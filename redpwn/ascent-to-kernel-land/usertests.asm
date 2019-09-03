
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
char *echoargv[] = {"echo", "ALL", "TESTS", "PASSED", 0};
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void iputtest(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
	printf(stdout, "iput test\n");
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
  11:	68 3d 13 00 00       	push   $0x133d

	if (mkdir("iputdir") < 0) {
  16:	6a 01                	push   $0x1
  18:	e8 83 01 00 00       	call   1a0 <printf>
  1d:	ff 15 20 14 00 00    	call   *0x1420
  23:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  26:	31 c0                	xor    %eax,%eax
  28:	c9                   	leave  
		printf(stdout, "mkdir failed\n");
		exit();
	}
	if (chdir("iputdir") < 0) {
  29:	8d 61 fc             	lea    -0x4(%ecx),%esp
  2c:	c3                   	ret    

0000002d <fork>:
  2d:	b8 01 00 00 00       	mov    $0x1,%eax
  32:	cd 40                	int    $0x40
  34:	c3                   	ret    

00000035 <exit>:
  35:	b8 02 00 00 00       	mov    $0x2,%eax
  3a:	cd 40                	int    $0x40
  3c:	c3                   	ret    

0000003d <wait>:
  3d:	b8 03 00 00 00       	mov    $0x3,%eax
		printf(stdout, "chdir iputdir failed\n");
		exit();
	}
	if (unlink("../iputdir") < 0) {
  42:	cd 40                	int    $0x40
  44:	c3                   	ret    

00000045 <pipe>:
  45:	b8 04 00 00 00       	mov    $0x4,%eax
  4a:	cd 40                	int    $0x40
  4c:	c3                   	ret    

0000004d <read>:
  4d:	b8 05 00 00 00       	mov    $0x5,%eax
  52:	cd 40                	int    $0x40
  54:	c3                   	ret    

00000055 <write>:
		printf(stdout, "unlink ../iputdir failed\n");
		exit();
	}
	if (chdir("/") < 0) {
  55:	b8 10 00 00 00       	mov    $0x10,%eax
  5a:	cd 40                	int    $0x40
  5c:	c3                   	ret    

0000005d <close>:
  5d:	b8 15 00 00 00       	mov    $0x15,%eax
  62:	cd 40                	int    $0x40
  64:	c3                   	ret    

00000065 <kill>:
  65:	b8 06 00 00 00       	mov    $0x6,%eax
		printf(stdout, "chdir / failed\n");
		exit();
	}
	printf(stdout, "iput test ok\n");
  6a:	cd 40                	int    $0x40
  6c:	c3                   	ret    

0000006d <exec>:
  6d:	b8 07 00 00 00       	mov    $0x7,%eax
  72:	cd 40                	int    $0x40
  74:	c3                   	ret    

00000075 <open>:
  75:	b8 0f 00 00 00       	mov    $0xf,%eax
  7a:	cd 40                	int    $0x40
}
  7c:	c3                   	ret    

0000007d <mknod>:
  7d:	b8 11 00 00 00       	mov    $0x11,%eax
		printf(stdout, "mkdir failed\n");
  82:	cd 40                	int    $0x40
  84:	c3                   	ret    

00000085 <unlink>:
  85:	b8 12 00 00 00       	mov    $0x12,%eax
  8a:	cd 40                	int    $0x40
  8c:	c3                   	ret    

0000008d <fstat>:
  8d:	b8 08 00 00 00       	mov    $0x8,%eax
  92:	cd 40                	int    $0x40
		exit();
  94:	c3                   	ret    

00000095 <link>:
  95:	b8 13 00 00 00       	mov    $0x13,%eax
		printf(stdout, "chdir / failed\n");
  9a:	cd 40                	int    $0x40
  9c:	c3                   	ret    

0000009d <mkdir>:
  9d:	b8 14 00 00 00       	mov    $0x14,%eax
  a2:	cd 40                	int    $0x40
  a4:	c3                   	ret    

000000a5 <chdir>:
  a5:	b8 09 00 00 00       	mov    $0x9,%eax
		exit();
  aa:	cd 40                	int    $0x40
  ac:	c3                   	ret    

000000ad <dup>:
  ad:	b8 0a 00 00 00       	mov    $0xa,%eax
		printf(stdout, "unlink ../iputdir failed\n");
  b2:	cd 40                	int    $0x40
  b4:	c3                   	ret    

