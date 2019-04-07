from hashlib import sha256
from itertools import product
from string import ascii_letters, digits

def crack_hash(h):
    for k in range(5):
        for x in product(ascii_letters + digits, repeat=k):
            m = sha256()
            m.update(''.join(x))
            nh = m.hexdigest()[-6:]
            #print (nh)
            if nh == h:
                return ''.join(x)

MODULO = 13371337

def solve(N):
    return 0

from pwn import *

p = remote('35.231.144.202', 2006)
p.recvuntil('sha256(string)[-6:]: ')
h = p.recvline().strip()
log.info(h)
r = crack_hash(h)
log.info(r)
p.sendline(r)
p.recvuntil('start')
p.sendline('start')

i = 0
while True:
    p.recvuntil('N: ')
    N = int(p.recvline().strip())
    log.info("N: {}".format(N))
    S = solve(N)
    log.success("S: {}".format(S))
    p.sendline(str(S))
    log.info('iter {}'.format(i))
    i+=1

p.interactive()
