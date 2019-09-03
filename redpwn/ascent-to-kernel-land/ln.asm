
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
	if (argc != 3) {
   a:	83 39 03             	cmpl   $0x3,(%ecx)
{
   d:	55                   	push   %ebp
   e:	89 e5                	mov    %esp,%ebp
  10:	53                   	push   %ebx
  11:	51                   	push   %ecx
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
	if (argc != 3) {
  15:	74 13                	je     2a <main+0x2a>
		printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 98 03 00 00       	push   $0x398
  1e:	6a 02                	push   $0x2
  20:	e8 ab 01 00 00       	call   1d0 <printf>
		exit();
  25:	e8 38 00 00 00       	call   62 <exit>
	}
	if (link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	pushl  0x8(%ebx)
  2f:	ff 73 04             	pushl  0x4(%ebx)
  32:	e8 8b 00 00 00       	call   c2 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
		printf(2, "link %s %s: failed\n", argv[1], argv[2]);
	exit();
  3e:	e8 1f 00 00 00       	call   62 <exit>
		printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	pushl  0x8(%ebx)
  46:	ff 73 04             	pushl  0x4(%ebx)
  49:	68 ab 03 00 00       	push   $0x3ab
  4e:	6a 02                	push   $0x2
  50:	e8 7b 01 00 00       	call   1d0 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>

0000005a <fork>:
	return os;
}

int strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
  5a:	b8 01 00 00 00       	mov    $0x1,%eax
  5f:	cd 40                	int    $0x40
  61:	c3                   	ret    

00000062 <exit>:
  62:	b8 02 00 00 00       	mov    $0x2,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
  67:	cd 40                	int    $0x40
}
  69:	c3                   	ret    

0000006a <wait>:
  6a:	b8 03 00 00 00       	mov    $0x3,%eax
  6f:	cd 40                	int    $0x40
  71:	c3                   	ret    

00000072 <pipe>:
  72:	b8 04 00 00 00       	mov    $0x4,%eax
  77:	cd 40                	int    $0x40
  79:	c3                   	ret    

0000007a <read>:
  7a:	b8 05 00 00 00       	mov    $0x5,%eax
  7f:	cd 40                	int    $0x40

uint strlen(char *s)
{
  81:	c3                   	ret    

00000082 <write>:
  82:	b8 10 00 00 00       	mov    $0x10,%eax
	int n;

	for (n = 0; s[n]; n++)
  87:	cd 40                	int    $0x40
  89:	c3                   	ret    

0000008a <close>:
  8a:	b8 15 00 00 00       	mov    $0x15,%eax
  8f:	cd 40                	int    $0x40
  91:	c3                   	ret    

00000092 <kill>:
  92:	b8 06 00 00 00       	mov    $0x6,%eax
  97:	cd 40                	int    $0x40
  99:	c3                   	ret    

0000009a <exec>:
  9a:	b8 07 00 00 00       	mov    $0x7,%eax
		;
	return n;
}
  9f:	cd 40                	int    $0x40
	for (n = 0; s[n]; n++)
  a1:	c3                   	ret    

000000a2 <open>:
}
  a2:	b8 0f 00 00 00       	mov    $0xf,%eax
  a7:	cd 40                	int    $0x40
  a9:	c3                   	ret    

000000aa <mknod>:
  aa:	b8 11 00 00 00       	mov    $0x11,%eax
  af:	cd 40                	int    $0x40

void *memset(void *dst, int c, uint n)
{
  b1:	c3                   	ret    

000000b2 <unlink>:
  b2:	b8 12 00 00 00       	mov    $0x12,%eax
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
  b7:	cd 40                	int    $0x40
  b9:	c3                   	ret    

000000ba <fstat>:
  ba:	b8 08 00 00 00       	mov    $0x8,%eax
  bf:	cd 40                	int    $0x40
  c1:	c3                   	ret    

000000c2 <link>:
	stosb(dst, c, n);
	return dst;
}
  c2:	b8 13 00 00 00       	mov    $0x13,%eax
  c7:	cd 40                	int    $0x40
  c9:	c3                   	ret    

