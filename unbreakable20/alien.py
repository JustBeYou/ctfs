from pwn import *
from time import sleep
from pprint import pprint
from binascii import hexlify

context.log_level='error'
def encode(s):
    p = remote('34.89.159.150', 32653)
    p.recvuntil('secure it:')
    p.sendline(s)
    p.recvline()
    resp = p.recvline().strip()
    p.close()
    return resp

flag=b""
while len(flag)==0 or flag[-1]!="}":
    for b in b"ctf{abcdef1234567890}":
        c=bytes([b])
        print (f"{flag+c}")
        s=encode(flag+c)
        s=s[len(flag)*2:len(flag)*2+2]
        if s == b"00":
            flag+=c
            break
    print(b'[+] ' + flag)
#ctf{aaac099bd38f64c9297b9905bdaac832365aca0f26719dc02b7cc2c6193cac4d}
