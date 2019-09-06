from Crypto.Util.number import inverse

def dlp(leak, p, g):
    leak[0]%=p
    for i in range(1,len(leak)):
        leak[i]=(leak[i]*inverse(leak[0],p))%p

    o=[]
    for h in leak:
        i=0
        aux=1
        while(aux!=h):
            aux=(aux*g)%p
            i+=1
        o.append(i)
    return o

def gg(tup, a, x):
    (_, p, g), n = tup, len(a)
    print (n, len(bin(x)[2:]))
    assert len(bin(x)[2:]) <= n
    X = bin(x)[2:].zfill(n)
    f_ax = g
    for i in range(1, n):
        f_ax *= pow(g, a[i] * int(X[i]), p)
    return f_ax % p

n = 93999052302971946473672759184397409116
tup = (0xdeadbeef, 0x85336d6b235651703f7ec444168b6377, 0x500ab9f96ccdabc7c9d2287e0949de16)
a = dlp(leak, tup[1], tup[2])
print (a)

for i in range(5):
    print (gg(tup, a, n + i))
