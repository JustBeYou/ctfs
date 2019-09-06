from pwn import *
from string import ascii_lowercase, digits

alph = ascii_lowercase+digits+" "
crack = {}
for c in alph:
    p = process('./secure-code')
    p.clean()
    p.sendline(c)
    data = p.clean().strip().replace('Text in secure code:\n', '')
    p.close()

    crack[c] = data

from pprint import pprint
pprint (crack)
