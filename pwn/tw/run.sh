#!/bin/sh

# SeLinux rule
# chcon -Rt svirt_sandbox_file_t /home/littlewho/ctfs/pwn/tw
docker run -v /home/littlewho/ctfs/pwn/tw:/home/littlewho/tw --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it pwnabletw
