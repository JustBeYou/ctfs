# coding: utf-8
with open('Alice_replies.txt', 'r') as f:
    lines=f.readlines()
    
lines
lines =[x.strip() for x in lines]
lines
16 * 32
16 * 2
len("3563504f92d40f67f1f8c7a4f57437274b2b1690ad0570b11c9b3f80e6cb5ca7")
half=[[]] * 16
for i in range(len(lines) - 1):
    for j in range(len(lines[0]) /2):
        if (lines[i][j] == lines[i + 1][j]):
            half[j].append(lines[i][j])
            
half=[[]] * 32
for i in range(len(lines) - 1):
    for j in range(len(lines[0]) / 2):
        if (lines[i][j] == lines[i + 1][j]):
            half[j].append(lines[i][j])
            
            
half
get_ipython().magic(u'clear ')
lines
for i in range(len(lines) - 1):
    print (lines[i], lines[i+1])
    
for i in range(len(lines)):
    print (lines[i][:32])
    
    
get_ipython().magic(u'clear ')
get_ipython().magic(u'ls ')
l = [["abcdef0123456789"]] * 64
l
get_ipython().magic(u'clear ')
get_ipython().magic(u'ls ')
l = ["abcdef0123456789"] * 64
for i in range(len(lines)):
    for j in range(32, 64):
        l[j] = l[j].replace(lines[i][j], '')
        
    
    
l
lines
for i in range(len(lines) - 1):
    a=line[i]
    b=line[i+1]
    for j in range(32):
        if a[j]==b[j]:
            l[j]=a[j]
            
    
    
for i in range(len(lines) - 1):
    a=lines[i]
    b=lines[i+1]
    for j in range(32):
        if a[j]==b[j]:
            l[j]=a[j]
            
    
    
l
for i in range(len(lines) - 1):
    a=lines[i]
    b=lines[i+1]
    for j in range(32):
        if a[j]==b[j]:
            l[j]=a[j]
        elif len(l[j]) > 1:
            l[j]=l[j].replace(a[j], '')
            
            
    
    
l
for i in range(32):
    l[i] = {}
    
l
for i in range(len(lines)):
    for j in range(32):
        try:
            l[j][lines[i][j]]+=1
        except:
            l[j][lines[i][j]]=1
            
            
            
    
    
l
for i in range(32):
    for k in l[i].keys():
        if l[i][k]==1:
            print k,
         print
for i in range(32):
    for k in l[i].keys():
        if l[i][k]==1:
            print k,
         print
for i in range(32):
    for k in l[i].keys():
        if l[i][k]==1:
            print k,
         print ()
for i in range(32):
    for k in l[i].keys():
        if l[i][k]==1:
            print k,
        print ()
        
for i in range(32):
    for k in l[i].keys():
        if l[i][k]==1:
            l[i]=k
            break
        
        
l
''.join(l)
get_ipython().magic(u'save alice.solver')
get_ipython().magic(u'save alice.solver 10000')
get_ipython().magic(u'save alice.solver 1-10000')
