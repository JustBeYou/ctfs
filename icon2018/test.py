from crackme import *

def calc_flag(a1, a2):
    v10 = a2
    v11 = 2
    v12 = 1

    while True:
        v5 = 1
        v6 = sup(v10, v5)
        if v6 == 0:
            break

        while True:
            v7 = mod(v10, v11)
            if v7 != 0:
                break

            v10 = div2(v10, v11)
            v12 = v11

        v8 = 1
        v11 = add(v11, v8)

    print str(v12) + str(","),
    return sub(a1, v12)

for i in range(200):
    calc_flag(1000, i)

def calc_flag2(x):
    o = 1
    while x>1:
        o+=1
        print (o)
        while x%o==0:
            x/=o
    print str(o) + str(","),

calc_flag2(25052671110843108)
