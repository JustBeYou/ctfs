#!/usr/bin/python

from pwn import *
from time import sleep

def _snd(s):
  io.send(s)
def _sndl(s):
  io.sendline(s)
def _snda(a,s):
  io.sendafter(a,s)
def _sndla(a,s):
  io.sendlineafter(a,s)
def _rcvu(s):
  return io.recvuntil(s)
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
def _rcvl():
    return io.recvline()


io = remote('vax.satellitesabove.me', 5035)
_rcvu('Ticket please:')
_sndl('ticket{alpha5609alpha:GMj4QSXgbH9ieLpsCTJheHELrpRqlhtlkM8gXBcrsoQZParuY-M5j9K2kUACvF7zzQ}')

_rcvu('Press enter to autoboot now, or any other key to abort:')
sleep(1)
_snd('\n\r\n\r\n')

io.interactive()

