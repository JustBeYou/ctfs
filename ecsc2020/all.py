import itertools

import string
import itertools


def generate_strings(charset, length):
    chars = charset 
    for item in itertools.product(chars, repeat=length):
        yield "".join(item)

print ('[', end='')
for x in generate_strings('ECSC{}0123456789abcdef', 3):
    if len(x) > 3:
        print ('fuck', x)
        break
    print('"{}",'.format(''.join(x)), end='')
print (']')
