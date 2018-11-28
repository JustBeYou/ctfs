import string
import base64

my_base64chars  = ''.join([chr(x) for x in range(32, 96)])
std_base64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

s = "25-Q44E233=,>E-M34=,,$LS5VEQ45)M2S-),7-$/3T "
s = s.translate(string.maketrans(my_base64chars, std_base64chars))
s = base64.b64decode(s)
print (s)

rot13 = string.maketrans(
    "ABCDEFGHIJKLMabcdefghijklmNOPQRSTUVWXYZnopqrstuvwxyz",
    "NOPQRSTUVWXYZnopqrstuvwxyzABCDEFGHIJKLMabcdefghijklm")

s = string.translate(s, rot13)
print (s)

s = base64.b64decode(s)
print (s)
