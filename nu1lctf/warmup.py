#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.terminal = ['tmux', 'split', '-h']
# Pwntools custom functions
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
def _rcvl():
  return io.recvline()


exe = context.binary = ELF('warmup')

host = args.HOST or '47.52.90.3'
port = int(args.PORT or 9999)

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

def create(data):
    _snda('>>', 1)
    _snda('>>', data)

def delete(idx):
    _snda('>>', 2)
    _snda(':', idx)

def edit(idx, data):
    _snda('>>', 3)
    _snda(':', idx)
    _snda('>>', data)

def quit():
    _snda('>>', 4)

io = start()

create("A"*4)
delete(0)

io.interactive()

