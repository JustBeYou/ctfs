from pwn import *

def run(s):
    p = process(["./dec_dec_dec", s])
    data = p.recvline().strip()
    print (s, data)
    p.close()
    return data

#print (run("TWCTF{"))

s = "@25-Q44E233=,>E-M34=,,$LS5VEQ45)M2S-),7-$/3T"
flag = ""
counter = 0

def match(s1, s2):
    c = 0
    for i in range(len(s1)):
        if s1[i] != s2[i]: break
        c += 1
    return c

while counter < len(s):
    for i in range(32, 128):
        new_flag = flag + chr(i)
        new_counter = match(run(new_flag), s)
        if new_counter > counter:
            couter = new_counter
            flag = new_flag
            print (flag)
            print ("------------------")
            break