000000b5 <getpid>:
  b5:	b8 0b 00 00 00       	mov    $0xb,%eax
  ba:	cd 40                	int    $0x40
  bc:	c3                   	ret    

000000bd <sbrk>:
  bd:	b8 0c 00 00 00       	mov    $0xc,%eax
		exit();
  c2:	cd 40                	int    $0x40
  c4:	c3                   	ret    

000000c5 <sleep>:
  c5:	b8 0d 00 00 00       	mov    $0xd,%eax
		printf(stdout, "chdir iputdir failed\n");
  ca:	cd 40                	int    $0x40
  cc:	c3                   	ret    

000000cd <uptime>:
  cd:	b8 0e 00 00 00       	mov    $0xe,%eax
  d2:	cd 40                	int    $0x40
  d4:	c3                   	ret    
  d5:	66 90                	xchg   %ax,%ax
  d7:	66 90                	xchg   %ax,%ax
		exit();
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <printint>:

// does exit() call iput(p->cwd) in a transaction?
void exitiputtest(void)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
	int pid;

	printf(stdout, "exitiput test\n");
  e6:	89 d3                	mov    %edx,%ebx
  e8:	83 ec 3c             	sub    $0x3c,%esp
  eb:	89 45 bc             	mov    %eax,-0x44(%ebp)
  ee:	85 d2                	test   %edx,%edx
  f0:	0f 89 92 00 00 00    	jns    188 <printint+0xa8>

	pid = fork();
  f6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
  fa:	0f 84 88 00 00 00    	je     188 <printint+0xa8>
	if (pid < 0) {
 100:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
		printf(stdout, "fork failed\n");
		exit();
	}
	if (pid == 0) {
 107:	f7 db                	neg    %ebx
		if (mkdir("iputdir") < 0) {
 109:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 110:	8d 75 d7             	lea    -0x29(%ebp),%esi
 113:	eb 08                	jmp    11d <printint+0x3d>
 115:	8d 76 00             	lea    0x0(%esi),%esi
 118:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 11b:	89 c3                	mov    %eax,%ebx
 11d:	89 d8                	mov    %ebx,%eax
 11f:	31 d2                	xor    %edx,%edx
			printf(stdout, "mkdir failed\n");
			exit();
		}
		if (chdir("iputdir") < 0) {
 121:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 124:	f7 f1                	div    %ecx
 126:	83 c7 01             	add    $0x1,%edi
 129:	0f b6 92 68 13 00 00 	movzbl 0x1368(%edx),%edx
 130:	88 14 3e             	mov    %dl,(%esi,%edi,1)
 133:	39 d9                	cmp    %ebx,%ecx
 135:	76 e1                	jbe    118 <printint+0x38>
 137:	8b 45 c0             	mov    -0x40(%ebp),%eax
			printf(stdout, "child chdir failed\n");
			exit();
		}
		if (unlink("../iputdir") < 0) {
 13a:	85 c0                	test   %eax,%eax
 13c:	74 0d                	je     14b <printint+0x6b>
 13e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 143:	ba 2d 00 00 00       	mov    $0x2d,%edx
 148:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 14b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
			printf(stdout, "unlink ../iputdir failed\n");
			exit();
		}
		exit();
 14e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 151:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 155:	eb 0f                	jmp    166 <printint+0x86>
 157:	89 f6                	mov    %esi,%esi
	}
	wait();
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	printf(stdout, "exitiput test ok\n");
 160:	0f b6 13             	movzbl (%ebx),%edx
 163:	83 eb 01             	sub    $0x1,%ebx
 166:	83 ec 04             	sub    $0x4,%esp
 169:	88 55 d7             	mov    %dl,-0x29(%ebp)
 16c:	6a 01                	push   $0x1
 16e:	56                   	push   %esi
 16f:	57                   	push   %edi
}
 170:	e8 e0 fe ff ff       	call   55 <write>
 175:	83 c4 10             	add    $0x10,%esp
			printf(stdout, "unlink ../iputdir failed\n");
 178:	39 de                	cmp    %ebx,%esi
 17a:	75 e4                	jne    160 <printint+0x80>
 17c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17f:	5b                   	pop    %ebx
 180:	5e                   	pop    %esi
 181:	5f                   	pop    %edi
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 188:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
			exit();
 18f:	e9 75 ff ff ff       	jmp    109 <printint+0x29>
		printf(stdout, "fork failed\n");
 194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <printf>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
		exit();
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	83 ec 2c             	sub    $0x2c,%esp
			printf(stdout, "mkdir failed\n");
 1a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 1ac:	0f b6 1e             	movzbl (%esi),%ebx
 1af:	84 db                	test   %bl,%bl
 1b1:	0f 84 b9 00 00 00    	je     270 <printf+0xd0>
 1b7:	8d 45 10             	lea    0x10(%ebp),%eax
			exit();
 1ba:	83 c6 01             	add    $0x1,%esi
 1bd:	8d 7d e7             	lea    -0x19(%ebp),%edi
			printf(stdout, "child chdir failed\n");
 1c0:	31 d2                	xor    %edx,%edx
 1c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1c5:	eb 38                	jmp    1ff <printf+0x5f>
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			exit();
 1d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 1d3:	ba 25 00 00 00       	mov    $0x25,%edx
 1d8:	83 f8 25             	cmp    $0x25,%eax
 1db:	74 17                	je     1f4 <printf+0x54>
 1dd:	83 ec 04             	sub    $0x4,%esp
