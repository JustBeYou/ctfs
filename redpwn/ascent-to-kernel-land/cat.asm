
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		exit();
	}
}

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
	int fd, i;

	if (argc <= 1) {
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		cat(0);
		exit();
	}

	for (i = 1; i < argc; i++) {
		if ((fd = open(argv[i], 0)) < 0) {
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 0f 01 00 00       	call   14b <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
			printf(1, "cat: cannot open %s\n", argv[i]);
			exit();
		}
		cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
	for (i = 1; i < argc; i++) {
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
		cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
		close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 d7 00 00 00       	call   133 <close>
	for (i = 1; i < argc; i++) {
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
	}
	exit();
  64:	e8 a2 00 00 00       	call   10b <exit>
			printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 5b 04 00 00       	push   $0x45b
  71:	6a 01                	push   $0x1
  73:	e8 f8 01 00 00       	call   270 <printf>
			exit();
  78:	e8 8e 00 00 00       	call   10b <exit>
		cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
		exit();
  87:	e8 7f 00 00 00       	call   10b <exit>

uint strlen(char *s)
{
	int n;

	for (n = 0; s[n]; n++)
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	8b 75 08             	mov    0x8(%ebp),%esi
  97:	53                   	push   %ebx
	while ((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 80 05 00 00       	push   $0x580
  a9:	6a 01                	push   $0x1
  ab:	e8 7b 00 00 00       	call   12b <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
	while ((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 80 05 00 00       	push   $0x580
  c4:	56                   	push   %esi
  c5:	e8 59 00 00 00       	call   123 <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
	if (n < 0) {
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
			printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 38 04 00 00       	push   $0x438
  e4:	6a 01                	push   $0x1
  e6:	e8 85 01 00 00       	call   270 <printf>
			exit();
  eb:	e8 1b 00 00 00       	call   10b <exit>
		printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 4a 04 00 00       	push   $0x44a
  f7:	6a 01                	push   $0x1
  f9:	e8 72 01 00 00       	call   270 <printf>
		exit();
  fe:	e8 08 00 00 00       	call   10b <exit>

00000103 <fork>:
{
	for (; *s; s++)
		if (*s == c)
			return (char *)s;
	return 0;
}
 103:	b8 01 00 00 00       	mov    $0x1,%eax
 108:	cd 40                	int    $0x40
 10a:	c3                   	ret    

0000010b <exit>:
 10b:	b8 02 00 00 00       	mov    $0x2,%eax

char *gets(char *buf, int max)
{
 110:	cd 40                	int    $0x40
 112:	c3                   	ret    

00000113 <wait>:
 113:	b8 03 00 00 00       	mov    $0x3,%eax
 118:	cd 40                	int    $0x40
 11a:	c3                   	ret    

0000011b <pipe>:
 11b:	b8 04 00 00 00       	mov    $0x4,%eax
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 120:	cd 40                	int    $0x40
 122:	c3                   	ret    

00000123 <read>:
 123:	b8 05 00 00 00       	mov    $0x5,%eax
		cc = read(0, &c, 1);
 128:	cd 40                	int    $0x40
 12a:	c3                   	ret    

0000012b <write>:
 12b:	b8 10 00 00 00       	mov    $0x10,%eax
 130:	cd 40                	int    $0x40
 132:	c3                   	ret    

00000133 <close>:
 133:	b8 15 00 00 00       	mov    $0x15,%eax
		if (cc < 1)
 138:	cd 40                	int    $0x40
 13a:	c3                   	ret    

0000013b <kill>:
 13b:	b8 06 00 00 00       	mov    $0x6,%eax
			break;
		buf[i++] = c;
 140:	cd 40                	int    $0x40
 142:	c3                   	ret    

00000143 <exec>:
 143:	b8 07 00 00 00       	mov    $0x7,%eax
 148:	cd 40                	int    $0x40
		if (c == '\n' || c == '\r')
 14a:	c3                   	ret    

0000014b <open>:
 14b:	b8 0f 00 00 00       	mov    $0xf,%eax
 150:	cd 40                	int    $0x40
	for (i = 0; i + 1 < max;) {
 152:	c3                   	ret    

00000153 <mknod>:
 153:	b8 11 00 00 00       	mov    $0x11,%eax
 158:	cd 40                	int    $0x40
 15a:	c3                   	ret    

0000015b <unlink>:
 15b:	b8 12 00 00 00       	mov    $0x12,%eax
			break;
	}
	buf[i] = '\0';
 160:	cd 40                	int    $0x40
 162:	c3                   	ret    

00000163 <fstat>:
	return buf;
}
 163:	b8 08 00 00 00       	mov    $0x8,%eax
 168:	cd 40                	int    $0x40
 16a:	c3                   	ret    

0000016b <link>:
 16b:	b8 13 00 00 00       	mov    $0x13,%eax
 170:	cd 40                	int    $0x40
 172:	c3                   	ret    

00000173 <mkdir>:
 173:	b8 14 00 00 00       	mov    $0x14,%eax
 178:	cd 40                	int    $0x40
	buf[i] = '\0';
 17a:	c3                   	ret    

0000017b <chdir>:
 17b:	b8 09 00 00 00       	mov    $0x9,%eax
}
 180:	cd 40                	int    $0x40
 182:	c3                   	ret    

00000183 <dup>:
 183:	b8 0a 00 00 00       	mov    $0xa,%eax
 188:	cd 40                	int    $0x40
 18a:	c3                   	ret    

0000018b <getpid>:
 18b:	b8 0b 00 00 00       	mov    $0xb,%eax

int stat(char *n, struct stat *st)
{
 190:	cd 40                	int    $0x40
 192:	c3                   	ret    

00000193 <sbrk>:
 193:	b8 0c 00 00 00       	mov    $0xc,%eax
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 198:	cd 40                	int    $0x40
 19a:	c3                   	ret    

0000019b <sleep>:
 19b:	b8 0d 00 00 00       	mov    $0xd,%eax
 1a0:	cd 40                	int    $0x40
	if (fd < 0)
 1a2:	c3                   	ret    

000001a3 <uptime>:
 1a3:	b8 0e 00 00 00       	mov    $0xe,%eax
 1a8:	cd 40                	int    $0x40
		return -1;
	r = fstat(fd, st);
 1aa:	c3                   	ret    
 1ab:	66 90                	xchg   %ax,%ax
 1ad:	66 90                	xchg   %ax,%ax
 1af:	90                   	nop

000001b0 <printint>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	89 d3                	mov    %edx,%ebx
	close(fd);
 1b8:	83 ec 3c             	sub    $0x3c,%esp
	r = fstat(fd, st);
 1bb:	89 45 bc             	mov    %eax,-0x44(%ebp)
	close(fd);
 1be:	85 d2                	test   %edx,%edx
 1c0:	0f 89 92 00 00 00    	jns    258 <printint+0xa8>
	return r;
}
 1c6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 1ca:	0f 84 88 00 00 00    	je     258 <printint+0xa8>
		return -1;
 1d0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 1d7:	f7 db                	neg    %ebx
 1d9:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)

int atoi(const char *s)
{
 1e0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 1e3:	eb 08                	jmp    1ed <printint+0x3d>
 1e5:	8d 76 00             	lea    0x0(%esi),%esi
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 1e8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 1eb:	89 c3                	mov    %eax,%ebx
 1ed:	89 d8                	mov    %ebx,%eax
	n = 0;
 1ef:	31 d2                	xor    %edx,%edx
 1f1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
	while ('0' <= *s && *s <= '9')
 1f4:	f7 f1                	div    %ecx
 1f6:	83 c7 01             	add    $0x1,%edi
 1f9:	0f b6 92 78 04 00 00 	movzbl 0x478(%edx),%edx
		n = n * 10 + *s++ - '0';
 200:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 203:	39 d9                	cmp    %ebx,%ecx
 205:	76 e1                	jbe    1e8 <printint+0x38>
 207:	8b 45 c0             	mov    -0x40(%ebp),%eax
	while ('0' <= *s && *s <= '9')
 20a:	85 c0                	test   %eax,%eax
 20c:	74 0d                	je     21b <printint+0x6b>
 20e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 213:	ba 2d 00 00 00       	mov    $0x2d,%edx
	return n;
}
 218:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 21b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 21e:	8b 7d bc             	mov    -0x44(%ebp),%edi

void *memmove(void *vdst, void *vsrc, int n)
{
 221:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 225:	eb 0f                	jmp    236 <printint+0x86>
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 230:	0f b6 13             	movzbl (%ebx),%edx
 233:	83 eb 01             	sub    $0x1,%ebx
	dst = vdst;
 236:	83 ec 04             	sub    $0x4,%esp
 239:	88 55 d7             	mov    %dl,-0x29(%ebp)
 23c:	6a 01                	push   $0x1
 23e:	56                   	push   %esi
 23f:	57                   	push   %edi
		*dst++ = *src++;
 240:	e8 e6 fe ff ff       	call   12b <write>
	return vdst;
}
 245:	83 c4 10             	add    $0x10,%esp
 248:	39 de                	cmp    %ebx,%esi
		buf[i++] = digits[x % base];
	} while ((x /= base) != 0);
	if (neg)
		buf[i++] = '-';

	while (--i >= 0)
 24a:	75 e4                	jne    230 <printint+0x80>
		putc(fd, buf[i]);
}
 24c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24f:	5b                   	pop    %ebx
 250:	5e                   	pop    %esi
 251:	5f                   	pop    %edi
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	neg = 0;
 258:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 25f:	e9 75 ff ff ff       	jmp    1d9 <printint+0x29>
 264:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 26a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000270 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 279:	8b 75 0c             	mov    0xc(%ebp),%esi
 27c:	0f b6 1e             	movzbl (%esi),%ebx
 27f:	84 db                	test   %bl,%bl
 281:	0f 84 b9 00 00 00    	je     340 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
 287:	8d 45 10             	lea    0x10(%ebp),%eax
 28a:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
 28d:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
 290:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
 292:	89 45 d0             	mov    %eax,-0x30(%ebp)
 295:	eb 38                	jmp    2cf <printf+0x5f>
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 2a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 2a3:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
 2a8:	83 f8 25             	cmp    $0x25,%eax
 2ab:	74 17                	je     2c4 <printf+0x54>
	write(fd, &c, 1);
 2ad:	83 ec 04             	sub    $0x4,%esp
 2b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	ff 75 08             	pushl  0x8(%ebp)
 2b9:	e8 6d fe ff ff       	call   12b <write>
 2be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
 2c7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 2cb:	84 db                	test   %bl,%bl
 2cd:	74 71                	je     340 <printf+0xd0>
		c = fmt[i] & 0xff;
 2cf:	0f be cb             	movsbl %bl,%ecx
 2d2:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
 2d5:	85 d2                	test   %edx,%edx
 2d7:	74 c7                	je     2a0 <printf+0x30>
			}
		} else if (state == '%') {
 2d9:	83 fa 25             	cmp    $0x25,%edx
 2dc:	75 e6                	jne    2c4 <printf+0x54>
			if (c == 'd') {
 2de:	83 f8 64             	cmp    $0x64,%eax
 2e1:	0f 84 99 00 00 00    	je     380 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 2e7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 2ed:	83 f9 70             	cmp    $0x70,%ecx
 2f0:	74 5e                	je     350 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 2f2:	83 f8 73             	cmp    $0x73,%eax
 2f5:	0f 84 d5 00 00 00    	je     3d0 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 2fb:	83 f8 63             	cmp    $0x63,%eax
 2fe:	0f 84 8c 00 00 00    	je     390 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 304:	83 f8 25             	cmp    $0x25,%eax
 307:	0f 84 b3 00 00 00    	je     3c0 <printf+0x150>
	write(fd, &c, 1);
 30d:	83 ec 04             	sub    $0x4,%esp
 310:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 314:	6a 01                	push   $0x1
 316:	57                   	push   %edi
 317:	ff 75 08             	pushl  0x8(%ebp)
 31a:	e8 0c fe ff ff       	call   12b <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 31f:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 322:	83 c4 0c             	add    $0xc,%esp
 325:	6a 01                	push   $0x1
 327:	83 c6 01             	add    $0x1,%esi
 32a:	57                   	push   %edi
 32b:	ff 75 08             	pushl  0x8(%ebp)
 32e:	e8 f8 fd ff ff       	call   12b <write>
	for (i = 0; fmt[i]; i++) {
 333:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 337:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 33a:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 33c:	84 db                	test   %bl,%bl
 33e:	75 8f                	jne    2cf <printf+0x5f>
		}
	}
}
 340:	8d 65 f4             	lea    -0xc(%ebp),%esp
 343:	5b                   	pop    %ebx
 344:	5e                   	pop    %esi
 345:	5f                   	pop    %edi
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    
 348:	90                   	nop
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 350:	83 ec 0c             	sub    $0xc,%esp
 353:	b9 10 00 00 00       	mov    $0x10,%ecx
 358:	6a 00                	push   $0x0
 35a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	8b 13                	mov    (%ebx),%edx
 362:	e8 49 fe ff ff       	call   1b0 <printint>
				ap++;
 367:	89 d8                	mov    %ebx,%eax
 369:	83 c4 10             	add    $0x10,%esp
			state = 0;
 36c:	31 d2                	xor    %edx,%edx
				ap++;
 36e:	83 c0 04             	add    $0x4,%eax
 371:	89 45 d0             	mov    %eax,-0x30(%ebp)
 374:	e9 4b ff ff ff       	jmp    2c4 <printf+0x54>
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 380:	83 ec 0c             	sub    $0xc,%esp
 383:	b9 0a 00 00 00       	mov    $0xa,%ecx
 388:	6a 01                	push   $0x1
 38a:	eb ce                	jmp    35a <printf+0xea>
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 390:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 393:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 396:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 398:	6a 01                	push   $0x1
				ap++;
 39a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 39d:	57                   	push   %edi
 39e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 3a1:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 3a4:	e8 82 fd ff ff       	call   12b <write>
				ap++;
 3a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 3ac:	83 c4 10             	add    $0x10,%esp
			state = 0;
 3af:	31 d2                	xor    %edx,%edx
 3b1:	e9 0e ff ff ff       	jmp    2c4 <printf+0x54>
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 3c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 3c3:	83 ec 04             	sub    $0x4,%esp
 3c6:	e9 5a ff ff ff       	jmp    325 <printf+0xb5>
 3cb:	90                   	nop
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 3d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 3d3:	8b 18                	mov    (%eax),%ebx
				ap++;
 3d5:	83 c0 04             	add    $0x4,%eax
 3d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 3db:	85 db                	test   %ebx,%ebx
 3dd:	74 17                	je     3f6 <printf+0x186>
				while (*s != 0) {
 3df:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 3e2:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 3e4:	84 c0                	test   %al,%al
 3e6:	0f 84 d8 fe ff ff    	je     2c4 <printf+0x54>
 3ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 3ef:	89 de                	mov    %ebx,%esi
 3f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3f4:	eb 1a                	jmp    410 <printf+0x1a0>
					s = "(null)";
 3f6:	bb 70 04 00 00       	mov    $0x470,%ebx
				while (*s != 0) {
 3fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 3fe:	b8 28 00 00 00       	mov    $0x28,%eax
 403:	89 de                	mov    %ebx,%esi
 405:	8b 5d 08             	mov    0x8(%ebp),%ebx
 408:	90                   	nop
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 410:	83 ec 04             	sub    $0x4,%esp
					s++;
 413:	83 c6 01             	add    $0x1,%esi
 416:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 419:	6a 01                	push   $0x1
 41b:	57                   	push   %edi
 41c:	53                   	push   %ebx
 41d:	e8 09 fd ff ff       	call   12b <write>
				while (*s != 0) {
 422:	0f b6 06             	movzbl (%esi),%eax
 425:	83 c4 10             	add    $0x10,%esp
 428:	84 c0                	test   %al,%al
 42a:	75 e4                	jne    410 <printf+0x1a0>
 42c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 42f:	31 d2                	xor    %edx,%edx
 431:	e9 8e fe ff ff       	jmp    2c4 <printf+0x54>
