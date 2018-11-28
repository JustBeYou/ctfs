with open('challenge', 'rb') as f:
    data = f.read()[0x2174:0x348c]

for c in data:
    print ('{:02x}'.format(c), end='')
