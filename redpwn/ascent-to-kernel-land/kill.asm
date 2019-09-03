
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 51 04             	mov    0x4(%ecx),%edx
	int i;

	if (argc < 2) {
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 2c                	jle    49 <main+0x49>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		printf(2, "usage: kill pid...\n");
		exit();
	}
	for (i = 1; i < argc; i++)
		kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 33                	pushl  (%ebx)
  2d:	83 c3 04             	add    $0x4,%ebx
  30:	e8 0b 02 00 00       	call   240 <atoi>
  35:	89 04 24             	mov    %eax,(%esp)
  38:	e8 a4 02 00 00       	call   2e1 <kill>
	for (i = 1; i < argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 e4                	jne    28 <main+0x28>
	exit();
  44:	e8 68 02 00 00       	call   2b1 <exit>
		printf(2, "usage: kill pid...\n");
  49:	50                   	push   %eax
  4a:	50                   	push   %eax
  4b:	68 e8 05 00 00       	push   $0x5e8
  50:	6a 02                	push   $0x2
  52:	e8 c9 03 00 00       	call   420 <printf>
		exit();
  57:	e8 55 02 00 00       	call   2b1 <exit>
		p->s.size += bp->s.size;
		p->s.ptr = bp->s.ptr;
	} else
		p->s.ptr = bp;
	freep = p;
}
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
		bp->s.size += p->s.ptr->s.size;
  60:	55                   	push   %ebp
  61:	31 d2                	xor    %edx,%edx
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
		bp->s.ptr = p->s.ptr->s.ptr;
  66:	8b 45 08             	mov    0x8(%ebp),%eax
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	if (p + p->s.size == bp) {
  70:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
		p->s.size += bp->s.size;
  77:	83 c2 01             	add    $0x1,%edx
	freep = p;
  7a:	84 c9                	test   %cl,%cl
  7c:	75 f2                	jne    70 <strcpy+0x10>
  7e:	5b                   	pop    %ebx
		p->s.size += bp->s.size;
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    
  81:	eb 0d                	jmp    90 <strcmp>
		p->s.ptr = bp->s.ptr;
  83:	90                   	nop
  84:	90                   	nop
  85:	90                   	nop
  86:	90                   	nop
}
  87:	90                   	nop
  88:	90                   	nop
  89:	90                   	nop
  8a:	90                   	nop
  8b:	90                   	nop
  8c:	90                   	nop
  8d:	90                   	nop
  8e:	90                   	nop
  8f:	90                   	nop

00000090 <strcmp>:
	free((void *)(hp + 1));
	return freep;
}

