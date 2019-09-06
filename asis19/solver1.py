from z3 import *
from math import *

flag = Int('flag')
s = Solver()

def digits(x):
    return int(log10(float(x.get())))+1

s.add(flag % (digits(flag) + 2) == 0)