//      int i;
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void openiputtest(void)
{
 1e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 1e3:	6a 01                	push   $0x1
 1e5:	57                   	push   %edi
	int pid;

	printf(stdout, "openiput test\n");
 1e6:	ff 75 08             	pushl  0x8(%ebp)
 1e9:	e8 67 fe ff ff       	call   55 <write>
 1ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 1f1:	83 c4 10             	add    $0x10,%esp
 1f4:	83 c6 01             	add    $0x1,%esi
	if (mkdir("oidir") < 0) {
 1f7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 1fb:	84 db                	test   %bl,%bl
 1fd:	74 71                	je     270 <printf+0xd0>
 1ff:	0f be cb             	movsbl %bl,%ecx
 202:	0f b6 c3             	movzbl %bl,%eax
 205:	85 d2                	test   %edx,%edx
 207:	74 c7                	je     1d0 <printf+0x30>
 209:	83 fa 25             	cmp    $0x25,%edx
 20c:	75 e6                	jne    1f4 <printf+0x54>
		printf(stdout, "mkdir oidir failed\n");
		exit();
	}
	pid = fork();
 20e:	83 f8 64             	cmp    $0x64,%eax
 211:	0f 84 99 00 00 00    	je     2b0 <printf+0x110>
	if (pid < 0) {
		printf(stdout, "fork failed\n");
		exit();
	}
	if (pid == 0) {
 217:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
		int fd = open("oidir", O_RDWR);
 21d:	83 f9 70             	cmp    $0x70,%ecx
 220:	74 5e                	je     280 <printf+0xe0>
 222:	83 f8 73             	cmp    $0x73,%eax
 225:	0f 84 d5 00 00 00    	je     300 <printf+0x160>
		if (fd >= 0) {
 22b:	83 f8 63             	cmp    $0x63,%eax
			printf(stdout, "open directory for write succeeded\n");
 22e:	0f 84 8c 00 00 00    	je     2c0 <printf+0x120>
 234:	83 f8 25             	cmp    $0x25,%eax
 237:	0f 84 b3 00 00 00    	je     2f0 <printf+0x150>
 23d:	83 ec 04             	sub    $0x4,%esp
 240:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
			exit();
 244:	6a 01                	push   $0x1
 246:	57                   	push   %edi
 247:	ff 75 08             	pushl  0x8(%ebp)
 24a:	e8 06 fe ff ff       	call   55 <write>
 24f:	88 5d e7             	mov    %bl,-0x19(%ebp)
		}
		exit();
	}
	sleep(1);
 252:	83 c4 0c             	add    $0xc,%esp
 255:	6a 01                	push   $0x1
 257:	83 c6 01             	add    $0x1,%esi
	if (unlink("oidir") != 0) {
 25a:	57                   	push   %edi
 25b:	ff 75 08             	pushl  0x8(%ebp)
 25e:	e8 f2 fd ff ff       	call   55 <write>
 263:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 267:	83 c4 10             	add    $0x10,%esp
 26a:	31 d2                	xor    %edx,%edx
 26c:	84 db                	test   %bl,%bl
		printf(stdout, "unlink failed\n");
		exit();
	}
	wait();
 26e:	75 8f                	jne    1ff <printf+0x5f>
 270:	8d 65 f4             	lea    -0xc(%ebp),%esp
	printf(stdout, "openiput test ok\n");
 273:	5b                   	pop    %ebx
 274:	5e                   	pop    %esi
 275:	5f                   	pop    %edi
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 280:	83 ec 0c             	sub    $0xc,%esp
 283:	b9 10 00 00 00       	mov    $0x10,%ecx
}
 288:	6a 00                	push   $0x0
 28a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
		exit();
 290:	8b 13                	mov    (%ebx),%edx
 292:	e8 49 fe ff ff       	call   e0 <printint>
		printf(stdout, "fork failed\n");
 297:	89 d8                	mov    %ebx,%eax
 299:	83 c4 10             	add    $0x10,%esp
 29c:	31 d2                	xor    %edx,%edx
 29e:	83 c0 04             	add    $0x4,%eax
 2a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 2a4:	e9 4b ff ff ff       	jmp    1f4 <printf+0x54>
		exit();
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		printf(stdout, "mkdir oidir failed\n");
 2b0:	83 ec 0c             	sub    $0xc,%esp
 2b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 2b8:	6a 01                	push   $0x1
 2ba:	eb ce                	jmp    28a <printf+0xea>
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		exit();
 2c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
		printf(stdout, "unlink failed\n");
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8b 03                	mov    (%ebx),%eax
 2c8:	6a 01                	push   $0x1
 2ca:	83 c3 04             	add    $0x4,%ebx
 2cd:	57                   	push   %edi
 2ce:	ff 75 08             	pushl  0x8(%ebp)
 2d1:	88 45 e7             	mov    %al,-0x19(%ebp)
 2d4:	e8 7c fd ff ff       	call   55 <write>
		exit();
 2d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 2dc:	83 c4 10             	add    $0x10,%esp
 2df:	31 d2                	xor    %edx,%edx

