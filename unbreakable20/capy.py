from scapy.all import *

a = rdpcap('./flag.pcap')
for p in a:
    if TCP in p:
        if p[TCP].dport == 1337:
            print (" ", end='')
            continue
        print (p[TCP].dport, end='')
#ctf{2f0e53fae2572c358b82bdddf6d02b4a5315cc453d2d9a1df7914bdffe6e61aa}
