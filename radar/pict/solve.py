import sys
from PIL import Image

images = map(Image.open, ['{}.jpg'.format(i) for i in range(1, 577)])

total_width = 40 * 25
max_height = 40 * 25

new_im = Image.new('RGB', (total_width, max_height))

x_offset = 0
y_offset = 0
i = 1
for im in images:
    box = (20, 20, 130, 130)
    part = im.crop(box)
    part = part.resize((40,40),Image.ANTIALIAS)
    new_im.paste(part, (x_offset,y_offset))
    x_offset += part.size[0]
    if i % 30 == 0:
        x_offset = 0
        y_offset += part.size[1]
    i += 1

new_im.save('solved1.jpg')