void *malloc(uint nbytes)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 5d 08             	mov    0x8(%ebp),%ebx
  98:	8b 75 0c             	mov    0xc(%ebp),%esi
	Header *p, *prevp;
	uint nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
  9b:	0f b6 13             	movzbl (%ebx),%edx
	if ((prevp = freep) == 0) {
  9e:	0f b6 0e             	movzbl (%esi),%ecx
  a1:	84 d2                	test   %dl,%dl
	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
  a3:	74 1e                	je     c3 <strcmp+0x33>
  a5:	b8 01 00 00 00       	mov    $0x1,%eax
  aa:	38 ca                	cmp    %cl,%dl
	if ((prevp = freep) == 0) {
  ac:	74 09                	je     b7 <strcmp+0x27>
  ae:	eb 20                	jmp    d0 <strcmp+0x40>
  b0:	83 c0 01             	add    $0x1,%eax
		base.s.ptr = freep = prevp = &base;
		base.s.size = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
  b3:	38 ca                	cmp    %cl,%dl
		if (p->s.size >= nunits) {
  b5:	75 19                	jne    d0 <strcmp+0x40>
  b7:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  bb:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
  bf:	84 d2                	test   %dl,%dl
  c1:	75 ed                	jne    b0 <strcmp+0x20>
  c3:	31 c0                	xor    %eax,%eax
  c5:	5b                   	pop    %ebx
  c6:	5e                   	pop    %esi
  c7:	29 c8                	sub    %ecx,%eax
  c9:	5d                   	pop    %ebp
	p = sbrk(nu * sizeof(Header));
  ca:	c3                   	ret    
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  d0:	0f b6 c2             	movzbl %dl,%eax
  d3:	5b                   	pop    %ebx
  d4:	5e                   	pop    %esi
  d5:	29 c8                	sub    %ecx,%eax
  d7:	5d                   	pop    %ebp
  d8:	c3                   	ret    
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strlen>:
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
		if (p->s.size >= nunits) {
  e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e6:	80 39 00             	cmpb   $0x0,(%ecx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 d2                	xor    %edx,%edx
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c2 01             	add    $0x1,%edx
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
	p = sbrk(nu * sizeof(Header));
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi
	if (p == (char *)-1)
 100:	31 c0                	xor    %eax,%eax
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	hp->s.size = nu;
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <memset>:
	free((void *)(hp + 1));
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
	return freep;
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
			if ((p = morecore(nunits)) == 0)
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
 122:	89 d0                	mov    %edx,%eax
				return 0;
	}
}
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
				return 0;
 127:	89 f6                	mov    %esi,%esi
}
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:
		if (p->s.size >= nunits) {
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 55 0c             	mov    0xc(%ebp),%edx
			if (p->s.size == nunits)
 13a:	0f b6 18             	movzbl (%eax),%ebx
				p->s.size -= nunits;
 13d:	84 db                	test   %bl,%bl
 13f:	74 1d                	je     15e <strchr+0x2e>
				p += p->s.size;
 141:	89 d1                	mov    %edx,%ecx
 143:	38 d3                	cmp    %dl,%bl
				p->s.size = nunits;
 145:	75 0d                	jne    154 <strchr+0x24>
			freep = prevp;
 147:	eb 17                	jmp    160 <strchr+0x30>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			return (void *)(p + 1);
 150:	38 ca                	cmp    %cl,%dl
 152:	74 0c                	je     160 <strchr+0x30>
}
 154:	83 c0 01             	add    $0x1,%eax
 157:	0f b6 10             	movzbl (%eax),%edx
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strchr+0x20>
 15e:	31 c0                	xor    %eax,%eax
		base.s.ptr = freep = prevp = &base;
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <gets>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	31 f6                	xor    %esi,%esi
 177:	53                   	push   %ebx
 178:	89 f3                	mov    %esi,%ebx
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 17a:	83 ec 1c             	sub    $0x1c,%esp
		base.s.size = 0;
 17d:	8b 7d 08             	mov    0x8(%ebp),%edi
 180:	eb 2f                	jmp    1b1 <gets+0x41>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		if (p->s.size >= nunits) {
 188:	83 ec 04             	sub    $0x4,%esp
 18b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 18e:	6a 01                	push   $0x1
				prevp->s.ptr = p->s.ptr;
 190:	50                   	push   %eax
 191:	6a 00                	push   $0x0
 193:	e8 31 01 00 00       	call   2c9 <read>
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
		cc = read(0, &c, 1);
		if (cc < 1)
 198:	83 c4 10             	add    $0x10,%esp
 19b:	85 c0                	test   %eax,%eax
 19d:	7e 1c                	jle    1bb <gets+0x4b>
			break;
		buf[i++] = c;
 19f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a3:	83 c7 01             	add    $0x1,%edi
 1a6:	88 47 ff             	mov    %al,-0x1(%edi)
		if (c == '\n' || c == '\r')
 1a9:	3c 0a                	cmp    $0xa,%al
 1ab:	74 23                	je     1d0 <gets+0x60>
 1ad:	3c 0d                	cmp    $0xd,%al
 1af:	74 1f                	je     1d0 <gets+0x60>
	for (i = 0; i + 1 < max;) {
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	89 fe                	mov    %edi,%esi
 1b6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b9:	7c cd                	jl     188 <gets+0x18>
 1bb:	89 f3                	mov    %esi,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
	buf[i] = '\0';
 1c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	90                   	nop
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d0:	8b 75 08             	mov    0x8(%ebp),%esi
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	01 de                	add    %ebx,%esi
 1d8:	89 f3                	mov    %esi,%ebx
	buf[i] = '\0';
 1da:	c6 03 00             	movb   $0x0,(%ebx)
}
 1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    
 1e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <stat>:

int stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 ef 00 00 00       	call   2f1 <open>
	if (fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
		return -1;
	r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f2 00 00 00       	call   309 <fstat>
	close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
	r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
	close(fd);
 21c:	e8 b8 00 00 00       	call   2d9 <close>
	return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:

int atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
	n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9')
 254:	77 1f                	ja     275 <atoi+0x35>
 256:	8d 76 00             	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
 260:	83 c1 01             	add    $0x1,%ecx
 263:	8d 04 80             	lea    (%eax,%eax,4),%eax
 266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	while ('0' <= *s && *s <= '9')
 26a:	0f be 11             	movsbl (%ecx),%edx
 26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
	return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void *memmove(void *vdst, void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 10             	mov    0x10(%ebp),%edx
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 28e:	85 d2                	test   %edx,%edx
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 c2                	add    %eax,%edx
	dst = vdst;
 294:	89 c7                	mov    %eax,%edi
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		*dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
	while (n-- > 0)
 2a1:	39 fa                	cmp    %edi,%edx
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
	return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	5f                   	pop    %edi
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    

000002a9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a9:	b8 01 00 00 00       	mov    $0x1,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <exit>:
SYSCALL(exit)
 2b1:	b8 02 00 00 00       	mov    $0x2,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <wait>:
SYSCALL(wait)
 2b9:	b8 03 00 00 00       	mov    $0x3,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <pipe>:
SYSCALL(pipe)
 2c1:	b8 04 00 00 00       	mov    $0x4,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <read>:
SYSCALL(read)
 2c9:	b8 05 00 00 00       	mov    $0x5,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <write>:
SYSCALL(write)
 2d1:	b8 10 00 00 00       	mov    $0x10,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <close>:
SYSCALL(close)
 2d9:	b8 15 00 00 00       	mov    $0x15,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <kill>:
SYSCALL(kill)
 2e1:	b8 06 00 00 00       	mov    $0x6,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <exec>:
SYSCALL(exec)
 2e9:	b8 07 00 00 00       	mov    $0x7,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <open>:
SYSCALL(open)
 2f1:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <mknod>:
SYSCALL(mknod)
 2f9:	b8 11 00 00 00       	mov    $0x11,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <unlink>:
SYSCALL(unlink)
 301:	b8 12 00 00 00       	mov    $0x12,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <fstat>:
SYSCALL(fstat)
 309:	b8 08 00 00 00       	mov    $0x8,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <link>:
SYSCALL(link)
 311:	b8 13 00 00 00       	mov    $0x13,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <mkdir>:
SYSCALL(mkdir)
 319:	b8 14 00 00 00       	mov    $0x14,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <chdir>:
SYSCALL(chdir)
 321:	b8 09 00 00 00       	mov    $0x9,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <dup>:
SYSCALL(dup)
 329:	b8 0a 00 00 00       	mov    $0xa,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <getpid>:
SYSCALL(getpid)
 331:	b8 0b 00 00 00       	mov    $0xb,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <sbrk>:
SYSCALL(sbrk)
 339:	b8 0c 00 00 00       	mov    $0xc,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <sleep>:
SYSCALL(sleep)
 341:	b8 0d 00 00 00       	mov    $0xd,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <uptime>:
SYSCALL(uptime)
 349:	b8 0e 00 00 00       	mov    $0xe,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    
 351:	66 90                	xchg   %ax,%ax
 353:	66 90                	xchg   %ax,%ax
 355:	66 90                	xchg   %ax,%ax
 357:	66 90                	xchg   %ax,%ax
 359:	66 90                	xchg   %ax,%ax
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
{
	write(fd, &c, 1);
}

static void printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
	uint x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x = -xx;
 366:	89 d3                	mov    %edx,%ebx
{
 368:	83 ec 3c             	sub    $0x3c,%esp
 36b:	89 45 bc             	mov    %eax,-0x44(%ebp)
	if (sgn && xx < 0) {
 36e:	85 d2                	test   %edx,%edx
 370:	0f 89 92 00 00 00    	jns    408 <printint+0xa8>
 376:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37a:	0f 84 88 00 00 00    	je     408 <printint+0xa8>
		neg = 1;
 380:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
		x = -xx;
 387:	f7 db                	neg    %ebx
	} else {
		x = xx;
	}

	i = 0;
 389:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 390:	8d 75 d7             	lea    -0x29(%ebp),%esi
 393:	eb 08                	jmp    39d <printint+0x3d>
 395:	8d 76 00             	lea    0x0(%esi),%esi
	do {
		buf[i++] = digits[x % base];
 398:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	} while ((x /= base) != 0);
 39b:	89 c3                	mov    %eax,%ebx
		buf[i++] = digits[x % base];
 39d:	89 d8                	mov    %ebx,%eax
 39f:	31 d2                	xor    %edx,%edx
 3a1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 3a4:	f7 f1                	div    %ecx
 3a6:	83 c7 01             	add    $0x1,%edi
 3a9:	0f b6 92 04 06 00 00 	movzbl 0x604(%edx),%edx
 3b0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
	} while ((x /= base) != 0);
 3b3:	39 d9                	cmp    %ebx,%ecx
 3b5:	76 e1                	jbe    398 <printint+0x38>
	if (neg)
 3b7:	8b 45 c0             	mov    -0x40(%ebp),%eax
 3ba:	85 c0                	test   %eax,%eax
 3bc:	74 0d                	je     3cb <printint+0x6b>
		buf[i++] = '-';
 3be:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3c3:	ba 2d 00 00 00       	mov    $0x2d,%edx
		buf[i++] = digits[x % base];
 3c8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 3cb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3ce:	8b 7d bc             	mov    -0x44(%ebp),%edi
 3d1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3d5:	eb 0f                	jmp    3e6 <printint+0x86>
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 3e0:	0f b6 13             	movzbl (%ebx),%edx
 3e3:	83 eb 01             	sub    $0x1,%ebx
	write(fd, &c, 1);
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ec:	6a 01                	push   $0x1
 3ee:	56                   	push   %esi
 3ef:	57                   	push   %edi
 3f0:	e8 dc fe ff ff       	call   2d1 <write>

	while (--i >= 0)
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	39 de                	cmp    %ebx,%esi
 3fa:	75 e4                	jne    3e0 <printint+0x80>
		putc(fd, buf[i]);
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ff:	5b                   	pop    %ebx
 400:	5e                   	pop    %esi
 401:	5f                   	pop    %edi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	neg = 0;
 408:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 40f:	e9 75 ff ff ff       	jmp    389 <printint+0x29>
 414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 41a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
 42c:	0f b6 1e             	movzbl (%esi),%ebx
 42f:	84 db                	test   %bl,%bl
 431:	0f 84 b9 00 00 00    	je     4f0 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
 437:	8d 45 10             	lea    0x10(%ebp),%eax
 43a:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
 43d:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
 440:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
 442:	89 45 d0             	mov    %eax,-0x30(%ebp)
 445:	eb 38                	jmp    47f <printf+0x5f>
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 450:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 453:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	74 17                	je     474 <printf+0x54>
	write(fd, &c, 1);
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	88 5d e7             	mov    %bl,-0x19(%ebp)
 463:	6a 01                	push   $0x1
 465:	57                   	push   %edi
 466:	ff 75 08             	pushl  0x8(%ebp)
 469:	e8 63 fe ff ff       	call   2d1 <write>
 46e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
 471:	83 c4 10             	add    $0x10,%esp
 474:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
 477:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 47b:	84 db                	test   %bl,%bl
 47d:	74 71                	je     4f0 <printf+0xd0>
		c = fmt[i] & 0xff;
 47f:	0f be cb             	movsbl %bl,%ecx
 482:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
 485:	85 d2                	test   %edx,%edx
 487:	74 c7                	je     450 <printf+0x30>
			}
		} else if (state == '%') {
 489:	83 fa 25             	cmp    $0x25,%edx
 48c:	75 e6                	jne    474 <printf+0x54>
			if (c == 'd') {
 48e:	83 f8 64             	cmp    $0x64,%eax
 491:	0f 84 99 00 00 00    	je     530 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 497:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 49d:	83 f9 70             	cmp    $0x70,%ecx
 4a0:	74 5e                	je     500 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 4a2:	83 f8 73             	cmp    $0x73,%eax
 4a5:	0f 84 d5 00 00 00    	je     580 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 4ab:	83 f8 63             	cmp    $0x63,%eax
 4ae:	0f 84 8c 00 00 00    	je     540 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 4b4:	83 f8 25             	cmp    $0x25,%eax
 4b7:	0f 84 b3 00 00 00    	je     570 <printf+0x150>
	write(fd, &c, 1);
 4bd:	83 ec 04             	sub    $0x4,%esp
 4c0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4c4:	6a 01                	push   $0x1
 4c6:	57                   	push   %edi
 4c7:	ff 75 08             	pushl  0x8(%ebp)
 4ca:	e8 02 fe ff ff       	call   2d1 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 4cf:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 4d2:	83 c4 0c             	add    $0xc,%esp
 4d5:	6a 01                	push   $0x1
 4d7:	83 c6 01             	add    $0x1,%esi
 4da:	57                   	push   %edi
 4db:	ff 75 08             	pushl  0x8(%ebp)
 4de:	e8 ee fd ff ff       	call   2d1 <write>
	for (i = 0; fmt[i]; i++) {
 4e3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 4e7:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 4ea:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 4ec:	84 db                	test   %bl,%bl
 4ee:	75 8f                	jne    47f <printf+0x5f>
		}
	}
}
 4f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
 4f8:	90                   	nop
 4f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 500:	83 ec 0c             	sub    $0xc,%esp
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
 508:	6a 00                	push   $0x0
 50a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	8b 13                	mov    (%ebx),%edx
 512:	e8 49 fe ff ff       	call   360 <printint>
				ap++;
 517:	89 d8                	mov    %ebx,%eax
 519:	83 c4 10             	add    $0x10,%esp
			state = 0;
 51c:	31 d2                	xor    %edx,%edx
				ap++;
 51e:	83 c0 04             	add    $0x4,%eax
 521:	89 45 d0             	mov    %eax,-0x30(%ebp)
 524:	e9 4b ff ff ff       	jmp    474 <printf+0x54>
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 0a 00 00 00       	mov    $0xa,%ecx
 538:	6a 01                	push   $0x1
 53a:	eb ce                	jmp    50a <printf+0xea>
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 540:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 543:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 546:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 548:	6a 01                	push   $0x1
				ap++;
 54a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 54d:	57                   	push   %edi
 54e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 551:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 554:	e8 78 fd ff ff       	call   2d1 <write>
				ap++;
 559:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 55c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 55f:	31 d2                	xor    %edx,%edx
 561:	e9 0e ff ff ff       	jmp    474 <printf+0x54>
 566:	8d 76 00             	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 570:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 573:	83 ec 04             	sub    $0x4,%esp
 576:	e9 5a ff ff ff       	jmp    4d5 <printf+0xb5>
 57b:	90                   	nop
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 580:	8b 45 d0             	mov    -0x30(%ebp),%eax
 583:	8b 18                	mov    (%eax),%ebx
				ap++;
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 58b:	85 db                	test   %ebx,%ebx
 58d:	74 17                	je     5a6 <printf+0x186>
				while (*s != 0) {
 58f:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 592:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 594:	84 c0                	test   %al,%al
 596:	0f 84 d8 fe ff ff    	je     474 <printf+0x54>
 59c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 59f:	89 de                	mov    %ebx,%esi
 5a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5a4:	eb 1a                	jmp    5c0 <printf+0x1a0>
					s = "(null)";
 5a6:	bb fc 05 00 00       	mov    $0x5fc,%ebx
				while (*s != 0) {
 5ab:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ae:	b8 28 00 00 00       	mov    $0x28,%eax
 5b3:	89 de                	mov    %ebx,%esi
 5b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
					s++;
 5c3:	83 c6 01             	add    $0x1,%esi
 5c6:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 5c9:	6a 01                	push   $0x1
 5cb:	57                   	push   %edi
 5cc:	53                   	push   %ebx
 5cd:	e8 ff fc ff ff       	call   2d1 <write>
				while (*s != 0) {
 5d2:	0f b6 06             	movzbl (%esi),%eax
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	84 c0                	test   %al,%al
 5da:	75 e4                	jne    5c0 <printf+0x1a0>
 5dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 5df:	31 d2                	xor    %edx,%edx
 5e1:	e9 8e fe ff ff       	jmp    474 <printf+0x54>
