base = 0x00401000
with open('Easy_UnpackMe.exe', 'rb') as f:
    data = f.read()

data = [ord(x) for x in data]
key = [0x10, 0x20, 0x30, 0x40, 0x50]
chunk1 = data[:0x4000]
chunk2 = data[0x5000:0x8000]

for i in range(len(chunk1)):
    chunk1[i] ^= key[i % 5]

"""
for i in range(len(chunk2)):
    chunk2[i] ^= key[i % 5]
"""

#data = data[:0x150] + chunk1[0x150:] + data[0x4000:0x5000] + chunk2 + data[0x8000:]

data = chunk1[0x150:]
data = ''.join([chr(a) for a in data])
with open('patched.exe', 'wb') as f:
    f.write(data)
