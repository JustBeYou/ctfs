from scapy.all import *

s1=b""
s2=b""
a = rdpcap('./traffic.pcapng')
for p in a:
    if len(p)==123:
        if p[IP].src == "10.10.10.1": s1+=raw(p)[-4:]
        if p[IP].src == "10.10.10.251": s2+=raw(p)[-4:]
print (s1.decode('ascii'))
print (s2.decode('ascii'))

"""
 ❯ openssl aes-256-cbc -d -K 74C95604043427F0BEE1D0E16BFA53AFD537F736AD0073C4CC4E1CCB3A82B5DC -iv 8BF46C25D9BAD98ED8EAE6C1F7AD2D04 -a
KQ6R50gkQLYCkY90yIBDHDznHRUyMaTijWmHO30UXjwftOMIGgZJhKh2xli7Sqln
CTF{25B24F21A9B698C026A7FF6D911B25%                                                                       ❯ openssl aes-256-cbc -d -K 74C95604043427F0BEE1D0E16BFA53AFD537F736AD0073C4CC4E1CCB3A82B5DC -iv 8BF46C25D9BAD98ED8EAE6C1F7AD2D04 -a
uWyYTCYqBTy9afI69to3eK0ScCA3SlPDEzBsWBnR9D8Ro7aIOqihGMPXwu/Z+HLn
2414260C11A4A7F46DD6885C9BAA0A5386}%                                                                     ~/ctfs/rocsc20                                                                                  11:40:06
 ❯
CTF{25B24F21A9B698C026A7FF6D911B252414260C11A4A7F46DD6885C9BAA0A5386}
"""
