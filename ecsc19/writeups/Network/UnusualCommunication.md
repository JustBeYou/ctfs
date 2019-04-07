# ECSC 2019
**Author: Feraru Mihail - mihailferaru2000@gmail.com - littlewho**

## Unusual Communication (200): Network

### Proof of flag
```
ECSC{5d0d4436ad7e07d5375948ad13746fe2987aa7fd7126dfdd47acedf89905a0a4}
```

### Summary
The transmission is full of HTTP traffic, but it is not relevant to our task. The image that was sent is encoded in the ICMP payloads.

### Proof of solving
I used a scapy script to extract the ICMP payloads and concatenate them.
```python
from scapy.all import *
data = "captura.pcapng"
a = rdpcap(data)
sessions = a.sessions()
i = 1
img = b""
for session in sessions:
    for packet in sessions[session]:
        try:
            if packet.getlayer(IP).src == '10.10.10.1':
                img += str(packet[ICMP].load)
        except Exception as e:
            print (e)
with open('img.png', 'w') as f: f.write(img[8*7:])
```

Looking at the image we see `admin password 7 ... very long text ...`. After a little bit of research I found that it is a CISCO pncoded password of type 7.
![](./password.png)

Any online cracker will do the job for us. (example: http://www.ifm.net.nz/cookbooks/passwordcracker.html)
