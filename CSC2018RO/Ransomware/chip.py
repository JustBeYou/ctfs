from hashlib import md5
from base64 import b64decode
from base64 import b64encode
from Crypto import Random
from Crypto.Cipher import AES

cipher = AES.new("1531010725:;<=>?@ABCDEFGHIJKLMNO", AES.MODE_CBC, "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f")

enc = cipher.encrypt("SUCKMYDICK000000")
for b in enc:
    print (hex(b), b, chr(b))

