#!/usr/bin/python
from pwn import *
import hashlib
import sys
def crack(func_name, arg):
    func = eval('hashlib.' + func_name)
    print (func)
    your_list = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[];:"\'\\|<,>.?/'
    for i in your_list:
        for j in your_list:
            for k in your_list:
                for l in your_list:
                    guess = (i+j+k+l)
                    hash = func(guess.encode('utf-8')).hexdigest()[-6:]
                    if hash == arg:
                        return guess

io = remote("167.71.62.250", 20029)
io.recvuntil('such that ')
func_name = io.recvuntil('(').replace('(', '')
io.recvuntil('= ')
arg = io.recvline().strip()

print (func_name, arg)
s = crack(func_name, arg)
print (s)
io.sendline(s)
io.interactive()
