from pwn import *
from string import ascii_lowercase, ascii_uppercase, printable
from base64 import b64decode

p  = remote("ec2-13-251-81-16.ap-southeast-1.compute.amazonaws.com", 3333)

p.recvuntil("Your choice: ")
p.sendline("1")

def get_enc(msg):
    p.recvuntil("Your message: ")
    p.sendline(msg)
    p.recvuntil("The cipher text: ")
    msg = p.recvuntil("\n").rstrip()
    return b64decode(msg)

to_crack = "* open a netcat session, get the encrypted text, copy it here and run the script *"
s = ""

while len(s) < len(to_crack) / 4:
    print ("%s %s/%s" % (s, len(s), len(to_crack) / 4))
    for c in printable:
        new_s = s + c
        msg = get_enc(new_s)
        #print ("compare %s - %s" % (msg, to_crack[:len(new_s) * 4]))
        if msg == to_crack[:len(new_s) * 4]:
            s = new_s
            break
print (s)
