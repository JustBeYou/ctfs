
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	}
	printf(1, "%d %d %d %s\n", l, w, c, name);
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
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		wc(0, "");
		exit();
	}

	for (i = 1; i < argc; i++) {
		if ((fd = open(argv[i], 0)) < 0) {
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 d5 03 00 00       	call   411 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
			printf(1, "wc: cannot open %s\n", argv[i]);
			exit();
		}
		wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
	for (i = 1; i < argc; i++) {
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
		wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
		close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 9b 03 00 00       	call   3f9 <close>
	for (i = 1; i < argc; i++) {
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
	}
	exit();
  66:	e8 66 03 00 00       	call   3d1 <exit>
			printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 2b 07 00 00       	push   $0x72b
  73:	6a 01                	push   $0x1
  75:	e8 c6 04 00 00       	call   540 <printf>
			exit();
  7a:	e8 52 03 00 00       	call   3d1 <exit>
		wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 1d 07 00 00       	push   $0x71d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
		exit();
  8d:	e8 3f 03 00 00       	call   3d1 <exit>
	free((void *)(hp + 1));
	return freep;
}

void *malloc(uint nbytes)
{
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
	Header *p, *prevp;
	uint nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
  9a:	66 90                	xchg   %ax,%ax
	if ((prevp = freep) == 0) {
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
	l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
	inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
	while ((n = read(fd, buf, sizeof(buf))) > 0) {
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 c0 09 00 00       	push   $0x9c0
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 14 03 00 00       	call   3e9 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
		for (i = 0; i < n; i++) {
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
				inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
		for (i = 0; i < n; i++) {
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
			if (buf[i] == '\n')
  f6:	0f be 87 c0 09 00 00 	movsbl 0x9c0(%edi),%eax
				l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
			if (strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
				l++;
 108:	01 cb                	add    %ecx,%ebx
			if (strchr(" \r\t\n\v", buf[i]))
 10a:	68 08 07 00 00       	push   $0x708
 10f:	e8 3c 01 00 00       	call   250 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
			else if (!inword) {
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
		for (i = 0; i < n; i++) {
 122:	83 c7 01             	add    $0x1,%edi
				w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
				inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
		for (i = 0; i < n; i++) {
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
	if (n < 0) {
 140:	75 24                	jne    166 <wc+0xc6>
	printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 dc             	pushl  -0x24(%ebp)
 14b:	ff 75 e0             	pushl  -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 1e 07 00 00       	push   $0x71e
 154:	6a 01                	push   $0x1
 156:	e8 e5 03 00 00       	call   540 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
		printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 0e 07 00 00       	push   $0x70e
 16d:	6a 01                	push   $0x1
 16f:	e8 cc 03 00 00       	call   540 <printf>
		exit();
 174:	e8 58 02 00 00       	call   3d1 <exit>
		base.s.ptr = freep = prevp = &base;
		base.s.size = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 179:	66 90                	xchg   %ax,%ax
		base.s.size = 0;
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
 180:	55                   	push   %ebp
 181:	31 d2                	xor    %edx,%edx
 183:	89 e5                	mov    %esp,%ebp
		if (p->s.size >= nunits) {
 185:	53                   	push   %ebx
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (p->s.size == nunits)
				prevp->s.ptr = p->s.ptr;
 190:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 194:	88 0c 10             	mov    %cl,(%eax,%edx,1)
char *strcpy(char *s, char *t)
{
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
 197:	83 c2 01             	add    $0x1,%edx
 19a:	84 c9                	test   %cl,%cl
 19c:	75 f2                	jne    190 <strcpy+0x10>
		;
	return os;
}
 19e:	5b                   	pop    %ebx
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <strcmp>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1b8:	8b 75 0c             	mov    0xc(%ebp),%esi
	while (*p && *p == *q)
 1bb:	0f b6 13             	movzbl (%ebx),%edx
 1be:	0f b6 0e             	movzbl (%esi),%ecx
 1c1:	84 d2                	test   %dl,%dl
 1c3:	74 1e                	je     1e3 <strcmp+0x33>
 1c5:	b8 01 00 00 00       	mov    $0x1,%eax
 1ca:	38 ca                	cmp    %cl,%dl
 1cc:	74 09                	je     1d7 <strcmp+0x27>
 1ce:	eb 20                	jmp    1f0 <strcmp+0x40>
 1d0:	83 c0 01             	add    $0x1,%eax
 1d3:	38 ca                	cmp    %cl,%dl
 1d5:	75 19                	jne    1f0 <strcmp+0x40>
 1d7:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1db:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 1df:	84 d2                	test   %dl,%dl
 1e1:	75 ed                	jne    1d0 <strcmp+0x20>
 1e3:	31 c0                	xor    %eax,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
 1e5:	5b                   	pop    %ebx
 1e6:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 1e7:	29 c8                	sub    %ecx,%eax
}
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	90                   	nop
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f0:	0f b6 c2             	movzbl %dl,%eax
 1f3:	5b                   	pop    %ebx
 1f4:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 1f5:	29 c8                	sub    %ecx,%eax
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strlen>:

uint strlen(char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 206:	80 39 00             	cmpb   $0x0,(%ecx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 d2                	xor    %edx,%edx
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c2 01             	add    $0x1,%edx
 213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 217:	89 d0                	mov    %edx,%eax
 219:	75 f5                	jne    210 <strlen+0x10>
		;
	return n;
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
	for (n = 0; s[n]; n++)
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 22a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000230 <memset>:

void *memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char *strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 25a:	0f b6 18             	movzbl (%eax),%ebx
 25d:	84 db                	test   %bl,%bl
 25f:	74 1d                	je     27e <strchr+0x2e>
 261:	89 d1                	mov    %edx,%ecx
		if (*s == c)
 263:	38 d3                	cmp    %dl,%bl
 265:	75 0d                	jne    274 <strchr+0x24>
 267:	eb 17                	jmp    280 <strchr+0x30>
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0c                	je     280 <strchr+0x30>
	for (; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	0f b6 10             	movzbl (%eax),%edx
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strchr+0x20>
			return (char *)s;
	return 0;
 27e:	31 c0                	xor    %eax,%eax
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char *gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 295:	31 f6                	xor    %esi,%esi
{
 297:	53                   	push   %ebx
 298:	89 f3                	mov    %esi,%ebx
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
	for (i = 0; i + 1 < max;) {
 2a0:	eb 2f                	jmp    2d1 <gets+0x41>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		cc = read(0, &c, 1);
 2a8:	83 ec 04             	sub    $0x4,%esp
 2ab:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ae:	6a 01                	push   $0x1
 2b0:	50                   	push   %eax
 2b1:	6a 00                	push   $0x0
 2b3:	e8 31 01 00 00       	call   3e9 <read>
		if (cc < 1)
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7e 1c                	jle    2db <gets+0x4b>
			break;
		buf[i++] = c;
 2bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c3:	83 c7 01             	add    $0x1,%edi
 2c6:	88 47 ff             	mov    %al,-0x1(%edi)
		if (c == '\n' || c == '\r')
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 23                	je     2f0 <gets+0x60>
 2cd:	3c 0d                	cmp    $0xd,%al
 2cf:	74 1f                	je     2f0 <gets+0x60>
	for (i = 0; i + 1 < max;) {
 2d1:	83 c3 01             	add    $0x1,%ebx
 2d4:	89 fe                	mov    %edi,%esi
 2d6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d9:	7c cd                	jl     2a8 <gets+0x18>
 2db:	89 f3                	mov    %esi,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
	buf[i] = '\0';
 2e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	90                   	nop
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	8b 75 08             	mov    0x8(%ebp),%esi
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	01 de                	add    %ebx,%esi
 2f8:	89 f3                	mov    %esi,%ebx
	buf[i] = '\0';
 2fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <stat>:

int stat(char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 ef 00 00 00       	call   411 <open>
	if (fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
		return -1;
	r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 f2 00 00 00       	call   429 <fstat>
	close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
	r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
	close(fd);
 33c:	e8 b8 00 00 00       	call   3f9 <close>
	return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <atoi>:

int atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 367:	0f be 11             	movsbl (%ecx),%edx
 36a:	8d 42 d0             	lea    -0x30(%edx),%eax
 36d:	3c 09                	cmp    $0x9,%al
	n = 0;
 36f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9')
 374:	77 1f                	ja     395 <atoi+0x35>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
 380:	83 c1 01             	add    $0x1,%ecx
 383:	8d 04 80             	lea    (%eax,%eax,4),%eax
 386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	while ('0' <= *s && *s <= '9')
 38a:	0f be 11             	movsbl (%ecx),%edx
 38d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
	return n;
}
 395:	5b                   	pop    %ebx
 396:	5d                   	pop    %ebp
 397:	c3                   	ret    
 398:	90                   	nop
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void *memmove(void *vdst, void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 55 10             	mov    0x10(%ebp),%edx
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 3ae:	85 d2                	test   %edx,%edx
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 c2                	add    %eax,%edx
	dst = vdst;
 3b4:	89 c7                	mov    %eax,%edi
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		*dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
	while (n-- > 0)
 3c1:	39 fa                	cmp    %edi,%edx
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
	return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	5f                   	pop    %edi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    

000003c9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3c9:	b8 01 00 00 00       	mov    $0x1,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <exit>:
SYSCALL(exit)
 3d1:	b8 02 00 00 00       	mov    $0x2,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <wait>:
SYSCALL(wait)
 3d9:	b8 03 00 00 00       	mov    $0x3,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <pipe>:
SYSCALL(pipe)
 3e1:	b8 04 00 00 00       	mov    $0x4,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <read>:
SYSCALL(read)
 3e9:	b8 05 00 00 00       	mov    $0x5,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <write>:
SYSCALL(write)
 3f1:	b8 10 00 00 00       	mov    $0x10,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <close>:
SYSCALL(close)
 3f9:	b8 15 00 00 00       	mov    $0x15,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <kill>:
SYSCALL(kill)
 401:	b8 06 00 00 00       	mov    $0x6,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <exec>:
SYSCALL(exec)
 409:	b8 07 00 00 00       	mov    $0x7,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <open>:
SYSCALL(open)
 411:	b8 0f 00 00 00       	mov    $0xf,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <mknod>:
SYSCALL(mknod)
 419:	b8 11 00 00 00       	mov    $0x11,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <unlink>:
SYSCALL(unlink)
 421:	b8 12 00 00 00       	mov    $0x12,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <fstat>:
SYSCALL(fstat)
 429:	b8 08 00 00 00       	mov    $0x8,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <link>:
SYSCALL(link)
 431:	b8 13 00 00 00       	mov    $0x13,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <mkdir>:
SYSCALL(mkdir)
 439:	b8 14 00 00 00       	mov    $0x14,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <chdir>:
SYSCALL(chdir)
 441:	b8 09 00 00 00       	mov    $0x9,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <dup>:
SYSCALL(dup)
 449:	b8 0a 00 00 00       	mov    $0xa,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <getpid>:
SYSCALL(getpid)
 451:	b8 0b 00 00 00       	mov    $0xb,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <sbrk>:
SYSCALL(sbrk)
 459:	b8 0c 00 00 00       	mov    $0xc,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <sleep>:
SYSCALL(sleep)
 461:	b8 0d 00 00 00       	mov    $0xd,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <uptime>:
SYSCALL(uptime)
 469:	b8 0e 00 00 00       	mov    $0xe,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    
 471:	66 90                	xchg   %ax,%ax
 473:	66 90                	xchg   %ax,%ax
 475:	66 90                	xchg   %ax,%ax
 477:	66 90                	xchg   %ax,%ax
 479:	66 90                	xchg   %ax,%ax
 47b:	66 90                	xchg   %ax,%ax
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint>:
{
	write(fd, &c, 1);
}

static void printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
	uint x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x = -xx;
 486:	89 d3                	mov    %edx,%ebx
{
 488:	83 ec 3c             	sub    $0x3c,%esp
 48b:	89 45 bc             	mov    %eax,-0x44(%ebp)
	if (sgn && xx < 0) {
 48e:	85 d2                	test   %edx,%edx
 490:	0f 89 92 00 00 00    	jns    528 <printint+0xa8>
 496:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 49a:	0f 84 88 00 00 00    	je     528 <printint+0xa8>
		neg = 1;
 4a0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
		x = -xx;
 4a7:	f7 db                	neg    %ebx
	} else {
		x = xx;
	}

	i = 0;
 4a9:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4b0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4b3:	eb 08                	jmp    4bd <printint+0x3d>
 4b5:	8d 76 00             	lea    0x0(%esi),%esi
	do {
		buf[i++] = digits[x % base];
 4b8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	} while ((x /= base) != 0);
 4bb:	89 c3                	mov    %eax,%ebx
		buf[i++] = digits[x % base];
 4bd:	89 d8                	mov    %ebx,%eax
 4bf:	31 d2                	xor    %edx,%edx
 4c1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 4c4:	f7 f1                	div    %ecx
 4c6:	83 c7 01             	add    $0x1,%edi
 4c9:	0f b6 92 48 07 00 00 	movzbl 0x748(%edx),%edx
 4d0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
	} while ((x /= base) != 0);
 4d3:	39 d9                	cmp    %ebx,%ecx
 4d5:	76 e1                	jbe    4b8 <printint+0x38>
	if (neg)
 4d7:	8b 45 c0             	mov    -0x40(%ebp),%eax
 4da:	85 c0                	test   %eax,%eax
 4dc:	74 0d                	je     4eb <printint+0x6b>
		buf[i++] = '-';
 4de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4e3:	ba 2d 00 00 00       	mov    $0x2d,%edx
		buf[i++] = digits[x % base];
 4e8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 4eb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4ee:	8b 7d bc             	mov    -0x44(%ebp),%edi
 4f1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4f5:	eb 0f                	jmp    506 <printint+0x86>
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 500:	0f b6 13             	movzbl (%ebx),%edx
 503:	83 eb 01             	sub    $0x1,%ebx
	write(fd, &c, 1);
 506:	83 ec 04             	sub    $0x4,%esp
 509:	88 55 d7             	mov    %dl,-0x29(%ebp)
 50c:	6a 01                	push   $0x1
 50e:	56                   	push   %esi
 50f:	57                   	push   %edi
 510:	e8 dc fe ff ff       	call   3f1 <write>

	while (--i >= 0)
 515:	83 c4 10             	add    $0x10,%esp
 518:	39 de                	cmp    %ebx,%esi
 51a:	75 e4                	jne    500 <printint+0x80>
		putc(fd, buf[i]);
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	neg = 0;
 528:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 52f:	e9 75 ff ff ff       	jmp    4a9 <printint+0x29>
 534:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 53a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 549:	8b 75 0c             	mov    0xc(%ebp),%esi
 54c:	0f b6 1e             	movzbl (%esi),%ebx
 54f:	84 db                	test   %bl,%bl
 551:	0f 84 b9 00 00 00    	je     610 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
 557:	8d 45 10             	lea    0x10(%ebp),%eax
 55a:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
 55d:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
 560:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
 562:	89 45 d0             	mov    %eax,-0x30(%ebp)
 565:	eb 38                	jmp    59f <printf+0x5f>
 567:	89 f6                	mov    %esi,%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 570:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 573:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	74 17                	je     594 <printf+0x54>
	write(fd, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	88 5d e7             	mov    %bl,-0x19(%ebp)
 583:	6a 01                	push   $0x1
 585:	57                   	push   %edi
 586:	ff 75 08             	pushl  0x8(%ebp)
 589:	e8 63 fe ff ff       	call   3f1 <write>
 58e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
 591:	83 c4 10             	add    $0x10,%esp
 594:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
 597:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 59b:	84 db                	test   %bl,%bl
 59d:	74 71                	je     610 <printf+0xd0>
		c = fmt[i] & 0xff;
 59f:	0f be cb             	movsbl %bl,%ecx
 5a2:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
 5a5:	85 d2                	test   %edx,%edx
 5a7:	74 c7                	je     570 <printf+0x30>
			}
		} else if (state == '%') {
 5a9:	83 fa 25             	cmp    $0x25,%edx
 5ac:	75 e6                	jne    594 <printf+0x54>
			if (c == 'd') {
 5ae:	83 f8 64             	cmp    $0x64,%eax
 5b1:	0f 84 99 00 00 00    	je     650 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 5b7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5bd:	83 f9 70             	cmp    $0x70,%ecx
 5c0:	74 5e                	je     620 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 5c2:	83 f8 73             	cmp    $0x73,%eax
 5c5:	0f 84 d5 00 00 00    	je     6a0 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 5cb:	83 f8 63             	cmp    $0x63,%eax
 5ce:	0f 84 8c 00 00 00    	je     660 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 5d4:	83 f8 25             	cmp    $0x25,%eax
 5d7:	0f 84 b3 00 00 00    	je     690 <printf+0x150>
	write(fd, &c, 1);
 5dd:	83 ec 04             	sub    $0x4,%esp
 5e0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5e4:	6a 01                	push   $0x1
 5e6:	57                   	push   %edi
 5e7:	ff 75 08             	pushl  0x8(%ebp)
 5ea:	e8 02 fe ff ff       	call   3f1 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 5ef:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 5f2:	83 c4 0c             	add    $0xc,%esp
 5f5:	6a 01                	push   $0x1
 5f7:	83 c6 01             	add    $0x1,%esi
 5fa:	57                   	push   %edi
 5fb:	ff 75 08             	pushl  0x8(%ebp)
 5fe:	e8 ee fd ff ff       	call   3f1 <write>
	for (i = 0; fmt[i]; i++) {
 603:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 607:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 60a:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 60c:	84 db                	test   %bl,%bl
 60e:	75 8f                	jne    59f <printf+0x5f>
		}
	}
}
 610:	8d 65 f4             	lea    -0xc(%ebp),%esp
 613:	5b                   	pop    %ebx
 614:	5e                   	pop    %esi
 615:	5f                   	pop    %edi
 616:	5d                   	pop    %ebp
 617:	c3                   	ret    
 618:	90                   	nop
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
 628:	6a 00                	push   $0x0
 62a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 62d:	8b 45 08             	mov    0x8(%ebp),%eax
 630:	8b 13                	mov    (%ebx),%edx
 632:	e8 49 fe ff ff       	call   480 <printint>
				ap++;
 637:	89 d8                	mov    %ebx,%eax
 639:	83 c4 10             	add    $0x10,%esp
			state = 0;
 63c:	31 d2                	xor    %edx,%edx
				ap++;
 63e:	83 c0 04             	add    $0x4,%eax
 641:	89 45 d0             	mov    %eax,-0x30(%ebp)
 644:	e9 4b ff ff ff       	jmp    594 <printf+0x54>
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	6a 01                	push   $0x1
 65a:	eb ce                	jmp    62a <printf+0xea>
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 660:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 666:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 668:	6a 01                	push   $0x1
				ap++;
 66a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 66d:	57                   	push   %edi
 66e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 671:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 674:	e8 78 fd ff ff       	call   3f1 <write>
				ap++;
 679:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 67c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 67f:	31 d2                	xor    %edx,%edx
 681:	e9 0e ff ff ff       	jmp    594 <printf+0x54>
 686:	8d 76 00             	lea    0x0(%esi),%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 690:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
 696:	e9 5a ff ff ff       	jmp    5f5 <printf+0xb5>
 69b:	90                   	nop
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 6a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6a3:	8b 18                	mov    (%eax),%ebx
				ap++;
 6a5:	83 c0 04             	add    $0x4,%eax
 6a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 6ab:	85 db                	test   %ebx,%ebx
 6ad:	74 17                	je     6c6 <printf+0x186>
				while (*s != 0) {
 6af:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 6b2:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 6b4:	84 c0                	test   %al,%al
 6b6:	0f 84 d8 fe ff ff    	je     594 <printf+0x54>
 6bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6bf:	89 de                	mov    %ebx,%esi
 6c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6c4:	eb 1a                	jmp    6e0 <printf+0x1a0>
					s = "(null)";
 6c6:	bb 3f 07 00 00       	mov    $0x73f,%ebx
				while (*s != 0) {
 6cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ce:	b8 28 00 00 00       	mov    $0x28,%eax
 6d3:	89 de                	mov    %ebx,%esi
 6d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6d8:	90                   	nop
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
					s++;
 6e3:	83 c6 01             	add    $0x1,%esi
 6e6:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 6e9:	6a 01                	push   $0x1
 6eb:	57                   	push   %edi
 6ec:	53                   	push   %ebx
 6ed:	e8 ff fc ff ff       	call   3f1 <write>
				while (*s != 0) {
 6f2:	0f b6 06             	movzbl (%esi),%eax
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	84 c0                	test   %al,%al
 6fa:	75 e4                	jne    6e0 <printf+0x1a0>
 6fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 6ff:	31 d2                	xor    %edx,%edx
 701:	e9 8e fe ff ff       	jmp    594 <printf+0x54>
