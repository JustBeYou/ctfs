#!/usr/bin/env python2

from __future__ import print_function
import struct
import angr

def main():
    project = angr.Project("./gates-of-hell")

    state = project.factory.blank_state(addr=0x08048060)

    return solution

if __name__ == "__main__":
    print (main())

