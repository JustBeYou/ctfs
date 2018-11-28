ciphertext = "wpwt#5ng4_qbitp#8mq59r_g866c4t59c6vy6tisj4af6bprfnbd_wrq2wjmr4ld_s26a7i#biiyqjolq8lus_wfusfkj8xv2qrrv3etab_marovc#uuoueyl"
key        = "pq_xc589r3nb#mgjtkh7w2dlfvy4eaoi6uzs"
alphabet   = "#_23456789abcdefghijklmnopqrstuvwxyz"
modulo = len(alphabet)

def ord(c):
    return alphabet.index(c)

def chr(i):
    return alphabet[i]

S = range(modulo)
j = 0
out = []

# KSA
for i in range(modulo):
    j = (j + S[i] + ord( key[i % len(key)] )) % modulo
    S[i] , S[j] = S[j] , S[i]

print ("KSA: " + ' '.join([str(x) + '({})'.format(chr(x)) for x in S]))

#PRGA
i = j = 0
for char in ciphertext:
    i = ( i + 1 ) % modulo
    j = ( j + S[i] ) % modulo
    S[i] , S[j] = S[j] , S[i]
    out.append(chr((ord(char) ^ S[(S[i] + S[j]) % modulo]) % modulo))

print (''.join(out))
