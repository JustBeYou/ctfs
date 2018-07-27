#!/usr/bin/env python2
import dpkt
import re

reader = dpkt.pcap.Reader(open('bootleg_iodine_b462e0e66e87e07b9fe15ec03b51dd321547e386.pcap'))

res = ''
for ts, data in reader:
    r = re.search('([A-Z0-9=]+)\\.myfile', data)
    if r:
        res += r.groups()[0]
        print(r.groups()[0])

print(res)
