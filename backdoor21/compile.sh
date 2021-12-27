#!/bin/sh

gcc -fno-unwind-tables -fno-asynchronous-unwind-tables -ffunction-sections -fdata-sections -Wl,--gc-sections -fno-stack-protector -Os -s like_expl.c -static -o like_expl && strip like_expl

cp like_expl like_my_comments/ramfs/

rm -f like_my_comments/initramfs.cpio.gz

(cd like_my_comments/ramfs/; find . | cpio -o -c -R root:root | gzip -9 > ../initramfs.cpio.gz)
