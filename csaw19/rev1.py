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

exe = context.binary = ELF('gibberish_check')



def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

gdbscript = '''
break *0x{exe.entry:x}
continue
'''.format(**locals())

# -- Exploit goes here --

s=["dqzkenxmpsdoe_qkihmd","jffglzbo_zghqpnqqfjs","kdwx_vl_rnesamuxugap","ozntzohegxagreedxukr","xujaowgbjjhydjmmtapo","pwbzgymqvpmznoanomzx","qaqhrjofhfiuyt_okwxn","a_anqkczwbydtdwwbjwi","zoljafyuxinnvkxsskdu","irdlddjjokwtpbrrr_yj","cecckcvaltzejskg_qrc","vlpwstrhtcpxxnbbcbhv","spirysagnyujbqfhldsk","bcyqbikpuhlwordznpth","_xkiiusddvvicipuzyna","wsxyupdsqatrkzgawzbt","ybg_wmftbdcvlhhidril","ryvmngilaqkbsyojgify","mvefjqtxzmxf_vcyhelf","hjhofxwrk_rpwli_mxv_","enupmannieqqzcyevs_w","uhmvvb_cfgjkggjpavub","gktdphqiswomuwzvjtog","lgoehepwclbaifvtfoeq","nm_uxrukmof_fxsfpcqz","ttsbclzyyuslmutcylcm"]
for i in s:
    io = start()
    gdb.attach(io, '''
            break *93824992241346
            continue
            x/wx $rbp-0x40c
            ''')

    io.sendlineafter('!', i)
    data = io.recvline()
    data = io.recvline()
    print (i, data)
    io.close()
    break


