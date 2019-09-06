"""
  memcpy(tmp_matrix, &strings_matrix, 160uLL);
  for ( i = 0; i < 96; ++i )
  {
    if ( *(char *)(tmp_matrix[i % 20] + 2 * (i / 10)) - input_password[i] != 1 )
    {
      v3 = 1;
      goto WRONG;
    }
  }
"""

with open('get', 'rb') as f:
    f.read(0xDCC)
    data = f.read(21 * (160 / 8))

data = data.split("\x00")
flag = ""
for i in range(96):
    flag += chr(ord(data[i % 20][2 * (i // 10)]) - 1)

from base64 import b64decode
print (b64decode(flag))
