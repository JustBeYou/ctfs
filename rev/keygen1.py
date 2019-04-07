from binascii import hexlify, unhexlify

def gen(name):
    serial = ""
    key = [0x10, 0x20, 0x30]

    for i in range(len(name)):
        j = i % 3
        serial += hexlify(chr(ord(name[i]) ^ key[j]))

    return serial

def crack(serial):
    name = ""
    key = [0x10, 0x20, 0x30]

    serial = unhexlify(serial)
    for i in range(len(serial)):
        j = i % 3
        name += chr(ord(serial[i]) ^ key[j])

    return name

print (crack("5B134977135E7D13"))
