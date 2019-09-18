import socket

# START FUNCTIONS PART
def read_buffer():
    global buff, pos
    buff = s.recv(1024)
    print (buff)
    pos = 0                
    
def read_line():
    global buff, pos
    o = ''
    while buff[pos] != '\n':
        o += buff[pos]
        pos += 1
        if pos == len(buff):
            read_buffer()
    pos += 1
    if pos == len(buff):
        read_buffer()
    return o
    
def read_full_buff():
    global buff, pos
    o = ''
    while pos<len(buff):
        o += buff[pos]
        pos += 1
    pos += 1
    return o
    
def send_int(x):
    s.sendall(str(x)+' ')
    
def send_new_line():
    s.sendall('\n')

def solve_brute(v):
    d={}
    for i in range(2**len(v)):
        sum = 0
        s = []
        for j in range(len(v)):
            if((2**j) & i != 0):
                sum+=v[j]
                s.append(v[j])
        if(sum<=X):
            d[sum] = s
    return d

# END FUNCTIONS PART
    
#START SOLUTION PART

#start connection
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('89.38.208.143', 22021))

#initialize buffer
buff = ''
pos = 0
read_buffer()

print read_line()
for i in range(10):
    print read_line()
    X = int(read_line())
    print X
    
    v = map(int,read_full_buff().split())
    n = len(v)
    
    d1 = solve_brute(v[:n/2])
    d2 = solve_brute(v[n/2:])
    
    for a in d1:
        if(X-a in d2):
            ans = d1[a]+d2[X-a]
            send_int(len(ans))
            send_new_line()
            for a in ans:
                send_int(a)
            break
    read_buffer()
    print read_line()
while True:
    read_line()
#read public key

#END SOLUTION PART
