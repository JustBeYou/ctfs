#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='i386')
exe = 'run'



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe] + argv, *a, **kw)

gdbscript = '''
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

io.clean()
io.send("sojupwner\r")
io.clean()
#io.send("\x7f"*35+"A\r")

io.interactive()

