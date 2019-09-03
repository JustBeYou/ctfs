
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fs.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
	int fd, i;
	char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	pushl  -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
	char data[512];

	printf(1, "stressfs starting\n");
	memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

	for (i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
	char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
	printf(1, "stressfs starting\n");
  2b:	68 c8 06 00 00       	push   $0x6c8
  30:	6a 01                	push   $0x1
	char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
	printf(1, "stressfs starting\n");
  46:	e8 b5 04 00 00       	call   500 <printf>
	memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 95 01 00 00       	call   1f0 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
		if (fork() > 0)
  5e:	e8 26 03 00 00       	call   389 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
	for (i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
			break;

	printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx

	path[8] += i;
	fd = open(path, O_CREATE | O_RDWR);
  7c:	bb 14 00 00 00       	mov    $0x14,%ebx
	printf(1, "write %d\n", i);
  81:	68 db 06 00 00       	push   $0x6db
  86:	6a 01                	push   $0x1
  88:	e8 73 04 00 00       	call   500 <printf>
	path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
	fd = open(path, O_CREATE | O_RDWR);
  8f:	5f                   	pop    %edi
	path[8] += i;
  90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
	fd = open(path, O_CREATE | O_RDWR);
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 29 03 00 00       	call   3d1 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  ad:	8d 76 00             	lea    0x0(%esi),%esi
	for (i = 0; i < 20; i++)
		//    printf(fd, "%d\n", i);
		write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 f2 02 00 00       	call   3b1 <write>
	for (i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
	close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 e9 02 00 00       	call   3b9 <close>

	printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 e5 06 00 00       	push   $0x6e5
  d7:	6a 01                	push   $0x1
  d9:	e8 22 04 00 00       	call   500 <printf>

	fd = open(path, O_RDONLY);
  de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e4:	59                   	pop    %ecx
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	bb 14 00 00 00       	mov    $0x14,%ebx
  ed:	50                   	push   %eax
  ee:	e8 de 02 00 00       	call   3d1 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	for (i = 0; i < 20; i++)
		read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 9a 02 00 00       	call   3a9 <read>
	for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
	close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 99 02 00 00       	call   3b9 <close>

	wait();
 120:	e8 74 02 00 00       	call   399 <wait>

	exit();
 125:	e8 67 02 00 00       	call   391 <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
	if ((prevp = freep) == 0) {
		base.s.ptr = freep = prevp = &base;
		base.s.size = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
		if (p->s.size >= nunits) {
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
			if (p->s.size == nunits)
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
				prevp->s.ptr = p->s.ptr;
			else {
				p->s.size -= nunits;
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
 140:	55                   	push   %ebp
				p += p->s.size;
 141:	31 d2                	xor    %edx,%edx
 143:	89 e5                	mov    %esp,%ebp
				p->s.size = nunits;
 145:	53                   	push   %ebx
 146:	8b 45 08             	mov    0x8(%ebp),%eax
			}
			freep = prevp;
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			return (void *)(p + 1);
 150:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
		}
		if (p == freep)
			if ((p = morecore(nunits)) == 0)
				return 0;
	}
}
 154:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 c9                	test   %cl,%cl
 15c:	75 f2                	jne    150 <strcpy+0x10>
 15e:	5b                   	pop    %ebx
 15f:	5d                   	pop    %ebp
		base.s.ptr = freep = prevp = &base;
 160:	c3                   	ret    
 161:	eb 0d                	jmp    170 <strcmp>
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
		base.s.size = 0;
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
		base.s.ptr = freep = prevp = &base;
 16f:	90                   	nop

00000170 <strcmp>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
		base.s.size = 0;
 17b:	0f b6 13             	movzbl (%ebx),%edx
 17e:	0f b6 0e             	movzbl (%esi),%ecx
 181:	84 d2                	test   %dl,%dl
 183:	74 1e                	je     1a3 <strcmp+0x33>
		if (p->s.size >= nunits) {
 185:	b8 01 00 00 00       	mov    $0x1,%eax
 18a:	38 ca                	cmp    %cl,%dl
 18c:	74 09                	je     197 <strcmp+0x27>
 18e:	eb 20                	jmp    1b0 <strcmp+0x40>
				prevp->s.ptr = p->s.ptr;
 190:	83 c0 01             	add    $0x1,%eax
 193:	38 ca                	cmp    %cl,%dl
 195:	75 19                	jne    1b0 <strcmp+0x40>
	return os;
}

int strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 197:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 19b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 19f:	84 d2                	test   %dl,%dl
 1a1:	75 ed                	jne    190 <strcmp+0x20>
 1a3:	31 c0                	xor    %eax,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
 1a5:	5b                   	pop    %ebx
 1a6:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 1a7:	29 c8                	sub    %ecx,%eax
}
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b0:	0f b6 c2             	movzbl %dl,%eax
 1b3:	5b                   	pop    %ebx
 1b4:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 1b5:	29 c8                	sub    %ecx,%eax
}
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strlen>:

