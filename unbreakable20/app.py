#!/usr/bin/python3
import sys, random, binascii, hashlib, re, math, os
from string import ascii_uppercase as asc
from itertools import product as d
from pprint import pprint

encription_table = None

upper = {ascii:chr(ascii) for ascii in range(65,91)}
lower = {ascii:chr(ascii) for ascii in range(97,123)}
digit = {ascii:chr(ascii) for ascii in range(48,58)}

with open("text.txt", "r") as myfile:
    data = myfile.readline()


def premessage(text):
    print ("Premessage")
    text = text.replace("_", "Q")
    print (f"_ -> Q: {text}")
    print ()
    return text

def enc4(text, key, debug=False):
    print ("Enc 4")
    r = [['\n' for i in range(len(text))]
                  for j in range(key)]

    dir_down = False
    row, col = 0, 0

    for i in range(len(text)):


        if (row == 0) or (row == key - 1):
            dir_down = not dir_down


        r[row][col] = text[i]
        col += 1


        if dir_down:
            row += 1
        else:
            row -= 1

    for i in r:
        for j in i:
            if j != '\n': print (j, end=' ')
            else: print ('!', end=' ')
        print ()

    result = []
    for i in range(key):
        for j in range(len(text)):
            if r[i][j] != '\n':
                result.append(r[i][j])
    r=("" . join(result))

    print ()
    print (text, key)
    print (r)
    print ()

    return r


def enc3(text, key):
    print ("Enc 3")
    t=lambda x: x.upper().replace('J','I')
    print (f"key+alph: upper, J -> I: {key + asc} {t(key + asc)}")
    s=[]
    for _ in t(key+asc):

        if _ not in s and _ in asc:

            s.append(_)
    print (f'unique, only upper: {"".join(s)}')

    m=[s[i:i+5] for i in range(0,len(s),5)]

    print ()
    for i in m:
        for j in i:
            print (j, end=' ')
        print ()

    enc={row[i]+row[j]:row[(i+1)%5]+row[(j+1)%5] for row in m for i,j in d(range(5),repeat=2) if i!=j}
    enc.update({col[i]+col[j]:col[(i+1)%5]+col[(j+1)%5] for col in zip(*m) for i,j in d(range(5),repeat=2) if i!=j})
    enc.update({m[i1][j1]+m[i2][j2]:m[i1][j2]+m[i2][j1] for i1,j1,i2,j2 in d(range(5),repeat=4) if i1!=i2 and j1!=j2})
    l=re.findall(r'(.)(?:(?!\1)(.))?',''.join([_ for _ in t(text) if _ in asc]))
    print ()
    print (f"only upper, J -> I: {text} {t(text)}")
    print (f"chunks of 2: {[''.join(x) for x in l]}")
    print (f"pad if needed (+ Z)")

    global encription_table
    encription_table = enc

    print ("encrypt pairs - enc[a,b] for a,b in t(text)")
    r=''.join(enc[a+(b if b else 'Z')] for a,b in l)
    print ()
    print (text)
    print (r)
    print ()
    return r


def enc2(string, key):
    print ("Enc 2")
    for c in string:
        o = ord(c)
        if (o not in upper and o not in lower) or o in digit:
            yield o
        else:
            if o in upper and o + key % 26 in upper:
                yield o + key % 26
            elif o in lower and o + key % 26 in lower:
                yield o + key % 26.
            else:
                yield o + key % 26 -26




