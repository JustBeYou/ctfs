#!/bin/sh
gcc -fPIC -shared  -o libchook.so default.c -ldl
