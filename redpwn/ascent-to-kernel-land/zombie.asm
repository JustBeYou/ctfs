
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
	if (fork() > 0)
  11:	e8 16 00 00 00       	call   2c <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
		sleep(5); // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 a0 00 00 00       	call   c4 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
	exit();
  27:	e8 08 00 00 00       	call   34 <exit>

0000002c <fork>:

	os = s;
	while ((*s++ = *t++) != 0)
		;
	return os;
}
  2c:	b8 01 00 00 00       	mov    $0x1,%eax

int strcmp(const char *p, const char *q)
{
  31:	cd 40                	int    $0x40
  33:	c3                   	ret    

00000034 <exit>:
  34:	b8 02 00 00 00       	mov    $0x2,%eax
  39:	cd 40                	int    $0x40
	while (*p && *p == *q)
  3b:	c3                   	ret    

0000003c <wait>:
  3c:	b8 03 00 00 00       	mov    $0x3,%eax
  41:	cd 40                	int    $0x40
  43:	c3                   	ret    

00000044 <pipe>:
  44:	b8 04 00 00 00       	mov    $0x4,%eax
  49:	cd 40                	int    $0x40
  4b:	c3                   	ret    

0000004c <read>:
  4c:	b8 05 00 00 00       	mov    $0x5,%eax
  51:	cd 40                	int    $0x40
  53:	c3                   	ret    

00000054 <write>:
  54:	b8 10 00 00 00       	mov    $0x10,%eax
  59:	cd 40                	int    $0x40
  5b:	c3                   	ret    

0000005c <close>:
  5c:	b8 15 00 00 00       	mov    $0x15,%eax
  61:	cd 40                	int    $0x40
  63:	c3                   	ret    

00000064 <kill>:
  64:	b8 06 00 00 00       	mov    $0x6,%eax
		p++, q++;
	return (uchar)*p - (uchar)*q;
}
  69:	cd 40                	int    $0x40
  6b:	c3                   	ret    

0000006c <exec>:
  6c:	b8 07 00 00 00       	mov    $0x7,%eax
  71:	cd 40                	int    $0x40
  73:	c3                   	ret    

00000074 <open>:
  74:	b8 0f 00 00 00       	mov    $0xf,%eax
  79:	cd 40                	int    $0x40
  7b:	c3                   	ret    

0000007c <mknod>:
  7c:	b8 11 00 00 00       	mov    $0x11,%eax

uint strlen(char *s)
{
  81:	cd 40                	int    $0x40
  83:	c3                   	ret    

00000084 <unlink>:
  84:	b8 12 00 00 00       	mov    $0x12,%eax
	int n;

	for (n = 0; s[n]; n++)
  89:	cd 40                	int    $0x40
  8b:	c3                   	ret    

0000008c <fstat>:
  8c:	b8 08 00 00 00       	mov    $0x8,%eax
  91:	cd 40                	int    $0x40
  93:	c3                   	ret    

00000094 <link>:
  94:	b8 13 00 00 00       	mov    $0x13,%eax
  99:	cd 40                	int    $0x40
		;
	return n;
}
  9b:	c3                   	ret    

0000009c <mkdir>:
  9c:	b8 14 00 00 00       	mov    $0x14,%eax
	for (n = 0; s[n]; n++)
  a1:	cd 40                	int    $0x40
}
  a3:	c3                   	ret    

000000a4 <chdir>:
  a4:	b8 09 00 00 00       	mov    $0x9,%eax
  a9:	cd 40                	int    $0x40
  ab:	c3                   	ret    

000000ac <dup>:
  ac:	b8 0a 00 00 00       	mov    $0xa,%eax

void *memset(void *dst, int c, uint n)
{
  b1:	cd 40                	int    $0x40
  b3:	c3                   	ret    

000000b4 <getpid>:
  b4:	b8 0b 00 00 00       	mov    $0xb,%eax
		     : "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
	asm volatile("cld; rep stosb"
  b9:	cd 40                	int    $0x40
  bb:	c3                   	ret    

000000bc <sbrk>:
  bc:	b8 0c 00 00 00       	mov    $0xc,%eax
  c1:	cd 40                	int    $0x40
	stosb(dst, c, n);
	return dst;
}
  c3:	c3                   	ret    

000000c4 <sleep>:
  c4:	b8 0d 00 00 00       	mov    $0xd,%eax
  c9:	cd 40                	int    $0x40
  cb:	c3                   	ret    

000000cc <uptime>:
  cc:	b8 0e 00 00 00       	mov    $0xe,%eax

char *strchr(const char *s, char c)
{
  d1:	cd 40                	int    $0x40
  d3:	c3                   	ret    
