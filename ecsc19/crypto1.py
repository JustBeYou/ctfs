import hashlib
import string
import itertools

def crack(target):
    for l in range(5):
        for c in itertools.product(string.ascii_lowercase + string.digits, repeat=l):
            x = ''.join(c)
            s = hashlib.sha1(x.encode())
            s = s.hexdigest()[0:6]
            if s == target:
                return x
    return "bad"

from pwn import *
p = remote('37.128.230.46', 50041)
r = ""
i = 0
while True:
    print ("{}/10".format(i))
    r = p.clean()
    if "ECSC" in r:
        print (r)
        break
    r = r.strip()
    print ("cracking {}".format(r))
    res = crack(r)
    if res == "bad": print ("not found")
    else:
        print ("found: {}".format(res))
        i+=1
    p.sendline(res)
