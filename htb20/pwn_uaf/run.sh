#!/bin/sh

# SeLinux rule
# chcon -Rt svirt_sandbox_file_t /home/littlewho/ctfs/pwn/tw
docker run -v /home/littlewho/ctfs/htb20/pwn_uaf:/home/littlewho --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it pwn_uaf
