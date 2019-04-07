#!/usr/bin/env python

import sys, paramiko


hostname = "1118daysober.teaser.insomnihack.ch"
password = "1118daysober"
command = "ls -l"

username = "1118daysober"
port = 22

try:
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.WarningPolicy)

    client.connect(hostname, port=port, username=username, password=password)

    stdin, stdout, stderr = client.exec_command(command)
    print stdout.read(),

finally:
    client.close()
