with open("stage-2.bin", 'rb') as f:
    data = f.read()


data = data[0xe8:]

xor_key =0x69
shift = 1

flag = ''
for c in data:
    if ord(c) == 0x1f: continue
    flag += chr((ord(c) ^ xor_key) >> shift)
    if flag[-1] == '}':
        break

print (flag)
