
_rm:     file format elf32-i386


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
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	8b 31                	mov    (%ecx),%esi
  1e:	83 c3 04             	add    $0x4,%ebx
	int i;

	if (argc < 2) {
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d 76 00             	lea    0x0(%esi),%esi
  29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		printf(2, "Usage: rm files...\n");
		exit();
	}

	for (i = 1; i < argc; i++) {
		if (unlink(argv[i]) < 0) {
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 95 00 00 00       	call   cf <unlink>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
	for (i = 1; i < argc; i++) {
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
			printf(2, "rm: %s failed to delete\n", argv[i]);
			break;
		}
	}

	exit();
  4b:	e8 2f 00 00 00       	call   7f <exit>
			printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 bc 03 00 00       	push   $0x3bc
  58:	6a 02                	push   $0x2
  5a:	e8 81 01 00 00       	call   1e0 <printf>
			break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
		printf(2, "Usage: rm files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 a8 03 00 00       	push   $0x3a8
  6b:	6a 02                	push   $0x2
  6d:	e8 6e 01 00 00       	call   1e0 <printf>
		exit();
  72:	e8 08 00 00 00       	call   7f <exit>

00000077 <fork>:
int strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
  77:	b8 01 00 00 00       	mov    $0x1,%eax
  7c:	cd 40                	int    $0x40
  7e:	c3                   	ret    

0000007f <exit>:
  7f:	b8 02 00 00 00       	mov    $0x2,%eax

uint strlen(char *s)
{
  84:	cd 40                	int    $0x40
	int n;

	for (n = 0; s[n]; n++)
  86:	c3                   	ret    

00000087 <wait>:
  87:	b8 03 00 00 00       	mov    $0x3,%eax
  8c:	cd 40                	int    $0x40
  8e:	c3                   	ret    

0000008f <pipe>:
  8f:	b8 04 00 00 00       	mov    $0x4,%eax
  94:	cd 40                	int    $0x40
  96:	c3                   	ret    

00000097 <read>:
  97:	b8 05 00 00 00       	mov    $0x5,%eax
		;
	return n;
}
  9c:	cd 40                	int    $0x40
  9e:	c3                   	ret    

0000009f <write>:
  9f:	b8 10 00 00 00       	mov    $0x10,%eax
  a4:	cd 40                	int    $0x40
  a6:	c3                   	ret    

000000a7 <close>:
  a7:	b8 15 00 00 00       	mov    $0x15,%eax
  ac:	cd 40                	int    $0x40
  ae:	c3                   	ret    

000000af <kill>:
  af:	b8 06 00 00 00       	mov    $0x6,%eax

void *memset(void *dst, int c, uint n)
{
  b4:	cd 40                	int    $0x40
  b6:	c3                   	ret    

000000b7 <exec>:
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
  b7:	b8 07 00 00 00       	mov    $0x7,%eax
  bc:	cd 40                	int    $0x40
  be:	c3                   	ret    

000000bf <open>:
  bf:	b8 0f 00 00 00       	mov    $0xf,%eax
	stosb(dst, c, n);
	return dst;
}
  c4:	cd 40                	int    $0x40
  c6:	c3                   	ret    

000000c7 <mknod>:
  c7:	b8 11 00 00 00       	mov    $0x11,%eax
  cc:	cd 40                	int    $0x40
  ce:	c3                   	ret    

000000cf <unlink>:
  cf:	b8 12 00 00 00       	mov    $0x12,%eax

char *strchr(const char *s, char c)
{
  d4:	cd 40                	int    $0x40
  d6:	c3                   	ret    

000000d7 <fstat>:
  d7:	b8 08 00 00 00       	mov    $0x8,%eax
	for (; *s; s++)
  dc:	cd 40                	int    $0x40
  de:	c3                   	ret    

000000df <link>:
  df:	b8 13 00 00 00       	mov    $0x13,%eax
		if (*s == c)
  e4:	cd 40                	int    $0x40
  e6:	c3                   	ret    

000000e7 <mkdir>:
  e7:	b8 14 00 00 00       	mov    $0x14,%eax
  ec:	cd 40                	int    $0x40
  ee:	c3                   	ret    

000000ef <chdir>:
  ef:	b8 09 00 00 00       	mov    $0x9,%eax
	for (; *s; s++)
  f4:	cd 40                	int    $0x40
  f6:	c3                   	ret    

000000f7 <dup>:
  f7:	b8 0a 00 00 00       	mov    $0xa,%eax
  fc:	cd 40                	int    $0x40
			return (char *)s;
	return 0;
  fe:	c3                   	ret    

000000ff <getpid>:
  ff:	b8 0b 00 00 00       	mov    $0xb,%eax
}
 104:	cd 40                	int    $0x40
 106:	c3                   	ret    

00000107 <sbrk>:
 107:	b8 0c 00 00 00       	mov    $0xc,%eax
 10c:	cd 40                	int    $0x40
 10e:	c3                   	ret    

0000010f <sleep>:
 10f:	b8 0d 00 00 00       	mov    $0xd,%eax

char *gets(char *buf, int max)
{
 114:	cd 40                	int    $0x40
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 116:	c3                   	ret    

00000117 <uptime>:
{
 117:	b8 0e 00 00 00       	mov    $0xe,%eax
 11c:	cd 40                	int    $0x40
 11e:	c3                   	ret    
 11f:	90                   	nop

00000120 <printint>:
	for (i = 0; i + 1 < max;) {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
 126:	89 d3                	mov    %edx,%ebx
		cc = read(0, &c, 1);
 128:	83 ec 3c             	sub    $0x3c,%esp
 12b:	89 45 bc             	mov    %eax,-0x44(%ebp)
 12e:	85 d2                	test   %edx,%edx
 130:	0f 89 92 00 00 00    	jns    1c8 <printint+0xa8>
 136:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
		if (cc < 1)
 13a:	0f 84 88 00 00 00    	je     1c8 <printint+0xa8>
			break;
		buf[i++] = c;
 140:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 147:	f7 db                	neg    %ebx
		if (c == '\n' || c == '\r')
 149:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 150:	8d 75 d7             	lea    -0x29(%ebp),%esi
	for (i = 0; i + 1 < max;) {
 153:	eb 08                	jmp    15d <printint+0x3d>
 155:	8d 76 00             	lea    0x0(%esi),%esi
 158:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 15b:	89 c3                	mov    %eax,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
 15d:	89 d8                	mov    %ebx,%eax
 15f:	31 d2                	xor    %edx,%edx
	buf[i] = '\0';
 161:	8b 7d c4             	mov    -0x3c(%ebp),%edi
}
 164:	f7 f1                	div    %ecx
 166:	83 c7 01             	add    $0x1,%edi
 169:	0f b6 92 dc 03 00 00 	movzbl 0x3dc(%edx),%edx
 170:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 173:	39 d9                	cmp    %ebx,%ecx
 175:	76 e1                	jbe    158 <printint+0x38>
 177:	8b 45 c0             	mov    -0x40(%ebp),%eax
	buf[i] = '\0';
 17a:	85 c0                	test   %eax,%eax
 17c:	74 0d                	je     18b <printint+0x6b>
}
 17e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 183:	ba 2d 00 00 00       	mov    $0x2d,%edx
 188:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 18b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 18e:	8b 7d bc             	mov    -0x44(%ebp),%edi

int stat(char *n, struct stat *st)
{
 191:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 195:	eb 0f                	jmp    1a6 <printint+0x86>
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 1a0:	0f b6 13             	movzbl (%ebx),%edx
	if (fd < 0)
 1a3:	83 eb 01             	sub    $0x1,%ebx
 1a6:	83 ec 04             	sub    $0x4,%esp
		return -1;
	r = fstat(fd, st);
 1a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 1ac:	6a 01                	push   $0x1
 1ae:	56                   	push   %esi
 1af:	57                   	push   %edi
 1b0:	e8 ea fe ff ff       	call   9f <write>
 1b5:	83 c4 10             	add    $0x10,%esp
	close(fd);
 1b8:	39 de                	cmp    %ebx,%esi
	r = fstat(fd, st);
 1ba:	75 e4                	jne    1a0 <printint+0x80>
	close(fd);
 1bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bf:	5b                   	pop    %ebx
 1c0:	5e                   	pop    %esi
	return r;
 1c1:	5f                   	pop    %edi
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
}
 1c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 1cf:	e9 75 ff ff ff       	jmp    149 <printint+0x29>
		return -1;
 1d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001e0 <printf>:

int atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	83 ec 2c             	sub    $0x2c,%esp
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 1e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 1ec:	0f b6 1e             	movzbl (%esi),%ebx
	n = 0;
 1ef:	84 db                	test   %bl,%bl
 1f1:	0f 84 b9 00 00 00    	je     2b0 <printf+0xd0>
	while ('0' <= *s && *s <= '9')
 1f7:	8d 45 10             	lea    0x10(%ebp),%eax
 1fa:	83 c6 01             	add    $0x1,%esi
 1fd:	8d 7d e7             	lea    -0x19(%ebp),%edi
		n = n * 10 + *s++ - '0';
 200:	31 d2                	xor    %edx,%edx
 202:	89 45 d0             	mov    %eax,-0x30(%ebp)
 205:	eb 38                	jmp    23f <printf+0x5f>
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	while ('0' <= *s && *s <= '9')
 210:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 213:	ba 25 00 00 00       	mov    $0x25,%edx
	return n;
}
 218:	83 f8 25             	cmp    $0x25,%eax
 21b:	74 17                	je     234 <printf+0x54>
 21d:	83 ec 04             	sub    $0x4,%esp

void *memmove(void *vdst, void *vsrc, int n)
{
 220:	88 5d e7             	mov    %bl,-0x19(%ebp)
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	ff 75 08             	pushl  0x8(%ebp)
 229:	e8 71 fe ff ff       	call   9f <write>
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 22e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 231:	83 c4 10             	add    $0x10,%esp
	dst = vdst;
 234:	83 c6 01             	add    $0x1,%esi
 237:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 23b:	84 db                	test   %bl,%bl
 23d:	74 71                	je     2b0 <printf+0xd0>
 23f:	0f be cb             	movsbl %bl,%ecx
	while (n-- > 0)
 242:	0f b6 c3             	movzbl %bl,%eax
		*dst++ = *src++;
	return vdst;
}
 245:	85 d2                	test   %edx,%edx
 247:	74 c7                	je     210 <printf+0x30>
			if (c == '%') {
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if (state == '%') {
 249:	83 fa 25             	cmp    $0x25,%edx
 24c:	75 e6                	jne    234 <printf+0x54>
			if (c == 'd') {
 24e:	83 f8 64             	cmp    $0x64,%eax
 251:	0f 84 99 00 00 00    	je     2f0 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 257:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 25d:	83 f9 70             	cmp    $0x70,%ecx
 260:	74 5e                	je     2c0 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 262:	83 f8 73             	cmp    $0x73,%eax
 265:	0f 84 d5 00 00 00    	je     340 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 26b:	83 f8 63             	cmp    $0x63,%eax
 26e:	0f 84 8c 00 00 00    	je     300 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 274:	83 f8 25             	cmp    $0x25,%eax
 277:	0f 84 b3 00 00 00    	je     330 <printf+0x150>
	write(fd, &c, 1);
 27d:	83 ec 04             	sub    $0x4,%esp
 280:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 284:	6a 01                	push   $0x1
 286:	57                   	push   %edi
 287:	ff 75 08             	pushl  0x8(%ebp)
 28a:	e8 10 fe ff ff       	call   9f <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 28f:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 292:	83 c4 0c             	add    $0xc,%esp
 295:	6a 01                	push   $0x1
 297:	83 c6 01             	add    $0x1,%esi
 29a:	57                   	push   %edi
 29b:	ff 75 08             	pushl  0x8(%ebp)
 29e:	e8 fc fd ff ff       	call   9f <write>
	for (i = 0; fmt[i]; i++) {
 2a3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 2a7:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 2aa:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 2ac:	84 db                	test   %bl,%bl
 2ae:	75 8f                	jne    23f <printf+0x5f>
		}
	}
}
 2b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b3:	5b                   	pop    %ebx
 2b4:	5e                   	pop    %esi
 2b5:	5f                   	pop    %edi
 2b6:	5d                   	pop    %ebp
 2b7:	c3                   	ret    
 2b8:	90                   	nop
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 2c0:	83 ec 0c             	sub    $0xc,%esp
 2c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 2c8:	6a 00                	push   $0x0
 2ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	8b 13                	mov    (%ebx),%edx
 2d2:	e8 49 fe ff ff       	call   120 <printint>
				ap++;
 2d7:	89 d8                	mov    %ebx,%eax
 2d9:	83 c4 10             	add    $0x10,%esp
			state = 0;
 2dc:	31 d2                	xor    %edx,%edx
				ap++;
 2de:	83 c0 04             	add    $0x4,%eax
 2e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 2e4:	e9 4b ff ff ff       	jmp    234 <printf+0x54>
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 2f0:	83 ec 0c             	sub    $0xc,%esp
 2f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 2f8:	6a 01                	push   $0x1
 2fa:	eb ce                	jmp    2ca <printf+0xea>
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 300:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 303:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 306:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 308:	6a 01                	push   $0x1
				ap++;
 30a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 30d:	57                   	push   %edi
 30e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 311:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 314:	e8 86 fd ff ff       	call   9f <write>
				ap++;
 319:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 31c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 31f:	31 d2                	xor    %edx,%edx
 321:	e9 0e ff ff ff       	jmp    234 <printf+0x54>
 326:	8d 76 00             	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 330:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 333:	83 ec 04             	sub    $0x4,%esp
 336:	e9 5a ff ff ff       	jmp    295 <printf+0xb5>
 33b:	90                   	nop
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 340:	8b 45 d0             	mov    -0x30(%ebp),%eax
 343:	8b 18                	mov    (%eax),%ebx
				ap++;
 345:	83 c0 04             	add    $0x4,%eax
 348:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 34b:	85 db                	test   %ebx,%ebx
 34d:	74 17                	je     366 <printf+0x186>
				while (*s != 0) {
 34f:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 352:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 354:	84 c0                	test   %al,%al
 356:	0f 84 d8 fe ff ff    	je     234 <printf+0x54>
 35c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 35f:	89 de                	mov    %ebx,%esi
 361:	8b 5d 08             	mov    0x8(%ebp),%ebx
 364:	eb 1a                	jmp    380 <printf+0x1a0>
					s = "(null)";
 366:	bb d5 03 00 00       	mov    $0x3d5,%ebx
				while (*s != 0) {
 36b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 36e:	b8 28 00 00 00       	mov    $0x28,%eax
 373:	89 de                	mov    %ebx,%esi
 375:	8b 5d 08             	mov    0x8(%ebp),%ebx
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 380:	83 ec 04             	sub    $0x4,%esp
					s++;
 383:	83 c6 01             	add    $0x1,%esi
 386:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 389:	6a 01                	push   $0x1
 38b:	57                   	push   %edi
 38c:	53                   	push   %ebx
 38d:	e8 0d fd ff ff       	call   9f <write>
				while (*s != 0) {
 392:	0f b6 06             	movzbl (%esi),%eax
 395:	83 c4 10             	add    $0x10,%esp
 398:	84 c0                	test   %al,%al
 39a:	75 e4                	jne    380 <printf+0x1a0>
 39c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 39f:	31 d2                	xor    %edx,%edx
 3a1:	e9 8e fe ff ff       	jmp    234 <printf+0x54>