def enc1(msg, key):
    print ("Enc 1")
    cipher = ""
    k_indx = 0
    msg_len = float(len(msg))
    msg_lst = list(msg)
    key_lst = sorted(list(key))
    print (f"key: {''.join(key_lst)}")

    col = len(key)
    row = int(math.ceil(msg_len / col))
    print (col, row)
    fill_null = int((row * col) - msg_len)
    msg_lst.extend('z' * fill_null)
    print (f'pad (+ z): {"".join(msg_lst)}')
    matrix = [msg_lst[i: i + col]
            for i in range(0, len(msg_lst), col)]

    print ()
    for i in matrix:
        for j in i:
            print (j, end=' ')
        print ()

    for _ in range(col):
        curr_idx = key.index(key_lst[k_indx])
        print (f'original pos of "{key_lst[k_indx]}" in {key}: {curr_idx} = row ', end='')
        cipher += ''.join([row[curr_idx]
                        for row in matrix])

        newrow = ''.join([row[curr_idx] for row in matrix])
        print (newrow)
        k_indx += 1

    print ()
    print (msg)
    print (cipher)
    print ()
    return cipher

d_cipher = enc4(premessage(data), 13)
c_cipher = enc3(d_cipher, "recomanded")
b_cipher = enc1(c_cipher, "zxdfiuypka")
a_cipher = "".join(map(chr, enc2(b_cipher, 35)))
print ("Caesar 9: ", end='')
print ("".join(map(chr, enc2("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 35))))

print ()
print (b_cipher)
print(a_cipher)
#print("FNFWCiZJGWWAWZTKYLLKDVNiWCVYViBYHXDiXFBEMiKYEZQMMPKNRiQXZVBQ")
print ()


print ("--- Decrypt ---")
def dec2(string, key):
    print ("Enc 2")
    for c in string:
        o = ord(c)
        if c == 'i': yield ord('z')
        else:
            if (o not in upper and o not in lower) or o in digit:
                yield o
            else:
                if o in upper and o + key % 26 in upper:
                    yield o + key % 26
                elif o in lower and o + key % 26 in lower:
                    yield o + key % 26.
                else:
                    yield o + key % 26 -26



a = "".join(map(chr, dec2(a_cipher, -9)))
assert (a == b_cipher)


def dec1(msg, key = "zxdfiuypka"):
    k_indx = 0
    msg_len = float(len(msg))
    msg_lst = list(msg)
    key_lst = sorted(list(key))
    print (f"key: {''.join(key_lst)}")

    col = len(key)
    row = int(math.ceil(msg_len / col))
    print (col, row)

    m = [msg[i:i+row] for i in range(0, len(msg), row)]
    print (m)

    n = ["" for _ in range(col)]
    for _ in range(col):
        curr_idx = key.index(key_lst[k_indx])
        n[curr_idx] = m[k_indx]
        k_indx+=1

    s = [[" " for _ in range(col)] for _ in range(row)]
    for i in range(row):
        for j in range(col):
            s[i][j] = n[j][i]
            print (s[i][j], end=' ')
        print()

    s = ''.join([''.join(x) for x in s]).replace('z', '')
    return s

b = dec1(a)
assert(b == c_cipher)

def dec3(text, key = "recomanded"):
    dec_table = dict((v,k) for k,v in encription_table.items())
    for k in dec_table:
        assert (k == encription_table[dec_table[k]])
    s = [text[i:i+2] for i in range(0, len(text), 2)]
    ss = ""
    for k in s:
        ss += dec_table[k]
    return ss.replace('Z', '')


c = dec3(b)
print (c)
print (d_cipher)
assert(c == d_cipher)

def dec4(msg, key = 13):

    text = msg
    print ("Enc 4")
    r = [['\n' for i in range(len(text))]
                  for j in range(key)]

    dir_down = False
    row, col = 0, 0

    for i in range(len(text)):


        if (row == 0) or (row == key - 1):
            dir_down = not dir_down


        r[row][col] = text[i]
        col += 1


        if dir_down:
            row += 1
        else:
            row -= 1

    for i in r:
        for j in i:
            if j != '\n': print (j, end=' ')
            else: print ('!', end=' ')
        print ()

    result = []
    for i in range(key):
        for j in range(len(text)):
            if r[i][j] != '\n':
                result.append(r[i][j])

    print ()
    idx = len(text) - 1
    for i in range(key - 1, -1, -1):
        for j in range(len(text) - 1, -1, -1):
            if r[i][j] != '\n':
                r[i][j] = text[idx]
                idx -= 1
    for i in r:
        for j in i:
            if j != '\n': print (j, end=' ')
            else: print ('!', end=' ')
        print ()
    print ()

    recovered = ["!" for _ in range(len(text))]

    dir_down = False
    row, col = 0, 0

    for i in range(len(text)):


        if (row == 0) or (row == key - 1):
            dir_down = not dir_down


        recovered[i] = r[row][col]
        col += 1


        if dir_down:
            row += 1
        else:
            row -= 1

    return ''.join(recovered)

d = dec4(c)


flag = "FNFWCiZJGWWAWZTKYLLKDVNiWCVYViBYHXDiXFBEMiKYEZQMMPKNRiQXZVBQ"
flag = "".join(map(chr, dec2(flag, -9)))
flag = dec1(flag)
flag = dec3(flag)
flag = dec4(flag)
print (flag.replace('Q', '_'))
# ctf{sha256(flag)}
# ctf{f5a2b03dedff103725131a2ce238bdc31b00accba79091237d566561cdfe6ec5}

flag = "HEZNERRJOYEVETVVEZXNRXIRXMEIDNCKBNDIGTYXON"
flag = dec4(flag, 12)
print (flag)

def newdec(s, key="AIRPLANES"*100):
    d=""
    for i,j in zip(s,key):
        for k in asc:
            if ord(i)==(ord(k)+ord(j))%26+ord('A'):
                d+=chr(ord(k)+32)
    return d

flag = newdec(flag)

from string import ascii_lowercase as lsc
from itertools import product as d
def newenc3(text, key):
    print ("Enc 3")
    t=lambda x: x.lower().replace('j','i')
    print (f"key+alph: upper, J -> I: {key + lsc} {t(key + lsc)}")
    s=[]
    for _ in t(key+lsc):

        if _ not in s and _ in lsc:

            s.append(_)
    print (f'unique, only upper: {"".join(s)}')

    m=[s[i:i+5] for i in range(0,len(s),5)]

    print ()
    for i in m:
        for j in i:
            print (j, end=' ')
        print ()

    enc={row[i]+row[j]:row[(i+1)%5]+row[(j+1)%5] for row in m for i,j in d(range(5),repeat=2) if i!=j}
    enc.update({col[i]+col[j]:col[(i+1)%5]+col[(j+1)%5] for col in zip(*m) for i,j in d(range(5),repeat=2) if i!=j})
    enc.update({m[i1][j1]+m[i2][j2]:m[i1][j2]+m[i2][j1] for i1,j1,i2,j2 in d(range(5),repeat=4) if i1!=i2 and j1!=j2})
    l=re.findall(r'(.)(?:(?!\1)(.))?',''.join([_ for _ in t(text) if _ in lsc]))
    print ()
    print (f"only upper, J -> I: {text} {t(text)}")
    print (f"chunks of 2: {[''.join(x) for x in l]}")
    print (f"pad if needed (+ Z)")

    global encription_table
    encription_table = enc

    print ("encrypt pairs - enc[a,b] for a,b in t(text)")
    r=''.join(enc[a+(b if b else 'z')] for a,b in l)
    print ()
    print (text)
    print (r)
    print ()
    return r

newenc3("a"*20, "consolidated")
print (encription_table)

def newdec3(text, key = "consolidated"):
    dec_table = dict((v,k) for k,v in encription_table.items())
    for k in dec_table:
        assert (k == encription_table[dec_table[k]])
    s = [text[i:i+2] for i in range(0, len(text), 2)]
    ss = ""
    for k in s:
        ss += dec_table[k]
    return ss.replace('z', '')

print (flag)
flag = newdec3(flag)
print (flag.replace('x', '-').upper())
#6384b1d0fac1bfa2b1af3530f72e54d5b89fdf22f62e8f6e3a84a91c7874f97a
