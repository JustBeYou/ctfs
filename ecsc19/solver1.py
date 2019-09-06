x="-.-- --- ..-  -.-. .- -.  -. --- -  -.. . -... ..- --.  - .... .. ...  --- -. ."
print len(x.split())
a='3KRRFJUTKFNU3FGHU1ZFHOTGX5FYZKMGTUFC7C7C7C'.lower()
print len(a)
alpha=' abcdefghijklmnopqrstuvwxyz1234567890'
b=''
key=6
for c in a:
    print c
    b+=alpha[alpha.index(c)-key]
print b
