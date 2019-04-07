# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## Challenge (100): Category

### Proof of flag
```
ECSC{BGtSheIosNMPWRqTABZcdYhkIeCHtgCB}
```

### Summary
We were given the following ciphertext:
```
bcjac --- YnuNmQPGhQWqCXGUxuXnFVqrUVCUMhQdaHuCIrbDIcUqnKxbPORYTzVCDBlmAqtKnEJcpED --- UVQR
```
We know that this is a Caesar cipher with two encryption keys. I observed that the first word is lowercase only and the last word is uppcarecase only. 

### Proof of solving
Bruteforcing all the shifts for the first and the last word we get
```
lowercase key = 17 bcjac -> start
uppercase key = 24 UVQR  -> STOP
```
Solver script:
```python
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
```
