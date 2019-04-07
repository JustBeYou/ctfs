from string import *
from itertools import permutations
from base64 import b64decode

alph = [ascii_uppercase, ascii_lowercase, digits, "+", "/"]

def shift(msg, alph, key):
    r = ""
    for c in msg:
        r += alph[(alph.index(c) + key) % len(alph)]
    return r

target = "fYZ7ipGIjFtsXpNLbHdPbXdaam1PS1c5lQ"
for perm in permutations(alph):
    tmp = ''.join(perm)
    for key in range(len(tmp)):
        r = shift(target, tmp, key)
        try:
            r = b64decode(r + "==")
            print (r)
        except Exception as e:
            pass
