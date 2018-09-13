with open('prg.txt') as f:
    s = f.read().strip()

charset = set()
for c in s:
    charset.add(c)

print (charset)
