from pwn import *

gg=[]
for i in range(256):
    p =process('./gg')
    p.send('a' + chr(i))
    d =p.clean()
    if "Epic" not in d:
        gg.append(i)
    print(d)
    p.close()

print (gg)
print (''.join([chr(x) for x in gg]))
