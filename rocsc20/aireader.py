from pwn import *
from math import sqrt
from time import sleep

from PIL import Image, ImageDraw
import numpy as np

from pyzbar import pyzbar

from cv2 import imread
from pytesseract import image_to_string

def img(l, d):
    boxsz = 15
    w, h = boxsz*l, boxsz*l
    data = np.zeros((h, w, 3), dtype=np.uint)

    img = Image.fromarray(data, 'RGB')

    draw = ImageDraw.Draw(img)
    for i in range(l):
        for j in range(l):
            if d[i][j] == 'B':
                draw.rectangle(((i*boxsz, j*boxsz), ((i+1)*boxsz, (j+1)*boxsz)), fill="white")

    img.save('my.png')
    dt = pyzbar.decode(img)
    return dt

p=remote('35.242.239.180', 32303)
while True:
    s=p.recvuntil(':')
    if b'That was way to fast! Here is a captcha image:' in s:
        q=p.recvline()
        q=p.recvline()
        from base64 import b64decode
        with open('cap.png', 'wb') as f:
            f.write(b64decode(q.strip()))

        im = Image.open('cap.png')
        dt = im.getdata()

        im2 = Image.new('RGB', im.size)
        l= list(dt)
        for i,v in enumerate(l):
            if v[0]==255 and v[3]==0:
                l[i]=(255, 255, 255, 0)
            else:
                l[i]=(0, 0, 0, 0)
        im2.putdata(l)
        im2.save('tmp.png')

        data = image_to_string(imread('tmp.png')).strip().replace('\n', '').replace(' ', '').strip()
        print (data)

        p.recvuntil('Enter captcha token: ')
        p.sendline(data)
        p.interactive()

        exit()

    l=int(p.recvline())

    print (l)

    black=b"\x1b[7m  \x1b[0m"
    white=b"\x1b[49m  \x1b[0m"

    data=p.recvline().strip()
    data=data.replace(black, b'B')
    data=data.replace(white, b'W')
    data=data.decode('ascii')

    k = int(sqrt(len(data)))

    lines=[data[i:i+k] for i in range(0, len(data), k)]
    dt = img(k, lines)
    p.sendline(dt[0].data)
    p.recvline()

p.interactive()

#ctf{00c578bb7c894a0210dd1ced051a88a06206c741d3c33c17b1555257c7a34894}
