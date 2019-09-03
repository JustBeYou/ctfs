
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		}
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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	int fd, i;
	char *pattern;

	if (argc <= 1) {
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 77                	jle    98 <main+0x98>
		printf(2, "usage: grep pattern [file ...]\n");
		exit();
	}
	pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

	if (argc <= 2) {
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
		grep(pattern, 0);
		exit();
	}

	for (i = 2; i < argc; i++) {
  2b:	be 02 00 00 00       	mov    $0x2,%esi
	pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
	if (argc <= 2) {
  33:	75 35                	jne    6a <main+0x6a>
		grep(pattern, 0);
  35:	52                   	push   %edx
  36:	52                   	push   %edx
  37:	6a 00                	push   $0x0
  39:	50                   	push   %eax
  3a:	e8 f1 01 00 00       	call   230 <grep>
		exit();
  3f:	e8 4d 05 00 00       	call   591 <exit>
  44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if ((fd = open(argv[i], 0)) < 0) {
			printf(1, "grep: cannot open %s\n", argv[i]);
			exit();
		}
		grep(pattern, fd);
  48:	83 ec 08             	sub    $0x8,%esp
	for (i = 2; i < argc; i++) {
  4b:	83 c6 01             	add    $0x1,%esi
  4e:	83 c3 04             	add    $0x4,%ebx
		grep(pattern, fd);
  51:	50                   	push   %eax
  52:	ff 75 e0             	pushl  -0x20(%ebp)
  55:	e8 d6 01 00 00       	call   230 <grep>
		close(fd);
  5a:	89 3c 24             	mov    %edi,(%esp)
  5d:	e8 57 05 00 00       	call   5b9 <close>
	for (i = 2; i < argc; i++) {
  62:	83 c4 10             	add    $0x10,%esp
  65:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  68:	7e 29                	jle    93 <main+0x93>
		if ((fd = open(argv[i], 0)) < 0) {
  6a:	83 ec 08             	sub    $0x8,%esp
  6d:	6a 00                	push   $0x0
  6f:	ff 33                	pushl  (%ebx)
  71:	e8 5b 05 00 00       	call   5d1 <open>
  76:	83 c4 10             	add    $0x10,%esp
  79:	89 c7                	mov    %eax,%edi
  7b:	85 c0                	test   %eax,%eax
  7d:	79 c9                	jns    48 <main+0x48>
			printf(1, "grep: cannot open %s\n", argv[i]);
  7f:	50                   	push   %eax
  80:	ff 33                	pushl  (%ebx)
  82:	68 e8 08 00 00       	push   $0x8e8
  87:	6a 01                	push   $0x1
  89:	e8 72 06 00 00       	call   700 <printf>
			exit();
  8e:	e8 fe 04 00 00       	call   591 <exit>
	}
	exit();
  93:	e8 f9 04 00 00       	call   591 <exit>
		printf(2, "usage: grep pattern [file ...]\n");
  98:	51                   	push   %ecx
  99:	51                   	push   %ecx
  9a:	68 c8 08 00 00       	push   $0x8c8
  9f:	6a 02                	push   $0x2
  a1:	e8 5a 06 00 00       	call   700 <printf>
		exit();
  a6:	e8 e6 04 00 00       	call   591 <exit>
{
	Header *p, *prevp;
	uint nunits;

	nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
	if ((prevp = freep) == 0) {
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <matchstar>:
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
		base.s.ptr = freep = prevp = &base;
		base.s.size = 0;
	}
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
		if (p->s.size >= nunits) {
  b5:	53                   	push   %ebx
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  bf:	8b 7d 10             	mov    0x10(%ebp),%edi
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c8:	83 ec 08             	sub    $0x8,%esp
	p = sbrk(nu * sizeof(Header));
  cb:	57                   	push   %edi
  cc:	56                   	push   %esi
  cd:	e8 3e 00 00 00       	call   110 <matchhere>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	85 c0                	test   %eax,%eax
  d7:	75 1f                	jne    f8 <matchstar+0x48>
  d9:	0f be 17             	movsbl (%edi),%edx
  dc:	84 d2                	test   %dl,%dl
  de:	74 0c                	je     ec <matchstar+0x3c>
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
  e0:	83 c7 01             	add    $0x1,%edi
		if (p->s.size >= nunits) {
  e3:	39 da                	cmp    %ebx,%edx
  e5:	74 e1                	je     c8 <matchstar+0x18>
  e7:	83 fb 2e             	cmp    $0x2e,%ebx
  ea:	74 dc                	je     c8 <matchstar+0x18>
  ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
				p->s.size = nunits;
			}
			freep = prevp;
			return (void *)(p + 1);
		}
		if (p == freep)
  f1:	5f                   	pop    %edi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	p = sbrk(nu * sizeof(Header));
  f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  fb:	b8 01 00 00 00       	mov    $0x1,%eax
	if (p == (char *)-1)
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	hp->s.size = nu;
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <matchhere>:
	free((void *)(hp + 1));
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
	return freep;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
			if ((p = morecore(nunits)) == 0)
 11f:	0f b6 10             	movzbl (%eax),%edx
 122:	84 d2                	test   %dl,%dl
				return 0;
	}
}
 124:	74 67                	je     18d <matchhere+0x7d>
 126:	0f be 40 01          	movsbl 0x1(%eax),%eax
 12a:	3c 2a                	cmp    $0x2a,%al
 12c:	74 6c                	je     19a <matchhere+0x8a>
		if (p->s.size >= nunits) {
 12e:	0f b6 1f             	movzbl (%edi),%ebx
 131:	80 fa 24             	cmp    $0x24,%dl
 134:	75 08                	jne    13e <matchhere+0x2e>
 136:	84 c0                	test   %al,%al
			if (p->s.size == nunits)
 138:	0f 84 81 00 00 00    	je     1bf <matchhere+0xaf>
				p->s.size -= nunits;
 13e:	84 db                	test   %bl,%bl
 140:	74 09                	je     14b <matchhere+0x3b>
				p += p->s.size;
 142:	38 da                	cmp    %bl,%dl
				p->s.size = nunits;
 144:	74 3c                	je     182 <matchhere+0x72>
 146:	80 fa 2e             	cmp    $0x2e,%dl
			freep = prevp;
 149:	74 37                	je     182 <matchhere+0x72>
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
}
 14e:	31 c0                	xor    %eax,%eax
			return (void *)(p + 1);
 150:	5b                   	pop    %ebx
 151:	5e                   	pop    %esi
 152:	5f                   	pop    %edi
}
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
 158:	8b 75 08             	mov    0x8(%ebp),%esi
 15b:	0f b6 56 01          	movzbl 0x1(%esi),%edx
 15f:	80 fa 2a             	cmp    $0x2a,%dl
		base.s.ptr = freep = prevp = &base;
 162:	74 3b                	je     19f <matchhere+0x8f>
 164:	3c 24                	cmp    $0x24,%al
 166:	75 04                	jne    16c <matchhere+0x5c>
 168:	84 d2                	test   %dl,%dl
		base.s.size = 0;
 16a:	74 4f                	je     1bb <matchhere+0xab>
 16c:	0f b6 33             	movzbl (%ebx),%esi
		base.s.ptr = freep = prevp = &base;
 16f:	89 f1                	mov    %esi,%ecx
 171:	84 c9                	test   %cl,%cl
 173:	74 d6                	je     14b <matchhere+0x3b>
 175:	89 df                	mov    %ebx,%edi
 177:	3c 2e                	cmp    $0x2e,%al
	for (p = prevp->s.ptr;; prevp = p, p = p->s.ptr) {
 179:	74 04                	je     17f <matchhere+0x6f>
		base.s.size = 0;
 17b:	38 c1                	cmp    %al,%cl
 17d:	75 cc                	jne    14b <matchhere+0x3b>
 17f:	0f be c2             	movsbl %dl,%eax
 182:	8d 5f 01             	lea    0x1(%edi),%ebx
		if (p->s.size >= nunits) {
 185:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 189:	84 c0                	test   %al,%al
 18b:	75 cb                	jne    158 <matchhere+0x48>
 18d:	b8 01 00 00 00       	mov    $0x1,%eax
				prevp->s.ptr = p->s.ptr;
 192:	8d 65 f4             	lea    -0xc(%ebp),%esp
 195:	5b                   	pop    %ebx
	if (re[0] == '$' && re[1] == '\0')
		return *text == '\0';
	if (*text != '\0' && (re[0] == '.' || re[0] == *text))
		return matchhere(re + 1, text + 1);
	return 0;
}
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
	if (re[1] == '*')
 19a:	89 fb                	mov    %edi,%ebx
 19c:	0f be c2             	movsbl %dl,%eax
		return matchstar(re[0], re + 2, text);
 19f:	8b 7d 08             	mov    0x8(%ebp),%edi
 1a2:	83 ec 04             	sub    $0x4,%esp
 1a5:	53                   	push   %ebx
 1a6:	8d 4f 02             	lea    0x2(%edi),%ecx
 1a9:	51                   	push   %ecx
 1aa:	50                   	push   %eax
 1ab:	e8 00 ff ff ff       	call   b0 <matchstar>
 1b0:	83 c4 10             	add    $0x10,%esp
}
 1b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
		return *text == '\0';
 1bf:	31 c0                	xor    %eax,%eax
 1c1:	84 db                	test   %bl,%bl
 1c3:	0f 94 c0             	sete   %al
 1c6:	eb ca                	jmp    192 <matchhere+0x82>
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <match>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	8b 75 08             	mov    0x8(%ebp),%esi
 1d7:	53                   	push   %ebx
 1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	if (re[0] == '^')
 1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1de:	75 11                	jne    1f1 <match+0x21>
 1e0:	eb 2e                	jmp    210 <match+0x40>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	} while (*text++ != '\0');
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1ef:	74 16                	je     207 <match+0x37>
		if (matchhere(re, text))
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	53                   	push   %ebx
 1f5:	56                   	push   %esi
 1f6:	e8 15 ff ff ff       	call   110 <matchhere>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	85 c0                	test   %eax,%eax
 200:	74 e6                	je     1e8 <match+0x18>
			return 1;
 202:	b8 01 00 00 00       	mov    $0x1,%eax
}
 207:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20a:	5b                   	pop    %ebx
 20b:	5e                   	pop    %esi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax
		return matchhere(re + 1, text);
 210:	83 c6 01             	add    $0x1,%esi
 213:	89 75 08             	mov    %esi,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
		return matchhere(re + 1, text);
 21c:	e9 ef fe ff ff       	jmp    110 <matchhere>
 221:	eb 0d                	jmp    230 <grep>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <grep>:
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
 236:	83 ec 1c             	sub    $0x1c,%esp
	m = 0;
 239:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
{
 240:	8b 75 08             	mov    0x8(%ebp),%esi
 243:	90                   	nop
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	while ((n = read(fd, buf + m, sizeof(buf) - m - 1)) > 0) {
 248:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 24b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 250:	83 ec 04             	sub    $0x4,%esp
 253:	29 c8                	sub    %ecx,%eax
 255:	50                   	push   %eax
 256:	8d 81 40 0c 00 00    	lea    0xc40(%ecx),%eax
 25c:	50                   	push   %eax
 25d:	ff 75 0c             	pushl  0xc(%ebp)
 260:	e8 44 03 00 00       	call   5a9 <read>
 265:	83 c4 10             	add    $0x10,%esp
 268:	85 c0                	test   %eax,%eax
 26a:	0f 8e c0 00 00 00    	jle    330 <grep+0x100>
		m += n;
 270:	01 45 e4             	add    %eax,-0x1c(%ebp)
 273:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
		p = buf;
 276:	bb 40 0c 00 00       	mov    $0xc40,%ebx
		buf[m] = '\0';
 27b:	c6 81 40 0c 00 00 00 	movb   $0x0,0xc40(%ecx)
		p = buf;
 282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		while ((q = strchr(p, '\n')) != 0) {
 288:	83 ec 08             	sub    $0x8,%esp
 28b:	6a 0a                	push   $0xa
 28d:	53                   	push   %ebx
 28e:	e8 7d 01 00 00       	call   410 <strchr>
 293:	83 c4 10             	add    $0x10,%esp
 296:	89 c7                	mov    %eax,%edi
 298:	85 c0                	test   %eax,%eax
 29a:	74 44                	je     2e0 <grep+0xb0>
			if (match(pattern, p)) {
 29c:	83 ec 08             	sub    $0x8,%esp
			*q = 0;
 29f:	c6 07 00             	movb   $0x0,(%edi)
			if (match(pattern, p)) {
 2a2:	53                   	push   %ebx
 2a3:	56                   	push   %esi
 2a4:	e8 27 ff ff ff       	call   1d0 <match>
 2a9:	83 c4 10             	add    $0x10,%esp
 2ac:	8d 57 01             	lea    0x1(%edi),%edx
 2af:	85 c0                	test   %eax,%eax
 2b1:	75 0d                	jne    2c0 <grep+0x90>
			p = q + 1;
 2b3:	89 d3                	mov    %edx,%ebx
 2b5:	eb d1                	jmp    288 <grep+0x58>
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				write(1, p, q + 1 - p);
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	83 ec 04             	sub    $0x4,%esp
				*q = '\n';
 2c5:	c6 07 0a             	movb   $0xa,(%edi)
				write(1, p, q + 1 - p);
 2c8:	29 d8                	sub    %ebx,%eax
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)
 2cd:	50                   	push   %eax
 2ce:	53                   	push   %ebx
 2cf:	6a 01                	push   $0x1
 2d1:	e8 db 02 00 00       	call   5b1 <write>
 2d6:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2d9:	83 c4 10             	add    $0x10,%esp
			p = q + 1;
 2dc:	89 d3                	mov    %edx,%ebx
 2de:	eb a8                	jmp    288 <grep+0x58>
		if (p == buf)
 2e0:	81 fb 40 0c 00 00    	cmp    $0xc40,%ebx
 2e6:	74 38                	je     320 <grep+0xf0>
		if (m > 0) {
 2e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 2eb:	85 c9                	test   %ecx,%ecx
 2ed:	0f 8e 55 ff ff ff    	jle    248 <grep+0x18>
			m -= p - buf;
 2f3:	89 d8                	mov    %ebx,%eax
			memmove(buf, p, m);
 2f5:	83 ec 04             	sub    $0x4,%esp
			m -= p - buf;
 2f8:	2d 40 0c 00 00       	sub    $0xc40,%eax
 2fd:	29 c1                	sub    %eax,%ecx
			memmove(buf, p, m);
 2ff:	51                   	push   %ecx
 300:	53                   	push   %ebx
 301:	68 40 0c 00 00       	push   $0xc40
			m -= p - buf;
 306:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
			memmove(buf, p, m);
 309:	e8 52 02 00 00       	call   560 <memmove>
 30e:	83 c4 10             	add    $0x10,%esp
 311:	e9 32 ff ff ff       	jmp    248 <grep+0x18>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			m = 0;
 320:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 327:	e9 1c ff ff ff       	jmp    248 <grep+0x18>
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
 330:	8d 65 f4             	lea    -0xc(%ebp),%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	66 90                	xchg   %ax,%ax
 33a:	66 90                	xchg   %ax,%ax
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

char *strcpy(char *s, char *t)
{
 340:	55                   	push   %ebp
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
 341:	31 d2                	xor    %edx,%edx
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	while ((*s++ = *t++) != 0)
 350:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 354:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 357:	83 c2 01             	add    $0x1,%edx
 35a:	84 c9                	test   %cl,%cl
 35c:	75 f2                	jne    350 <strcpy+0x10>
		;
	return os;
}
 35e:	5b                   	pop    %ebx
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	eb 0d                	jmp    370 <strcmp>
 363:	90                   	nop
 364:	90                   	nop
 365:	90                   	nop
 366:	90                   	nop
 367:	90                   	nop
 368:	90                   	nop
 369:	90                   	nop
 36a:	90                   	nop
 36b:	90                   	nop
 36c:	90                   	nop
 36d:	90                   	nop
 36e:	90                   	nop
 36f:	90                   	nop

00000370 <strcmp>:

int strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 5d 08             	mov    0x8(%ebp),%ebx
 378:	8b 75 0c             	mov    0xc(%ebp),%esi
	while (*p && *p == *q)
 37b:	0f b6 13             	movzbl (%ebx),%edx
 37e:	0f b6 0e             	movzbl (%esi),%ecx
 381:	84 d2                	test   %dl,%dl
 383:	74 1e                	je     3a3 <strcmp+0x33>
 385:	b8 01 00 00 00       	mov    $0x1,%eax
 38a:	38 ca                	cmp    %cl,%dl
 38c:	74 09                	je     397 <strcmp+0x27>
 38e:	eb 20                	jmp    3b0 <strcmp+0x40>
 390:	83 c0 01             	add    $0x1,%eax
 393:	38 ca                	cmp    %cl,%dl
 395:	75 19                	jne    3b0 <strcmp+0x40>
 397:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 39b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 39f:	84 d2                	test   %dl,%dl
 3a1:	75 ed                	jne    390 <strcmp+0x20>
 3a3:	31 c0                	xor    %eax,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
 3a5:	5b                   	pop    %ebx
 3a6:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 3a7:	29 c8                	sub    %ecx,%eax
}
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    
 3ab:	90                   	nop
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	0f b6 c2             	movzbl %dl,%eax
 3b3:	5b                   	pop    %ebx
 3b4:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 3b5:	29 c8                	sub    %ecx,%eax
}
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strlen>:

uint strlen(char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 3c6:	80 39 00             	cmpb   $0x0,(%ecx)
 3c9:	74 15                	je     3e0 <strlen+0x20>
 3cb:	31 d2                	xor    %edx,%edx
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3d7:	89 d0                	mov    %edx,%eax
 3d9:	75 f5                	jne    3d0 <strlen+0x10>
		;
	return n;
}
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
	for (n = 0; s[n]; n++)
 3e0:	31 c0                	xor    %eax,%eax
}
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    
 3e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003f0 <memset>:

void *memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld    
 400:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 402:	89 d0                	mov    %edx,%eax
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <strchr>:

char *strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 45 08             	mov    0x8(%ebp),%eax
 417:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 41a:	0f b6 18             	movzbl (%eax),%ebx
 41d:	84 db                	test   %bl,%bl
 41f:	74 1d                	je     43e <strchr+0x2e>
 421:	89 d1                	mov    %edx,%ecx
		if (*s == c)
 423:	38 d3                	cmp    %dl,%bl
 425:	75 0d                	jne    434 <strchr+0x24>
 427:	eb 17                	jmp    440 <strchr+0x30>
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 430:	38 ca                	cmp    %cl,%dl
 432:	74 0c                	je     440 <strchr+0x30>
	for (; *s; s++)
 434:	83 c0 01             	add    $0x1,%eax
 437:	0f b6 10             	movzbl (%eax),%edx
 43a:	84 d2                	test   %dl,%dl
 43c:	75 f2                	jne    430 <strchr+0x20>
			return (char *)s;
	return 0;
 43e:	31 c0                	xor    %eax,%eax
}
 440:	5b                   	pop    %ebx
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    
 443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <gets>:

char *gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 455:	31 f6                	xor    %esi,%esi
{
 457:	53                   	push   %ebx
 458:	89 f3                	mov    %esi,%ebx
 45a:	83 ec 1c             	sub    $0x1c,%esp
 45d:	8b 7d 08             	mov    0x8(%ebp),%edi
	for (i = 0; i + 1 < max;) {
 460:	eb 2f                	jmp    491 <gets+0x41>
 462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		cc = read(0, &c, 1);
 468:	83 ec 04             	sub    $0x4,%esp
 46b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 46e:	6a 01                	push   $0x1
 470:	50                   	push   %eax
 471:	6a 00                	push   $0x0
 473:	e8 31 01 00 00       	call   5a9 <read>
		if (cc < 1)
 478:	83 c4 10             	add    $0x10,%esp
 47b:	85 c0                	test   %eax,%eax
 47d:	7e 1c                	jle    49b <gets+0x4b>
			break;
		buf[i++] = c;
 47f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 483:	83 c7 01             	add    $0x1,%edi
 486:	88 47 ff             	mov    %al,-0x1(%edi)
		if (c == '\n' || c == '\r')
 489:	3c 0a                	cmp    $0xa,%al
 48b:	74 23                	je     4b0 <gets+0x60>
 48d:	3c 0d                	cmp    $0xd,%al
 48f:	74 1f                	je     4b0 <gets+0x60>
	for (i = 0; i + 1 < max;) {
 491:	83 c3 01             	add    $0x1,%ebx
 494:	89 fe                	mov    %edi,%esi
 496:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 499:	7c cd                	jl     468 <gets+0x18>
 49b:	89 f3                	mov    %esi,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
	buf[i] = '\0';
 4a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret    
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b0:	8b 75 08             	mov    0x8(%ebp),%esi
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	01 de                	add    %ebx,%esi
 4b8:	89 f3                	mov    %esi,%ebx
	buf[i] = '\0';
 4ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c0:	5b                   	pop    %ebx
 4c1:	5e                   	pop    %esi
 4c2:	5f                   	pop    %edi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    
 4c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <stat>:

int stat(char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	pushl  0x8(%ebp)
 4dd:	e8 ef 00 00 00       	call   5d1 <open>
	if (fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
		return -1;
	r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	pushl  0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 f2 00 00 00       	call   5e9 <fstat>
	close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
	r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
	close(fd);
 4fc:	e8 b8 00 00 00       	call   5b9 <close>
	return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000520 <atoi>:

int atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 527:	0f be 11             	movsbl (%ecx),%edx
 52a:	8d 42 d0             	lea    -0x30(%edx),%eax
 52d:	3c 09                	cmp    $0x9,%al
	n = 0;
 52f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9')
 534:	77 1f                	ja     555 <atoi+0x35>
 536:	8d 76 00             	lea    0x0(%esi),%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
 540:	83 c1 01             	add    $0x1,%ecx
 543:	8d 04 80             	lea    (%eax,%eax,4),%eax
 546:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	while ('0' <= *s && *s <= '9')
 54a:	0f be 11             	movsbl (%ecx),%edx
 54d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
	return n;
}
 555:	5b                   	pop    %ebx
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    
 558:	90                   	nop
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000560 <memmove>:

void *memmove(void *vdst, void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 55 10             	mov    0x10(%ebp),%edx
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 56e:	85 d2                	test   %edx,%edx
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 c2                	add    %eax,%edx
	dst = vdst;
 574:	89 c7                	mov    %eax,%edi
 576:	8d 76 00             	lea    0x0(%esi),%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		*dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
	while (n-- > 0)
 581:	39 fa                	cmp    %edi,%edx
 583:	75 fb                	jne    580 <memmove+0x20>
	return vdst;
}
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    

00000589 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 589:	b8 01 00 00 00       	mov    $0x1,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <exit>:
SYSCALL(exit)
 591:	b8 02 00 00 00       	mov    $0x2,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <wait>:
SYSCALL(wait)
 599:	b8 03 00 00 00       	mov    $0x3,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <pipe>:
SYSCALL(pipe)
 5a1:	b8 04 00 00 00       	mov    $0x4,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <read>:
SYSCALL(read)
 5a9:	b8 05 00 00 00       	mov    $0x5,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <write>:
SYSCALL(write)
 5b1:	b8 10 00 00 00       	mov    $0x10,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <close>:
SYSCALL(close)
 5b9:	b8 15 00 00 00       	mov    $0x15,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <kill>:
SYSCALL(kill)
 5c1:	b8 06 00 00 00       	mov    $0x6,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <exec>:
SYSCALL(exec)
 5c9:	b8 07 00 00 00       	mov    $0x7,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <open>:
SYSCALL(open)
 5d1:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <mknod>:
SYSCALL(mknod)
 5d9:	b8 11 00 00 00       	mov    $0x11,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <unlink>:
SYSCALL(unlink)
 5e1:	b8 12 00 00 00       	mov    $0x12,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <fstat>:
SYSCALL(fstat)
 5e9:	b8 08 00 00 00       	mov    $0x8,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <link>:
SYSCALL(link)
 5f1:	b8 13 00 00 00       	mov    $0x13,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <mkdir>:
SYSCALL(mkdir)
 5f9:	b8 14 00 00 00       	mov    $0x14,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <chdir>:
SYSCALL(chdir)
 601:	b8 09 00 00 00       	mov    $0x9,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <dup>:
SYSCALL(dup)
 609:	b8 0a 00 00 00       	mov    $0xa,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <getpid>:
SYSCALL(getpid)
 611:	b8 0b 00 00 00       	mov    $0xb,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <sbrk>:
SYSCALL(sbrk)
 619:	b8 0c 00 00 00       	mov    $0xc,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <sleep>:
SYSCALL(sleep)
 621:	b8 0d 00 00 00       	mov    $0xd,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <uptime>:
SYSCALL(uptime)
 629:	b8 0e 00 00 00       	mov    $0xe,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    
 631:	66 90                	xchg   %ax,%ax
 633:	66 90                	xchg   %ax,%ax
 635:	66 90                	xchg   %ax,%ax
 637:	66 90                	xchg   %ax,%ax
 639:	66 90                	xchg   %ax,%ax
 63b:	66 90                	xchg   %ax,%ax
 63d:	66 90                	xchg   %ax,%ax
 63f:	90                   	nop

00000640 <printint>:
{
	write(fd, &c, 1);
}

static void printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
	uint x;

	neg = 0;
	if (sgn && xx < 0) {
		neg = 1;
		x = -xx;
 646:	89 d3                	mov    %edx,%ebx
{
 648:	83 ec 3c             	sub    $0x3c,%esp
 64b:	89 45 bc             	mov    %eax,-0x44(%ebp)
	if (sgn && xx < 0) {
 64e:	85 d2                	test   %edx,%edx
 650:	0f 89 92 00 00 00    	jns    6e8 <printint+0xa8>
 656:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 65a:	0f 84 88 00 00 00    	je     6e8 <printint+0xa8>
		neg = 1;
 660:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
		x = -xx;
 667:	f7 db                	neg    %ebx
	} else {
		x = xx;
	}

	i = 0;
 669:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 670:	8d 75 d7             	lea    -0x29(%ebp),%esi
 673:	eb 08                	jmp    67d <printint+0x3d>
 675:	8d 76 00             	lea    0x0(%esi),%esi
	do {
		buf[i++] = digits[x % base];
 678:	89 7d c4             	mov    %edi,-0x3c(%ebp)
	} while ((x /= base) != 0);
 67b:	89 c3                	mov    %eax,%ebx
		buf[i++] = digits[x % base];
 67d:	89 d8                	mov    %ebx,%eax
 67f:	31 d2                	xor    %edx,%edx
 681:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 684:	f7 f1                	div    %ecx
 686:	83 c7 01             	add    $0x1,%edi
 689:	0f b6 92 08 09 00 00 	movzbl 0x908(%edx),%edx
 690:	88 14 3e             	mov    %dl,(%esi,%edi,1)
	} while ((x /= base) != 0);
 693:	39 d9                	cmp    %ebx,%ecx
 695:	76 e1                	jbe    678 <printint+0x38>
	if (neg)
 697:	8b 45 c0             	mov    -0x40(%ebp),%eax
 69a:	85 c0                	test   %eax,%eax
 69c:	74 0d                	je     6ab <printint+0x6b>
		buf[i++] = '-';
 69e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6a3:	ba 2d 00 00 00       	mov    $0x2d,%edx
		buf[i++] = digits[x % base];
 6a8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 6ab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6ae:	8b 7d bc             	mov    -0x44(%ebp),%edi
 6b1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6b5:	eb 0f                	jmp    6c6 <printint+0x86>
 6b7:	89 f6                	mov    %esi,%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6c0:	0f b6 13             	movzbl (%ebx),%edx
 6c3:	83 eb 01             	sub    $0x1,%ebx
	write(fd, &c, 1);
 6c6:	83 ec 04             	sub    $0x4,%esp
 6c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6cc:	6a 01                	push   $0x1
 6ce:	56                   	push   %esi
 6cf:	57                   	push   %edi
 6d0:	e8 dc fe ff ff       	call   5b1 <write>

	while (--i >= 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	39 de                	cmp    %ebx,%esi
 6da:	75 e4                	jne    6c0 <printint+0x80>
		putc(fd, buf[i]);
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	neg = 0;
 6e8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 6ef:	e9 75 ff ff ff       	jmp    669 <printint+0x29>
 6f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void printf(int fd, char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint *)(void *)&fmt + 1;
	for (i = 0; fmt[i]; i++) {
 709:	8b 75 0c             	mov    0xc(%ebp),%esi
 70c:	0f b6 1e             	movzbl (%esi),%ebx
 70f:	84 db                	test   %bl,%bl
 711:	0f 84 b9 00 00 00    	je     7d0 <printf+0xd0>
	ap = (uint *)(void *)&fmt + 1;
 717:	8d 45 10             	lea    0x10(%ebp),%eax
 71a:	83 c6 01             	add    $0x1,%esi
	write(fd, &c, 1);
 71d:	8d 7d e7             	lea    -0x19(%ebp),%edi
	state = 0;
 720:	31 d2                	xor    %edx,%edx
	ap = (uint *)(void *)&fmt + 1;
 722:	89 45 d0             	mov    %eax,-0x30(%ebp)
 725:	eb 38                	jmp    75f <printf+0x5f>
 727:	89 f6                	mov    %esi,%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 730:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		c = fmt[i] & 0xff;
		if (state == 0) {
			if (c == '%') {
				state = '%';
 733:	ba 25 00 00 00       	mov    $0x25,%edx
			if (c == '%') {
 738:	83 f8 25             	cmp    $0x25,%eax
 73b:	74 17                	je     754 <printf+0x54>
	write(fd, &c, 1);
 73d:	83 ec 04             	sub    $0x4,%esp
 740:	88 5d e7             	mov    %bl,-0x19(%ebp)
 743:	6a 01                	push   $0x1
 745:	57                   	push   %edi
 746:	ff 75 08             	pushl  0x8(%ebp)
 749:	e8 63 fe ff ff       	call   5b1 <write>
 74e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
			} else {
				putc(fd, c);
 751:	83 c4 10             	add    $0x10,%esp
 754:	83 c6 01             	add    $0x1,%esi
	for (i = 0; fmt[i]; i++) {
 757:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 75b:	84 db                	test   %bl,%bl
 75d:	74 71                	je     7d0 <printf+0xd0>
		c = fmt[i] & 0xff;
 75f:	0f be cb             	movsbl %bl,%ecx
 762:	0f b6 c3             	movzbl %bl,%eax
		if (state == 0) {
 765:	85 d2                	test   %edx,%edx
 767:	74 c7                	je     730 <printf+0x30>
			}
		} else if (state == '%') {
 769:	83 fa 25             	cmp    $0x25,%edx
 76c:	75 e6                	jne    754 <printf+0x54>
			if (c == 'd') {
 76e:	83 f8 64             	cmp    $0x64,%eax
 771:	0f 84 99 00 00 00    	je     810 <printf+0x110>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if (c == 'x' || c == 'p') {
 777:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 77d:	83 f9 70             	cmp    $0x70,%ecx
 780:	74 5e                	je     7e0 <printf+0xe0>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if (c == 's') {
 782:	83 f8 73             	cmp    $0x73,%eax
 785:	0f 84 d5 00 00 00    	je     860 <printf+0x160>
					s = "(null)";
				while (*s != 0) {
					putc(fd, *s);
					s++;
				}
			} else if (c == 'c') {
 78b:	83 f8 63             	cmp    $0x63,%eax
 78e:	0f 84 8c 00 00 00    	je     820 <printf+0x120>
				putc(fd, *ap);
				ap++;
			} else if (c == '%') {
 794:	83 f8 25             	cmp    $0x25,%eax
 797:	0f 84 b3 00 00 00    	je     850 <printf+0x150>
	write(fd, &c, 1);
 79d:	83 ec 04             	sub    $0x4,%esp
 7a0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7a4:	6a 01                	push   $0x1
 7a6:	57                   	push   %edi
 7a7:	ff 75 08             	pushl  0x8(%ebp)
 7aa:	e8 02 fe ff ff       	call   5b1 <write>
				putc(fd, c);
			} else {
				// Unknown % sequence.  Print it to draw
				// attention.
				putc(fd, '%');
				putc(fd, c);
 7af:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 7b2:	83 c4 0c             	add    $0xc,%esp
 7b5:	6a 01                	push   $0x1
 7b7:	83 c6 01             	add    $0x1,%esi
 7ba:	57                   	push   %edi
 7bb:	ff 75 08             	pushl  0x8(%ebp)
 7be:	e8 ee fd ff ff       	call   5b1 <write>
	for (i = 0; fmt[i]; i++) {
 7c3:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
				putc(fd, c);
 7c7:	83 c4 10             	add    $0x10,%esp
			}
			state = 0;
 7ca:	31 d2                	xor    %edx,%edx
	for (i = 0; fmt[i]; i++) {
 7cc:	84 db                	test   %bl,%bl
 7ce:	75 8f                	jne    75f <printf+0x5f>
		}
	}
}
 7d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d3:	5b                   	pop    %ebx
 7d4:	5e                   	pop    %esi
 7d5:	5f                   	pop    %edi
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
 7d8:	90                   	nop
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 16, 0);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e8:	6a 00                	push   $0x0
 7ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
 7f0:	8b 13                	mov    (%ebx),%edx
 7f2:	e8 49 fe ff ff       	call   640 <printint>
				ap++;
 7f7:	89 d8                	mov    %ebx,%eax
 7f9:	83 c4 10             	add    $0x10,%esp
			state = 0;
 7fc:	31 d2                	xor    %edx,%edx
				ap++;
 7fe:	83 c0 04             	add    $0x4,%eax
 801:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804:	e9 4b ff ff ff       	jmp    754 <printf+0x54>
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				printint(fd, *ap, 10, 1);
 810:	83 ec 0c             	sub    $0xc,%esp
 813:	b9 0a 00 00 00       	mov    $0xa,%ecx
 818:	6a 01                	push   $0x1
 81a:	eb ce                	jmp    7ea <printf+0xea>
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				putc(fd, *ap);
 820:	8b 5d d0             	mov    -0x30(%ebp),%ebx
	write(fd, &c, 1);
 823:	83 ec 04             	sub    $0x4,%esp
				putc(fd, *ap);
 826:	8b 03                	mov    (%ebx),%eax
	write(fd, &c, 1);
 828:	6a 01                	push   $0x1
				ap++;
 82a:	83 c3 04             	add    $0x4,%ebx
	write(fd, &c, 1);
 82d:	57                   	push   %edi
 82e:	ff 75 08             	pushl  0x8(%ebp)
				putc(fd, *ap);
 831:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 834:	e8 78 fd ff ff       	call   5b1 <write>
				ap++;
 839:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 83c:	83 c4 10             	add    $0x10,%esp
			state = 0;
 83f:	31 d2                	xor    %edx,%edx
 841:	e9 0e ff ff ff       	jmp    754 <printf+0x54>
 846:	8d 76 00             	lea    0x0(%esi),%esi
 849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
				putc(fd, c);
 850:	88 5d e7             	mov    %bl,-0x19(%ebp)
	write(fd, &c, 1);
 853:	83 ec 04             	sub    $0x4,%esp
 856:	e9 5a ff ff ff       	jmp    7b5 <printf+0xb5>
 85b:	90                   	nop
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				s = (char *)*ap;
 860:	8b 45 d0             	mov    -0x30(%ebp),%eax
 863:	8b 18                	mov    (%eax),%ebx
				ap++;
 865:	83 c0 04             	add    $0x4,%eax
 868:	89 45 d0             	mov    %eax,-0x30(%ebp)
				if (s == 0)
 86b:	85 db                	test   %ebx,%ebx
 86d:	74 17                	je     886 <printf+0x186>
				while (*s != 0) {
 86f:	0f b6 03             	movzbl (%ebx),%eax
			state = 0;
 872:	31 d2                	xor    %edx,%edx
				while (*s != 0) {
 874:	84 c0                	test   %al,%al
 876:	0f 84 d8 fe ff ff    	je     754 <printf+0x54>
 87c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 87f:	89 de                	mov    %ebx,%esi
 881:	8b 5d 08             	mov    0x8(%ebp),%ebx
 884:	eb 1a                	jmp    8a0 <printf+0x1a0>
					s = "(null)";
 886:	bb fe 08 00 00       	mov    $0x8fe,%ebx
				while (*s != 0) {
 88b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 88e:	b8 28 00 00 00       	mov    $0x28,%eax
 893:	89 de                	mov    %ebx,%esi
 895:	8b 5d 08             	mov    0x8(%ebp),%ebx
 898:	90                   	nop
 899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	write(fd, &c, 1);
 8a0:	83 ec 04             	sub    $0x4,%esp
					s++;
 8a3:	83 c6 01             	add    $0x1,%esi
 8a6:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(fd, &c, 1);
 8a9:	6a 01                	push   $0x1
 8ab:	57                   	push   %edi
 8ac:	53                   	push   %ebx
 8ad:	e8 ff fc ff ff       	call   5b1 <write>
				while (*s != 0) {
 8b2:	0f b6 06             	movzbl (%esi),%eax
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	84 c0                	test   %al,%al
 8ba:	75 e4                	jne    8a0 <printf+0x1a0>
 8bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
			state = 0;
 8bf:	31 d2                	xor    %edx,%edx
 8c1:	e9 8e fe ff ff       	jmp    754 <printf+0x54>
