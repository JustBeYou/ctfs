#!/bin/sh

# SeLinux rule
# chcon -Rt svirt_sandbox_file_t /home/littlewho/ctfs/
docker run -v /home/littlewho/ctfs/:/home/littlewho/ctfs --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it dock
