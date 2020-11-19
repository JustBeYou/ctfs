io = None
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
from pwn import *
#context.log_level = 'error'

def connect():
    global io
    io = remote('mission.satellitesabove.me', 5023)
    ticket = 'ticket{uniform74490hotel:GK069N6YnYRpJm_7gz3qKTpgeFg16x7l-pegT6h2rgmnqbP0BIyuXtftd9r87CoqiA}'
    _sndla(':', ticket)

    _rcvu('so make note of your plan elsewhere.')

def disconnect():
    global io
    io.close()

from datetime import datetime, timedelta
from random import choice

modes = ['sun_point', 'imaging', 'data_downlink', 'wheel_desaturate']
date_format = "%Y-%m-%dT%H:%M:%SZ"

start_time = '2020-04-22T00:00:00Z'
start_time = datetime.strptime(start_time, date_format)

def send_plan(time, mode):
    _sndl(f'{time.strftime(date_format)} {mode}')

import ast
def get_telemetry():
    cdate = _rcvl()
    if cdate == b'2020-04-23T23:59:00Z\n':
        io.interactive()
        exit(0)

    if b'Failed' in cdate:
        raise Exception(b'Error: ' + cdate)

    data = _rcvl()
    mode_change = None
    sensors = None

    if b'Changing'  in data:
        mode_change = data
        sensors = ast.literal_eval(_rcvl().decode('utf-8'))
    else:
        sensors = ast.literal_eval(data.decode('utf-8'))

    collected = _rcvl()
    collected = float(collected.replace(b'Collected Data:', b'').replace(b'bytes', b'').strip())

    return (cdate, mode_change, sensors, collected)

def bruteforce_plan(i):
    send_plan(start_time, 'sun_point')

    send_plan(start_time + timedelta(minutes = i), 'imaging')
    send_plan(start_time + timedelta(minutes = i + 2), 'sun_point')

def run_plan():
    _sndl('run')
    _rcvu('Executing mission plan.\n')

def bruteforce_find(i):
    print (f'try for minute: {i}')
    connect()
    bruteforce_plan(i)
    run_plan()
    while True:
        try:
            info = get_telemetry()
            if info[3] != 0:
                print (f'[+] sucess at {i}')
        except Exception as e:
            print (f'failed for {i}: {e}')
            break
        #print (info[0], end=' ')
        #print (info[2]['adcs']['mode'], end=' ')
        #print (info[3], end=' ')
    disconnect()

#for i in range(180 + 120 * 4, 180 + 120 * 6):
#    bruteforce_find(i)

def good_plan():
    connect()
    send_plan(start_time, 'sun_point')

    send_plan(start_time + timedelta(hours=9, minutes=30), 'imaging')
    send_plan(start_time + timedelta(hours=9, minutes=37), 'sun_point')

    send_plan(start_time + timedelta(hours=10, minutes=47), 'data_downlink')
    send_plan(start_time + timedelta(hours=10, minutes=51), 'sun_point')

    send_plan(start_time + timedelta(hours = 20), 'wheel_desaturate')
    send_plan(start_time + timedelta(hours = 22), 'sun_point')

    send_plan(start_time + timedelta(days=1, hours=9, minutes=50), 'imaging')
    send_plan(start_time + timedelta(days=1, hours=9, minutes=57), 'sun_point')

    send_plan(start_time + timedelta(days=1, hours=11, minutes=10), 'data_downlink')
    send_plan(start_time + timedelta(days=1, hours=11, minutes=14), 'sun_point')



    run_plan()

    while True:
        try:
            info = get_telemetry()
        except Exception as e:
            print (e)
            break
        if True:
            print (info[0], end=' ')
            print (f'{info[2]["adcs"]["mode"]} cam temp: {info[2]["cam"]["temp"]:.2f} disk {info[2]["obc"]["disk"]:.2f} rpm 1: {info[2]["adcs"]["whl_rpm"][0]:.2f}', end = ' ')
            print (f'MiB to ground: {info[3]/1024/1024:.2f}', end=' ')
            print ()
    disconnect()

good_plan()
