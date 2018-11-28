from base64 import b64decode
from pwn import p32

flag = "iB6WcuCG3nq+fZkoGgneegMtA5SRRL9yH0vUeN56FgbikZFE1HhTM9R4tZPghhYGFgbUeHB4tEKRRNR4Ymu0OwljQwmRRNR4jWBweOKRRyCRRAljLGQ="
flag = b64decode(flag)

def enc(s, e = 9517, n = 41117):
    new_s = []
    for c in s:
        new_s.append(pow(ord(c), e, n))
    return new_s

solution = ""
flag_i = 0
while flag_i < len(flag):
    for i in range(32, 128):
        p = p32(enc(chr(i))[0]).replace('\x00', '')
        if "\x88" in p:
            for j in p:
                print ord(j),
            print
        good = True
        for j in range(len(p)):
            if p[j] != flag[flag_i + j]:
                good = False
                break
        if good:
            solution += p
            print (solution)
    break
