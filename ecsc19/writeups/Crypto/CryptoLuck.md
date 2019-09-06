# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## Crypto Luck (150): Crypto

### Proof of flag
```
ECSC{bab4d1bdea5baf2a5ce69c2fd7e4945edd39970bc0eb49ea390d58a7d24c3986}
```

### Summary
We were given a netcat server where we should connect. The server challenges us to crack partial SHA hashes. Brutforcing each hash is enough to get the flag. 

### Proof of solving
I used the following script:
```python
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
```
