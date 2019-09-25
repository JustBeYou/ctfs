#!/bin/bash

qemu-system-x86_64 \
    -enable-kvm \
    -kernel vmlinuz-4.15.0-64-generic \
    -initrd initramfs.cpio.gz \
    -nographic \
    -monitor /dev/null \
    -smp cores=2,threads=2 \
    -append "console=ttyS0 quiet"
