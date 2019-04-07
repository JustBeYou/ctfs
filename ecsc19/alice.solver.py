with open('Alice_replies.txt', 'r') as f:
    lines=f.readlines()

l = ["abcdef0123456789"] * 64
for i in range(len(lines)):
    for j in range(32, 64):
        l[j] = l[j].replace(lines[i][j], '')

for i in range(32):
    l[i] = {}

for i in range(len(lines)):
    for j in range(32):
        try:
            l[j][lines[i][j]]+=1
        except:
            l[j][lines[i][j]]=1

for i in range(32):
    for k in l[i].keys():
        if l[i][k]==1:
            l[i]=k
            break

print(''.join(l))