000000ca <mkdir>:
  ca:	b8 14 00 00 00       	mov    $0x14,%eax
  cf:	cd 40                	int    $0x40

char *strchr(const char *s, char c)
{
  d1:	c3                   	ret    

000000d2 <chdir>:
  d2:	b8 09 00 00 00       	mov    $0x9,%eax
  d7:	cd 40                	int    $0x40
  d9:	c3                   	ret    

000000da <dup>:
	for (; *s; s++)
  da:	b8 0a 00 00 00       	mov    $0xa,%eax
  df:	cd 40                	int    $0x40
  e1:	c3                   	ret    

000000e2 <getpid>:
  e2:	b8 0b 00 00 00       	mov    $0xb,%eax
		if (*s == c)
  e7:	cd 40                	int    $0x40
  e9:	c3                   	ret    

000000ea <sbrk>:
  ea:	b8 0c 00 00 00       	mov    $0xc,%eax
  ef:	cd 40                	int    $0x40
  f1:	c3                   	ret    

000000f2 <sleep>:
  f2:	b8 0d 00 00 00       	mov    $0xd,%eax
	for (; *s; s++)
  f7:	cd 40                	int    $0x40
  f9:	c3                   	ret    

000000fa <uptime>:
  fa:	b8 0e 00 00 00       	mov    $0xe,%eax
			return (char *)s;
	return 0;
  ff:	cd 40                	int    $0x40
}
 101:	c3                   	ret    
 102:	66 90                	xchg   %ax,%ax
 104:	66 90                	xchg   %ax,%ax
 106:	66 90                	xchg   %ax,%ax
 108:	66 90                	xchg   %ax,%ax
 10a:	66 90                	xchg   %ax,%ax
 10c:	66 90                	xchg   %ax,%ax
 10e:	66 90                	xchg   %ax,%ax

00000110 <printint>:

char *gets(char *buf, int max)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 115:	53                   	push   %ebx
 116:	89 d3                	mov    %edx,%ebx
{
 118:	83 ec 3c             	sub    $0x3c,%esp
 11b:	89 45 bc             	mov    %eax,-0x44(%ebp)
 11e:	85 d2                	test   %edx,%edx
	for (i = 0; i + 1 < max;) {
 120:	0f 89 92 00 00 00    	jns    1b8 <printint+0xa8>
 126:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
		cc = read(0, &c, 1);
 12a:	0f 84 88 00 00 00    	je     1b8 <printint+0xa8>
 130:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 137:	f7 db                	neg    %ebx
		if (cc < 1)
 139:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
			break;
		buf[i++] = c;
 140:	8d 75 d7             	lea    -0x29(%ebp),%esi
 143:	eb 08                	jmp    14d <printint+0x3d>
 145:	8d 76 00             	lea    0x0(%esi),%esi
 148:	89 7d c4             	mov    %edi,-0x3c(%ebp)
		if (c == '\n' || c == '\r')
 14b:	89 c3                	mov    %eax,%ebx
 14d:	89 d8                	mov    %ebx,%eax
 14f:	31 d2                	xor    %edx,%edx
	for (i = 0; i + 1 < max;) {
 151:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 154:	f7 f1                	div    %ecx
 156:	83 c7 01             	add    $0x1,%edi
 159:	0f b6 92 c8 03 00 00 	movzbl 0x3c8(%edx),%edx
			break;
	}
	buf[i] = '\0';
 160:	88 14 3e             	mov    %dl,(%esi,%edi,1)
	return buf;
}
 163:	39 d9                	cmp    %ebx,%ecx
 165:	76 e1                	jbe    148 <printint+0x38>
 167:	8b 45 c0             	mov    -0x40(%ebp),%eax
 16a:	85 c0                	test   %eax,%eax
 16c:	74 0d                	je     17b <printint+0x6b>
 16e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 173:	ba 2d 00 00 00       	mov    $0x2d,%edx
 178:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	buf[i] = '\0';
 17b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
}
 17e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 181:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 185:	eb 0f                	jmp    196 <printint+0x86>
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

