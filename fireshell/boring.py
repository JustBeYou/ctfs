from z3 import *
l = [BitVec('a{}'.format(i), 8) for i in range(16)]
s = Solver()

s.add(Sum(l) == 1075)

for x in l:
    s.add(Or(And(x >= ord('0'), x <= ord('9')), And(x >= ord('a'), x <= ord('f')), And(x >= ord('A'), x <= ord('F'))))


from hashlib import md5
def check_hash(x):
    string = ""
    for k in x:
        string += chr(int(str(x[k])))
    m = md5(string.encode('ascii')).hexdigest()
    if m == "32f4f18bfd639f8df791ad6d8263d3d3":
        print ("FOUND {}".format(string))
        exit(0)

solutions = []

i = 0
while s.check() == sat:
    csol = s.model()
    solutions.append(csol)

    lcond = [l[int(str(k).replace("a", ""))] != csol[k] for k in csol]
    s.add(Or(*lcond))
    check_hash(csol)

    if i % 100 == 0:
        print (i)
    i+=1
