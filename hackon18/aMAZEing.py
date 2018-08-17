from Queue import Queue
from PIL import Image
import numpy
from pwn import *

Size=0
dirx=[0,1,0,-1]
diry=[1,0,-1,0]
d=['D','S','A','W']

def BFS(node,dest):
	q=Queue()
	q.put(node)
	while(not q.empty()):
		node=q.get()
		for i in range(4):
			son=[0,0]
			son[0]+=node[0]+dirx[i]
			son[1]+=node[1]+diry[i]
			if(son[0]>=0 and son[1]>=0 and son[0]<Size and son[1]<Size and mat[son[0]][son[1]]==0 and found[son[0]][son[1]]==0):
				father[son[0]][son[1]]=i
				found[son[0]][son[1]]=1
				q.put(son)
	out=''
	while(dest!=[0,0]):
		t=father[dest[0]][dest[1]]
		if(t==-1):
			while(not q.empty()):
				q.get()
			return "INVALID"
		out+=d[t]
		dest[0]-=dirx[t]
		dest[1]-=diry[t]
	out=''.join(list(reversed(out)))
	return out

s=remote('139.59.30.165','9300')

print s.recv()
s.send('\n')
while(1):
	x=s.recvuntil('\x42\x60\x82')

	open('maze.png','wb').write(x)

	maze=numpy.asarray(Image.open('maze.png'))

	Size=len(maze)/10

	mat=[[0 for i in range(Size)] for j in range(Size)]
	found=[[0 for i in range(Size)] for j in range(Size)]
	father=[[-1 for i in range(Size)] for j in range(Size)]


	for i in range(Size):
		for j in range(Size):
			mat[i][j]=1-maze[i*10][j*10][0]/255

	s.recv()
	s.sendline(BFS([0,0],[Size-1,Size-1]))
	print s.recvline()
