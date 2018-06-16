from pwn import *

p = process("maxsetting")

p.send(p16(0xdea))
p.send(p16(0xbee))

p.interactive()
