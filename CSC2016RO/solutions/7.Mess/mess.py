#!/usr/bin/python
import struct
import sys
import Crypto
from Crypto.Cipher import AES
import string
import hashlib

data = open("secret_location.enc").read()
i = 0

def read(c):
    global i
    global data
    res = data[i: i + c]
    i += c
    return res

def decrypt(key, iv, data):
    aes = AES.new(key, AES.MODE_CBC, iv)
    data = aes.decrypt(data)
    return data

def sxor(s1,s2):
    return ''.join(chr(ord(a) ^ ord(b)) for a,b in zip(s1,s2))

print "Header: " + read(4)

buf = read(16)
print "BUF: " + buf.encode("hex")

rsa_len = struct.unpack("<I", read(4))[0]
print "RSA len: " + str(rsa_len)

aes_len = struct.unpack("<I", read(4))[0]
print "AES len: " + str(aes_len)

rsa = read(rsa_len)
aes = read(aes_len)

if i == len(data):
    print "File parsed ok!"
else:
    print "Invalid file!"
    sys.exit(1)

password = "2rf3487fwegf4390ufjfrekgehf30"
usernameex = "Agent191-PC\Agent191"

iv = "\x00" * 16

for i in string.printable:
    for j in string.printable:
        secret = usernameex + (" " * (30 - len(usernameex))) + i + j
        secret += (100 - len(secret)) * "\x00"

        key = ""
        for x in range(100):
            key += chr(ord(buf[x & 0xf]) ^ ord(secret[x]))

        dec = decrypt(key[:32], iv, aes)

        if dec.startswith("\xff\xd8\xff\xe0"):
            print "Correct!"
            outfile = open("secret_location.jpg", "w")
            outfile.write(dec)
            outfile.close()
            sys.exit(0)
