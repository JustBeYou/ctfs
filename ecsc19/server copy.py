from __future__ import print_function
import string
import random
import hashlib


import sys
def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# this function will return the flag.
def flag():
    print("ECSC{the flag is on the server ;)}"+"\n")

def random_generator(size=10, chars=string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


count = 0
while True:
    token = "ECSC" + random_generator(50)
    eprint("Generated token: " + token + "\r\n")
    sha1 = hashlib.sha1(token.encode())
    sha1 = sha1.hexdigest()[0:6]
    print(sha1)
    data = raw_input("Your token is:")
    eprint("Read from client: " + data + "\r\n")
    if not data: break
    check = hashlib.sha1(data.rstrip("\n\r").encode())
    check = check.hexdigest()[0:6]
    if sha1 == check:
        count = count + 1
        eprint(count)
        if (count >= 10):
            flag()
            break
        

print('EXIT!')

exit()