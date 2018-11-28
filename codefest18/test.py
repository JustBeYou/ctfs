from pwn import *

for i in range (100):
    p = process(['./gcc-secure', 'polyglot.ws'])
    p.sendline(str(i))
    data = p.recv()
    print (data)

    if "{" in data:
        break
    p.close()

print ("Fuuuuuuuuuuuuuuuuuck")
