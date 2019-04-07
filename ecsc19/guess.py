from ctypes import *
from pwn import *

libc = CDLL('/lib64/libc.so.6')

#p = process('./a.out')
p = remote('37.128.230.46',50021)
p.sendline('mihai')
p.recv()
t = libc.time(0)
libc.srand(t)
a = libc.rand() % 1333337
b = libc.rand() % 1333337
c = libc.rand() % 1333337
log.info("{} {} {}".format(a, b, c))
log.info("{}".format(a+b+c))
p.sendline(str(a+b+c))

p.interactive()
