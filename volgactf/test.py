with open('dick.txt', 'r') as f:
    text = f.read()

d = eval(text)
print (len(d.keys()))

print (d.keys())
m = d.keys()[0]
for x in d.keys():
    m = min(m, int(x))
print (x)
