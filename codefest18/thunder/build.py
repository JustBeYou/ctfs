from os import listdir
import re

files = listdir('.')
files = [x for x in files if 'jpg' in x]

def tryint(s):
    try:
        return int(s)
    except:
        return s

def alphanum_key(s):
    """ Turn a string into a list of string and number chunks.
        "z23a" -> ["z", 23, "a"]
    """
    return [ tryint(c) for c in re.split('([0-9]+)', s) ]

def sort_nicely(l):
    """ Sort the given list in the way that humans expect.
    """
    l.sort(key=alphanum_key)

sort_nicely(files)

with open('good.jpg', 'wb') as f1:
    for filename in files:
        with open(filename, 'rb') as f2:
            data = f2.read()
        f1.write(data)