uint strlen(char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c2 01             	add    $0x1,%edx
 1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
		;
	return n;
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
	for (n = 0; s[n]; n++)
 1e0:	31 c0                	xor    %eax,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001f0 <memset>:

void *memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char *strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 21a:	0f b6 18             	movzbl (%eax),%ebx
 21d:	84 db                	test   %bl,%bl
 21f:	74 1d                	je     23e <strchr+0x2e>
 221:	89 d1                	mov    %edx,%ecx
		if (*s == c)
 223:	38 d3                	cmp    %dl,%bl
 225:	75 0d                	jne    234 <strchr+0x24>
 227:	eb 17                	jmp    240 <strchr+0x30>
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0c                	je     240 <strchr+0x30>
	for (; *s; s++)
 234:	83 c0 01             	add    $0x1,%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strchr+0x20>
			return (char *)s;
	return 0;
 23e:	31 c0                	xor    %eax,%eax
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <gets>:

char *gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 255:	31 f6                	xor    %esi,%esi
{
 257:	53                   	push   %ebx
 258:	89 f3                	mov    %esi,%ebx
 25a:	83 ec 1c             	sub    $0x1c,%esp
 25d:	8b 7d 08             	mov    0x8(%ebp),%edi
	for (i = 0; i + 1 < max;) {
 260:	eb 2f                	jmp    291 <gets+0x41>
 262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		cc = read(0, &c, 1);
 268:	83 ec 04             	sub    $0x4,%esp
 26b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 26e:	6a 01                	push   $0x1
 270:	50                   	push   %eax
 271:	6a 00                	push   $0x0
 273:	e8 31 01 00 00       	call   3a9 <read>
		if (cc < 1)
 278:	83 c4 10             	add    $0x10,%esp
 27b:	85 c0                	test   %eax,%eax
 27d:	7e 1c                	jle    29b <gets+0x4b>
			break;
		buf[i++] = c;
 27f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 283:	83 c7 01             	add    $0x1,%edi
 286:	88 47 ff             	mov    %al,-0x1(%edi)
		if (c == '\n' || c == '\r')
 289:	3c 0a                	cmp    $0xa,%al
 28b:	74 23                	je     2b0 <gets+0x60>
 28d:	3c 0d                	cmp    $0xd,%al
 28f:	74 1f                	je     2b0 <gets+0x60>
	for (i = 0; i + 1 < max;) {
 291:	83 c3 01             	add    $0x1,%ebx
 294:	89 fe                	mov    %edi,%esi
 296:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 299:	7c cd                	jl     268 <gets+0x18>
 29b:	89 f3                	mov    %esi,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
	buf[i] = '\0';
 2a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    
 2ab:	90                   	nop
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 de                	add    %ebx,%esi
 2b8:	89 f3                	mov    %esi,%ebx
	buf[i] = '\0';
 2ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c0:	5b                   	pop    %ebx
 2c1:	5e                   	pop    %esi
 2c2:	5f                   	pop    %edi
 2c3:	5d                   	pop    %ebp
 2c4:	c3                   	ret    
 2c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <stat>:

int stat(char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 ef 00 00 00       	call   3d1 <open>
	if (fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
		return -1;
	r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f2 00 00 00       	call   3e9 <fstat>
	close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
	r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
	close(fd);
 2fc:	e8 b8 00 00 00       	call   3b9 <close>
	return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <atoi>:

int atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
	n = 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9')
 334:	77 1f                	ja     355 <atoi+0x35>
 336:	8d 76 00             	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
 340:	83 c1 01             	add    $0x1,%ecx
 343:	8d 04 80             	lea    (%eax,%eax,4),%eax
 346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	while ('0' <= *s && *s <= '9')
 34a:	0f be 11             	movsbl (%ecx),%edx
 34d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
	return n;
}
 355:	5b                   	pop    %ebx
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void *memmove(void *vdst, void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 55 10             	mov    0x10(%ebp),%edx
 367:	8b 45 08             	mov    0x8(%ebp),%eax
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 36e:	85 d2                	test   %edx,%edx
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 c2                	add    %eax,%edx
	dst = vdst;
 374:	89 c7                	mov    %eax,%edi
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		*dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
	while (n-- > 0)
 381:	39 fa                	cmp    %edi,%edx
 383:	75 fb                	jne    380 <memmove+0x20>
	return vdst;
}
 385:	5e                   	pop    %esi
 386:	5f                   	pop    %edi
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 389:	b8 01 00 00 00       	mov    $0x1,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <exit>:
SYSCALL(exit)
 391:	b8 02 00 00 00       	mov    $0x2,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <wait>:
SYSCALL(wait)
 399:	b8 03 00 00 00       	mov    $0x3,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <pipe>:
SYSCALL(pipe)
 3a1:	b8 04 00 00 00       	mov    $0x4,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <read>:
SYSCALL(read)
 3a9:	b8 05 00 00 00       	mov    $0x5,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <write>:
SYSCALL(write)
 3b1:	b8 10 00 00 00       	mov    $0x10,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <close>:
SYSCALL(close)
 3b9:	b8 15 00 00 00       	mov    $0x15,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <kill>:
SYSCALL(kill)
 3c1:	b8 06 00 00 00       	mov    $0x6,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <exec>:
SYSCALL(exec)
 3c9:	b8 07 00 00 00       	mov    $0x7,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <open>:
SYSCALL(open)
 3d1:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <mknod>:
SYSCALL(mknod)
 3d9:	b8 11 00 00 00       	mov    $0x11,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <unlink>:
SYSCALL(unlink)
 3e1:	b8 12 00 00 00       	mov    $0x12,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <fstat>:
SYSCALL(fstat)
 3e9:	b8 08 00 00 00       	mov    $0x8,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <link>:
SYSCALL(link)
 3f1:	b8 13 00 00 00       	mov    $0x13,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <mkdir>:
SYSCALL(mkdir)
 3f9:	b8 14 00 00 00       	mov    $0x14,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <chdir>:
SYSCALL(chdir)
 401:	b8 09 00 00 00       	mov    $0x9,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <dup>:
SYSCALL(dup)
 409:	b8 0a 00 00 00       	mov    $0xa,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <getpid>:
SYSCALL(getpid)
 411:	b8 0b 00 00 00       	mov    $0xb,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <sbrk>:
SYSCALL(sbrk)
 419:	b8 0c 00 00 00       	mov    $0xc,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <sleep>:
SYSCALL(sleep)
 421:	b8 0d 00 00 00       	mov    $0xd,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <uptime>:
SYSCALL(uptime)
 429:	b8 0e 00 00 00       	mov    $0xe,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    
 431:	66 90                	xchg   %ax,%ax
 433:	66 90                	xchg   %ax,%ax
 435:	66 90                	xchg   %ax,%ax
 437:	66 90                	xchg   %ax,%ax
 439:	66 90                	xchg   %ax,%ax
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
{
	write(fd, &c, 1);
}

static void printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
	uint x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x = -xx;
 446:	89 d3                	mov    %edx,%ebx
{
 448:	83 ec 3c             	sub    $0x3c,%esp
 44b:	89 45 bc             	mov    %eax,-0x44(%ebp)
	if (sgn && xx < 0) {
 44e:	85 d2                	test   %edx,%edx
 450:	0f 89 92 00 00 00    	jns    4e8 <printint+0xa8>
 456:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45a:	0f 84 88 00 00 00    	je     4e8 <printint+0xa8>
		neg = 1;
 460:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
		x = -xx;
 467:	f7 db                	neg    %ebx
	} else {
		x = xx;
	}

	i = 0;
 469:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 470:	8d 75 d7             	lea    -0x29(%ebp),%esi
 473:	eb 08                	jmp    47d <printint+0x3d>
 475:	8d 76 00             	lea    0x0(%esi),%esi
	do {
		buf[i++] = digits[x % base];
 478:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	} while ((x /= base) != 0);
 47b:	89 c3                	mov    %eax,%ebx
		buf[i++] = digits[x % base];
 47d:	89 d8                	mov    %ebx,%eax
 47f:	31 d2                	xor    %edx,%edx
 481:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 484:	f7 f1                	div    %ecx
 486:	83 c7 01             	add    $0x1,%edi
 489:	0f b6 92 f4 06 00 00 	movzbl 0x6f4(%edx),%edx
 490:	88 14 3e             	mov    %dl,(%esi,%edi,1)
	} while ((x /= base) != 0);
 493:	39 d9                	cmp    %ebx,%ecx
 495:	76 e1                	jbe    478 <printint+0x38>
	if (neg)
 497:	8b 45 c0             	mov    -0x40(%ebp),%eax
 49a:	85 c0                	test   %eax,%eax
 49c:	74 0d                	je     4ab <printint+0x6b>
		buf[i++] = '-';
 49e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4a3:	ba 2d 00 00 00       	mov    $0x2d,%edx
		buf[i++] = digits[x % base];
 4a8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 4ab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4ae:	8b 7d bc             	mov    -0x44(%ebp),%edi
 4b1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4b5:	eb 0f                	jmp    4c6 <printint+0x86>
 4b7:	89 f6                	mov    %esi,%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 4c0:	0f b6 13             	movzbl (%ebx),%edx
 4c3:	83 eb 01             	sub    $0x1,%ebx
	write(fd, &c, 1);
 4c6:	83 ec 04             	sub    $0x4,%esp
 4c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	56                   	push   %esi
 4cf:	57                   	push   %edi
 4d0:	e8 dc fe ff ff       	call   3b1 <write>

	while (--i >= 0)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 de                	cmp    %ebx,%esi
 4da:	75 e4                	jne    4c0 <printint+0x80>
		putc(fd, buf[i]);
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	neg = 0;
 4e8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 4ef:	e9 75 ff ff ff       	jmp    469 <printint+0x29>
 4f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 509:	8b 75 0c             	mov    0xc(%ebp),%esi
 50c:	0f b6 1e             	movzbl (%esi),%ebx
 50f:	84 db                	test   %bl,%bl
 511:	0f 84 b9 00 00 00    	je     5d0 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
 517:	8d 45 10             	lea    0x10(%ebp),%eax
 51a:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
 51d:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
 520:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
 522:	89 45 d0             	mov    %eax,-0x30(%ebp)
 525:	eb 38                	jmp    55f <printf+0x5f>
 527:	89 f6                	mov    %esi,%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 530:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 533:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
 538:	83 f8 25             	cmp    $0x25,%eax
 53b:	74 17                	je     554 <printf+0x54>
	write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	88 5d e7             	mov    %bl,-0x19(%ebp)
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	ff 75 08             	pushl  0x8(%ebp)
 549:	e8 63 fe ff ff       	call   3b1 <write>
 54e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
 551:	83 c4 10             	add    $0x10,%esp
 554:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
 557:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 55b:	84 db                	test   %bl,%bl
 55d:	74 71                	je     5d0 <printf+0xd0>
		c = fmt[i] & 0xff;
 55f:	0f be cb             	movsbl %bl,%ecx
 562:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
 565:	85 d2                	test   %edx,%edx
 567:	74 c7                	je     530 <printf+0x30>
			}
		} else if (state == '%') {
 569:	83 fa 25             	cmp    $0x25,%edx
 56c:	75 e6                	jne    554 <printf+0x54>
			if (c == 'd') {
 56e:	83 f8 64             	cmp    $0x64,%eax
 571:	0f 84 99 00 00 00    	je     610 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 577:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 57d:	83 f9 70             	cmp    $0x70,%ecx
 580:	74 5e                	je     5e0 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 582:	83 f8 73             	cmp    $0x73,%eax
 585:	0f 84 d5 00 00 00    	je     660 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 58b:	83 f8 63             	cmp    $0x63,%eax
 58e:	0f 84 8c 00 00 00    	je     620 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 594:	83 f8 25             	cmp    $0x25,%eax
 597:	0f 84 b3 00 00 00    	je     650 <printf+0x150>
	write(fd, &c, 1);
 59d:	83 ec 04             	sub    $0x4,%esp
 5a0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5a4:	6a 01                	push   $0x1
 5a6:	57                   	push   %edi
 5a7:	ff 75 08             	pushl  0x8(%ebp)
 5aa:	e8 02 fe ff ff       	call   3b1 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 5af:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 5b2:	83 c4 0c             	add    $0xc,%esp
 5b5:	6a 01                	push   $0x1
 5b7:	83 c6 01             	add    $0x1,%esi
 5ba:	57                   	push   %edi
 5bb:	ff 75 08             	pushl  0x8(%ebp)
 5be:	e8 ee fd ff ff       	call   3b1 <write>
	for (i = 0; fmt[i]; i++) {
 5c3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 5c7:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 5ca:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 5cc:	84 db                	test   %bl,%bl
 5ce:	75 8f                	jne    55f <printf+0x5f>
		}
	}
}
 5d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d3:	5b                   	pop    %ebx
 5d4:	5e                   	pop    %esi
 5d5:	5f                   	pop    %edi
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    
 5d8:	90                   	nop
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e8:	6a 00                	push   $0x0
 5ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	8b 13                	mov    (%ebx),%edx
 5f2:	e8 49 fe ff ff       	call   440 <printint>
				ap++;
 5f7:	89 d8                	mov    %ebx,%eax
 5f9:	83 c4 10             	add    $0x10,%esp
			state = 0;
 5fc:	31 d2                	xor    %edx,%edx
				ap++;
 5fe:	83 c0 04             	add    $0x4,%eax
 601:	89 45 d0             	mov    %eax,-0x30(%ebp)
 604:	e9 4b ff ff ff       	jmp    554 <printf+0x54>
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 0a 00 00 00       	mov    $0xa,%ecx
 618:	6a 01                	push   $0x1
 61a:	eb ce                	jmp    5ea <printf+0xea>
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 620:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 626:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 628:	6a 01                	push   $0x1
				ap++;
 62a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 62d:	57                   	push   %edi
 62e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 631:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 634:	e8 78 fd ff ff       	call   3b1 <write>
				ap++;
 639:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 0e ff ff ff       	jmp    554 <printf+0x54>
 646:	8d 76 00             	lea    0x0(%esi),%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 650:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 653:	83 ec 04             	sub    $0x4,%esp
 656:	e9 5a ff ff ff       	jmp    5b5 <printf+0xb5>
 65b:	90                   	nop
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
 663:	8b 18                	mov    (%eax),%ebx
				ap++;
 665:	83 c0 04             	add    $0x4,%eax
 668:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 66b:	85 db                	test   %ebx,%ebx
 66d:	74 17                	je     686 <printf+0x186>
				while (*s != 0) {
 66f:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 672:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 674:	84 c0                	test   %al,%al
 676:	0f 84 d8 fe ff ff    	je     554 <printf+0x54>
 67c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 67f:	89 de                	mov    %ebx,%esi
 681:	8b 5d 08             	mov    0x8(%ebp),%ebx
 684:	eb 1a                	jmp    6a0 <printf+0x1a0>
					s = "(null)";
 686:	bb eb 06 00 00       	mov    $0x6eb,%ebx
				while (*s != 0) {
 68b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68e:	b8 28 00 00 00       	mov    $0x28,%eax
 693:	89 de                	mov    %ebx,%esi
 695:	8b 5d 08             	mov    0x8(%ebp),%ebx
 698:	90                   	nop
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
					s++;
 6a3:	83 c6 01             	add    $0x1,%esi
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	53                   	push   %ebx
 6ad:	e8 ff fc ff ff       	call   3b1 <write>
				while (*s != 0) {
 6b2:	0f b6 06             	movzbl (%esi),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x1a0>
 6bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 8e fe ff ff       	jmp    554 <printf+0x54>
