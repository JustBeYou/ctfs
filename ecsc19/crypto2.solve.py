from string import ascii_lowercase
from string import ascii_uppercase

def decrypt(t, alph, k):
    r = ""
    for c in t:
        if c in alph: r+=alph[(alph.index(c)+k)%len(alph)]
        else: r+=c
    return r

key1= 17
key2 = 24
s="YnuNmQPGhQWqCXGUxuXnFVqrUVCUMhQdaHuCIrbDIcUqnKxbPORYTzVCDBlmAqtKnEJcpED"

s1 = decrypt(s, ascii_uppercase, key2)
s2 = decrypt(s1, ascii_lowercase, key1)
print (s2)