int stat(char *n, struct stat *st)
{
 190:	0f b6 13             	movzbl (%ebx),%edx
 193:	83 eb 01             	sub    $0x1,%ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	88 55 d7             	mov    %dl,-0x29(%ebp)
 19c:	6a 01                	push   $0x1
 19e:	56                   	push   %esi
 19f:	57                   	push   %edi
 1a0:	e8 dd fe ff ff       	call   82 <write>
	if (fd < 0)
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	39 de                	cmp    %ebx,%esi
		return -1;
	r = fstat(fd, st);
 1aa:	75 e4                	jne    190 <printint+0x80>
 1ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1af:	5b                   	pop    %ebx
 1b0:	5e                   	pop    %esi
 1b1:	5f                   	pop    %edi
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	close(fd);
 1b8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 1bf:	e9 75 ff ff ff       	jmp    139 <printint+0x29>
	return r;
}
 1c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001d0 <printf>:
		return -1;
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 2c             	sub    $0x2c,%esp
 1d9:	8b 75 0c             	mov    0xc(%ebp),%esi
 1dc:	0f b6 1e             	movzbl (%esi),%ebx
 1df:	84 db                	test   %bl,%bl

int atoi(const char *s)
{
 1e1:	0f 84 b9 00 00 00    	je     2a0 <printf+0xd0>
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 1e7:	8d 45 10             	lea    0x10(%ebp),%eax
 1ea:	83 c6 01             	add    $0x1,%esi
 1ed:	8d 7d e7             	lea    -0x19(%ebp),%edi
	n = 0;
 1f0:	31 d2                	xor    %edx,%edx
 1f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
	while ('0' <= *s && *s <= '9')
 1f5:	eb 38                	jmp    22f <printf+0x5f>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
 200:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 203:	ba 25 00 00 00       	mov    $0x25,%edx
 208:	83 f8 25             	cmp    $0x25,%eax
	while ('0' <= *s && *s <= '9')
 20b:	74 17                	je     224 <printf+0x54>
 20d:	83 ec 04             	sub    $0x4,%esp
 210:	88 5d e7             	mov    %bl,-0x19(%ebp)
 213:	6a 01                	push   $0x1
	return n;
}
 215:	57                   	push   %edi
 216:	ff 75 08             	pushl  0x8(%ebp)
 219:	e8 64 fe ff ff       	call   82 <write>
 21e:	8b 55 d4             	mov    -0x2c(%ebp),%edx

