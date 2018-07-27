#!/usr/bin/env python2

import struct
from PIL import Image
import dpkt

INIT_X, INIT_Y = 2000, 1000

def print_map(pcap, device):
    picture = Image.new("RGB", (4200, 2020), "white")
    pixels = picture.load()

    x, y = INIT_X, INIT_Y

    for ts, buf in pcap:
        device_id, = struct.unpack("b", buf[0x0B])

        if device_id != device:
            continue

        data = struct.unpack("bbbbbb", buf[-6:])

        status = data[0]
        x = x + data[2]
        y = y + data[3]

        if (status == 1):
            pixels[x, y] = (255, 0, 0, 0)
            pass
        else:
            pixels[x, y] = (255, 0, 0, 0)
        if (data[1] == 1):
            for i in range(-2, 2):
                for j in range(-2, 2):
                    pixels[x + i , y + j] = (0, 0, 0, 0)
    picture.save("track.png", "PNG")

if __name__ == "__main__":
    f = open("scribbler_b0a037b8a6569915ce9e96d9b0134eeae40b2b9d.pcap", 'rb')
    pcap = dpkt.pcap.Reader(f)

    print_map(pcap, 5)
    f.close()
