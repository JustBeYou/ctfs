#!/usr/bin/env python

from pwn import *
import hashpumpy

p = remote('13.251.110.215', 10001)
p.recv()

# order Flag
p.sendline("2")
p.recvuntil("Item ID: ")
p.sendline("5")

# extract sign and payment from order
payment = p.recv()
sp = payment.find('&sign=')
sign = payment[sp+6:]
sign = sign[:sign.find('\n')]
payment = payment[payment.find('product'):payment.find('&sign')]

for keylen in range(8,32):
  log.info('trying keylen='+str(keylen))

  n = hashpumpy.hashpump(sign, payment, '&price=1', keylen)
  order = n[1] + "&sign="+n[0]

  p.sendline("3")
  p.recvuntil("Your order:")
  p.sendline(order)
  p.recv(1000)
  ret = p.recv(1000)
  if ("Invalid" not in ret):
    print(ret)
    print(p.recv())
    quit()
