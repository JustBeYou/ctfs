import base64

def reverse(s):
    return s[::-1]


def b32decode(s):
    return base64.b32decode(s)


def reversePigLatin(s):
    return s[-1] + s[:-1]


def rot13(s):
    return s.decode('rot13')


def main():
    flag = '=YR2XYRGQJ6KWZENQZXGTQFGZ3XCXZUM33UOEIBJ'
    flag = reverse(flag)
    flag = b32decode(flag)
    flag = reversePigLatin(flag)
    flag = rot13(flag)
    return flag


if __name__ == '__main__':
    s = main()
    print s
