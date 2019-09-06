from Crypto.Util.number import *
from sage import *

def encrypt_time_capsule(msg, n, t, z):
	m = bytes_to_long(msg)
	l = pow(2, pow(2, t), n)
	c = l ^ z ^ m
	return (c, n, t, z)

def decrypt_time_capsule(c, n, t, z, phi):
    l = pow(2, pow(2, t, phi), n)
    print (l)
    m = c ^ z ^ l
    print (m)
    return long_to_bytes(m)

with open('input.txt', 'r') as f:
    input_data = eval(f.read().strip())
c, n, t, z, phi = input_data

# From Fermat's little theorem:
# a ^ k (mod n) = a ^ (k mod phi(n)) (mod n)

print ("c: {}".format(c))
print ("n: {}".format(n))
print ("phi: {}".format(phi))
print ("t: {}".format(t))
print ("z: {}".format(z))
print(decrypt_time_capsule(c, n, t, z, phi))
