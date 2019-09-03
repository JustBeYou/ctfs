
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"

char *argv[] = {"sh", 0};

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
	int pid, wpid;

	if (open("console", O_RDWR) < 0) {
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 28 04 00 00       	push   $0x428
  19:	e8 17 01 00 00       	call   135 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
		mknod("console", 1, 1);
		open("console", O_RDWR);
	}
	dup(0); // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 3a 01 00 00       	call   16d <dup>
	dup(0); // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 2e 01 00 00       	call   16d <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

	for (;;) {
		printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 30 04 00 00       	push   $0x430
  50:	6a 01                	push   $0x1
  52:	e8 09 02 00 00       	call   260 <printf>
		pid = fork();
  57:	e8 91 00 00 00       	call   ed <fork>
		if (pid < 0) {
  5c:	83 c4 10             	add    $0x10,%esp
		pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
		if (pid < 0) {
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
			printf(1, "init: fork failed\n");
			exit();
		}
		if (pid == 0) {
  65:	74 3d                	je     a4 <main+0xa4>
  67:	89 f6                	mov    %esi,%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			exec("sh", argv);
			printf(1, "init: exec sh failed\n");
			exit();
		}
		while ((wpid = wait()) >= 0 && wpid != pid)
  70:	e8 88 00 00 00       	call   fd <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
			printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 6f 04 00 00       	push   $0x46f
  85:	6a 01                	push   $0x1
  87:	e8 d4 01 00 00       	call   260 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
			printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 43 04 00 00       	push   $0x443
  98:	6a 01                	push   $0x1
  9a:	e8 c1 01 00 00       	call   260 <printf>
			exit();
  9f:	e8 51 00 00 00       	call   f5 <exit>
			exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 34 05 00 00       	push   $0x534
  ab:	68 56 04 00 00       	push   $0x456
  b0:	e8 78 00 00 00       	call   12d <exec>
			printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 59 04 00 00       	push   $0x459
  bc:	6a 01                	push   $0x1
  be:	e8 9d 01 00 00       	call   260 <printf>
			exit();
  c3:	e8 2d 00 00 00       	call   f5 <exit>
		mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 28 04 00 00       	push   $0x428
  d2:	e8 66 00 00 00       	call   13d <mknod>
		open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 28 04 00 00       	push   $0x428
  e0:	e8 50 00 00 00       	call   135 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>

000000ed <fork>:
}

char *strchr(const char *s, char c)
{
	for (; *s; s++)
		if (*s == c)
  ed:	b8 01 00 00 00       	mov    $0x1,%eax
  f2:	cd 40                	int    $0x40
	for (; *s; s++)
  f4:	c3                   	ret    

000000f5 <exit>:
  f5:	b8 02 00 00 00       	mov    $0x2,%eax
  fa:	cd 40                	int    $0x40
  fc:	c3                   	ret    

000000fd <wait>:
  fd:	b8 03 00 00 00       	mov    $0x3,%eax
			return (char *)s;
	return 0;
}
 102:	cd 40                	int    $0x40
 104:	c3                   	ret    

00000105 <pipe>:
 105:	b8 04 00 00 00       	mov    $0x4,%eax
 10a:	cd 40                	int    $0x40
 10c:	c3                   	ret    

0000010d <read>:
 10d:	b8 05 00 00 00       	mov    $0x5,%eax

char *gets(char *buf, int max)
{
 112:	cd 40                	int    $0x40
 114:	c3                   	ret    

00000115 <write>:
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 115:	b8 10 00 00 00       	mov    $0x10,%eax
{
 11a:	cd 40                	int    $0x40
 11c:	c3                   	ret    

0000011d <close>:
 11d:	b8 15 00 00 00       	mov    $0x15,%eax
	for (i = 0; i + 1 < max;) {
 122:	cd 40                	int    $0x40
 124:	c3                   	ret    

00000125 <kill>:
 125:	b8 06 00 00 00       	mov    $0x6,%eax
		cc = read(0, &c, 1);
 12a:	cd 40                	int    $0x40
 12c:	c3                   	ret    

0000012d <exec>:
 12d:	b8 07 00 00 00       	mov    $0x7,%eax
 132:	cd 40                	int    $0x40
 134:	c3                   	ret    

00000135 <open>:
 135:	b8 0f 00 00 00       	mov    $0xf,%eax
		if (cc < 1)
 13a:	cd 40                	int    $0x40
 13c:	c3                   	ret    

0000013d <mknod>:
 13d:	b8 11 00 00 00       	mov    $0x11,%eax
			break;
		buf[i++] = c;
 142:	cd 40                	int    $0x40
 144:	c3                   	ret    

00000145 <unlink>:
 145:	b8 12 00 00 00       	mov    $0x12,%eax
		if (c == '\n' || c == '\r')
 14a:	cd 40                	int    $0x40
 14c:	c3                   	ret    

0000014d <fstat>:
 14d:	b8 08 00 00 00       	mov    $0x8,%eax
	for (i = 0; i + 1 < max;) {
 152:	cd 40                	int    $0x40
 154:	c3                   	ret    

00000155 <link>:
 155:	b8 13 00 00 00       	mov    $0x13,%eax
 15a:	cd 40                	int    $0x40
 15c:	c3                   	ret    

0000015d <mkdir>:
			break;
	}
	buf[i] = '\0';
	return buf;
}
 15d:	b8 14 00 00 00       	mov    $0x14,%eax
	buf[i] = '\0';
 162:	cd 40                	int    $0x40
}
 164:	c3                   	ret    

00000165 <chdir>:
 165:	b8 09 00 00 00       	mov    $0x9,%eax
 16a:	cd 40                	int    $0x40
 16c:	c3                   	ret    

0000016d <dup>:
 16d:	b8 0a 00 00 00       	mov    $0xa,%eax
 172:	cd 40                	int    $0x40
 174:	c3                   	ret    

00000175 <getpid>:
 175:	b8 0b 00 00 00       	mov    $0xb,%eax
	buf[i] = '\0';
 17a:	cd 40                	int    $0x40
 17c:	c3                   	ret    

0000017d <sbrk>:
}
 17d:	b8 0c 00 00 00       	mov    $0xc,%eax
 182:	cd 40                	int    $0x40
 184:	c3                   	ret    

00000185 <sleep>:
 185:	b8 0d 00 00 00       	mov    $0xd,%eax
 18a:	cd 40                	int    $0x40
 18c:	c3                   	ret    

0000018d <uptime>:
 18d:	b8 0e 00 00 00       	mov    $0xe,%eax

int stat(char *n, struct stat *st)
{
 192:	cd 40                	int    $0x40
 194:	c3                   	ret    
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 195:	66 90                	xchg   %ax,%ax
 197:	66 90                	xchg   %ax,%ax
 199:	66 90                	xchg   %ax,%ax
 19b:	66 90                	xchg   %ax,%ax
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <printint>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
	if (fd < 0)
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	89 d3                	mov    %edx,%ebx
 1a8:	83 ec 3c             	sub    $0x3c,%esp
		return -1;
	r = fstat(fd, st);
 1ab:	89 45 bc             	mov    %eax,-0x44(%ebp)
 1ae:	85 d2                	test   %edx,%edx
 1b0:	0f 89 92 00 00 00    	jns    248 <printint+0xa8>
 1b6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 1ba:	0f 84 88 00 00 00    	je     248 <printint+0xa8>
	close(fd);
 1c0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
	return r;
}
 1c7:	f7 db                	neg    %ebx
 1c9:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
		return -1;
 1d0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 1d3:	eb 08                	jmp    1dd <printint+0x3d>
 1d5:	8d 76 00             	lea    0x0(%esi),%esi
 1d8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 1db:	89 c3                	mov    %eax,%ebx
 1dd:	89 d8                	mov    %ebx,%eax
 1df:	31 d2                	xor    %edx,%edx

int atoi(const char *s)
{
 1e1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 1e4:	f7 f1                	div    %ecx
 1e6:	83 c7 01             	add    $0x1,%edi
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 1e9:	0f b6 92 80 04 00 00 	movzbl 0x480(%edx),%edx
	n = 0;
 1f0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 1f3:	39 d9                	cmp    %ebx,%ecx
	while ('0' <= *s && *s <= '9')
 1f5:	76 e1                	jbe    1d8 <printint+0x38>
 1f7:	8b 45 c0             	mov    -0x40(%ebp),%eax
 1fa:	85 c0                	test   %eax,%eax
 1fc:	74 0d                	je     20b <printint+0x6b>
 1fe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
		n = n * 10 + *s++ - '0';
 203:	ba 2d 00 00 00       	mov    $0x2d,%edx
 208:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	while ('0' <= *s && *s <= '9')
 20b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 20e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 211:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
	return n;
}
 215:	eb 0f                	jmp    226 <printint+0x86>
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

void *memmove(void *vdst, void *vsrc, int n)
{
 220:	0f b6 13             	movzbl (%ebx),%edx
 223:	83 eb 01             	sub    $0x1,%ebx
 226:	83 ec 04             	sub    $0x4,%esp
 229:	88 55 d7             	mov    %dl,-0x29(%ebp)
 22c:	6a 01                	push   $0x1
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 22e:	56                   	push   %esi
 22f:	57                   	push   %edi
 230:	e8 e0 fe ff ff       	call   115 <write>
	dst = vdst;
 235:	83 c4 10             	add    $0x10,%esp
 238:	39 de                	cmp    %ebx,%esi
 23a:	75 e4                	jne    220 <printint+0x80>
 23c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23f:	5b                   	pop    %ebx
		*dst++ = *src++;
 240:	5e                   	pop    %esi
	while (n-- > 0)
 241:	5f                   	pop    %edi
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	return vdst;
}
 248:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
	static char digits[] = "0123456789ABCDEF";
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
 24f:	e9 75 ff ff ff       	jmp    1c9 <printint+0x29>
 254:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 25a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000260 <printf>:
		putc(fd, buf[i]);
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
 266:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 269:	8b 75 0c             	mov    0xc(%ebp),%esi
 26c:	0f b6 1e             	movzbl (%esi),%ebx
 26f:	84 db                	test   %bl,%bl
 271:	0f 84 b9 00 00 00    	je     330 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
 277:	8d 45 10             	lea    0x10(%ebp),%eax
 27a:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
 27d:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
 280:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
 282:	89 45 d0             	mov    %eax,-0x30(%ebp)
 285:	eb 38                	jmp    2bf <printf+0x5f>
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 290:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 293:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
 298:	83 f8 25             	cmp    $0x25,%eax
 29b:	74 17                	je     2b4 <printf+0x54>
	write(fd, &c, 1);
 29d:	83 ec 04             	sub    $0x4,%esp
 2a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 2a3:	6a 01                	push   $0x1
 2a5:	57                   	push   %edi
 2a6:	ff 75 08             	pushl  0x8(%ebp)
 2a9:	e8 67 fe ff ff       	call   115 <write>
 2ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
 2b7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 2bb:	84 db                	test   %bl,%bl
 2bd:	74 71                	je     330 <printf+0xd0>
		c = fmt[i] & 0xff;
 2bf:	0f be cb             	movsbl %bl,%ecx
 2c2:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
 2c5:	85 d2                	test   %edx,%edx
 2c7:	74 c7                	je     290 <printf+0x30>
			}
		} else if (state == '%') {
 2c9:	83 fa 25             	cmp    $0x25,%edx
 2cc:	75 e6                	jne    2b4 <printf+0x54>
			if (c == 'd') {
 2ce:	83 f8 64             	cmp    $0x64,%eax
 2d1:	0f 84 99 00 00 00    	je     370 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 2d7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 2dd:	83 f9 70             	cmp    $0x70,%ecx
 2e0:	74 5e                	je     340 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 2e2:	83 f8 73             	cmp    $0x73,%eax
 2e5:	0f 84 d5 00 00 00    	je     3c0 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 2eb:	83 f8 63             	cmp    $0x63,%eax
 2ee:	0f 84 8c 00 00 00    	je     380 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 2f4:	83 f8 25             	cmp    $0x25,%eax
 2f7:	0f 84 b3 00 00 00    	je     3b0 <printf+0x150>
	write(fd, &c, 1);
 2fd:	83 ec 04             	sub    $0x4,%esp
 300:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 304:	6a 01                	push   $0x1
 306:	57                   	push   %edi
 307:	ff 75 08             	pushl  0x8(%ebp)
 30a:	e8 06 fe ff ff       	call   115 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 30f:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 312:	83 c4 0c             	add    $0xc,%esp
 315:	6a 01                	push   $0x1
 317:	83 c6 01             	add    $0x1,%esi
 31a:	57                   	push   %edi
 31b:	ff 75 08             	pushl  0x8(%ebp)
 31e:	e8 f2 fd ff ff       	call   115 <write>
	for (i = 0; fmt[i]; i++) {
 323:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 327:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 32a:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 32c:	84 db                	test   %bl,%bl
 32e:	75 8f                	jne    2bf <printf+0x5f>
		}
	}
}
 330:	8d 65 f4             	lea    -0xc(%ebp),%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 340:	83 ec 0c             	sub    $0xc,%esp
 343:	b9 10 00 00 00       	mov    $0x10,%ecx
 348:	6a 00                	push   $0x0
 34a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	8b 13                	mov    (%ebx),%edx
 352:	e8 49 fe ff ff       	call   1a0 <printint>
				ap++;
 357:	89 d8                	mov    %ebx,%eax
 359:	83 c4 10             	add    $0x10,%esp
			state = 0;
 35c:	31 d2                	xor    %edx,%edx
				ap++;
 35e:	83 c0 04             	add    $0x4,%eax
 361:	89 45 d0             	mov    %eax,-0x30(%ebp)
 364:	e9 4b ff ff ff       	jmp    2b4 <printf+0x54>
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 370:	83 ec 0c             	sub    $0xc,%esp
 373:	b9 0a 00 00 00       	mov    $0xa,%ecx
 378:	6a 01                	push   $0x1
 37a:	eb ce                	jmp    34a <printf+0xea>
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 380:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 383:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 386:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 388:	6a 01                	push   $0x1
				ap++;
 38a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 38d:	57                   	push   %edi
 38e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 391:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 394:	e8 7c fd ff ff       	call   115 <write>
				ap++;
 399:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 39c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 39f:	31 d2                	xor    %edx,%edx
 3a1:	e9 0e ff ff ff       	jmp    2b4 <printf+0x54>
 3a6:	8d 76 00             	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 3b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 3b3:	83 ec 04             	sub    $0x4,%esp
 3b6:	e9 5a ff ff ff       	jmp    315 <printf+0xb5>
 3bb:	90                   	nop
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 3c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3c3:	8b 18                	mov    (%eax),%ebx
				ap++;
 3c5:	83 c0 04             	add    $0x4,%eax
 3c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 3cb:	85 db                	test   %ebx,%ebx
 3cd:	74 17                	je     3e6 <printf+0x186>
				while (*s != 0) {
 3cf:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 3d2:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 3d4:	84 c0                	test   %al,%al
 3d6:	0f 84 d8 fe ff ff    	je     2b4 <printf+0x54>
 3dc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 3df:	89 de                	mov    %ebx,%esi
 3e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3e4:	eb 1a                	jmp    400 <printf+0x1a0>
					s = "(null)";
 3e6:	bb 78 04 00 00       	mov    $0x478,%ebx
				while (*s != 0) {
 3eb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 3ee:	b8 28 00 00 00       	mov    $0x28,%eax
 3f3:	89 de                	mov    %ebx,%esi
 3f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3f8:	90                   	nop
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 400:	83 ec 04             	sub    $0x4,%esp
					s++;
 403:	83 c6 01             	add    $0x1,%esi
 406:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 409:	6a 01                	push   $0x1
 40b:	57                   	push   %edi
 40c:	53                   	push   %ebx
 40d:	e8 03 fd ff ff       	call   115 <write>
				while (*s != 0) {
 412:	0f b6 06             	movzbl (%esi),%eax
 415:	83 c4 10             	add    $0x10,%esp
 418:	84 c0                	test   %al,%al
 41a:	75 e4                	jne    400 <printf+0x1a0>
 41c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 41f:	31 d2                	xor    %edx,%edx
 421:	e9 8e fe ff ff       	jmp    2b4 <printf+0x54>
