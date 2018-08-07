use nmap on the server
you will see:
Starting Nmap 7.60 ( https://nmap.org ) at 2018-08-07 10:54 EEST
Nmap scan report for 226.187.154.104.bc.googleusercontent.com (104.154.187.226)
Host is up (0.16s latency).
Not shown: 996 filtered ports
PORT     STATE  SERVICE VERSION
22/tcp   open   ssh     OpenSSH 7.4p1 Debian 10+deb9u3 (protocol 2.0)
| ssh-hostkey: 
|   2048 25:97:23:e0:26:26:07:2e:f6:38:20:90:ce:39:44:96 (RSA)
|   256 66:2e:64:31:21:83:68:03:2b:05:30:05:7a:59:72:df (ECDSA)
|_  256 25:61:dd:51:b8:43:76:47:ba:96:16:fe:cd:09:e0:04 (EdDSA)
80/tcp   closed http
5901/tcp closed vnc-1
9418/tcp open   git?
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

So we have a git server.
Run the following
mkdir huge && cd huge
git init && git remote add origin git://104.154.187.226/huuuuuge
git pull origin master --depth=1
cat flag.txt

tjctf{this_fl4g_1s_huuuuuge}
