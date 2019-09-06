import claripy

from itertools import product
chars = '0123456789abcdef' # chars to look for

n = "{}_39_8"
target = hash(claripy.BVS('r12_53_64', 64, explicit_name=True))
print ("cracking {}".format(target))

i = 0
for length in range(7, 10):
    to_attempt = product(chars, repeat=length)
    for attempt in to_attempt:
        s = ''.join(attempt)
        k = n.format(s)
        x = hash(claripy.BVS(k, 8, explicit_name=True))
        i+=1
        if i % 1000000 == 0: print (i, k, x)
        if (x == target):
            print ("Found {}".format(k))
            break

