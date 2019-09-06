# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## Checker (150): Revexp

### Proof of flag
```
ECSC{23771F9703440994F0ABDD81128AE7CD89AA19E70D7E86EE695360F51E6CA350}
```

### Summary
The given binary was created using Pyinstaller (I came to this conclusion as it has a section named "pydata"), so using classic reverse engineering tools like IDA or Radare won't help too much. I had to use Python specific tools.

### Proof of solving
I installed `pyinstaller` for `python 3.6` and I used `archive_viewer.py` to explore the executable. Among other default compiled modules, there was an interesting one:
```
...
 (245, 1102, 1809, 1, 'm', 'pyimod01_os_path'),
 (1347, 4354, 9369, 1, 'm', 'pyimod02_archive'),
 (5701, 7374, 18674, 1, 'm', 'pyimod03_importers'),
 (13075, 1848, 4157, 1, 's', 'pyiboot01_bootstrap'),
 (14923, 3015, 5662, 1, 's', '1'),    < ----------------------- this one
 (17938, 8205, 22040, 1, 'b', '_bz2.cpython-36m-x86_64-linux-gnu.so'),
 (26143, 102465, 149808, 1, 'b', '_codecs_cn.cpython-36m-x86_64-linux-gnu.so'),
 (128608, 35789, 158032, 1, 'b', '_codecs_hk.cpython-36m-x86_64-linux-gnu.so'),
...
```
After extracting it I tried to decompile using `uncompyle6`, but the header was invalid. I added the correct header:
```
33 0d 0d 0a 70 79 69 30  01 01 00 00 e3 00 00 00  |3...pyi0........|
```
and then I decompiled the file. Here it is the obtained code:
```python
import math, enum
from urllib.parse import unquote
username = [
 'I', 'J', 'k', 'J', 'G', '1', 'M', 'T', 'E', 'w', 'I', 'A', 'I', 'H', 'c', 'u', 'H', 'a', 'c', 'T', 'q', '1', 'y', 'g', 'L', 'm', 'y', 'D', 'H', 'G', '0', '9']
password = [
 'S', 'D', 'B', 'F', 'R', 'k', 'g', 'x', 'Y', '1', 'Z', 'I', 'S', '3', 'F', 'G', 'W', 'j', 'F', 'N', 'Z', 'k', 'x', 't', 'Q', 'U', 'F', 'v', 'T', 'i', 'U', 'z', 'R', 'C', 'U', 'z', 'R', 'A', '=', '=']
n2ch = ('').join([
 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
 'abcdefghijklmnopqrstuvwxyz',
 '0123456789+/'])
rotate_amounts = [
 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21]
constants = [int(abs(math.sin(i + 1)) * 4294967296) & 4294967295 for i in range(64)]
init_values = [
 1732584193, 4023233417, 2562383102, 271733878]
functions = 16 * [
 lambda b, c, d: b & c | ~b & d] + 16 * [
 lambda b, c, d: d & b | ~d & c] + 16 * [
 lambda b, c, d: b ^ c ^ d] + 16 * [lambda b, c, d: c ^ (b | ~d)]
index_functions = 16 * [
 lambda i: i] + 16 * [
 lambda i: (5 * i + 1) % 16] + 16 * [
 lambda i: (3 * i + 5) % 16] + 16 * [lambda i: 7 * i % 16]
ch2n = dict(zip(n2ch, range(len(n2ch))))

def to_bytes(n, length, endianess='big'):
    h = '%x' % n
    s = ('0' * (len(h) % 2) + h).zfill(length * 2).decode('hex')
    if endianess == 'big':
        return s
    else:
        return s[::-1]


def separate(seq, size):
    return (seq[i:i + size] for i in range(0, len(seq), size))


def encode(data, split=76, br='\r\n'):
    buf = ''
    rem = len(data) % 3
    pad = 3 - rem
    if rem > 0:
        data = data + '\x00' * pad
    for i in range(0, len(data), 3):
        b3 = ord(data[i]) << 16 | ord(data[i + 1]) << 8 | ord(data[i + 2])
        buf += n2ch[b3 >> 18] + n2ch[b3 >> 12 & 63]
        buf += n2ch[b3 >> 6 & 63] + n2ch[b3 & 63]

    if rem > 0:
        buf = buf[:-pad] + '=' * pad
    if split > 0:
        return br.join(separate(buf, split)) + br
    else:
        return buf


def decode(base64):
    ns = []
    for ch in base64:
        if ch == '=':
            break
            try:
                ns.append(ch2n[ch])
            except:
                pass

    data = ''
    rem = len(ns) % 4
    if rem > 0:
        ns += [0] * (4 - rem)
    for i in range(0, len(ns), 4):
        b3 = ns[i] << 18 | ns[i + 1] << 12 | ns[i + 2] << 6 | ns[i + 3]
        data += chr(b3 >> 16) + chr(b3 >> 8 & 255) + chr(b3 & 255)

    if rem > 0:
        return data[:-rem]
    else:
        return data


def rot13(s):
    result = ''
    for v in s:
        c = ord(v)
        if c >= ord('a') and c <= ord('z'):
            if c > ord('m'):
                c -= 13
            else:
                c += 13
        else:
            if c >= ord('A') and c <= ord('Z'):
                if c > ord('M'):
                    c -= 13
                else:
                    c += 13
        result += chr(c)

    return result


def left_rotate(x, amount):
    x &= 4294967295
    return (x << amount | x >> 32 - amount) & 4294967295


def md5(message):
    message = bytearray(message)
    orig_len_in_bits = 8 * len(message) & 18446744073709551615
    message.append(128)
    while len(message) % 64 != 56:
        message.append(0)

    message += orig_len_in_bits.to_bytes(8, byteorder='little')
    hash_pieces = init_values[:]
    for chunk_ofst in range(0, len(message), 64):
        a, b, c, d = hash_pieces
        chunk = message[chunk_ofst:chunk_ofst + 64]
        for i in range(64):
            f = functions[i](b, c, d)
            g = index_functions[i](i)
            to_rotate = a + f + constants[i] + (int.from_bytes(chunk[4 * g:4 * g + 4], byteorder='little'))
            new_b = b + left_rotate(to_rotate, rotate_amounts[i]) & 4294967295
            a, b, c, d = (d, new_b, b, c)

        for i, val in enumerate([a, b, c, d]):
            hash_pieces[i] += val
            hash_pieces[i] &= 4294967295

    return sum((x << 32 * i for i, x in enumerate(hash_pieces)))


def md5_to_hex(digest):
    raw = digest.to_bytes(16, byteorder='little')
    return ('{:032x}').format(int.from_bytes(raw, byteorder='big'))

username = decode(decode(decode(rot13(('').join(map(str, username))))))
password = md5_to_hex(md5(str.encode(decode(decode(rot13(unquote(decode(('').join(map(str, password))))))))))

print('Welcome to our checker software.')
print('We need to verify your identity in order to reveal the flag.')

test_username = input('Enter username:')

if test_username == username:
    test_password = input('Enter password:')
    if password == test_password:
        print('Well done the flag is: ECSC{sha256(username:password)}')
    else:
        print('I do not know you!')
else:
    print('I do not know you!')
```
There is no need of reversing, simply adding a print statement will leak all the info we need. 

```
Sha256(ECSC-Admin:H4Rdt0Guess%)
```
