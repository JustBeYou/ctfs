# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## Alice (300): Crypto

### Proof of flag
```
ECSC{dc0eb76143e50fe3dbeb6383605de5ffa9fefe455caca597677eab7cbf0ad649}
```

### Summary
We know that the attacker challenged Alice 16 times, all characters except two of them changed each time, only from the first half. That means that the correct characters from the second half must have 0 frequency in the answers. Also, as there are 16 queries * 2 characters per query, that means 32 queried characters in total. As the attacker tried to get the original hash, for sure he chose different ones each time. So, the frequency of correct characters in the first half must be 1.

### Proof of solving
Solving script:
```python
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
```
