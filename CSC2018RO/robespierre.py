s = 0
for i in range(1, 24948):
    j = str(i)
    j = j.split("0")
    for k in j:
        if k == '': continue
        s += int(k)

print (s)
