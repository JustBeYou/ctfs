from PIL import Image
from cv2 import imread
from pytesseract import image_to_string

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

data = image_to_string(imread('tmp.png')).strip().replace('\n', ' ').strip()
print (data)
