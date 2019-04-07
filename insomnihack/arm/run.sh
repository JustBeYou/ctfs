#!/bin/bash

qemu-system-arm \
    -m 128M \
    -M virt \
    -nographic \
    -serial stdio \
    -kernel zImage \
    -append 'console=ttyAMA0 loglevel=3 oops=panic panic=1 root=/dev/ram rdinit=/sbin/init' \
    -monitor /dev/null \
    -initrd rootfs.img  \
    -drive file=flag_part.img,if=none,format=raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 



