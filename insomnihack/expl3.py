import paramiko
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect('1118daysober.teaser.insomnihack.ch', username='1118daysober', password='1118daysober')
ssh_stdin, ssh_stdout, ssh_stderr = ssh.exec_command('ls -la')

print (ssh_stdout.readlines())
