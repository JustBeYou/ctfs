Open the binary in IDA. Reading the assembly code we could figure out the followings:
- ax = buffer address 0x26b (data)
- bx = buffer address 0x2000 (stack)
- cx = counter
- dx = constant value (counter stop at 4)

We could write a little pseudo-code of what is happening:

```
ax = 0x26b
bx = 0x2000

read(bx) // read from stdin

dx = 4
for cx = 0..dx {
    if *ax != *bx {
        goto WRONG
    }
    ax++
    bx++
}

// ----------------------
if *ax ^ *bx != some hard coded value {
    goto WRONG
}
ax++
bx++
// repeat this block of code 4 times

CORECT:
    print flag
    exit

WRONG:
    print wrong message
    exit
```

So, looking at the strings in data we craft the following script:
```
s1 = "fyty"
s2 = "SHEL"

for i in range(4):
    print (chr(ord(s1[i]) ^ ord(s2[i])))
```

Now we have the serial: 1337-5115
And the flag: SECT{K3YG3N_MU51C_R0CK5}
