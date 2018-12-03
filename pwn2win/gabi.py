import numpy as np
def Pow(b,exp,mod):
    ans=np.array([1,0,0,1]).reshape(2,2)
    i=1
    while(i<=exp):
        if(i&exp):
            ans=np.matmul(ans,b)
            ans%=mod
        b=np.matmul(b,b)
        b%=mod
        i*=2
    return ans

def decrypt_char(char0,char1):
    mod=242612
    exp=pow(char0,2)-1
    x=np.array([0,1,1,1]).reshape(2,2)
    x=Pow(x,exp,mod)
    y=np.matmul(np.array([char0,char1]),x)
    char1=(y[1]%89 + 37)%256
    return char1
    
print decrypt_char(10, 12)