// simple file system tests

void opentest(void)
{
 2e1:	e9 0e ff ff ff       	jmp    1f4 <printf+0x54>
	int fd;

	printf(stdout, "open test\n");
 2e6:	8d 76 00             	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 2f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 2f3:	83 ec 04             	sub    $0x4,%esp
	fd = open("echo", 0);
 2f6:	e9 5a ff ff ff       	jmp    255 <printf+0xb5>
 2fb:	90                   	nop
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 300:	8b 45 d0             	mov    -0x30(%ebp),%eax
 303:	8b 18                	mov    (%eax),%ebx
	if (fd < 0) {
 305:	83 c0 04             	add    $0x4,%eax
 308:	89 45 d0             	mov    %eax,-0x30(%ebp)
		printf(stdout, "open echo failed!\n");
		exit();
	}
	close(fd);
 30b:	85 db                	test   %ebx,%ebx
 30d:	74 17                	je     326 <printf+0x186>
 30f:	0f b6 03             	movzbl (%ebx),%eax
 312:	31 d2                	xor    %edx,%edx
	fd = open("doesnotexist", 0);
 314:	84 c0                	test   %al,%al
 316:	0f 84 d8 fe ff ff    	je     1f4 <printf+0x54>
 31c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 31f:	89 de                	mov    %ebx,%esi
 321:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (fd >= 0) {
 324:	eb 1a                	jmp    340 <printf+0x1a0>
 326:	bb 5f 13 00 00       	mov    $0x135f,%ebx
		printf(stdout, "open doesnotexist succeeded!\n");
		exit();
	}
	printf(stdout, "open test ok\n");
 32b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 32e:	b8 28 00 00 00       	mov    $0x28,%eax
 333:	89 de                	mov    %ebx,%esi
 335:	8b 5d 08             	mov    0x8(%ebp),%ebx
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
 340:	83 ec 04             	sub    $0x4,%esp
		printf(stdout, "open echo failed!\n");
 343:	83 c6 01             	add    $0x1,%esi
 346:	88 45 e7             	mov    %al,-0x19(%ebp)
 349:	6a 01                	push   $0x1
 34b:	57                   	push   %edi
 34c:	53                   	push   %ebx
 34d:	e8 03 fd ff ff       	call   55 <write>
 352:	0f b6 06             	movzbl (%esi),%eax
		exit();
 355:	83 c4 10             	add    $0x10,%esp
		printf(stdout, "open doesnotexist succeeded!\n");
 358:	84 c0                	test   %al,%al
 35a:	75 e4                	jne    340 <printf+0x1a0>
 35c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 35f:	31 d2                	xor    %edx,%edx
 361:	e9 8e fe ff ff       	jmp    1f4 <printf+0x54>
