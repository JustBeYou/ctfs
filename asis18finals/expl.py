from Crypto.Util.number import inverse
import itertools,string
from pwn import *
from hashlib import *

context.log_level = 'error'

def gcd(a,b):
	while b:
		a,b=b,a%b
	return a

sigma=string.ascii_letters+string.digits
DICT={}
i=0
for a in itertools.product(sigma,repeat=5):
	X=''.join(a)
	DICT[sha1(X).hexdigest()[-6:]]=X
	if(i>6*256**3):
		break
	if(i%256**2==0):
		print i/256**2
	i+=1

l=[]
stop=0
while(not stop):
	s=remote('37.139.4.247','36032')
	s.readline()
	s.readline()
	s.readline()
	x=s.readline()[39:]
	x,y=x[:x.find(')')+1],x[x.find(')')+9:-1]
	if(not x.startswith('sha1')):
		s.close()
		continue

	if y in DICT:
		s.sendline(DICT[y])
	else:
		for a in itertools.product(sigma,repeat=8):
			X=''.join(a)
			if(sha1(X).hexdigest()[-6:]==y):
				s.sendline(X)
				break

	s.sendline('P')
	pk=s.recvline()
	while(not pk.startswith('pubkey')):
		pk=s.recvline()
	pk=int(pk[17:-3])
	ok=1
	for k in l:
		if(gcd(k,pk)!=1):
			p=gcd(k,pk)
			q=pk/p
			n=pk
			phi=(p-1)*(q-1)
			e=65537
			s.sendline('C')
			c=s.recvline()
			while(not c.startswith('enc')):
				c=s.recvline()
			c=int(c[6:].strip('\n'))
			c2=c%n
			d=inverse(e+2,phi)
			r=pow(c2,d,n)
			rinv=inverse(pow(r,e,n**2),n**2)
			m=(c*rinv-r**2)%n**2/n
			pt=(hex(m)[2:].strip('L')).decode('hex')
			print pt
			if('ASIS' in pt):
				stop=1			
			ok=0
			break
	if(ok):
		l.append(pk)
	print len(l)
	s.close()
