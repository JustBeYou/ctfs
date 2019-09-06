#!/usr/bin/env python
#-*- coding:utf-8 -*-

import random
#from flag import flag

def encrypt(msg, perm):
	W = len(perm)
	while len(msg) % (2*W):
		msg += "."
	msg = msg[1:] + msg[:1]
	msg = msg[0::2] + msg[1::2]
	msg = msg[1:] + msg[:1]
	print (msg)
        res = ""
	for j in xrange(0, len(msg), W):
		for k in xrange(W):
			res += msg[j:j+W][perm[k]]
	msg = res
	return msg

def encord(msg, perm, l):
	for _ in xrange(l):
		msg = encrypt(msg, perm)
	return msg

W, l = 7, random.randint(0, 1337)
perm = range(W)
random.shuffle(perm)

print (l, perm)
flag = "flag{test}...."
print (flag)
enc = encord(flag, perm, l)
print (enc)

l, perm = 1045, [6, 1, 5, 2, 3, 0, 4]
flag = "at.s}g.left.{."

#f = open('flag.enc', 'w')
#f.write(enc)
#f.close()
