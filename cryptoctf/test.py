n = 100
phi = n*prod([1 - 1/p for p in prime_divisors(n)])
print (phi)
