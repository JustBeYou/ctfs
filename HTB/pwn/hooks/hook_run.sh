#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $SCRIPTPATH
export LD_PRELOAD=$SCRIPTPATH/libchook.so

args=""
i=1
j=1
for var in "$@"
do
    if ((i > j)); then
        args=$args$var
    fi
    i=$((i+1))
done

$(pwd)/$1 $args
