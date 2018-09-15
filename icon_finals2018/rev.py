a1 = 77
a2 = 38

from crackme import *

def func(a1, a2):
    if a2 == 0 or a1 == a2:
        return 1

    v13 = func(a1 - 1, a2)
    v16 = func(a1 - 1, a2 - 1)

    return add(v16, v13)

#print (func(a1, a2))
for i in range(11):
        print (func(10,i))
