
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
{
	write(1, &c, 1);
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
  11:	83 ec 30             	sub    $0x30,%esp
  14:	8b 71 04             	mov    0x4(%ecx),%esi
  17:	8b 39                	mov    (%ecx),%edi
	int i, j, nflag = 0;
	unsigned int x;

	if (!strcmp(argv[1], "-n")) {
  19:	68 91 04 00 00       	push   $0x491
  1e:	ff 76 04             	pushl  0x4(%esi)
{
  21:	89 7d d0             	mov    %edi,-0x30(%ebp)
	if (!strcmp(argv[1], "-n")) {
  24:	e8 a7 01 00 00       	call   1d0 <strcmp>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	85 c0                	test   %eax,%eax
  2e:	0f 84 46 01 00 00    	je     17a <main+0x17a>
		nflag = 1;
		argv++;
		argc--;
	}
	for (i = 1; i < argc; i++) {
  34:	83 ef 01             	sub    $0x1,%edi
	int i, j, nflag = 0;
  37:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
	for (i = 1; i < argc; i++) {
  3e:	0f 8e 1c 01 00 00    	jle    160 <main+0x160>
		nflag = 1;
  44:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  4b:	83 c6 04             	add    $0x4,%esi
  4e:	66 90                	xchg   %ax,%ax
		for (j = 0; argv[i][j]; j++) {
  50:	8b 06                	mov    (%esi),%eax
  52:	31 db                	xor    %ebx,%ebx
  54:	31 ff                	xor    %edi,%edi
  56:	0f b6 10             	movzbl (%eax),%edx
  59:	84 d2                	test   %dl,%dl
  5b:	75 36                	jne    93 <main+0x93>
  5d:	eb 49                	jmp    a8 <main+0xa8>
  5f:	90                   	nop
			if (argv[i][j] == '\\') {
				j++;
				if (argv[i][j] == 'x') {
  60:	0f b6 54 18 01       	movzbl 0x1(%eax,%ebx,1),%edx
  65:	80 fa 78             	cmp    $0x78,%dl
  68:	0f 84 82 00 00 00    	je     f0 <main+0xf0>
  6e:	83 c3 02             	add    $0x2,%ebx
  71:	89 df                	mov    %ebx,%edi
	write(1, &c, 1);
  73:	83 ec 04             	sub    $0x4,%esp
  76:	8d 45 e7             	lea    -0x19(%ebp),%eax
  79:	88 55 e7             	mov    %dl,-0x19(%ebp)
  7c:	6a 01                	push   $0x1
  7e:	50                   	push   %eax
  7f:	6a 01                	push   $0x1
  81:	e8 8b 03 00 00       	call   411 <write>
					putchar(x);
					j++;
					continue;
				}
			}
			putchar(argv[i][j]);
  86:	83 c4 10             	add    $0x10,%esp
		for (j = 0; argv[i][j]; j++) {
  89:	8b 06                	mov    (%esi),%eax
  8b:	0f b6 14 38          	movzbl (%eax,%edi,1),%edx
  8f:	84 d2                	test   %dl,%dl
  91:	74 15                	je     a8 <main+0xa8>
			if (argv[i][j] == '\\') {
  93:	8d 4b 01             	lea    0x1(%ebx),%ecx
  96:	80 fa 5c             	cmp    $0x5c,%dl
  99:	74 c5                	je     60 <main+0x60>
  9b:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
  9f:	89 cf                	mov    %ecx,%edi
  a1:	89 cb                	mov    %ecx,%ebx
  a3:	eb ce                	jmp    73 <main+0x73>
  a5:	8d 76 00             	lea    0x0(%esi),%esi
		}
		if (i + 1 != argc) {
  a8:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  ac:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  af:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  b2:	39 df                	cmp    %ebx,%edi
  b4:	74 2a                	je     e0 <main+0xe0>
	write(1, &c, 1);
  b6:	83 ec 04             	sub    $0x4,%esp
  b9:	8d 45 e7             	lea    -0x19(%ebp),%eax
  bc:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
  c0:	83 c6 04             	add    $0x4,%esi
  c3:	6a 01                	push   $0x1
  c5:	50                   	push   %eax
  c6:	6a 01                	push   $0x1
  c8:	e8 44 03 00 00       	call   411 <write>
	for (i = 1; i < argc; i++) {
  cd:	83 c4 10             	add    $0x10,%esp
  d0:	39 df                	cmp    %ebx,%edi
  d2:	0f 8c 78 ff ff ff    	jl     50 <main+0x50>
  d8:	90                   	nop
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			putchar(' ');
		}
	}
	if (!nflag) {
  e0:	8b 45 cc             	mov    -0x34(%ebp),%eax
  e3:	85 c0                	test   %eax,%eax
  e5:	74 79                	je     160 <main+0x160>
		putchar('\n');
	}
	exit();
  e7:	e8 05 03 00 00       	call   3f1 <exit>
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
					x = HEXDIGIT(argv[i][j]) * 0x10
  f0:	0f be 54 18 02       	movsbl 0x2(%eax,%ebx,1),%edx
  f5:	80 fa 39             	cmp    $0x39,%dl
  f8:	7f 36                	jg     130 <main+0x130>
  fa:	83 ea 30             	sub    $0x30,%edx
  fd:	c1 e2 04             	shl    $0x4,%edx
					    + HEXDIGIT(argv[i][j + 1]);
 100:	0f be 44 38 03       	movsbl 0x3(%eax,%edi,1),%eax
 105:	89 c1                	mov    %eax,%ecx
 107:	3c 39                	cmp    $0x39,%al
 109:	7f 3b                	jg     146 <main+0x146>
 10b:	83 e8 30             	sub    $0x30,%eax
 10e:	01 d0                	add    %edx,%eax
	write(1, &c, 1);
 110:	83 ec 04             	sub    $0x4,%esp
 113:	83 c3 04             	add    $0x4,%ebx
					putchar(x);
 116:	88 45 e7             	mov    %al,-0x19(%ebp)
	write(1, &c, 1);
 119:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11c:	89 df                	mov    %ebx,%edi
 11e:	6a 01                	push   $0x1
 120:	50                   	push   %eax
 121:	6a 01                	push   $0x1
 123:	e8 e9 02 00 00       	call   411 <write>
					continue;
 128:	83 c4 10             	add    $0x10,%esp
 12b:	e9 59 ff ff ff       	jmp    89 <main+0x89>
					x = HEXDIGIT(argv[i][j]) * 0x10
 130:	80 fa 5a             	cmp    $0x5a,%dl
 133:	7f 23                	jg     158 <main+0x158>
					    + HEXDIGIT(argv[i][j + 1]);
 135:	0f be 44 38 03       	movsbl 0x3(%eax,%edi,1),%eax
					x = HEXDIGIT(argv[i][j]) * 0x10
 13a:	83 ea 37             	sub    $0x37,%edx
 13d:	c1 e2 04             	shl    $0x4,%edx
					    + HEXDIGIT(argv[i][j + 1]);
 140:	89 c1                	mov    %eax,%ecx
 142:	3c 39                	cmp    $0x39,%al
 144:	7e c5                	jle    10b <main+0x10b>
 146:	8d 78 c9             	lea    -0x37(%eax),%edi
 149:	83 e8 57             	sub    $0x57,%eax
 14c:	80 f9 5a             	cmp    $0x5a,%cl
 14f:	0f 4e c7             	cmovle %edi,%eax
 152:	eb ba                	jmp    10e <main+0x10e>
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
					x = HEXDIGIT(argv[i][j]) * 0x10
 158:	83 ea 57             	sub    $0x57,%edx
 15b:	c1 e2 04             	shl    $0x4,%edx
 15e:	eb a0                	jmp    100 <main+0x100>
	write(1, &c, 1);
 160:	8d 45 e7             	lea    -0x19(%ebp),%eax
 163:	52                   	push   %edx
 164:	6a 01                	push   $0x1
 166:	50                   	push   %eax
 167:	6a 01                	push   $0x1
 169:	c6 45 e7 0a          	movb   $0xa,-0x19(%ebp)
 16d:	e8 9f 02 00 00       	call   411 <write>
		putchar('\n');
 172:	83 c4 10             	add    $0x10,%esp
 175:	e9 6d ff ff ff       	jmp    e7 <main+0xe7>
		argc--;
 17a:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
 17e:	8b 45 d0             	mov    -0x30(%ebp),%eax
		argv++;
 181:	83 c6 04             	add    $0x4,%esi
		nflag = 1;
 184:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
	for (i = 1; i < argc; i++) {
 18b:	83 e8 01             	sub    $0x1,%eax
 18e:	0f 8f b0 fe ff ff    	jg     44 <main+0x44>
 194:	e9 4e ff ff ff       	jmp    e7 <main+0xe7>
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 199:	66 90                	xchg   %ax,%ax
 19b:	66 90                	xchg   %ax,%ax
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <strcpy>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"

char *strcpy(char *s, char *t)
{
 1a0:	55                   	push   %ebp
	char *os;

	os = s;
	while ((*s++ = *t++) != 0)
 1a1:	31 d2                	xor    %edx,%edx
{
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	53                   	push   %ebx
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	while ((*s++ = *t++) != 0)
 1b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1b7:	83 c2 01             	add    $0x1,%edx
 1ba:	84 c9                	test   %cl,%cl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
		;
	return os;
}
 1be:	5b                   	pop    %ebx
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <strcmp>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1d8:	8b 75 0c             	mov    0xc(%ebp),%esi
	while (*p && *p == *q)
 1db:	0f b6 13             	movzbl (%ebx),%edx
 1de:	0f b6 0e             	movzbl (%esi),%ecx
 1e1:	84 d2                	test   %dl,%dl
 1e3:	74 1e                	je     203 <strcmp+0x33>
 1e5:	b8 01 00 00 00       	mov    $0x1,%eax
 1ea:	38 ca                	cmp    %cl,%dl
 1ec:	74 09                	je     1f7 <strcmp+0x27>
 1ee:	eb 20                	jmp    210 <strcmp+0x40>
 1f0:	83 c0 01             	add    $0x1,%eax
 1f3:	38 ca                	cmp    %cl,%dl
 1f5:	75 19                	jne    210 <strcmp+0x40>
 1f7:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1fb:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 1ff:	84 d2                	test   %dl,%dl
 201:	75 ed                	jne    1f0 <strcmp+0x20>
 203:	31 c0                	xor    %eax,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
 205:	5b                   	pop    %ebx
 206:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 207:	29 c8                	sub    %ecx,%eax
}
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	0f b6 c2             	movzbl %dl,%eax
 213:	5b                   	pop    %ebx
 214:	5e                   	pop    %esi
	return (uchar)*p - (uchar)*q;
 215:	29 c8                	sub    %ecx,%eax
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strlen>:

uint strlen(char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	for (n = 0; s[n]; n++)
 226:	80 39 00             	cmpb   $0x0,(%ecx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 d2                	xor    %edx,%edx
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
		;
	return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
	for (n = 0; s[n]; n++)
 240:	31 c0                	xor    %eax,%eax
}
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 24a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000250 <memset>:

void *memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
	stosb(dst, c, n);
	return dst;
}
 262:	89 d0                	mov    %edx,%eax
 264:	5f                   	pop    %edi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strchr>:

char *strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
	for (; *s; s++)
 27a:	0f b6 18             	movzbl (%eax),%ebx
 27d:	84 db                	test   %bl,%bl
 27f:	74 1d                	je     29e <strchr+0x2e>
 281:	89 d1                	mov    %edx,%ecx
		if (*s == c)
 283:	38 d3                	cmp    %dl,%bl
 285:	75 0d                	jne    294 <strchr+0x24>
 287:	eb 17                	jmp    2a0 <strchr+0x30>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 290:	38 ca                	cmp    %cl,%dl
 292:	74 0c                	je     2a0 <strchr+0x30>
	for (; *s; s++)
 294:	83 c0 01             	add    $0x1,%eax
 297:	0f b6 10             	movzbl (%eax),%edx
 29a:	84 d2                	test   %dl,%dl
 29c:	75 f2                	jne    290 <strchr+0x20>
			return (char *)s;
	return 0;
 29e:	31 c0                	xor    %eax,%eax
}
 2a0:	5b                   	pop    %ebx
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
 2a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <gets>:

char *gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
	int i, cc;
	char c;

	for (i = 0; i + 1 < max;) {
 2b5:	31 f6                	xor    %esi,%esi
{
 2b7:	53                   	push   %ebx
 2b8:	89 f3                	mov    %esi,%ebx
 2ba:	83 ec 1c             	sub    $0x1c,%esp
 2bd:	8b 7d 08             	mov    0x8(%ebp),%edi
	for (i = 0; i + 1 < max;) {
 2c0:	eb 2f                	jmp    2f1 <gets+0x41>
 2c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		cc = read(0, &c, 1);
 2c8:	83 ec 04             	sub    $0x4,%esp
 2cb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ce:	6a 01                	push   $0x1
 2d0:	50                   	push   %eax
 2d1:	6a 00                	push   $0x0
 2d3:	e8 31 01 00 00       	call   409 <read>
		if (cc < 1)
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 1c                	jle    2fb <gets+0x4b>
			break;
		buf[i++] = c;
 2df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e3:	83 c7 01             	add    $0x1,%edi
 2e6:	88 47 ff             	mov    %al,-0x1(%edi)
		if (c == '\n' || c == '\r')
 2e9:	3c 0a                	cmp    $0xa,%al
 2eb:	74 23                	je     310 <gets+0x60>
 2ed:	3c 0d                	cmp    $0xd,%al
 2ef:	74 1f                	je     310 <gets+0x60>
	for (i = 0; i + 1 < max;) {
 2f1:	83 c3 01             	add    $0x1,%ebx
 2f4:	89 fe                	mov    %edi,%esi
 2f6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2f9:	7c cd                	jl     2c8 <gets+0x18>
 2fb:	89 f3                	mov    %esi,%ebx
			break;
	}
	buf[i] = '\0';
	return buf;
}
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
	buf[i] = '\0';
 300:	c6 03 00             	movb   $0x0,(%ebx)
}
 303:	8d 65 f4             	lea    -0xc(%ebp),%esp
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 310:	8b 75 08             	mov    0x8(%ebp),%esi
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	01 de                	add    %ebx,%esi
 318:	89 f3                	mov    %esi,%ebx
	buf[i] = '\0';
 31a:	c6 03 00             	movb   $0x0,(%ebx)
}
 31d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 320:	5b                   	pop    %ebx
 321:	5e                   	pop    %esi
 322:	5f                   	pop    %edi
 323:	5d                   	pop    %ebp
 324:	c3                   	ret    
 325:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <stat>:

int stat(char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
	int fd;
	int r;

	fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	pushl  0x8(%ebp)
 33d:	e8 ef 00 00 00       	call   431 <open>
	if (fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
		return -1;
	r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	pushl  0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 f2 00 00 00       	call   449 <fstat>
	close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
	r = fstat(fd, st);
 35a:	89 c6                	mov    %eax,%esi
	close(fd);
 35c:	e8 b8 00 00 00       	call   419 <close>
	return r;
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <atoi>:

int atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int n;

	n = 0;
	while ('0' <= *s && *s <= '9')
 387:	0f be 11             	movsbl (%ecx),%edx
 38a:	8d 42 d0             	lea    -0x30(%edx),%eax
 38d:	3c 09                	cmp    $0x9,%al
	n = 0;
 38f:	b8 00 00 00 00       	mov    $0x0,%eax
	while ('0' <= *s && *s <= '9')
 394:	77 1f                	ja     3b5 <atoi+0x35>
 396:	8d 76 00             	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		n = n * 10 + *s++ - '0';
 3a0:	83 c1 01             	add    $0x1,%ecx
 3a3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
	while ('0' <= *s && *s <= '9')
 3aa:	0f be 11             	movsbl (%ecx),%edx
 3ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
	return n;
}
 3b5:	5b                   	pop    %ebx
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
 3b8:	90                   	nop
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void *memmove(void *vdst, void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 55 10             	mov    0x10(%ebp),%edx
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	56                   	push   %esi
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
	char *dst, *src;

	dst = vdst;
	src = vsrc;
	while (n-- > 0)
 3ce:	85 d2                	test   %edx,%edx
 3d0:	7e 13                	jle    3e5 <memmove+0x25>
 3d2:	01 c2                	add    %eax,%edx
	dst = vdst;
 3d4:	89 c7                	mov    %eax,%edi
 3d6:	8d 76 00             	lea    0x0(%esi),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		*dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
	while (n-- > 0)
 3e1:	39 fa                	cmp    %edi,%edx
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
	return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	5f                   	pop    %edi
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e9:	b8 01 00 00 00       	mov    $0x1,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <exit>:
SYSCALL(exit)
 3f1:	b8 02 00 00 00       	mov    $0x2,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <wait>:
SYSCALL(wait)
 3f9:	b8 03 00 00 00       	mov    $0x3,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <pipe>:
SYSCALL(pipe)
 401:	b8 04 00 00 00       	mov    $0x4,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <read>:
SYSCALL(read)
 409:	b8 05 00 00 00       	mov    $0x5,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <write>:
SYSCALL(write)
 411:	b8 10 00 00 00       	mov    $0x10,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <close>:
SYSCALL(close)
 419:	b8 15 00 00 00       	mov    $0x15,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <kill>:
SYSCALL(kill)
 421:	b8 06 00 00 00       	mov    $0x6,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <exec>:
SYSCALL(exec)
 429:	b8 07 00 00 00       	mov    $0x7,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <open>:
SYSCALL(open)
 431:	b8 0f 00 00 00       	mov    $0xf,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <mknod>:
SYSCALL(mknod)
 439:	b8 11 00 00 00       	mov    $0x11,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <unlink>:
SYSCALL(unlink)
 441:	b8 12 00 00 00       	mov    $0x12,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <fstat>:
SYSCALL(fstat)
 449:	b8 08 00 00 00       	mov    $0x8,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <link>:
SYSCALL(link)
 451:	b8 13 00 00 00       	mov    $0x13,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <mkdir>:
SYSCALL(mkdir)
 459:	b8 14 00 00 00       	mov    $0x14,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <chdir>:
SYSCALL(chdir)
 461:	b8 09 00 00 00       	mov    $0x9,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <dup>:
SYSCALL(dup)
 469:	b8 0a 00 00 00       	mov    $0xa,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <getpid>:
SYSCALL(getpid)
 471:	b8 0b 00 00 00       	mov    $0xb,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <sbrk>:
SYSCALL(sbrk)
 479:	b8 0c 00 00 00       	mov    $0xc,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <sleep>:
SYSCALL(sleep)
 481:	b8 0d 00 00 00       	mov    $0xd,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <uptime>:
SYSCALL(uptime)
 489:	b8 0e 00 00 00       	mov    $0xe,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    
