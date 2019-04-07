# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## get-password (100): Revexp

### Proof of flag
```
ECSC{DAC553500B60BF700F56E456922104FA06BC144213ED2B58BEC2429F015242DB}
```

### Summary
We have a Mach-O binary that checks a passowrd and as I was unable to run it, I solved it statically.

### Proof of solving
After disassembling with IDA, we got this piece of code that checks the password:
```
  memcpy(tmp_matrix, &strings_matrix, 160uLL);
  for ( i = 0; i < 96; ++i )
  {
    if ( *(char *)(tmp_matrix[i % 20] + 2 * (i / 10)) - input_password[i] != 1 )
    {
      v3 = 1;
      goto WRONG;
    }
  }
```
So, I wrote a script that reverses this process:
```python
with open('get', 'rb') as f:
    f.read(0xDCC)
    data = f.read(21 * (160 / 8))

data = data.split("\x00")
flag = ""
for i in range(96):
    flag += chr(ord(data[i % 20][2 * (i // 10)]) - 1)

from base64 import b64decode
print (b64decode(flag))
```