void *memmove(void *vdst, void *vsrc, int n)
{
 221:	83 c4 10             	add    $0x10,%esp
 224:	83 c6 01             	add    $0x1,%esi
 227:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 22b:	84 db                	test   %bl,%bl
 22d:	74 71                	je     2a0 <printf+0xd0>
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 22f:	0f be cb             	movsbl %bl,%ecx
 232:	0f b6 c3             	movzbl %bl,%eax
	dst = vdst;
 235:	85 d2                	test   %edx,%edx
 237:	74 c7                	je     200 <printf+0x30>
 239:	83 fa 25             	cmp    $0x25,%edx
 23c:	75 e6                	jne    224 <printf+0x54>
 23e:	83 f8 64             	cmp    $0x64,%eax
	while (n-- > 0)
 241:	0f 84 99 00 00 00    	je     2e0 <printf+0x110>
		*dst++ = *src++;
	return vdst;
}
 247:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
			}
		} else if (state == '%') {
			if (c == 'd') {
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 24d:	83 f9 70             	cmp    $0x70,%ecx
 250:	74 5e                	je     2b0 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 252:	83 f8 73             	cmp    $0x73,%eax
 255:	0f 84 d5 00 00 00    	je     330 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 25b:	83 f8 63             	cmp    $0x63,%eax
 25e:	0f 84 8c 00 00 00    	je     2f0 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 264:	83 f8 25             	cmp    $0x25,%eax
 267:	0f 84 b3 00 00 00    	je     320 <printf+0x150>
	write(fd, &c, 1);
 26d:	83 ec 04             	sub    $0x4,%esp
 270:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 274:	6a 01                	push   $0x1
 276:	57                   	push   %edi
 277:	ff 75 08             	pushl  0x8(%ebp)
 27a:	e8 03 fe ff ff       	call   82 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 27f:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 282:	83 c4 0c             	add    $0xc,%esp
 285:	6a 01                	push   $0x1
 287:	83 c6 01             	add    $0x1,%esi
 28a:	57                   	push   %edi
 28b:	ff 75 08             	pushl  0x8(%ebp)
 28e:	e8 ef fd ff ff       	call   82 <write>
	for (i = 0; fmt[i]; i++) {
 293:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 297:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 29a:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 29c:	84 db                	test   %bl,%bl
 29e:	75 8f                	jne    22f <printf+0x5f>
		}
	}
}
 2a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a3:	5b                   	pop    %ebx
 2a4:	5e                   	pop    %esi
 2a5:	5f                   	pop    %edi
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    
 2a8:	90                   	nop
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 2b0:	83 ec 0c             	sub    $0xc,%esp
 2b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 2b8:	6a 00                	push   $0x0
 2ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	8b 13                	mov    (%ebx),%edx
 2c2:	e8 49 fe ff ff       	call   110 <printint>
				ap++;
 2c7:	89 d8                	mov    %ebx,%eax
 2c9:	83 c4 10             	add    $0x10,%esp
			state = 0;
 2cc:	31 d2                	xor    %edx,%edx
				ap++;
 2ce:	83 c0 04             	add    $0x4,%eax
 2d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 2d4:	e9 4b ff ff ff       	jmp    224 <printf+0x54>
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 2e0:	83 ec 0c             	sub    $0xc,%esp
 2e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 2e8:	6a 01                	push   $0x1
 2ea:	eb ce                	jmp    2ba <printf+0xea>
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 2f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 2f3:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 2f6:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 2f8:	6a 01                	push   $0x1
				ap++;
 2fa:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 2fd:	57                   	push   %edi
 2fe:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 301:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 304:	e8 79 fd ff ff       	call   82 <write>
				ap++;
 309:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 30c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 30f:	31 d2                	xor    %edx,%edx
 311:	e9 0e ff ff ff       	jmp    224 <printf+0x54>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 320:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 323:	83 ec 04             	sub    $0x4,%esp
 326:	e9 5a ff ff ff       	jmp    285 <printf+0xb5>
 32b:	90                   	nop
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 330:	8b 45 d0             	mov    -0x30(%ebp),%eax
 333:	8b 18                	mov    (%eax),%ebx
				ap++;
 335:	83 c0 04             	add    $0x4,%eax
 338:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 33b:	85 db                	test   %ebx,%ebx
 33d:	74 17                	je     356 <printf+0x186>
				while (*s != 0) {
 33f:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 342:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 344:	84 c0                	test   %al,%al
 346:	0f 84 d8 fe ff ff    	je     224 <printf+0x54>
 34c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 34f:	89 de                	mov    %ebx,%esi
 351:	8b 5d 08             	mov    0x8(%ebp),%ebx
 354:	eb 1a                	jmp    370 <printf+0x1a0>
					s = "(null)";
 356:	bb bf 03 00 00       	mov    $0x3bf,%ebx
				while (*s != 0) {
 35b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 35e:	b8 28 00 00 00       	mov    $0x28,%eax
 363:	89 de                	mov    %ebx,%esi
 365:	8b 5d 08             	mov    0x8(%ebp),%ebx
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 370:	83 ec 04             	sub    $0x4,%esp
					s++;
 373:	83 c6 01             	add    $0x1,%esi
 376:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 379:	6a 01                	push   $0x1
 37b:	57                   	push   %edi
 37c:	53                   	push   %ebx
 37d:	e8 00 fd ff ff       	call   82 <write>
				while (*s != 0) {
 382:	0f b6 06             	movzbl (%esi),%eax
 385:	83 c4 10             	add    $0x10,%esp
 388:	84 c0                	test   %al,%al
 38a:	75 e4                	jne    370 <printf+0x1a0>
 38c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 38f:	31 d2                	xor    %edx,%edx
 391:	e9 8e fe ff ff       	jmp    224 <printf+0x54>
