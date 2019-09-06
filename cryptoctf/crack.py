#!/usr/bin/python
from pwn import *
import hashlib
import sys
def crack(func_name, arg):
    func = eval('hashlib.' + func_name)
    your_list = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[];:"\'\\|<,>.?/'
    for i in your_list:
        for j in your_list:
            for k in your_list:
                for l in your_list:
                    guess = (i+j+k+l)
                    hash = func(guess.encode('utf-8')).hexdigest()[-6:]
                    if hash == arg:
                        return guess

io = remote("167.71.62.250", 23549)
io.recvuntil('such that ')
func_name = io.recvuntil('(').replace('(', '')
io.recvuntil('= ')
arg = io.recvline().strip()
s = crack(func_name, arg)
io.sendline(s)

def leak_a_len():
    for l in range(100, 500):
        print ("trying {}".format(l))
        io.recvuntil('[Q]uit')
        io.sendline('N')
        io.recvuntil('[Y]es [N]o\n')
        io.sendline('Y')
        data=io.recvline()
        if "enter your integer" in data:
            io.sendline(str(int("1"*l, 2)))

def get_fn(to_send):
    to_send = ''.join(to_send)
    io.recvuntil('[Q]uit')
    io.sendline('N')
    io.recvuntil('[Y]es [N]o\n')
    io.sendline('Y')
    io.sendline(str(int(to_send, 2)).replace("L", ""))
    io.recvuntil('f_a(n + 0) = ')
    number = io.recvline().strip()
    return int(number)

def leak_a():
    leak = []
    to_send = list("1" + "0" * 127)

    leak.append(get_fn(to_send))

    to_send[1] = "1"
    leak.append(get_fn(to_send))

    for i in range(2, 128):
        to_send[i - 1] = "0"
        to_send[i] = "1"
        leak.append(get_fn(to_send))

    return leak

def get_pg():
    io.recvuntil('for n = ')
    n = io.recvuntil(',').replace(',', '')
    n = int(n)
    io.recvuntil('parameters: \n| ')
    exec(io.recvline())
    return n, p, g

n, p, g = get_pg()
print (n, p, g)
tup = (0xdeadbeef, p, g)
leak = leak_a()

from Crypto.Util.number import inverse
def dlp(leak, p, g):
    leak[0]%=p
    for i in range(1,len(leak)):
        leak[i]=(leak[i]*inverse(leak[0],p))%p

    o=[]
    for h in leak:
        i=0
        aux=1
        while(aux!=h):
            aux=(aux*g)%p
            i+=1
        o.append(i)
    return o

def gg(tup, a, x):
    (_, p, g), n = tup, len(a)
    assert len(bin(x)[2:]) <= n
    X = bin(x)[2:].zfill(n)
    f_ax = g
    for i in range(1, n):
        f_ax *= pow(g, a[i] * int(X[i]), p)
    return f_ax % p
a = dlp(leak, p, g)
n = 30869518887955031157906728211658742733 # arbitrary value
io.recvuntil('[Q]uit')
io.sendline('N')
io.recvuntil('[Y]es [N]o\n')
io.sendline('Y')
io.sendline(str(n).replace("L", ""))

solution = gg(tup, a, n + 5)
io.recvuntil('[Q]uit')
io.sendline('G')
io.recvuntil('please guess and enter the next number:')
io.sendline(str(solution).replace('L', ''))
io.interactive()

