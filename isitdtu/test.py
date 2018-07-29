def do():
    secret = "392a3d3c2b3a22125d58595733031c0c070a043a071a37081d300b1d1f0b09"
    secret = secret.decode("hex")
    key = "pythonwillhelpyouopenthedoor"
    ret = ""
    for i in xrange(len(secret)):
            #ret += chr(ord(a[i])^ord(key[i%len(a)]))
            ret += chr(ord(secret[i]) ^ ord(key[i % len(key)]))
    print ret

do()
