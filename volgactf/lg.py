from pwn import *
import re
import requests

from functools import reduce


recover_size = 10
streak_count = 20

def gcd(a, b):
    while b != 0:
        r = a % b
        a = b
        b = r
    return a

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def invert(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m

class LCG:
    def __init__(self, m, a, c, seed):
        self.m = m
        self.a = a
        self.c = c
        self.state = seed

    def next(self):
        self.state = (self.a * self.state + self.c) % self.m
        return self.state


def crack_unknown_increment(states, modulus, multiplier):
    increment = (states[1] - states[0]*multiplier) % modulus
    return modulus, multiplier, increment


def crack_unknown_multiplier(states, modulus):
    multiplier = (states[2] - states[1]) * invert(states[1] - states[0], modulus) % modulus
    return crack_unknown_increment(states, modulus, multiplier)


def crack_unknown_modulus(states):
    diffs = [s1 - s0 for s0, s1 in zip(states, states[1:])]
    zeroes = [t2*t0 - t1*t1 for t0, t1, t2 in zip(diffs, diffs[1:], diffs[2:])]
    modulus = abs(reduce(gcd, zeroes))
    return crack_unknown_multiplier(states, modulus)


def recover_lcg():
    io = remote('95.213.235.103', 8801)
    io.recvuntil(':')
    io.recvline()
    data = io.clean()
    data = data.split('\n')

    nums = []
    for x in data:
        try:
            int(x)
            nums.append(int(x))
        except:
            pass

    io.close()

    modulus, multiplier, increment = crack_unknown_modulus(nums)
    lcg = LCG(modulus, multiplier, increment, nums[-1])
    return lcg

if __name__ == '__main__':
    lcg = recover_lcg()
    print('modulus={}, multiplier={}, increment={}'.format(lcg.m, lcg.a, lcg.c))

