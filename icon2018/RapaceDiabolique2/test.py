#!/usr/bin/env python3
from crackme import *

def calc_flag(a1, a2, a3):
    v21 = div(a2, a1)
    v22 = 0

    i = inf(v22, 100)
    while i != 0:
        v7 = 2
        v8 = mul(v22, v7)

        v9 = 1
        v10 = add(v8, v9)

        v11 = mul(v10, a1)

        v12 = mul(a1, a1)

        v13 = sub(v12, v11)

        v14 = mul(v22, v22)

        v15 = add(v13, v14)

        v16 = add(v15, v22)

        v17 = div(a2, v16)

        v21 = add(v21, v17)

        v18 = 1

        v22 = add(v22, v18)

        i = inf(v22, 100)
        print (v17)

    return v21
"""
def calc_flag(a1, a2, a3):
    i = 0
    while i < a3:
        result = add( div( a2, a1), div( a2, add( add( sub( mul( a1, a1), mul( add( mul( i, 2), 1), a1)), mul( i, i)), i)))

        print (result)
        i = add( i, 1)

    return result
"""
"""
def calc_flag(a1, a2, a3):
    result = a2 / a1
    old_result = result
    for i in range(a3, 0, -1):
        result += a2 / (a1 ** 2 - a1 * (i * 2 + 1) + i ** 2 + i)

        print (result)

    return result
"""
def calc_flag_simple(x,y,step):
    o = y/x
    for i in range(100):
        d=y/(i**2+i*(1+2*x)+x**2-x)
        print (d)
        o+=d
    return o


print (calc_flag(25052671110843108, 16420105858350620421142892712, 16289103821838282))

