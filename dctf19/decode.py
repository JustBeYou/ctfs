
from base64 import b64decode

with open('data', 'r') as f:
    s=f.read()

s=s.strip()

i = s.find('.')
while i != -1:
    k = s[0:i]
    s = s[i+1:]
    n = s.find('\n')
    s = s[n+1:]
    i=s.find('.')
    k=k.strip()
    print (b64decode(k))
