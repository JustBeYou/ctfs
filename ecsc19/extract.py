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
