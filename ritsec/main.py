# uncompyle6 version 3.2.4
# Python bytecode 2.7 (62211)
# Decompiled from: Python 3.6.6 (default, Jul 19 2018, 14:25:17)
# [GCC 8.1.1 20180712 (Red Hat 8.1.1-5)]
# Embedded file name: main.py
# Compiled at: 2018-11-17 17:45:54
import datetime, struct
str = '\\x6a\\x71\\x61\\x62\\x7d\\x7a\\x4d\\x47\\x5f\\x55\\x59\\x5b\\x6e\\x4f\\x51\\x53\\x42\\x55\\x67\\x51\\x46\\x6e\\x55\\x40\\x69\\x43\\x45\\x48\\x5d\\x47\\x6e\\x4b\\x4c\\x5f\\x44\\x4d'



def a():
    time_res = "885189600"
    if True:
        print (time_res)
        b(time_res, str)
        print '\n'


def b(key, flag):
    res = ''
    arr = flag.split('\\x')[1:]
    for i in range(0, len(arr)):
        res += chr(ord(key[i % len(key)]) ^ int(arr[i], 16))

    print res


a()
print datetime.datetime.now().strftime('%s')
# okay decompiling main1.pyc
