#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('revfcuk')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
break *0x{exe.symbols.main:x}
continue
'''.format(**locals())

import itertools
import time
context.log_level = 'error'

# -- Exploit goes here --

stime = time.time()
length = 80
password = []
alphabet = "134570_abcdefghijklmnopqrstuvwxyz{}"
for i in range(1):#range(length / 4):
    for comb in itertools.product(alphabet, repeat =4):
        io = start()
        payload = ''.join(password) + ''.join(comb) + "AAAA" * ((length - (i + 1) * 4) / 4)
        io.sendline(payload)
        recv = io.clean()
        if "Wrongat" + str(i + 1) + '\n' not in recv.replace(' ', ''):
            print ("OK")
            print (comb)
            password.append(comb)
            break
        io.close()
etime = time.time()

print ("TIME: " + str(etime - stime))
