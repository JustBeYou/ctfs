data = open('server.ino.elf', 'rb').read()

offset = 0x000014d0 + 12

data = data[offset:offset + 32]

for i in data:
    print ("{} ".format(hex(i)[2:].rjust(2, '0')), end='')
