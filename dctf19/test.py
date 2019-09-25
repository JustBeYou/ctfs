from pwn import *

mod = 3
s = remote ("206.81.24.129", 2338)
while True:
    s.recvuntil ("You curently have: ")
    money = int (s.recvline ().strip().strip("$"))
    s.recv ()
    print ("Money: " + str (money))
        
    if (money >= 300):
        print ("MONEYSHOT")
        s.interactive ()

    if (money % mod == 0):
        s.sendline ("1")
    else:
        s.sendline ("2")
    
    s.recvuntil ("Press 1 to play, press 2 to exit.")
    s.sendline ("1")
    s.recvuntil ("Press 1 to play, press 2 to exit.")
    s.sendline ("2")
    s.sendline ("")
