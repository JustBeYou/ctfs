from z3 import *

s = Solver()

def flag_name(i):
    return "flag" + str(i)

def name(i):
    return "a"+str(i)

flag = {}
flag[flag_name(0)] = BitVec(flag_name(0), 64)

name_counter = 0
flag_name_counter = 0
for i in range(128):
    low_4_bytes = BitVec(name(name_counter), 64)
    hi_4_bytes = BitVec(name(name_counter + 1), 64)

    s.add(low_4_bytes ==
            ((((flag[flag_name(flag_name_counter)] >> 32)
                ^ 4290952684) + 4290952684)) & 4294967295
            )
    s.add(hi_4_bytes ==
            ((((flag[flag_name(flag_name_counter)] & 4294967295)
                ^ 4290952684) + 4294967295)) & 4294967295
            )

    flag[flag_name(flag_name_counter + 1)] = BitVec(flag_name(flag_name_counter + 1), 64)

    s.add(flag[flag_name(flag_name_counter + 1)] ==
            (((hi_4_bytes << 32) | low_4_bytes))
            )

    least_significant_7_bits = BitVec(name(name_counter + 2), 64)
    s.add(least_significant_7_bits ==
            (((flag[flag_name(flag_name_counter + 1)] >> 7) | least_significant_7_bits) & 0xffffffffffffffff)
            )

    name_counter += 3
    flag_name_counter += 1

s.add(flag[flag_name(flag_name_counter)] == 15164928151071436234)

check = s.check()
print ("The model is: " + str(check))
if check.r == 1:
    for k in s.model():
        print (k, s.model()[k])
else:
    print ("Can't solve")
