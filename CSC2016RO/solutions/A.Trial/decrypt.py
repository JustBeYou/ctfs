#!/usr/bin/python

import base64, socket, os, sys, hashlib, string
from Crypto.PublicKey import RSA

allchar = string.maketrans('','')
nodigs = allchar.translate(allchar, string.digits)

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m

def text_to_num(s):
        return int(s.encode('hex'), 16)

def num_to_text(a):
	return format(a, "02x").decode('hex')

def crack_captcha(c):
	i = 0
	while True:
		i = i+1    
		ha = hashlib.sha1()
		ha.update(c + str(i))
    		if ha.digest().endswith('\xFF\xFF\xFF'):
			 print ha.digest().encode('hex')	
        		 return i

def encrypt(t,s):
	s.recv(2048 + 2);
	s.sendall('E ' + str(t))
	a = s.recv(2048 + 2)
	return int(a.translate(allchar, nodigs))

def crack_sha1(h):
	for i in range(0, 256):
		ha = hashlib.sha1()
                ha.update(str(i))
		if ha.hexdigest() + '\n' == h:
			return i
	return None	

def decrypt(c,s):
	s.recv(2048 + 2)
	s.sendall('D ' + str(c))
	return crack_sha1(s.recv(2048 + 2))

def find_n(s):
	n = 0
	el = 0
	v = 2**1024
	while (el + 1) < v:
    		n = (el + v) / 2
    		if decrypt(encrypt(n,s),s) == n % 256:
        		el = n
    		else:    
        		v = n
    		print "n:",n
	return n

def get_the_flag(c,n,s):
        inv = modinv(256,n)
        shift = encrypt(inv, s)
        char = decrypt(c,s)
        t = chr(char)
        r = char * inv % n
        while True:
                c = c * shift % n
                char = (decrypt(c,s) - r % 256) % 256
                r = (r * inv % n + char * inv % n) % n
                t = chr(char) + t
                print t

s = socket.socket()
s.connect(('108.61.170.199', 8080))
c = s.recv(20);
print c;
cc = crack_captcha(c);
print c + str(cc)
s.sendall(c + str(cc));
print s.recv(2048)
resp = s.recv(2048)
print resp
cyphertext = int(resp[165:])
print 'cracking n:'
n = find_n(s)
print "N found:", n 

print decrypt(encrypt(4,s), s)
if decrypt(encrypt(4,s) * encrypt(modinv(2,n),s), s) == 2:
	print "N is correct!";
else:
	print "N is incorrect!"
	sys.exit()

get_the_flag(cyphertext, n, s)

s.close();
