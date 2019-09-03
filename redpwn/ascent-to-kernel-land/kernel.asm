
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc 20 b6 10 80       	mov    $0x8010b620,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 e0 2f 10 80       	mov    $0x80102fe0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
	// head.next is most recently used.
	struct buf head;
} bcache;

void binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
	initlock(&bcache.lock, "bcache");

	// Create linked list of buffers
	bcache.head.prev = &bcache.head;
	bcache.head.next = &bcache.head;
	for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
80100044:	bb 54 b6 10 80       	mov    $0x8010b654,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
	initlock(&bcache.lock, "bcache");
8010004c:	68 80 6f 10 80       	push   $0x80106f80
80100051:	68 20 b6 10 80       	push   $0x8010b620
80100056:	e8 c5 42 00 00       	call   80104320 <initlock>
	bcache.head.next = &bcache.head;
8010005b:	83 c4 10             	add    $0x10,%esp
8010005e:	ba 1c fd 10 80       	mov    $0x8010fd1c,%edx
	bcache.head.prev = &bcache.head;
80100063:	c7 05 6c fd 10 80 1c 	movl   $0x8010fd1c,0x8010fd6c
8010006a:	fd 10 80 
	bcache.head.next = &bcache.head;
8010006d:	c7 05 70 fd 10 80 1c 	movl   $0x8010fd1c,0x8010fd70
80100074:	fd 10 80 
	for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
		b->next = bcache.head.next;
		b->prev = &bcache.head;
		initsleeplock(&b->lock, "buffer");
80100082:	83 ec 08             	sub    $0x8,%esp
80100085:	8d 43 0c             	lea    0xc(%ebx),%eax
		b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
		b->prev = &bcache.head;
8010008b:	c7 43 50 1c fd 10 80 	movl   $0x8010fd1c,0x50(%ebx)
		initsleeplock(&b->lock, "buffer");
80100092:	68 87 6f 10 80       	push   $0x80106f87
80100097:	50                   	push   %eax
80100098:	e8 73 41 00 00       	call   80104210 <initsleeplock>
		bcache.head.next->prev = b;
8010009d:	a1 70 fd 10 80       	mov    0x8010fd70,%eax
801000a2:	89 da                	mov    %ebx,%edx
	for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
801000a4:	83 c4 10             	add    $0x10,%esp
		bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
	for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
		bcache.head.next = b;
801000b0:	89 1d 70 fd 10 80    	mov    %ebx,0x8010fd70
	for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
801000b6:	3d 1c fd 10 80       	cmp    $0x8010fd1c,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
	}
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
	panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf *bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 7d 08             	mov    0x8(%ebp),%edi
801000dc:	8b 75 0c             	mov    0xc(%ebp),%esi
	acquire(&bcache.lock);
801000df:	68 20 b6 10 80       	push   $0x8010b620
801000e4:	e8 37 43 00 00       	call   80104420 <acquire>
	for (b = bcache.head.next; b != &bcache.head; b = b->next) {
801000e9:	8b 1d 70 fd 10 80    	mov    0x8010fd70,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 1c fd 10 80    	cmp    $0x8010fd1c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 1c fd 10 80    	cmp    $0x8010fd1c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
		if (b->dev == dev && b->blockno == blockno) {
8010010b:	3b 7b 04             	cmp    0x4(%ebx),%edi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 73 08             	cmp    0x8(%ebx),%esi
80100113:	75 eb                	jne    80100100 <bread+0x30>
			b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
			release(&bcache.lock);
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
80100120:	8b 1d 6c fd 10 80    	mov    0x8010fd6c,%ebx
80100126:	81 fb 1c fd 10 80    	cmp    $0x8010fd1c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 70                	jmp    801001a0 <bread+0xd0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 1c fd 10 80    	cmp    $0x8010fd1c,%ebx
80100139:	74 65                	je     801001a0 <bread+0xd0>
		if (b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
			b->dev = dev;
80100147:	89 7b 04             	mov    %edi,0x4(%ebx)
			b->blockno = blockno;
8010014a:	89 73 08             	mov    %esi,0x8(%ebx)
			b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
			b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
			release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 20 b6 10 80       	push   $0x8010b620
80100162:	e8 d9 43 00 00       	call   80104540 <release>
			acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 de 40 00 00       	call   80104250 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
	struct buf *b;

	b = bget(dev, blockno);
	if ((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
		iderw(b);
	}
	return b;
}
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret    
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		iderw(b);
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 9f 20 00 00       	call   80102230 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
}
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret    
8010019e:	66 90                	xchg   %ax,%ax
	panic("bget: no buffers");
801001a0:	83 ec 0c             	sub    $0xc,%esp
801001a3:	68 8e 6f 10 80       	push   $0x80106f8e
801001a8:	e8 e3 01 00 00       	call   80100390 <panic>
801001ad:	8d 76 00             	lea    0x0(%esi),%esi

801001b0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void bwrite(struct buf *b)
{
801001b0:	55                   	push   %ebp
801001b1:	89 e5                	mov    %esp,%ebp
801001b3:	53                   	push   %ebx
801001b4:	83 ec 10             	sub    $0x10,%esp
801001b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (!holdingsleep(&b->lock))
801001ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801001bd:	50                   	push   %eax
801001be:	e8 2d 41 00 00       	call   801042f0 <holdingsleep>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	85 c0                	test   %eax,%eax
801001c8:	74 0f                	je     801001d9 <bwrite+0x29>
		panic("bwrite");
	b->flags |= B_DIRTY;
801001ca:	83 0b 04             	orl    $0x4,(%ebx)
	iderw(b);
801001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d3:	c9                   	leave  
	iderw(b);
801001d4:	e9 57 20 00 00       	jmp    80102230 <iderw>
		panic("bwrite");
801001d9:	83 ec 0c             	sub    $0xc,%esp
801001dc:	68 9f 6f 10 80       	push   $0x80106f9f
801001e1:	e8 aa 01 00 00       	call   80100390 <panic>
801001e6:	8d 76 00             	lea    0x0(%esi),%esi
801001e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001f0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void brelse(struct buf *b)
{
801001f0:	55                   	push   %ebp
801001f1:	89 e5                	mov    %esp,%ebp
801001f3:	56                   	push   %esi
801001f4:	53                   	push   %ebx
801001f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (!holdingsleep(&b->lock))
801001f8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 ec 40 00 00       	call   801042f0 <holdingsleep>
80100204:	83 c4 10             	add    $0x10,%esp
80100207:	85 c0                	test   %eax,%eax
80100209:	74 66                	je     80100271 <brelse+0x81>
		panic("brelse");

	releasesleep(&b->lock);
8010020b:	83 ec 0c             	sub    $0xc,%esp
8010020e:	56                   	push   %esi
8010020f:	e8 9c 40 00 00       	call   801042b0 <releasesleep>

	acquire(&bcache.lock);
80100214:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
8010021b:	e8 00 42 00 00       	call   80104420 <acquire>
	b->refcnt--;
80100220:	8b 43 4c             	mov    0x4c(%ebx),%eax
	if (b->refcnt == 0) {
80100223:	83 c4 10             	add    $0x10,%esp
	b->refcnt--;
80100226:	83 e8 01             	sub    $0x1,%eax
80100229:	89 43 4c             	mov    %eax,0x4c(%ebx)
	if (b->refcnt == 0) {
8010022c:	85 c0                	test   %eax,%eax
8010022e:	75 2f                	jne    8010025f <brelse+0x6f>
		// no one is waiting for it.
		b->next->prev = b->prev;
80100230:	8b 43 54             	mov    0x54(%ebx),%eax
80100233:	8b 53 50             	mov    0x50(%ebx),%edx
80100236:	89 50 50             	mov    %edx,0x50(%eax)
		b->prev->next = b->next;
80100239:	8b 43 50             	mov    0x50(%ebx),%eax
8010023c:	8b 53 54             	mov    0x54(%ebx),%edx
8010023f:	89 50 54             	mov    %edx,0x54(%eax)
		b->next = bcache.head.next;
80100242:	a1 70 fd 10 80       	mov    0x8010fd70,%eax
		b->prev = &bcache.head;
80100247:	c7 43 50 1c fd 10 80 	movl   $0x8010fd1c,0x50(%ebx)
		b->next = bcache.head.next;
8010024e:	89 43 54             	mov    %eax,0x54(%ebx)
		bcache.head.next->prev = b;
80100251:	a1 70 fd 10 80       	mov    0x8010fd70,%eax
80100256:	89 58 50             	mov    %ebx,0x50(%eax)
		bcache.head.next = b;
80100259:	89 1d 70 fd 10 80    	mov    %ebx,0x8010fd70
	}

	release(&bcache.lock);
8010025f:	c7 45 08 20 b6 10 80 	movl   $0x8010b620,0x8(%ebp)
}
80100266:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100269:	5b                   	pop    %ebx
8010026a:	5e                   	pop    %esi
8010026b:	5d                   	pop    %ebp
	release(&bcache.lock);
8010026c:	e9 cf 42 00 00       	jmp    80104540 <release>
		panic("brelse");
80100271:	83 ec 0c             	sub    $0xc,%esp
80100274:	68 a6 6f 10 80       	push   $0x80106fa6
80100279:	e8 12 01 00 00       	call   80100390 <panic>
8010027e:	66 90                	xchg   %ax,%ax

80100280 <consoleread>:
		procdump(); // now call procdump() wo. cons.lock held
	}
}

int consoleread(struct inode *ip, char *dst, int n)
{
80100280:	55                   	push   %ebp
80100281:	89 e5                	mov    %esp,%ebp
80100283:	57                   	push   %edi
80100284:	56                   	push   %esi
80100285:	53                   	push   %ebx
80100286:	83 ec 28             	sub    $0x28,%esp
	uint target;
	int c;

	iunlock(ip);
80100289:	ff 75 08             	pushl  0x8(%ebp)
{
8010028c:	8b 75 10             	mov    0x10(%ebp),%esi
	iunlock(ip);
8010028f:	e8 9c 15 00 00       	call   80101830 <iunlock>
	target = n;
	acquire(&cons.lock);
80100294:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010029b:	e8 80 41 00 00       	call   80104420 <acquire>
				// caller gets a 0-byte result.
				input.r--;
			}
			break;
		}
		*dst++ = c;
801002a0:	8b 7d 0c             	mov    0xc(%ebp),%edi
	while (n > 0) {
801002a3:	83 c4 10             	add    $0x10,%esp
801002a6:	31 c0                	xor    %eax,%eax
		*dst++ = c;
801002a8:	01 f7                	add    %esi,%edi
	while (n > 0) {
801002aa:	85 f6                	test   %esi,%esi
801002ac:	0f 8e a0 00 00 00    	jle    80100352 <consoleread+0xd2>
801002b2:	89 f3                	mov    %esi,%ebx
		while (input.r == input.w) {
801002b4:	8b 15 00 00 11 80    	mov    0x80110000,%edx
801002ba:	39 15 04 00 11 80    	cmp    %edx,0x80110004
801002c0:	74 29                	je     801002eb <consoleread+0x6b>
801002c2:	eb 5c                	jmp    80100320 <consoleread+0xa0>
801002c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			sleep(&input.r, &cons.lock);
801002c8:	83 ec 08             	sub    $0x8,%esp
801002cb:	68 80 a5 10 80       	push   $0x8010a580
801002d0:	68 00 00 11 80       	push   $0x80110000
801002d5:	e8 e6 3b 00 00       	call   80103ec0 <sleep>
		while (input.r == input.w) {
801002da:	8b 15 00 00 11 80    	mov    0x80110000,%edx
801002e0:	83 c4 10             	add    $0x10,%esp
801002e3:	3b 15 04 00 11 80    	cmp    0x80110004,%edx
801002e9:	75 35                	jne    80100320 <consoleread+0xa0>
			if (myproc()->killed) {
801002eb:	e8 20 36 00 00       	call   80103910 <myproc>
801002f0:	8b 48 24             	mov    0x24(%eax),%ecx
801002f3:	85 c9                	test   %ecx,%ecx
801002f5:	74 d1                	je     801002c8 <consoleread+0x48>
				release(&cons.lock);
801002f7:	83 ec 0c             	sub    $0xc,%esp
801002fa:	68 80 a5 10 80       	push   $0x8010a580
801002ff:	e8 3c 42 00 00       	call   80104540 <release>
				ilock(ip);
80100304:	5a                   	pop    %edx
80100305:	ff 75 08             	pushl  0x8(%ebp)
80100308:	e8 43 14 00 00       	call   80101750 <ilock>
				return -1;
8010030d:	83 c4 10             	add    $0x10,%esp
	}
	release(&cons.lock);
	ilock(ip);

	return target - n;
}
80100310:	8d 65 f4             	lea    -0xc(%ebp),%esp
				return -1;
80100313:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100318:	5b                   	pop    %ebx
80100319:	5e                   	pop    %esi
8010031a:	5f                   	pop    %edi
8010031b:	5d                   	pop    %ebp
8010031c:	c3                   	ret    
8010031d:	8d 76 00             	lea    0x0(%esi),%esi
		c = input.buf[input.r++ % INPUT_BUF];
80100320:	8d 42 01             	lea    0x1(%edx),%eax
80100323:	a3 00 00 11 80       	mov    %eax,0x80110000
80100328:	89 d0                	mov    %edx,%eax
8010032a:	83 e0 7f             	and    $0x7f,%eax
8010032d:	0f be 80 80 ff 10 80 	movsbl -0x7fef0080(%eax),%eax
		if (c == C('D')) { // EOF
80100334:	83 f8 04             	cmp    $0x4,%eax
80100337:	74 46                	je     8010037f <consoleread+0xff>
		*dst++ = c;
80100339:	89 da                	mov    %ebx,%edx
		--n;
8010033b:	83 eb 01             	sub    $0x1,%ebx
		*dst++ = c;
8010033e:	f7 da                	neg    %edx
80100340:	88 04 17             	mov    %al,(%edi,%edx,1)
		if (c == '\n')
80100343:	83 f8 0a             	cmp    $0xa,%eax
80100346:	74 31                	je     80100379 <consoleread+0xf9>
	while (n > 0) {
80100348:	85 db                	test   %ebx,%ebx
8010034a:	0f 85 64 ff ff ff    	jne    801002b4 <consoleread+0x34>
80100350:	89 f0                	mov    %esi,%eax
	release(&cons.lock);
80100352:	83 ec 0c             	sub    $0xc,%esp
80100355:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100358:	68 80 a5 10 80       	push   $0x8010a580
8010035d:	e8 de 41 00 00       	call   80104540 <release>
	ilock(ip);
80100362:	58                   	pop    %eax
80100363:	ff 75 08             	pushl  0x8(%ebp)
80100366:	e8 e5 13 00 00       	call   80101750 <ilock>
	return target - n;
8010036b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010036e:	83 c4 10             	add    $0x10,%esp
}
80100371:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100374:	5b                   	pop    %ebx
80100375:	5e                   	pop    %esi
80100376:	5f                   	pop    %edi
80100377:	5d                   	pop    %ebp
80100378:	c3                   	ret    
80100379:	89 f0                	mov    %esi,%eax
8010037b:	29 d8                	sub    %ebx,%eax
8010037d:	eb d3                	jmp    80100352 <consoleread+0xd2>
			if (n < target) {
8010037f:	89 f0                	mov    %esi,%eax
80100381:	29 d8                	sub    %ebx,%eax
80100383:	39 f3                	cmp    %esi,%ebx
80100385:	73 cb                	jae    80100352 <consoleread+0xd2>
				input.r--;
80100387:	89 15 00 00 11 80    	mov    %edx,0x80110000
8010038d:	eb c3                	jmp    80100352 <consoleread+0xd2>
8010038f:	90                   	nop

80100390 <panic>:
{
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
	asm volatile("movw %0, %%gs" : : "r"(v));
}

static inline void cli(void)
{
	asm volatile("cli");
80100398:	fa                   	cli    
	cons.locking = 0;
80100399:	c7 05 b4 a5 10 80 00 	movl   $0x0,0x8010a5b4
801003a0:	00 00 00 
	getcallerpcs(&s, pcs);
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
	cprintf("lapicid %d: panic: ", lapicid());
801003a9:	e8 b2 24 00 00       	call   80102860 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 ad 6f 10 80       	push   $0x80106fad
801003b7:	e8 f4 02 00 00       	call   801006b0 <cprintf>
	cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 eb 02 00 00       	call   801006b0 <cprintf>
	cprintf("\n");
801003c5:	c7 04 24 03 79 10 80 	movl   $0x80107903,(%esp)
801003cc:	e8 df 02 00 00       	call   801006b0 <cprintf>
	getcallerpcs(&s, pcs);
801003d1:	8d 45 08             	lea    0x8(%ebp),%eax
801003d4:	5a                   	pop    %edx
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 63 3f 00 00       	call   80104340 <getcallerpcs>
	for (i = 0; i < 10; i++)
801003dd:	83 c4 10             	add    $0x10,%esp
		cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 c1 6f 10 80       	push   $0x80106fc1
801003ed:	e8 be 02 00 00       	call   801006b0 <cprintf>
	for (i = 0; i < 10; i++)
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
	panicked = 1; // freeze other CPU
801003f9:	c7 05 b8 a5 10 80 01 	movl   $0x1,0x8010a5b8
80100400:	00 00 00 
		;
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc.part.0>:
void consputc(int c)
80100410:	55                   	push   %ebp
80100411:	89 e5                	mov    %esp,%ebp
80100413:	57                   	push   %edi
80100414:	56                   	push   %esi
80100415:	53                   	push   %ebx
80100416:	89 c3                	mov    %eax,%ebx
80100418:	83 ec 1c             	sub    $0x1c,%esp
	if (c == BACKSPACE) {
8010041b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100420:	0f 84 ea 00 00 00    	je     80100510 <consputc.part.0+0x100>
		uartputc(c);
80100426:	83 ec 0c             	sub    $0xc,%esp
80100429:	50                   	push   %eax
8010042a:	e8 81 57 00 00       	call   80105bb0 <uartputc>
8010042f:	83 c4 10             	add    $0x10,%esp
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80100432:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100437:	b8 0e 00 00 00       	mov    $0xe,%eax
8010043c:	89 fa                	mov    %edi,%edx
8010043e:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
8010043f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100444:	89 ca                	mov    %ecx,%edx
80100446:	ec                   	in     (%dx),%al
	pos = inb(CRTPORT + 1) << 8;
80100447:	0f b6 c0             	movzbl %al,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
8010044a:	89 fa                	mov    %edi,%edx
8010044c:	c1 e0 08             	shl    $0x8,%eax
8010044f:	89 c6                	mov    %eax,%esi
80100451:	b8 0f 00 00 00       	mov    $0xf,%eax
80100456:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80100457:	89 ca                	mov    %ecx,%edx
80100459:	ec                   	in     (%dx),%al
	pos |= inb(CRTPORT + 1);
8010045a:	0f b6 c0             	movzbl %al,%eax
8010045d:	09 f0                	or     %esi,%eax
	if (c == '\n')
8010045f:	83 fb 0a             	cmp    $0xa,%ebx
80100462:	0f 84 90 00 00 00    	je     801004f8 <consputc.part.0+0xe8>
	else if (c == BACKSPACE) {
80100468:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010046e:	74 70                	je     801004e0 <consputc.part.0+0xd0>
		crt[pos++] = (c & 0xff) | 0x0700; // black on white
80100470:	0f b6 db             	movzbl %bl,%ebx
80100473:	8d 70 01             	lea    0x1(%eax),%esi
80100476:	80 cf 07             	or     $0x7,%bh
80100479:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
80100480:	80 
	if (pos < 0 || pos > 25 * 80)
80100481:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
80100487:	0f 8f f9 00 00 00    	jg     80100586 <consputc.part.0+0x176>
	if ((pos / 80) >= 24) { // Scroll up.
8010048d:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100493:	0f 8f a7 00 00 00    	jg     80100540 <consputc.part.0+0x130>
80100499:	89 f0                	mov    %esi,%eax
8010049b:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
801004a2:	88 45 e7             	mov    %al,-0x19(%ebp)
801004a5:	0f b6 fc             	movzbl %ah,%edi
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801004a8:	bb d4 03 00 00       	mov    $0x3d4,%ebx
801004ad:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b2:	89 da                	mov    %ebx,%edx
801004b4:	ee                   	out    %al,(%dx)
801004b5:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004ba:	89 f8                	mov    %edi,%eax
801004bc:	89 ca                	mov    %ecx,%edx
801004be:	ee                   	out    %al,(%dx)
801004bf:	b8 0f 00 00 00       	mov    $0xf,%eax
801004c4:	89 da                	mov    %ebx,%edx
801004c6:	ee                   	out    %al,(%dx)
801004c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004cb:	89 ca                	mov    %ecx,%edx
801004cd:	ee                   	out    %al,(%dx)
	crt[pos] = ' ' | 0x0700;
801004ce:	b8 20 07 00 00       	mov    $0x720,%eax
801004d3:	66 89 06             	mov    %ax,(%esi)
}
801004d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004d9:	5b                   	pop    %ebx
801004da:	5e                   	pop    %esi
801004db:	5f                   	pop    %edi
801004dc:	5d                   	pop    %ebp
801004dd:	c3                   	ret    
801004de:	66 90                	xchg   %ax,%ax
			--pos;
801004e0:	8d 70 ff             	lea    -0x1(%eax),%esi
		if (pos > 0)
801004e3:	85 c0                	test   %eax,%eax
801004e5:	75 9a                	jne    80100481 <consputc.part.0+0x71>
801004e7:	be 00 80 0b 80       	mov    $0x800b8000,%esi
801004ec:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
801004f0:	31 ff                	xor    %edi,%edi
801004f2:	eb b4                	jmp    801004a8 <consputc.part.0+0x98>
801004f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		pos += 80 - pos % 80;
801004f8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
801004fd:	f7 e2                	mul    %edx
801004ff:	c1 ea 06             	shr    $0x6,%edx
80100502:	8d 04 92             	lea    (%edx,%edx,4),%eax
80100505:	c1 e0 04             	shl    $0x4,%eax
80100508:	8d 70 50             	lea    0x50(%eax),%esi
8010050b:	e9 71 ff ff ff       	jmp    80100481 <consputc.part.0+0x71>
		uartputc('\b');
80100510:	83 ec 0c             	sub    $0xc,%esp
80100513:	6a 08                	push   $0x8
80100515:	e8 96 56 00 00       	call   80105bb0 <uartputc>
		uartputc(' ');
8010051a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100521:	e8 8a 56 00 00       	call   80105bb0 <uartputc>
		uartputc('\b');
80100526:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010052d:	e8 7e 56 00 00       	call   80105bb0 <uartputc>
80100532:	83 c4 10             	add    $0x10,%esp
80100535:	e9 f8 fe ff ff       	jmp    80100432 <consputc.part.0+0x22>
8010053a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		memmove(crt, crt + 80, sizeof(crt[0]) * 23 * 80);
80100540:	83 ec 04             	sub    $0x4,%esp
		pos -= 80;
80100543:	8d 5e b0             	lea    -0x50(%esi),%ebx
		memset(crt + pos, 0, sizeof(crt[0]) * (24 * 80 - pos));
80100546:	bf 07 00 00 00       	mov    $0x7,%edi
		memmove(crt, crt + 80, sizeof(crt[0]) * 23 * 80);
8010054b:	68 60 0e 00 00       	push   $0xe60
		memset(crt + pos, 0, sizeof(crt[0]) * (24 * 80 - pos));
80100550:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
		memmove(crt, crt + 80, sizeof(crt[0]) * 23 * 80);
80100557:	68 a0 80 0b 80       	push   $0x800b80a0
8010055c:	68 00 80 0b 80       	push   $0x800b8000
80100561:	e8 ca 40 00 00       	call   80104630 <memmove>
		memset(crt + pos, 0, sizeof(crt[0]) * (24 * 80 - pos));
80100566:	b8 80 07 00 00       	mov    $0x780,%eax
8010056b:	83 c4 0c             	add    $0xc,%esp
8010056e:	29 d8                	sub    %ebx,%eax
80100570:	01 c0                	add    %eax,%eax
80100572:	50                   	push   %eax
80100573:	6a 00                	push   $0x0
80100575:	56                   	push   %esi
80100576:	e8 15 40 00 00       	call   80104590 <memset>
8010057b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010057e:	83 c4 10             	add    $0x10,%esp
80100581:	e9 22 ff ff ff       	jmp    801004a8 <consputc.part.0+0x98>
		panic("pos under/overflow");
80100586:	83 ec 0c             	sub    $0xc,%esp
80100589:	68 c5 6f 10 80       	push   $0x80106fc5
8010058e:	e8 fd fd ff ff       	call   80100390 <panic>
80100593:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801005a0 <printint>:
{
801005a0:	55                   	push   %ebp
801005a1:	89 e5                	mov    %esp,%ebp
801005a3:	57                   	push   %edi
801005a4:	56                   	push   %esi
801005a5:	53                   	push   %ebx
801005a6:	83 ec 2c             	sub    $0x2c,%esp
801005a9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
	if (sign && (sign = xx < 0))
801005ac:	85 c9                	test   %ecx,%ecx
801005ae:	74 04                	je     801005b4 <printint+0x14>
801005b0:	85 c0                	test   %eax,%eax
801005b2:	78 68                	js     8010061c <printint+0x7c>
		x = xx;
801005b4:	89 c1                	mov    %eax,%ecx
801005b6:	31 f6                	xor    %esi,%esi
	i = 0;
801005b8:	31 db                	xor    %ebx,%ebx
801005ba:	eb 04                	jmp    801005c0 <printint+0x20>
	} while ((x /= base) != 0);
801005bc:	89 c1                	mov    %eax,%ecx
		buf[i++] = digits[x % base];
801005be:	89 fb                	mov    %edi,%ebx
801005c0:	89 c8                	mov    %ecx,%eax
801005c2:	31 d2                	xor    %edx,%edx
801005c4:	8d 7b 01             	lea    0x1(%ebx),%edi
801005c7:	f7 75 d4             	divl   -0x2c(%ebp)
801005ca:	0f b6 92 f0 6f 10 80 	movzbl -0x7fef9010(%edx),%edx
801005d1:	88 54 3d d7          	mov    %dl,-0x29(%ebp,%edi,1)
	} while ((x /= base) != 0);
801005d5:	39 4d d4             	cmp    %ecx,-0x2c(%ebp)
801005d8:	76 e2                	jbe    801005bc <printint+0x1c>
	if (sign)
801005da:	85 f6                	test   %esi,%esi
801005dc:	75 32                	jne    80100610 <printint+0x70>
801005de:	0f be c2             	movsbl %dl,%eax
801005e1:	89 df                	mov    %ebx,%edi
	if (panicked) {
801005e3:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
801005e9:	85 c9                	test   %ecx,%ecx
801005eb:	75 20                	jne    8010060d <printint+0x6d>
801005ed:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005f1:	e8 1a fe ff ff       	call   80100410 <consputc.part.0>
	while (--i >= 0)
801005f6:	8d 45 d7             	lea    -0x29(%ebp),%eax
801005f9:	39 d8                	cmp    %ebx,%eax
801005fb:	74 27                	je     80100624 <printint+0x84>
	if (panicked) {
801005fd:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
		consputc(buf[i]);
80100603:	0f be 03             	movsbl (%ebx),%eax
	if (panicked) {
80100606:	83 eb 01             	sub    $0x1,%ebx
80100609:	85 d2                	test   %edx,%edx
8010060b:	74 e4                	je     801005f1 <printint+0x51>
	asm volatile("cli");
8010060d:	fa                   	cli    
			;
8010060e:	eb fe                	jmp    8010060e <printint+0x6e>
		buf[i++] = '-';
80100610:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
80100615:	b8 2d 00 00 00       	mov    $0x2d,%eax
8010061a:	eb c7                	jmp    801005e3 <printint+0x43>
		x = -xx;
8010061c:	f7 d8                	neg    %eax
8010061e:	89 ce                	mov    %ecx,%esi
80100620:	89 c1                	mov    %eax,%ecx
80100622:	eb 94                	jmp    801005b8 <printint+0x18>
}
80100624:	83 c4 2c             	add    $0x2c,%esp
80100627:	5b                   	pop    %ebx
80100628:	5e                   	pop    %esi
80100629:	5f                   	pop    %edi
8010062a:	5d                   	pop    %ebp
8010062b:	c3                   	ret    
8010062c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100630 <consolewrite>:

int consolewrite(struct inode *ip, char *buf, int n)
{
80100630:	55                   	push   %ebp
80100631:	89 e5                	mov    %esp,%ebp
80100633:	57                   	push   %edi
80100634:	56                   	push   %esi
80100635:	53                   	push   %ebx
80100636:	83 ec 18             	sub    $0x18,%esp
80100639:	8b 7d 10             	mov    0x10(%ebp),%edi
8010063c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	int i;

	iunlock(ip);
8010063f:	ff 75 08             	pushl  0x8(%ebp)
80100642:	e8 e9 11 00 00       	call   80101830 <iunlock>
	acquire(&cons.lock);
80100647:	c7 04 24 80 a5 10 80 	movl   $0x8010a580,(%esp)
8010064e:	e8 cd 3d 00 00       	call   80104420 <acquire>
	for (i = 0; i < n; i++)
80100653:	83 c4 10             	add    $0x10,%esp
80100656:	85 ff                	test   %edi,%edi
80100658:	7e 36                	jle    80100690 <consolewrite+0x60>
	if (panicked) {
8010065a:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80100660:	85 c9                	test   %ecx,%ecx
80100662:	75 21                	jne    80100685 <consolewrite+0x55>
		consputc(buf[i] & 0xff);
80100664:	0f b6 03             	movzbl (%ebx),%eax
80100667:	8d 73 01             	lea    0x1(%ebx),%esi
8010066a:	01 fb                	add    %edi,%ebx
8010066c:	e8 9f fd ff ff       	call   80100410 <consputc.part.0>
	for (i = 0; i < n; i++)
80100671:	39 de                	cmp    %ebx,%esi
80100673:	74 1b                	je     80100690 <consolewrite+0x60>
	if (panicked) {
80100675:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
		consputc(buf[i] & 0xff);
8010067b:	0f b6 06             	movzbl (%esi),%eax
	if (panicked) {
8010067e:	83 c6 01             	add    $0x1,%esi
80100681:	85 d2                	test   %edx,%edx
80100683:	74 e7                	je     8010066c <consolewrite+0x3c>
80100685:	fa                   	cli    
			;
80100686:	eb fe                	jmp    80100686 <consolewrite+0x56>
80100688:	90                   	nop
80100689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	release(&cons.lock);
80100690:	83 ec 0c             	sub    $0xc,%esp
80100693:	68 80 a5 10 80       	push   $0x8010a580
80100698:	e8 a3 3e 00 00       	call   80104540 <release>
	ilock(ip);
8010069d:	58                   	pop    %eax
8010069e:	ff 75 08             	pushl  0x8(%ebp)
801006a1:	e8 aa 10 00 00       	call   80101750 <ilock>

	return n;
}
801006a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801006a9:	89 f8                	mov    %edi,%eax
801006ab:	5b                   	pop    %ebx
801006ac:	5e                   	pop    %esi
801006ad:	5f                   	pop    %edi
801006ae:	5d                   	pop    %ebp
801006af:	c3                   	ret    

801006b0 <cprintf>:
{
801006b0:	55                   	push   %ebp
801006b1:	89 e5                	mov    %esp,%ebp
801006b3:	57                   	push   %edi
801006b4:	56                   	push   %esi
801006b5:	53                   	push   %ebx
801006b6:	83 ec 1c             	sub    $0x1c,%esp
	locking = cons.locking;
801006b9:	a1 b4 a5 10 80       	mov    0x8010a5b4,%eax
801006be:	89 45 e0             	mov    %eax,-0x20(%ebp)
	if (locking)
801006c1:	85 c0                	test   %eax,%eax
801006c3:	0f 85 df 00 00 00    	jne    801007a8 <cprintf+0xf8>
	if (fmt == 0)
801006c9:	8b 45 08             	mov    0x8(%ebp),%eax
801006cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006cf:	85 c0                	test   %eax,%eax
801006d1:	0f 84 5e 01 00 00    	je     80100835 <cprintf+0x185>
	for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
801006d7:	0f b6 00             	movzbl (%eax),%eax
801006da:	85 c0                	test   %eax,%eax
801006dc:	74 32                	je     80100710 <cprintf+0x60>
	argp = (uint *)(void *)(&fmt + 1);
801006de:	8d 5d 0c             	lea    0xc(%ebp),%ebx
	for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
801006e1:	31 f6                	xor    %esi,%esi
		if (c != '%') {
801006e3:	83 f8 25             	cmp    $0x25,%eax
801006e6:	74 40                	je     80100728 <cprintf+0x78>
	if (panicked) {
801006e8:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
801006ee:	85 c9                	test   %ecx,%ecx
801006f0:	74 0b                	je     801006fd <cprintf+0x4d>
801006f2:	fa                   	cli    
			;
801006f3:	eb fe                	jmp    801006f3 <cprintf+0x43>
801006f5:	8d 76 00             	lea    0x0(%esi),%esi
801006f8:	b8 25 00 00 00       	mov    $0x25,%eax
801006fd:	e8 0e fd ff ff       	call   80100410 <consputc.part.0>
	for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
80100702:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100705:	83 c6 01             	add    $0x1,%esi
80100708:	0f b6 04 30          	movzbl (%eax,%esi,1),%eax
8010070c:	85 c0                	test   %eax,%eax
8010070e:	75 d3                	jne    801006e3 <cprintf+0x33>
	if (locking)
80100710:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80100713:	85 db                	test   %ebx,%ebx
80100715:	0f 85 05 01 00 00    	jne    80100820 <cprintf+0x170>
}
8010071b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010071e:	5b                   	pop    %ebx
8010071f:	5e                   	pop    %esi
80100720:	5f                   	pop    %edi
80100721:	5d                   	pop    %ebp
80100722:	c3                   	ret    
80100723:	90                   	nop
80100724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		c = fmt[++i] & 0xff;
80100728:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010072b:	83 c6 01             	add    $0x1,%esi
8010072e:	0f b6 3c 30          	movzbl (%eax,%esi,1),%edi
		if (c == 0)
80100732:	85 ff                	test   %edi,%edi
80100734:	74 da                	je     80100710 <cprintf+0x60>
		switch (c) {
80100736:	83 ff 70             	cmp    $0x70,%edi
80100739:	0f 84 7e 00 00 00    	je     801007bd <cprintf+0x10d>
8010073f:	7f 26                	jg     80100767 <cprintf+0xb7>
80100741:	83 ff 25             	cmp    $0x25,%edi
80100744:	0f 84 be 00 00 00    	je     80100808 <cprintf+0x158>
8010074a:	83 ff 64             	cmp    $0x64,%edi
8010074d:	75 46                	jne    80100795 <cprintf+0xe5>
			printint(*argp++, 10, 1);
8010074f:	8b 03                	mov    (%ebx),%eax
80100751:	8d 7b 04             	lea    0x4(%ebx),%edi
80100754:	b9 01 00 00 00       	mov    $0x1,%ecx
80100759:	ba 0a 00 00 00       	mov    $0xa,%edx
8010075e:	89 fb                	mov    %edi,%ebx
80100760:	e8 3b fe ff ff       	call   801005a0 <printint>
			break;
80100765:	eb 9b                	jmp    80100702 <cprintf+0x52>
80100767:	83 ff 73             	cmp    $0x73,%edi
8010076a:	75 24                	jne    80100790 <cprintf+0xe0>
			if ((s = (char *)*argp++) == 0)
8010076c:	8d 7b 04             	lea    0x4(%ebx),%edi
8010076f:	8b 1b                	mov    (%ebx),%ebx
80100771:	85 db                	test   %ebx,%ebx
80100773:	75 68                	jne    801007dd <cprintf+0x12d>
80100775:	b8 28 00 00 00       	mov    $0x28,%eax
				s = "(null)";
8010077a:	bb d8 6f 10 80       	mov    $0x80106fd8,%ebx
	if (panicked) {
8010077f:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
80100785:	85 d2                	test   %edx,%edx
80100787:	74 4c                	je     801007d5 <cprintf+0x125>
80100789:	fa                   	cli    
			;
8010078a:	eb fe                	jmp    8010078a <cprintf+0xda>
8010078c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100790:	83 ff 78             	cmp    $0x78,%edi
80100793:	74 28                	je     801007bd <cprintf+0x10d>
	if (panicked) {
80100795:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
8010079b:	85 d2                	test   %edx,%edx
8010079d:	74 4c                	je     801007eb <cprintf+0x13b>
8010079f:	fa                   	cli    
			;
801007a0:	eb fe                	jmp    801007a0 <cprintf+0xf0>
801007a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		acquire(&cons.lock);
801007a8:	83 ec 0c             	sub    $0xc,%esp
801007ab:	68 80 a5 10 80       	push   $0x8010a580
801007b0:	e8 6b 3c 00 00       	call   80104420 <acquire>
801007b5:	83 c4 10             	add    $0x10,%esp
801007b8:	e9 0c ff ff ff       	jmp    801006c9 <cprintf+0x19>
			printint(*argp++, 16, 0);
801007bd:	8b 03                	mov    (%ebx),%eax
801007bf:	8d 7b 04             	lea    0x4(%ebx),%edi
801007c2:	31 c9                	xor    %ecx,%ecx
801007c4:	ba 10 00 00 00       	mov    $0x10,%edx
801007c9:	89 fb                	mov    %edi,%ebx
801007cb:	e8 d0 fd ff ff       	call   801005a0 <printint>
			break;
801007d0:	e9 2d ff ff ff       	jmp    80100702 <cprintf+0x52>
801007d5:	e8 36 fc ff ff       	call   80100410 <consputc.part.0>
			for (; *s; s++)
801007da:	83 c3 01             	add    $0x1,%ebx
801007dd:	0f be 03             	movsbl (%ebx),%eax
801007e0:	84 c0                	test   %al,%al
801007e2:	75 9b                	jne    8010077f <cprintf+0xcf>
			if ((s = (char *)*argp++) == 0)
801007e4:	89 fb                	mov    %edi,%ebx
801007e6:	e9 17 ff ff ff       	jmp    80100702 <cprintf+0x52>
801007eb:	b8 25 00 00 00       	mov    $0x25,%eax
801007f0:	e8 1b fc ff ff       	call   80100410 <consputc.part.0>
	if (panicked) {
801007f5:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
801007fa:	85 c0                	test   %eax,%eax
801007fc:	74 4a                	je     80100848 <cprintf+0x198>
801007fe:	fa                   	cli    
			;
801007ff:	eb fe                	jmp    801007ff <cprintf+0x14f>
80100801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	if (panicked) {
80100808:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
8010080e:	85 c9                	test   %ecx,%ecx
80100810:	0f 84 e2 fe ff ff    	je     801006f8 <cprintf+0x48>
80100816:	fa                   	cli    
			;
80100817:	eb fe                	jmp    80100817 <cprintf+0x167>
80100819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		release(&cons.lock);
80100820:	83 ec 0c             	sub    $0xc,%esp
80100823:	68 80 a5 10 80       	push   $0x8010a580
80100828:	e8 13 3d 00 00       	call   80104540 <release>
8010082d:	83 c4 10             	add    $0x10,%esp
}
80100830:	e9 e6 fe ff ff       	jmp    8010071b <cprintf+0x6b>
		panic("null fmt");
80100835:	83 ec 0c             	sub    $0xc,%esp
80100838:	68 df 6f 10 80       	push   $0x80106fdf
8010083d:	e8 4e fb ff ff       	call   80100390 <panic>
80100842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100848:	89 f8                	mov    %edi,%eax
8010084a:	e8 c1 fb ff ff       	call   80100410 <consputc.part.0>
8010084f:	e9 ae fe ff ff       	jmp    80100702 <cprintf+0x52>
80100854:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010085a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100860 <consoleintr>:
{
80100860:	55                   	push   %ebp
80100861:	89 e5                	mov    %esp,%ebp
80100863:	57                   	push   %edi
80100864:	56                   	push   %esi
	int c, doprocdump = 0;
80100865:	31 f6                	xor    %esi,%esi
{
80100867:	53                   	push   %ebx
80100868:	83 ec 18             	sub    $0x18,%esp
8010086b:	8b 7d 08             	mov    0x8(%ebp),%edi
	acquire(&cons.lock);
8010086e:	68 80 a5 10 80       	push   $0x8010a580
80100873:	e8 a8 3b 00 00       	call   80104420 <acquire>
	while ((c = getc()) >= 0) {
80100878:	83 c4 10             	add    $0x10,%esp
8010087b:	ff d7                	call   *%edi
8010087d:	89 c3                	mov    %eax,%ebx
8010087f:	85 c0                	test   %eax,%eax
80100881:	78 34                	js     801008b7 <consoleintr+0x57>
		if (!prev_ctrl_v) {
80100883:	8b 0d 60 a5 10 80    	mov    0x8010a560,%ecx
80100889:	85 c9                	test   %ecx,%ecx
8010088b:	75 53                	jne    801008e0 <consoleintr+0x80>
			switch (c) {
8010088d:	83 fb 15             	cmp    $0x15,%ebx
80100890:	0f 84 12 01 00 00    	je     801009a8 <consoleintr+0x148>
80100896:	0f 8f bf 00 00 00    	jg     8010095b <consoleintr+0xfb>
8010089c:	83 fb 08             	cmp    $0x8,%ebx
8010089f:	0f 84 d3 00 00 00    	je     80100978 <consoleintr+0x118>
801008a5:	83 fb 10             	cmp    $0x10,%ebx
801008a8:	75 36                	jne    801008e0 <consoleintr+0x80>
	while ((c = getc()) >= 0) {
801008aa:	ff d7                	call   *%edi
				doprocdump = 1;
801008ac:	be 01 00 00 00       	mov    $0x1,%esi
	while ((c = getc()) >= 0) {
801008b1:	89 c3                	mov    %eax,%ebx
801008b3:	85 c0                	test   %eax,%eax
801008b5:	79 cc                	jns    80100883 <consoleintr+0x23>
	release(&cons.lock);
801008b7:	83 ec 0c             	sub    $0xc,%esp
801008ba:	68 80 a5 10 80       	push   $0x8010a580
801008bf:	e8 7c 3c 00 00       	call   80104540 <release>
	if (doprocdump) {
801008c4:	83 c4 10             	add    $0x10,%esp
801008c7:	85 f6                	test   %esi,%esi
801008c9:	0f 85 83 01 00 00    	jne    80100a52 <consoleintr+0x1f2>
}
801008cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008d2:	5b                   	pop    %ebx
801008d3:	5e                   	pop    %esi
801008d4:	5f                   	pop    %edi
801008d5:	5d                   	pop    %ebp
801008d6:	c3                   	ret    
801008d7:	89 f6                	mov    %esi,%esi
801008d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		if (c != 0 && input.e - input.r < INPUT_BUF) {
801008e0:	85 db                	test   %ebx,%ebx
801008e2:	74 68                	je     8010094c <consoleintr+0xec>
801008e4:	a1 08 00 11 80       	mov    0x80110008,%eax
801008e9:	89 c2                	mov    %eax,%edx
801008eb:	2b 15 00 00 11 80    	sub    0x80110000,%edx
801008f1:	83 fa 7f             	cmp    $0x7f,%edx
801008f4:	77 56                	ja     8010094c <consoleintr+0xec>
			c = (c == '\r') ? '\n' : c;
801008f6:	8d 48 01             	lea    0x1(%eax),%ecx
801008f9:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
801008ff:	83 e0 7f             	and    $0x7f,%eax
			input.buf[input.e++ % INPUT_BUF] = c;
80100902:	89 0d 08 00 11 80    	mov    %ecx,0x80110008
			c = (c == '\r') ? '\n' : c;
80100908:	83 fb 0d             	cmp    $0xd,%ebx
8010090b:	0f 84 cf 00 00 00    	je     801009e0 <consoleintr+0x180>
			input.buf[input.e++ % INPUT_BUF] = c;
80100911:	88 98 80 ff 10 80    	mov    %bl,-0x7fef0080(%eax)
	if (panicked) {
80100917:	85 d2                	test   %edx,%edx
80100919:	0f 85 cc 00 00 00    	jne    801009eb <consoleintr+0x18b>
8010091f:	89 d8                	mov    %ebx,%eax
80100921:	e8 ea fa ff ff       	call   80100410 <consputc.part.0>
			if (c == '\n' || c == C('D')
80100926:	83 fb 0a             	cmp    $0xa,%ebx
80100929:	0f 84 cb 00 00 00    	je     801009fa <consoleintr+0x19a>
8010092f:	83 fb 04             	cmp    $0x4,%ebx
80100932:	0f 84 c2 00 00 00    	je     801009fa <consoleintr+0x19a>
			    || input.e == input.r + INPUT_BUF) {
80100938:	a1 00 00 11 80       	mov    0x80110000,%eax
8010093d:	83 e8 80             	sub    $0xffffff80,%eax
80100940:	39 05 08 00 11 80    	cmp    %eax,0x80110008
80100946:	0f 84 b3 00 00 00    	je     801009ff <consoleintr+0x19f>
		prev_ctrl_v = 0;
8010094c:	c7 05 60 a5 10 80 00 	movl   $0x0,0x8010a560
80100953:	00 00 00 
80100956:	e9 20 ff ff ff       	jmp    8010087b <consoleintr+0x1b>
8010095b:	83 fb 16             	cmp    $0x16,%ebx
8010095e:	75 0f                	jne    8010096f <consoleintr+0x10f>
				prev_ctrl_v = 1;
80100960:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80100967:	00 00 00 
				continue;
8010096a:	e9 0c ff ff ff       	jmp    8010087b <consoleintr+0x1b>
8010096f:	83 fb 7f             	cmp    $0x7f,%ebx
80100972:	0f 85 68 ff ff ff    	jne    801008e0 <consoleintr+0x80>
				if (input.e != input.w) {
80100978:	a1 08 00 11 80       	mov    0x80110008,%eax
8010097d:	3b 05 04 00 11 80    	cmp    0x80110004,%eax
80100983:	0f 84 f2 fe ff ff    	je     8010087b <consoleintr+0x1b>
					input.e--;
80100989:	83 e8 01             	sub    $0x1,%eax
8010098c:	a3 08 00 11 80       	mov    %eax,0x80110008
	if (panicked) {
80100991:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80100996:	85 c0                	test   %eax,%eax
80100998:	0f 84 85 00 00 00    	je     80100a23 <consoleintr+0x1c3>
8010099e:	fa                   	cli    
			;
8010099f:	eb fe                	jmp    8010099f <consoleintr+0x13f>
801009a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
				while (input.e != input.w
801009a8:	a1 08 00 11 80       	mov    0x80110008,%eax
801009ad:	39 05 04 00 11 80    	cmp    %eax,0x80110004
801009b3:	0f 84 c2 fe ff ff    	je     8010087b <consoleintr+0x1b>
				       && input.buf[(input.e - 1) % INPUT_BUF]
801009b9:	83 e8 01             	sub    $0x1,%eax
801009bc:	89 c2                	mov    %eax,%edx
801009be:	83 e2 7f             	and    $0x7f,%edx
801009c1:	80 ba 80 ff 10 80 0a 	cmpb   $0xa,-0x7fef0080(%edx)
801009c8:	0f 84 ad fe ff ff    	je     8010087b <consoleintr+0x1b>
	if (panicked) {
801009ce:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
					input.e--;
801009d4:	a3 08 00 11 80       	mov    %eax,0x80110008
	if (panicked) {
801009d9:	85 d2                	test   %edx,%edx
801009db:	74 55                	je     80100a32 <consoleintr+0x1d2>
801009dd:	fa                   	cli    
			;
801009de:	eb fe                	jmp    801009de <consoleintr+0x17e>
			input.buf[input.e++ % INPUT_BUF] = c;
801009e0:	c6 80 80 ff 10 80 0a 	movb   $0xa,-0x7fef0080(%eax)
	if (panicked) {
801009e7:	85 d2                	test   %edx,%edx
801009e9:	74 05                	je     801009f0 <consoleintr+0x190>
801009eb:	fa                   	cli    
			;
801009ec:	eb fe                	jmp    801009ec <consoleintr+0x18c>
801009ee:	66 90                	xchg   %ax,%ax
801009f0:	b8 0a 00 00 00       	mov    $0xa,%eax
801009f5:	e8 16 fa ff ff       	call   80100410 <consputc.part.0>
			if (c == '\n' || c == C('D')
801009fa:	a1 08 00 11 80       	mov    0x80110008,%eax
				wakeup(&input.r);
801009ff:	83 ec 0c             	sub    $0xc,%esp
				input.w = input.e;
80100a02:	a3 04 00 11 80       	mov    %eax,0x80110004
				wakeup(&input.r);
80100a07:	68 00 00 11 80       	push   $0x80110000
80100a0c:	e8 5f 36 00 00       	call   80104070 <wakeup>
80100a11:	83 c4 10             	add    $0x10,%esp
		prev_ctrl_v = 0;
80100a14:	c7 05 60 a5 10 80 00 	movl   $0x0,0x8010a560
80100a1b:	00 00 00 
80100a1e:	e9 58 fe ff ff       	jmp    8010087b <consoleintr+0x1b>
80100a23:	b8 00 01 00 00       	mov    $0x100,%eax
80100a28:	e8 e3 f9 ff ff       	call   80100410 <consputc.part.0>
80100a2d:	e9 49 fe ff ff       	jmp    8010087b <consoleintr+0x1b>
80100a32:	b8 00 01 00 00       	mov    $0x100,%eax
80100a37:	e8 d4 f9 ff ff       	call   80100410 <consputc.part.0>
				while (input.e != input.w
80100a3c:	a1 08 00 11 80       	mov    0x80110008,%eax
80100a41:	3b 05 04 00 11 80    	cmp    0x80110004,%eax
80100a47:	0f 85 6c ff ff ff    	jne    801009b9 <consoleintr+0x159>
80100a4d:	e9 29 fe ff ff       	jmp    8010087b <consoleintr+0x1b>
}
80100a52:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a55:	5b                   	pop    %ebx
80100a56:	5e                   	pop    %esi
80100a57:	5f                   	pop    %edi
80100a58:	5d                   	pop    %ebp
		procdump(); // now call procdump() wo. cons.lock held
80100a59:	e9 f2 36 00 00       	jmp    80104150 <procdump>
80100a5e:	66 90                	xchg   %ax,%ax

80100a60 <consoleinit>:

void consoleinit(void)
{
80100a60:	55                   	push   %ebp
80100a61:	89 e5                	mov    %esp,%ebp
80100a63:	83 ec 10             	sub    $0x10,%esp
	initlock(&cons.lock, "console");
80100a66:	68 e8 6f 10 80       	push   $0x80106fe8
80100a6b:	68 80 a5 10 80       	push   $0x8010a580
80100a70:	e8 ab 38 00 00       	call   80104320 <initlock>

	devsw[CONSOLE].write = consolewrite;
	devsw[CONSOLE].read = consoleread;
	cons.locking = 1;

	ioapicenable(IRQ_KBD, 0);
80100a75:	58                   	pop    %eax
80100a76:	5a                   	pop    %edx
80100a77:	6a 00                	push   $0x0
80100a79:	6a 01                	push   $0x1
	devsw[CONSOLE].write = consolewrite;
80100a7b:	c7 05 cc 09 11 80 30 	movl   $0x80100630,0x801109cc
80100a82:	06 10 80 
	devsw[CONSOLE].read = consoleread;
80100a85:	c7 05 c8 09 11 80 80 	movl   $0x80100280,0x801109c8
80100a8c:	02 10 80 
	cons.locking = 1;
80100a8f:	c7 05 b4 a5 10 80 01 	movl   $0x1,0x8010a5b4
80100a96:	00 00 00 
	ioapicenable(IRQ_KBD, 0);
80100a99:	e8 42 19 00 00       	call   801023e0 <ioapicenable>
}
80100a9e:	83 c4 10             	add    $0x10,%esp
80100aa1:	c9                   	leave  
80100aa2:	c3                   	ret    
80100aa3:	66 90                	xchg   %ax,%ax
80100aa5:	66 90                	xchg   %ax,%ax
80100aa7:	66 90                	xchg   %ax,%ax
80100aa9:	66 90                	xchg   %ax,%ax
80100aab:	66 90                	xchg   %ax,%ax
80100aad:	66 90                	xchg   %ax,%ax
80100aaf:	90                   	nop

80100ab0 <exec>:
#include "defs.h"
#include "x86.h"
#include "elf.h"

int exec(char *path, char **argv)
{
80100ab0:	55                   	push   %ebp
80100ab1:	89 e5                	mov    %esp,%ebp
80100ab3:	57                   	push   %edi
80100ab4:	56                   	push   %esi
80100ab5:	53                   	push   %ebx
80100ab6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
	uint argc, sz, sp, ustack[3 + MAXARG + 1];
	struct elfhdr elf;
	struct inode *ip;
	struct proghdr ph;
	pde_t *pgdir, *oldpgdir;
	struct proc *curproc = myproc();
80100abc:	e8 4f 2e 00 00       	call   80103910 <myproc>
80100ac1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

	begin_op();
80100ac7:	e8 04 22 00 00       	call   80102cd0 <begin_op>

	if ((ip = namei(path)) == 0) {
80100acc:	83 ec 0c             	sub    $0xc,%esp
80100acf:	ff 75 08             	pushl  0x8(%ebp)
80100ad2:	e8 19 15 00 00       	call   80101ff0 <namei>
80100ad7:	83 c4 10             	add    $0x10,%esp
80100ada:	85 c0                	test   %eax,%eax
80100adc:	0f 84 02 03 00 00    	je     80100de4 <exec+0x334>
		end_op();
		cprintf("exec: fail\n");
		return -1;
	}
	ilock(ip);
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	89 c3                	mov    %eax,%ebx
80100ae7:	50                   	push   %eax
80100ae8:	e8 63 0c 00 00       	call   80101750 <ilock>
	pgdir = 0;

	// Check ELF header
	if (readi(ip, (char *)&elf, 0, sizeof(elf)) != sizeof(elf))
80100aed:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100af3:	6a 34                	push   $0x34
80100af5:	6a 00                	push   $0x0
80100af7:	50                   	push   %eax
80100af8:	53                   	push   %ebx
80100af9:	e8 32 0f 00 00       	call   80101a30 <readi>
80100afe:	83 c4 20             	add    $0x20,%esp
80100b01:	83 f8 34             	cmp    $0x34,%eax
80100b04:	74 22                	je     80100b28 <exec+0x78>

bad:
	if (pgdir)
		freevm(pgdir);
	if (ip) {
		iunlockput(ip);
80100b06:	83 ec 0c             	sub    $0xc,%esp
80100b09:	53                   	push   %ebx
80100b0a:	e8 d1 0e 00 00       	call   801019e0 <iunlockput>
		end_op();
80100b0f:	e8 2c 22 00 00       	call   80102d40 <end_op>
80100b14:	83 c4 10             	add    $0x10,%esp
	}
	return -1;
80100b17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b1f:	5b                   	pop    %ebx
80100b20:	5e                   	pop    %esi
80100b21:	5f                   	pop    %edi
80100b22:	5d                   	pop    %ebp
80100b23:	c3                   	ret    
80100b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	if (elf.magic != ELF_MAGIC)
80100b28:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b2f:	45 4c 46 
80100b32:	75 d2                	jne    80100b06 <exec+0x56>
	if ((pgdir = setupkvm()) == 0)
80100b34:	e8 c7 61 00 00       	call   80106d00 <setupkvm>
80100b39:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b3f:	85 c0                	test   %eax,%eax
80100b41:	74 c3                	je     80100b06 <exec+0x56>
	for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
80100b43:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b4a:	00 
80100b4b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b51:	0f 84 ac 02 00 00    	je     80100e03 <exec+0x353>
	sz = 0;
80100b57:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b5e:	00 00 00 
	for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
80100b61:	31 ff                	xor    %edi,%edi
80100b63:	e9 8e 00 00 00       	jmp    80100bf6 <exec+0x146>
80100b68:	90                   	nop
80100b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (ph.type != ELF_PROG_LOAD)
80100b70:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b77:	75 6c                	jne    80100be5 <exec+0x135>
		if (ph.memsz < ph.filesz)
80100b79:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b7f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b85:	0f 82 87 00 00 00    	jb     80100c12 <exec+0x162>
		if (ph.vaddr + ph.memsz < ph.vaddr)
80100b8b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b91:	72 7f                	jb     80100c12 <exec+0x162>
		if ((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b93:	83 ec 04             	sub    $0x4,%esp
80100b96:	50                   	push   %eax
80100b97:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b9d:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba3:	e8 78 5f 00 00       	call   80106b20 <allocuvm>
80100ba8:	83 c4 10             	add    $0x10,%esp
80100bab:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100bb1:	85 c0                	test   %eax,%eax
80100bb3:	74 5d                	je     80100c12 <exec+0x162>
		if (ph.vaddr % PGSIZE != 0)
80100bb5:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100bbb:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100bc0:	75 50                	jne    80100c12 <exec+0x162>
		if (loaduvm(pgdir, (char *)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100bc2:	83 ec 0c             	sub    $0xc,%esp
80100bc5:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100bcb:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100bd1:	53                   	push   %ebx
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bd9:	e8 82 5e 00 00       	call   80106a60 <loaduvm>
80100bde:	83 c4 20             	add    $0x20,%esp
80100be1:	85 c0                	test   %eax,%eax
80100be3:	78 2d                	js     80100c12 <exec+0x162>
	for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
80100be5:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bec:	83 c7 01             	add    $0x1,%edi
80100bef:	83 c6 20             	add    $0x20,%esi
80100bf2:	39 f8                	cmp    %edi,%eax
80100bf4:	7e 3a                	jle    80100c30 <exec+0x180>
		if (readi(ip, (char *)&ph, off, sizeof(ph)) != sizeof(ph))
80100bf6:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bfc:	6a 20                	push   $0x20
80100bfe:	56                   	push   %esi
80100bff:	50                   	push   %eax
80100c00:	53                   	push   %ebx
80100c01:	e8 2a 0e 00 00       	call   80101a30 <readi>
80100c06:	83 c4 10             	add    $0x10,%esp
80100c09:	83 f8 20             	cmp    $0x20,%eax
80100c0c:	0f 84 5e ff ff ff    	je     80100b70 <exec+0xc0>
		freevm(pgdir);
80100c12:	83 ec 0c             	sub    $0xc,%esp
80100c15:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c1b:	e8 60 60 00 00       	call   80106c80 <freevm>
	if (ip) {
80100c20:	83 c4 10             	add    $0x10,%esp
80100c23:	e9 de fe ff ff       	jmp    80100b06 <exec+0x56>
80100c28:	90                   	nop
80100c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100c30:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c36:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100c3c:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100c42:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
	iunlockput(ip);
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	53                   	push   %ebx
80100c4c:	e8 8f 0d 00 00       	call   801019e0 <iunlockput>
	end_op();
80100c51:	e8 ea 20 00 00       	call   80102d40 <end_op>
	if ((sz = allocuvm(pgdir, sz, sz + 2 * PGSIZE)) == 0)
80100c56:	83 c4 0c             	add    $0xc,%esp
80100c59:	56                   	push   %esi
80100c5a:	57                   	push   %edi
80100c5b:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c61:	57                   	push   %edi
80100c62:	e8 b9 5e 00 00       	call   80106b20 <allocuvm>
80100c67:	83 c4 10             	add    $0x10,%esp
80100c6a:	89 c6                	mov    %eax,%esi
80100c6c:	85 c0                	test   %eax,%eax
80100c6e:	0f 84 94 00 00 00    	je     80100d08 <exec+0x258>
	clearpteu(pgdir, (char *)(sz - 2 * PGSIZE));
80100c74:	83 ec 08             	sub    $0x8,%esp
80100c77:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
	for (argc = 0; argv[argc]; argc++) {
80100c7d:	89 f3                	mov    %esi,%ebx
	clearpteu(pgdir, (char *)(sz - 2 * PGSIZE));
80100c7f:	50                   	push   %eax
80100c80:	57                   	push   %edi
	for (argc = 0; argv[argc]; argc++) {
80100c81:	31 ff                	xor    %edi,%edi
	clearpteu(pgdir, (char *)(sz - 2 * PGSIZE));
80100c83:	e8 18 61 00 00       	call   80106da0 <clearpteu>
	for (argc = 0; argv[argc]; argc++) {
80100c88:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8b:	83 c4 10             	add    $0x10,%esp
80100c8e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c94:	8b 00                	mov    (%eax),%eax
80100c96:	85 c0                	test   %eax,%eax
80100c98:	0f 84 8b 00 00 00    	je     80100d29 <exec+0x279>
80100c9e:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100ca4:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100caa:	eb 23                	jmp    80100ccf <exec+0x21f>
80100cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100cb0:	8b 45 0c             	mov    0xc(%ebp),%eax
		ustack[3 + argc] = sp;
80100cb3:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
	for (argc = 0; argv[argc]; argc++) {
80100cba:	83 c7 01             	add    $0x1,%edi
		ustack[3 + argc] = sp;
80100cbd:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
	for (argc = 0; argv[argc]; argc++) {
80100cc3:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100cc6:	85 c0                	test   %eax,%eax
80100cc8:	74 59                	je     80100d23 <exec+0x273>
		if (argc >= MAXARG)
80100cca:	83 ff 20             	cmp    $0x20,%edi
80100ccd:	74 39                	je     80100d08 <exec+0x258>
		sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ccf:	83 ec 0c             	sub    $0xc,%esp
80100cd2:	50                   	push   %eax
80100cd3:	e8 c8 3a 00 00       	call   801047a0 <strlen>
80100cd8:	f7 d0                	not    %eax
80100cda:	01 c3                	add    %eax,%ebx
		if (copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cdc:	58                   	pop    %eax
80100cdd:	8b 45 0c             	mov    0xc(%ebp),%eax
		sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ce0:	83 e3 fc             	and    $0xfffffffc,%ebx
		if (copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100ce3:	ff 34 b8             	pushl  (%eax,%edi,4)
80100ce6:	e8 b5 3a 00 00       	call   801047a0 <strlen>
80100ceb:	83 c0 01             	add    $0x1,%eax
80100cee:	50                   	push   %eax
80100cef:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cf2:	ff 34 b8             	pushl  (%eax,%edi,4)
80100cf5:	53                   	push   %ebx
80100cf6:	56                   	push   %esi
80100cf7:	e8 f4 61 00 00       	call   80106ef0 <copyout>
80100cfc:	83 c4 20             	add    $0x20,%esp
80100cff:	85 c0                	test   %eax,%eax
80100d01:	79 ad                	jns    80100cb0 <exec+0x200>
80100d03:	90                   	nop
80100d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		freevm(pgdir);
80100d08:	83 ec 0c             	sub    $0xc,%esp
80100d0b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100d11:	e8 6a 5f 00 00       	call   80106c80 <freevm>
80100d16:	83 c4 10             	add    $0x10,%esp
	return -1;
80100d19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100d1e:	e9 f9 fd ff ff       	jmp    80100b1c <exec+0x6c>
80100d23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
	ustack[2] = sp - (argc + 1) * 4; // argv pointer
80100d29:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100d30:	89 d9                	mov    %ebx,%ecx
	ustack[3 + argc] = 0;
80100d32:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100d39:	00 00 00 00 
	ustack[2] = sp - (argc + 1) * 4; // argv pointer
80100d3d:	29 c1                	sub    %eax,%ecx
	sp -= (3 + argc + 1) * 4;
80100d3f:	83 c0 0c             	add    $0xc,%eax
	ustack[1] = argc;
80100d42:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
	sp -= (3 + argc + 1) * 4;
80100d48:	29 c3                	sub    %eax,%ebx
	if (copyout(pgdir, sp, ustack, (3 + argc + 1) * 4) < 0)
80100d4a:	50                   	push   %eax
80100d4b:	52                   	push   %edx
80100d4c:	53                   	push   %ebx
80100d4d:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
	ustack[0] = 0xffffffff; // fake return PC
80100d53:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d5a:	ff ff ff 
	ustack[2] = sp - (argc + 1) * 4; // argv pointer
80100d5d:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
	if (copyout(pgdir, sp, ustack, (3 + argc + 1) * 4) < 0)
80100d63:	e8 88 61 00 00       	call   80106ef0 <copyout>
80100d68:	83 c4 10             	add    $0x10,%esp
80100d6b:	85 c0                	test   %eax,%eax
80100d6d:	78 99                	js     80100d08 <exec+0x258>
	for (last = s = path; *s; s++)
80100d6f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d72:	8b 55 08             	mov    0x8(%ebp),%edx
80100d75:	0f b6 00             	movzbl (%eax),%eax
80100d78:	84 c0                	test   %al,%al
80100d7a:	74 13                	je     80100d8f <exec+0x2df>
80100d7c:	89 d1                	mov    %edx,%ecx
80100d7e:	66 90                	xchg   %ax,%ax
		if (*s == '/')
80100d80:	83 c1 01             	add    $0x1,%ecx
80100d83:	3c 2f                	cmp    $0x2f,%al
	for (last = s = path; *s; s++)
80100d85:	0f b6 01             	movzbl (%ecx),%eax
		if (*s == '/')
80100d88:	0f 44 d1             	cmove  %ecx,%edx
	for (last = s = path; *s; s++)
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <exec+0x2d0>
	safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d8f:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
80100d95:	83 ec 04             	sub    $0x4,%esp
80100d98:	6a 10                	push   $0x10
80100d9a:	89 f8                	mov    %edi,%eax
80100d9c:	52                   	push   %edx
80100d9d:	83 c0 6c             	add    $0x6c,%eax
80100da0:	50                   	push   %eax
80100da1:	e8 ba 39 00 00       	call   80104760 <safestrcpy>
	curproc->pgdir = pgdir;
80100da6:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
	oldpgdir = curproc->pgdir;
80100dac:	89 f8                	mov    %edi,%eax
80100dae:	8b 7f 04             	mov    0x4(%edi),%edi
	curproc->sz = sz;
80100db1:	89 30                	mov    %esi,(%eax)
	curproc->pgdir = pgdir;
80100db3:	89 48 04             	mov    %ecx,0x4(%eax)
	curproc->tf->eip = elf.entry; // main
80100db6:	89 c1                	mov    %eax,%ecx
80100db8:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100dbe:	8b 40 18             	mov    0x18(%eax),%eax
80100dc1:	89 50 38             	mov    %edx,0x38(%eax)
	curproc->tf->esp = sp;
80100dc4:	8b 41 18             	mov    0x18(%ecx),%eax
80100dc7:	89 58 44             	mov    %ebx,0x44(%eax)
	switchuvm(curproc);
80100dca:	89 0c 24             	mov    %ecx,(%esp)
80100dcd:	e8 fe 5a 00 00       	call   801068d0 <switchuvm>
	freevm(oldpgdir);
80100dd2:	89 3c 24             	mov    %edi,(%esp)
80100dd5:	e8 a6 5e 00 00       	call   80106c80 <freevm>
	return 0;
80100dda:	83 c4 10             	add    $0x10,%esp
80100ddd:	31 c0                	xor    %eax,%eax
80100ddf:	e9 38 fd ff ff       	jmp    80100b1c <exec+0x6c>
		end_op();
80100de4:	e8 57 1f 00 00       	call   80102d40 <end_op>
		cprintf("exec: fail\n");
80100de9:	83 ec 0c             	sub    $0xc,%esp
80100dec:	68 01 70 10 80       	push   $0x80107001
80100df1:	e8 ba f8 ff ff       	call   801006b0 <cprintf>
		return -1;
80100df6:	83 c4 10             	add    $0x10,%esp
80100df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dfe:	e9 19 fd ff ff       	jmp    80100b1c <exec+0x6c>
	for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
80100e03:	31 ff                	xor    %edi,%edi
80100e05:	be 00 20 00 00       	mov    $0x2000,%esi
80100e0a:	e9 39 fe ff ff       	jmp    80100c48 <exec+0x198>
80100e0f:	90                   	nop

80100e10 <fileinit>:
	struct spinlock lock;
	struct file file[NFILE];
} ftable;

void fileinit(void)
{
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	83 ec 10             	sub    $0x10,%esp
	initlock(&ftable.lock, "ftable");
80100e16:	68 0d 70 10 80       	push   $0x8010700d
80100e1b:	68 20 00 11 80       	push   $0x80110020
80100e20:	e8 fb 34 00 00       	call   80104320 <initlock>
}
80100e25:	83 c4 10             	add    $0x10,%esp
80100e28:	c9                   	leave  
80100e29:	c3                   	ret    
80100e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e30 <filealloc>:

// Allocate a file structure.
struct file *filealloc(void)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
	struct file *f;

	acquire(&ftable.lock);
	for (f = ftable.file; f < ftable.file + NFILE; f++) {
80100e34:	bb 54 00 11 80       	mov    $0x80110054,%ebx
{
80100e39:	83 ec 10             	sub    $0x10,%esp
	acquire(&ftable.lock);
80100e3c:	68 20 00 11 80       	push   $0x80110020
80100e41:	e8 da 35 00 00       	call   80104420 <acquire>
80100e46:	83 c4 10             	add    $0x10,%esp
80100e49:	eb 10                	jmp    80100e5b <filealloc+0x2b>
80100e4b:	90                   	nop
80100e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (f = ftable.file; f < ftable.file + NFILE; f++) {
80100e50:	83 c3 18             	add    $0x18,%ebx
80100e53:	81 fb b4 09 11 80    	cmp    $0x801109b4,%ebx
80100e59:	74 25                	je     80100e80 <filealloc+0x50>
		if (f->ref == 0) {
80100e5b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e5e:	85 c0                	test   %eax,%eax
80100e60:	75 ee                	jne    80100e50 <filealloc+0x20>
			f->ref = 1;
			release(&ftable.lock);
80100e62:	83 ec 0c             	sub    $0xc,%esp
			f->ref = 1;
80100e65:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
			release(&ftable.lock);
80100e6c:	68 20 00 11 80       	push   $0x80110020
80100e71:	e8 ca 36 00 00       	call   80104540 <release>
			return f;
		}
	}
	release(&ftable.lock);
	return 0;
}
80100e76:	89 d8                	mov    %ebx,%eax
			return f;
80100e78:	83 c4 10             	add    $0x10,%esp
}
80100e7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e7e:	c9                   	leave  
80100e7f:	c3                   	ret    
	release(&ftable.lock);
80100e80:	83 ec 0c             	sub    $0xc,%esp
	return 0;
80100e83:	31 db                	xor    %ebx,%ebx
	release(&ftable.lock);
80100e85:	68 20 00 11 80       	push   $0x80110020
80100e8a:	e8 b1 36 00 00       	call   80104540 <release>
}
80100e8f:	89 d8                	mov    %ebx,%eax
	return 0;
80100e91:	83 c4 10             	add    $0x10,%esp
}
80100e94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e97:	c9                   	leave  
80100e98:	c3                   	ret    
80100e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ea0 <filedup>:

// Increment ref count for file f.
struct file *filedup(struct file *f)
{
80100ea0:	55                   	push   %ebp
80100ea1:	89 e5                	mov    %esp,%ebp
80100ea3:	53                   	push   %ebx
80100ea4:	83 ec 10             	sub    $0x10,%esp
80100ea7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquire(&ftable.lock);
80100eaa:	68 20 00 11 80       	push   $0x80110020
80100eaf:	e8 6c 35 00 00       	call   80104420 <acquire>
	if (f->ref < 1)
80100eb4:	8b 43 04             	mov    0x4(%ebx),%eax
80100eb7:	83 c4 10             	add    $0x10,%esp
80100eba:	85 c0                	test   %eax,%eax
80100ebc:	7e 1a                	jle    80100ed8 <filedup+0x38>
		panic("filedup");
	f->ref++;
80100ebe:	83 c0 01             	add    $0x1,%eax
	release(&ftable.lock);
80100ec1:	83 ec 0c             	sub    $0xc,%esp
	f->ref++;
80100ec4:	89 43 04             	mov    %eax,0x4(%ebx)
	release(&ftable.lock);
80100ec7:	68 20 00 11 80       	push   $0x80110020
80100ecc:	e8 6f 36 00 00       	call   80104540 <release>
	return f;
}
80100ed1:	89 d8                	mov    %ebx,%eax
80100ed3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ed6:	c9                   	leave  
80100ed7:	c3                   	ret    
		panic("filedup");
80100ed8:	83 ec 0c             	sub    $0xc,%esp
80100edb:	68 14 70 10 80       	push   $0x80107014
80100ee0:	e8 ab f4 ff ff       	call   80100390 <panic>
80100ee5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100ef0 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void fileclose(struct file *f)
{
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	57                   	push   %edi
80100ef4:	56                   	push   %esi
80100ef5:	53                   	push   %ebx
80100ef6:	83 ec 28             	sub    $0x28,%esp
80100ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct file ff;

	acquire(&ftable.lock);
80100efc:	68 20 00 11 80       	push   $0x80110020
80100f01:	e8 1a 35 00 00       	call   80104420 <acquire>
	if (f->ref < 1)
80100f06:	8b 43 04             	mov    0x4(%ebx),%eax
80100f09:	83 c4 10             	add    $0x10,%esp
80100f0c:	85 c0                	test   %eax,%eax
80100f0e:	0f 8e a3 00 00 00    	jle    80100fb7 <fileclose+0xc7>
		panic("fileclose");
	if (--f->ref > 0) {
80100f14:	83 e8 01             	sub    $0x1,%eax
80100f17:	89 43 04             	mov    %eax,0x4(%ebx)
80100f1a:	75 44                	jne    80100f60 <fileclose+0x70>
		release(&ftable.lock);
		return;
	}
	ff = *f;
80100f1c:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
	f->ref = 0;
	f->type = FD_NONE;
	release(&ftable.lock);
80100f20:	83 ec 0c             	sub    $0xc,%esp
	ff = *f;
80100f23:	8b 3b                	mov    (%ebx),%edi
	f->type = FD_NONE;
80100f25:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
	ff = *f;
80100f2b:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f2e:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f31:	8b 43 10             	mov    0x10(%ebx),%eax
	release(&ftable.lock);
80100f34:	68 20 00 11 80       	push   $0x80110020
	ff = *f;
80100f39:	89 45 e0             	mov    %eax,-0x20(%ebp)
	release(&ftable.lock);
80100f3c:	e8 ff 35 00 00       	call   80104540 <release>

	if (ff.type == FD_PIPE)
80100f41:	83 c4 10             	add    $0x10,%esp
80100f44:	83 ff 01             	cmp    $0x1,%edi
80100f47:	74 2f                	je     80100f78 <fileclose+0x88>
		pipeclose(ff.pipe, ff.writable);
	else if (ff.type == FD_INODE) {
80100f49:	83 ff 02             	cmp    $0x2,%edi
80100f4c:	74 4a                	je     80100f98 <fileclose+0xa8>
		begin_op();
		iput(ff.ip);
		end_op();
	}
}
80100f4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f51:	5b                   	pop    %ebx
80100f52:	5e                   	pop    %esi
80100f53:	5f                   	pop    %edi
80100f54:	5d                   	pop    %ebp
80100f55:	c3                   	ret    
80100f56:	8d 76 00             	lea    0x0(%esi),%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		release(&ftable.lock);
80100f60:	c7 45 08 20 00 11 80 	movl   $0x80110020,0x8(%ebp)
}
80100f67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f6a:	5b                   	pop    %ebx
80100f6b:	5e                   	pop    %esi
80100f6c:	5f                   	pop    %edi
80100f6d:	5d                   	pop    %ebp
		release(&ftable.lock);
80100f6e:	e9 cd 35 00 00       	jmp    80104540 <release>
80100f73:	90                   	nop
80100f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		pipeclose(ff.pipe, ff.writable);
80100f78:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100f7c:	83 ec 08             	sub    $0x8,%esp
80100f7f:	53                   	push   %ebx
80100f80:	56                   	push   %esi
80100f81:	e8 fa 24 00 00       	call   80103480 <pipeclose>
80100f86:	83 c4 10             	add    $0x10,%esp
}
80100f89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8c:	5b                   	pop    %ebx
80100f8d:	5e                   	pop    %esi
80100f8e:	5f                   	pop    %edi
80100f8f:	5d                   	pop    %ebp
80100f90:	c3                   	ret    
80100f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		begin_op();
80100f98:	e8 33 1d 00 00       	call   80102cd0 <begin_op>
		iput(ff.ip);
80100f9d:	83 ec 0c             	sub    $0xc,%esp
80100fa0:	ff 75 e0             	pushl  -0x20(%ebp)
80100fa3:	e8 d8 08 00 00       	call   80101880 <iput>
		end_op();
80100fa8:	83 c4 10             	add    $0x10,%esp
}
80100fab:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fae:	5b                   	pop    %ebx
80100faf:	5e                   	pop    %esi
80100fb0:	5f                   	pop    %edi
80100fb1:	5d                   	pop    %ebp
		end_op();
80100fb2:	e9 89 1d 00 00       	jmp    80102d40 <end_op>
		panic("fileclose");
80100fb7:	83 ec 0c             	sub    $0xc,%esp
80100fba:	68 1c 70 10 80       	push   $0x8010701c
80100fbf:	e8 cc f3 ff ff       	call   80100390 <panic>
80100fc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100fd0 <filestat>:

// Get metadata about file f.
int filestat(struct file *f, struct stat *st)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	53                   	push   %ebx
80100fd4:	83 ec 04             	sub    $0x4,%esp
80100fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (f->type == FD_INODE) {
80100fda:	83 3b 02             	cmpl   $0x2,(%ebx)
80100fdd:	75 31                	jne    80101010 <filestat+0x40>
		ilock(f->ip);
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	ff 73 10             	pushl  0x10(%ebx)
80100fe5:	e8 66 07 00 00       	call   80101750 <ilock>
		stati(f->ip, st);
80100fea:	58                   	pop    %eax
80100feb:	5a                   	pop    %edx
80100fec:	ff 75 0c             	pushl  0xc(%ebp)
80100fef:	ff 73 10             	pushl  0x10(%ebx)
80100ff2:	e8 09 0a 00 00       	call   80101a00 <stati>
		iunlock(f->ip);
80100ff7:	59                   	pop    %ecx
80100ff8:	ff 73 10             	pushl  0x10(%ebx)
80100ffb:	e8 30 08 00 00       	call   80101830 <iunlock>
		return 0;
80101000:	83 c4 10             	add    $0x10,%esp
80101003:	31 c0                	xor    %eax,%eax
	}
	return -1;
}
80101005:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101008:	c9                   	leave  
80101009:	c3                   	ret    
8010100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	return -1;
80101010:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101015:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101018:	c9                   	leave  
80101019:	c3                   	ret    
8010101a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101020 <fileread>:

// Read from file f.
int fileread(struct file *f, char *addr, int n)
{
80101020:	55                   	push   %ebp
80101021:	89 e5                	mov    %esp,%ebp
80101023:	57                   	push   %edi
80101024:	56                   	push   %esi
80101025:	53                   	push   %ebx
80101026:	83 ec 0c             	sub    $0xc,%esp
80101029:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010102c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010102f:	8b 7d 10             	mov    0x10(%ebp),%edi
	int r;

	if (f->readable == 0)
80101032:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101036:	74 60                	je     80101098 <fileread+0x78>
		return -1;
	if (f->type == FD_PIPE)
80101038:	8b 03                	mov    (%ebx),%eax
8010103a:	83 f8 01             	cmp    $0x1,%eax
8010103d:	74 41                	je     80101080 <fileread+0x60>
		return piperead(f->pipe, addr, n);
	if (f->type == FD_INODE) {
8010103f:	83 f8 02             	cmp    $0x2,%eax
80101042:	75 5b                	jne    8010109f <fileread+0x7f>
		ilock(f->ip);
80101044:	83 ec 0c             	sub    $0xc,%esp
80101047:	ff 73 10             	pushl  0x10(%ebx)
8010104a:	e8 01 07 00 00       	call   80101750 <ilock>
		if ((r = readi(f->ip, addr, f->off, n)) > 0)
8010104f:	57                   	push   %edi
80101050:	ff 73 14             	pushl  0x14(%ebx)
80101053:	56                   	push   %esi
80101054:	ff 73 10             	pushl  0x10(%ebx)
80101057:	e8 d4 09 00 00       	call   80101a30 <readi>
8010105c:	83 c4 20             	add    $0x20,%esp
8010105f:	89 c6                	mov    %eax,%esi
80101061:	85 c0                	test   %eax,%eax
80101063:	7e 03                	jle    80101068 <fileread+0x48>
			f->off += r;
80101065:	01 43 14             	add    %eax,0x14(%ebx)
		iunlock(f->ip);
80101068:	83 ec 0c             	sub    $0xc,%esp
8010106b:	ff 73 10             	pushl  0x10(%ebx)
8010106e:	e8 bd 07 00 00       	call   80101830 <iunlock>
		return r;
80101073:	83 c4 10             	add    $0x10,%esp
	}
	panic("fileread");
}
80101076:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101079:	89 f0                	mov    %esi,%eax
8010107b:	5b                   	pop    %ebx
8010107c:	5e                   	pop    %esi
8010107d:	5f                   	pop    %edi
8010107e:	5d                   	pop    %ebp
8010107f:	c3                   	ret    
		return piperead(f->pipe, addr, n);
80101080:	8b 43 0c             	mov    0xc(%ebx),%eax
80101083:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101086:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101089:	5b                   	pop    %ebx
8010108a:	5e                   	pop    %esi
8010108b:	5f                   	pop    %edi
8010108c:	5d                   	pop    %ebp
		return piperead(f->pipe, addr, n);
8010108d:	e9 9e 25 00 00       	jmp    80103630 <piperead>
80101092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		return -1;
80101098:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010109d:	eb d7                	jmp    80101076 <fileread+0x56>
	panic("fileread");
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	68 26 70 10 80       	push   $0x80107026
801010a7:	e8 e4 f2 ff ff       	call   80100390 <panic>
801010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801010b0 <filewrite>:

// Write to file f.
int filewrite(struct file *f, char *addr, int n)
{
801010b0:	55                   	push   %ebp
801010b1:	89 e5                	mov    %esp,%ebp
801010b3:	57                   	push   %edi
801010b4:	56                   	push   %esi
801010b5:	53                   	push   %ebx
801010b6:	83 ec 1c             	sub    $0x1c,%esp
801010b9:	8b 45 0c             	mov    0xc(%ebp),%eax
801010bc:	8b 75 08             	mov    0x8(%ebp),%esi
801010bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010c2:	8b 45 10             	mov    0x10(%ebp),%eax
	int r;

	if (f->writable == 0)
801010c5:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
801010c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	if (f->writable == 0)
801010cc:	0f 84 bb 00 00 00    	je     8010118d <filewrite+0xdd>
		return -1;
	if (f->type == FD_PIPE)
801010d2:	8b 06                	mov    (%esi),%eax
801010d4:	83 f8 01             	cmp    $0x1,%eax
801010d7:	0f 84 bf 00 00 00    	je     8010119c <filewrite+0xec>
		return pipewrite(f->pipe, addr, n);
	if (f->type == FD_INODE) {
801010dd:	83 f8 02             	cmp    $0x2,%eax
801010e0:	0f 85 c8 00 00 00    	jne    801011ae <filewrite+0xfe>
		// and 2 blocks of slop for non-aligned writes.
		// this really belongs lower down, since writei()
		// might be writing a device like the console.
		int max = ((MAXOPBLOCKS - 1 - 1 - 2) / 2) * 512;
		int i = 0;
		while (i < n) {
801010e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
		int i = 0;
801010e9:	31 ff                	xor    %edi,%edi
		while (i < n) {
801010eb:	85 c0                	test   %eax,%eax
801010ed:	7f 30                	jg     8010111f <filewrite+0x6f>
801010ef:	e9 94 00 00 00       	jmp    80101188 <filewrite+0xd8>
801010f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				n1 = max;

			begin_op();
			ilock(f->ip);
			if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
				f->off += r;
801010f8:	01 46 14             	add    %eax,0x14(%esi)
			iunlock(f->ip);
801010fb:	83 ec 0c             	sub    $0xc,%esp
801010fe:	ff 76 10             	pushl  0x10(%esi)
				f->off += r;
80101101:	89 45 e0             	mov    %eax,-0x20(%ebp)
			iunlock(f->ip);
80101104:	e8 27 07 00 00       	call   80101830 <iunlock>
			end_op();
80101109:	e8 32 1c 00 00       	call   80102d40 <end_op>

			if (r < 0)
				break;
			if (r != n1)
8010110e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101111:	83 c4 10             	add    $0x10,%esp
80101114:	39 c3                	cmp    %eax,%ebx
80101116:	75 60                	jne    80101178 <filewrite+0xc8>
				panic("short filewrite");
			i += r;
80101118:	01 df                	add    %ebx,%edi
		while (i < n) {
8010111a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
8010111d:	7e 69                	jle    80101188 <filewrite+0xd8>
			int n1 = n - i;
8010111f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101122:	b8 00 06 00 00       	mov    $0x600,%eax
80101127:	29 fb                	sub    %edi,%ebx
			if (n1 > max)
80101129:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
8010112f:	0f 4f d8             	cmovg  %eax,%ebx
			begin_op();
80101132:	e8 99 1b 00 00       	call   80102cd0 <begin_op>
			ilock(f->ip);
80101137:	83 ec 0c             	sub    $0xc,%esp
8010113a:	ff 76 10             	pushl  0x10(%esi)
8010113d:	e8 0e 06 00 00       	call   80101750 <ilock>
			if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101142:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101145:	53                   	push   %ebx
80101146:	ff 76 14             	pushl  0x14(%esi)
80101149:	01 f8                	add    %edi,%eax
8010114b:	50                   	push   %eax
8010114c:	ff 76 10             	pushl  0x10(%esi)
8010114f:	e8 dc 09 00 00       	call   80101b30 <writei>
80101154:	83 c4 20             	add    $0x20,%esp
80101157:	85 c0                	test   %eax,%eax
80101159:	7f 9d                	jg     801010f8 <filewrite+0x48>
			iunlock(f->ip);
8010115b:	83 ec 0c             	sub    $0xc,%esp
8010115e:	ff 76 10             	pushl  0x10(%esi)
80101161:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101164:	e8 c7 06 00 00       	call   80101830 <iunlock>
			end_op();
80101169:	e8 d2 1b 00 00       	call   80102d40 <end_op>
			if (r < 0)
8010116e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101171:	83 c4 10             	add    $0x10,%esp
80101174:	85 c0                	test   %eax,%eax
80101176:	75 15                	jne    8010118d <filewrite+0xdd>
				panic("short filewrite");
80101178:	83 ec 0c             	sub    $0xc,%esp
8010117b:	68 2f 70 10 80       	push   $0x8010702f
80101180:	e8 0b f2 ff ff       	call   80100390 <panic>
80101185:	8d 76 00             	lea    0x0(%esi),%esi
		}
		return i == n ? n : -1;
80101188:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
8010118b:	74 05                	je     80101192 <filewrite+0xe2>
		return -1;
8010118d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
	}
	panic("filewrite");
}
80101192:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101195:	89 f8                	mov    %edi,%eax
80101197:	5b                   	pop    %ebx
80101198:	5e                   	pop    %esi
80101199:	5f                   	pop    %edi
8010119a:	5d                   	pop    %ebp
8010119b:	c3                   	ret    
		return pipewrite(f->pipe, addr, n);
8010119c:	8b 46 0c             	mov    0xc(%esi),%eax
8010119f:	89 45 08             	mov    %eax,0x8(%ebp)
}
801011a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011a5:	5b                   	pop    %ebx
801011a6:	5e                   	pop    %esi
801011a7:	5f                   	pop    %edi
801011a8:	5d                   	pop    %ebp
		return pipewrite(f->pipe, addr, n);
801011a9:	e9 72 23 00 00       	jmp    80103520 <pipewrite>
	panic("filewrite");
801011ae:	83 ec 0c             	sub    $0xc,%esp
801011b1:	68 35 70 10 80       	push   $0x80107035
801011b6:	e8 d5 f1 ff ff       	call   80100390 <panic>
801011bb:	66 90                	xchg   %ax,%ax
801011bd:	66 90                	xchg   %ax,%ax
801011bf:	90                   	nop

801011c0 <balloc>:

// Blocks.

// Allocate a zeroed disk block.
static uint balloc(uint dev)
{
801011c0:	55                   	push   %ebp
801011c1:	89 e5                	mov    %esp,%ebp
801011c3:	57                   	push   %edi
801011c4:	56                   	push   %esi
801011c5:	53                   	push   %ebx
801011c6:	83 ec 1c             	sub    $0x1c,%esp
	int b, bi, m;
	struct buf *bp;

	bp = 0;
	for (b = 0; b < sb.size; b += BPB) {
801011c9:	8b 0d 20 0a 11 80    	mov    0x80110a20,%ecx
{
801011cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
	for (b = 0; b < sb.size; b += BPB) {
801011d2:	85 c9                	test   %ecx,%ecx
801011d4:	0f 84 87 00 00 00    	je     80101261 <balloc+0xa1>
801011da:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
		bp = bread(dev, BBLOCK(b, sb));
801011e1:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011e4:	83 ec 08             	sub    $0x8,%esp
801011e7:	89 f0                	mov    %esi,%eax
801011e9:	c1 f8 0c             	sar    $0xc,%eax
801011ec:	03 05 38 0a 11 80    	add    0x80110a38,%eax
801011f2:	50                   	push   %eax
801011f3:	ff 75 d8             	pushl  -0x28(%ebp)
801011f6:	e8 d5 ee ff ff       	call   801000d0 <bread>
801011fb:	83 c4 10             	add    $0x10,%esp
801011fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
80101201:	a1 20 0a 11 80       	mov    0x80110a20,%eax
80101206:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101209:	31 c0                	xor    %eax,%eax
8010120b:	eb 2f                	jmp    8010123c <balloc+0x7c>
8010120d:	8d 76 00             	lea    0x0(%esi),%esi
			m = 1 << (bi % 8);
80101210:	89 c1                	mov    %eax,%ecx
80101212:	bb 01 00 00 00       	mov    $0x1,%ebx
			if ((bp->data[bi / 8] & m) == 0) { // Is block free?
80101217:	8b 55 e4             	mov    -0x1c(%ebp),%edx
			m = 1 << (bi % 8);
8010121a:	83 e1 07             	and    $0x7,%ecx
8010121d:	d3 e3                	shl    %cl,%ebx
			if ((bp->data[bi / 8] & m) == 0) { // Is block free?
8010121f:	89 c1                	mov    %eax,%ecx
80101221:	c1 f9 03             	sar    $0x3,%ecx
80101224:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101229:	89 fa                	mov    %edi,%edx
8010122b:	85 df                	test   %ebx,%edi
8010122d:	74 41                	je     80101270 <balloc+0xb0>
		for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
8010122f:	83 c0 01             	add    $0x1,%eax
80101232:	83 c6 01             	add    $0x1,%esi
80101235:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010123a:	74 05                	je     80101241 <balloc+0x81>
8010123c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010123f:	77 cf                	ja     80101210 <balloc+0x50>
				brelse(bp);
				bzero(dev, b + bi);
				return b + bi;
			}
		}
		brelse(bp);
80101241:	83 ec 0c             	sub    $0xc,%esp
80101244:	ff 75 e4             	pushl  -0x1c(%ebp)
80101247:	e8 a4 ef ff ff       	call   801001f0 <brelse>
	for (b = 0; b < sb.size; b += BPB) {
8010124c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101253:	83 c4 10             	add    $0x10,%esp
80101256:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101259:	39 05 20 0a 11 80    	cmp    %eax,0x80110a20
8010125f:	77 80                	ja     801011e1 <balloc+0x21>
	}
	panic("balloc: out of blocks");
80101261:	83 ec 0c             	sub    $0xc,%esp
80101264:	68 3f 70 10 80       	push   $0x8010703f
80101269:	e8 22 f1 ff ff       	call   80100390 <panic>
8010126e:	66 90                	xchg   %ax,%ax
				bp->data[bi / 8] |= m;     // Mark block in use.
80101270:	8b 7d e4             	mov    -0x1c(%ebp),%edi
				log_write(bp);
80101273:	83 ec 0c             	sub    $0xc,%esp
				bp->data[bi / 8] |= m;     // Mark block in use.
80101276:	09 da                	or     %ebx,%edx
80101278:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
				log_write(bp);
8010127c:	57                   	push   %edi
8010127d:	e8 2e 1c 00 00       	call   80102eb0 <log_write>
				brelse(bp);
80101282:	89 3c 24             	mov    %edi,(%esp)
80101285:	e8 66 ef ff ff       	call   801001f0 <brelse>
	bp = bread(dev, bno);
8010128a:	58                   	pop    %eax
8010128b:	5a                   	pop    %edx
8010128c:	56                   	push   %esi
8010128d:	ff 75 d8             	pushl  -0x28(%ebp)
80101290:	e8 3b ee ff ff       	call   801000d0 <bread>
	memset(bp->data, 0, BSIZE);
80101295:	83 c4 0c             	add    $0xc,%esp
	bp = bread(dev, bno);
80101298:	89 c3                	mov    %eax,%ebx
	memset(bp->data, 0, BSIZE);
8010129a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010129d:	68 00 02 00 00       	push   $0x200
801012a2:	6a 00                	push   $0x0
801012a4:	50                   	push   %eax
801012a5:	e8 e6 32 00 00       	call   80104590 <memset>
	log_write(bp);
801012aa:	89 1c 24             	mov    %ebx,(%esp)
801012ad:	e8 fe 1b 00 00       	call   80102eb0 <log_write>
	brelse(bp);
801012b2:	89 1c 24             	mov    %ebx,(%esp)
801012b5:	e8 36 ef ff ff       	call   801001f0 <brelse>
}
801012ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012bd:	89 f0                	mov    %esi,%eax
801012bf:	5b                   	pop    %ebx
801012c0:	5e                   	pop    %esi
801012c1:	5f                   	pop    %edi
801012c2:	5d                   	pop    %ebp
801012c3:	c3                   	ret    
801012c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801012ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801012d0 <iget>:

// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode *iget(uint dev, uint inum)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	89 c7                	mov    %eax,%edi
801012d6:	56                   	push   %esi
	struct inode *ip, *empty;

	acquire(&icache.lock);

	// Is the inode already cached?
	empty = 0;
801012d7:	31 f6                	xor    %esi,%esi
{
801012d9:	53                   	push   %ebx
	for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
801012da:	bb 74 0a 11 80       	mov    $0x80110a74,%ebx
{
801012df:	83 ec 28             	sub    $0x28,%esp
801012e2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
	acquire(&icache.lock);
801012e5:	68 40 0a 11 80       	push   $0x80110a40
801012ea:	e8 31 31 00 00       	call   80104420 <acquire>
801012ef:	83 c4 10             	add    $0x10,%esp
	for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
801012f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012f5:	eb 1b                	jmp    80101312 <iget+0x42>
801012f7:	89 f6                	mov    %esi,%esi
801012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
80101300:	39 3b                	cmp    %edi,(%ebx)
80101302:	74 6c                	je     80101370 <iget+0xa0>
80101304:	81 c3 90 00 00 00    	add    $0x90,%ebx
	for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
8010130a:	81 fb 94 26 11 80    	cmp    $0x80112694,%ebx
80101310:	73 26                	jae    80101338 <iget+0x68>
		if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
80101312:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101315:	85 c9                	test   %ecx,%ecx
80101317:	7f e7                	jg     80101300 <iget+0x30>
			ip->ref++;
			release(&icache.lock);
			return ip;
		}
		if (empty == 0 && ip->ref == 0) // Remember empty slot.
80101319:	85 f6                	test   %esi,%esi
8010131b:	75 e7                	jne    80101304 <iget+0x34>
8010131d:	8d 83 90 00 00 00    	lea    0x90(%ebx),%eax
80101323:	85 c9                	test   %ecx,%ecx
80101325:	75 70                	jne    80101397 <iget+0xc7>
80101327:	89 de                	mov    %ebx,%esi
80101329:	89 c3                	mov    %eax,%ebx
	for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
8010132b:	81 fb 94 26 11 80    	cmp    $0x80112694,%ebx
80101331:	72 df                	jb     80101312 <iget+0x42>
80101333:	90                   	nop
80101334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			empty = ip;
	}

	// Recycle an inode cache entry.
	if (empty == 0)
80101338:	85 f6                	test   %esi,%esi
8010133a:	74 74                	je     801013b0 <iget+0xe0>
	ip = empty;
	ip->dev = dev;
	ip->inum = inum;
	ip->ref = 1;
	ip->valid = 0;
	release(&icache.lock);
8010133c:	83 ec 0c             	sub    $0xc,%esp
	ip->dev = dev;
8010133f:	89 3e                	mov    %edi,(%esi)
	ip->inum = inum;
80101341:	89 56 04             	mov    %edx,0x4(%esi)
	ip->ref = 1;
80101344:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
	ip->valid = 0;
8010134b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
	release(&icache.lock);
80101352:	68 40 0a 11 80       	push   $0x80110a40
80101357:	e8 e4 31 00 00       	call   80104540 <release>

	return ip;
8010135c:	83 c4 10             	add    $0x10,%esp
}
8010135f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101362:	89 f0                	mov    %esi,%eax
80101364:	5b                   	pop    %ebx
80101365:	5e                   	pop    %esi
80101366:	5f                   	pop    %edi
80101367:	5d                   	pop    %ebp
80101368:	c3                   	ret    
80101369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
80101370:	39 53 04             	cmp    %edx,0x4(%ebx)
80101373:	75 8f                	jne    80101304 <iget+0x34>
			release(&icache.lock);
80101375:	83 ec 0c             	sub    $0xc,%esp
			ip->ref++;
80101378:	83 c1 01             	add    $0x1,%ecx
			return ip;
8010137b:	89 de                	mov    %ebx,%esi
			ip->ref++;
8010137d:	89 4b 08             	mov    %ecx,0x8(%ebx)
			release(&icache.lock);
80101380:	68 40 0a 11 80       	push   $0x80110a40
80101385:	e8 b6 31 00 00       	call   80104540 <release>
			return ip;
8010138a:	83 c4 10             	add    $0x10,%esp
}
8010138d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101390:	89 f0                	mov    %esi,%eax
80101392:	5b                   	pop    %ebx
80101393:	5e                   	pop    %esi
80101394:	5f                   	pop    %edi
80101395:	5d                   	pop    %ebp
80101396:	c3                   	ret    
	for (ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++) {
80101397:	3d 94 26 11 80       	cmp    $0x80112694,%eax
8010139c:	73 12                	jae    801013b0 <iget+0xe0>
		if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
8010139e:	8b 48 08             	mov    0x8(%eax),%ecx
801013a1:	89 c3                	mov    %eax,%ebx
801013a3:	85 c9                	test   %ecx,%ecx
801013a5:	0f 8f 55 ff ff ff    	jg     80101300 <iget+0x30>
801013ab:	e9 6d ff ff ff       	jmp    8010131d <iget+0x4d>
		panic("iget: no inodes");
801013b0:	83 ec 0c             	sub    $0xc,%esp
801013b3:	68 55 70 10 80       	push   $0x80107055
801013b8:	e8 d3 ef ff ff       	call   80100390 <panic>
801013bd:	8d 76 00             	lea    0x0(%esi),%esi

801013c0 <bmap>:
// listed in block ip->addrs[NDIRECT].

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint bmap(struct inode *ip, uint bn)
{
801013c0:	55                   	push   %ebp
801013c1:	89 e5                	mov    %esp,%ebp
801013c3:	57                   	push   %edi
801013c4:	56                   	push   %esi
801013c5:	89 c6                	mov    %eax,%esi
801013c7:	53                   	push   %ebx
801013c8:	83 ec 1c             	sub    $0x1c,%esp
	uint addr, *a;
	struct buf *bp;

	if (bn < NDIRECT) {
801013cb:	83 fa 0b             	cmp    $0xb,%edx
801013ce:	0f 86 84 00 00 00    	jbe    80101458 <bmap+0x98>
		if ((addr = ip->addrs[bn]) == 0)
			ip->addrs[bn] = addr = balloc(ip->dev);
		return addr;
	}
	bn -= NDIRECT;
801013d4:	8d 5a f4             	lea    -0xc(%edx),%ebx

	if (bn < NINDIRECT) {
801013d7:	83 fb 7f             	cmp    $0x7f,%ebx
801013da:	0f 87 98 00 00 00    	ja     80101478 <bmap+0xb8>
		// Load indirect block, allocating if necessary.
		if ((addr = ip->addrs[NDIRECT]) == 0)
801013e0:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
801013e6:	8b 00                	mov    (%eax),%eax
801013e8:	85 d2                	test   %edx,%edx
801013ea:	74 54                	je     80101440 <bmap+0x80>
			ip->addrs[NDIRECT] = addr = balloc(ip->dev);
		bp = bread(ip->dev, addr);
801013ec:	83 ec 08             	sub    $0x8,%esp
801013ef:	52                   	push   %edx
801013f0:	50                   	push   %eax
801013f1:	e8 da ec ff ff       	call   801000d0 <bread>
		a = (uint *)bp->data;
		if ((addr = a[bn]) == 0) {
801013f6:	83 c4 10             	add    $0x10,%esp
801013f9:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
		bp = bread(ip->dev, addr);
801013fd:	89 c7                	mov    %eax,%edi
		if ((addr = a[bn]) == 0) {
801013ff:	8b 1a                	mov    (%edx),%ebx
80101401:	85 db                	test   %ebx,%ebx
80101403:	74 1b                	je     80101420 <bmap+0x60>
			a[bn] = addr = balloc(ip->dev);
			log_write(bp);
		}
		brelse(bp);
80101405:	83 ec 0c             	sub    $0xc,%esp
80101408:	57                   	push   %edi
80101409:	e8 e2 ed ff ff       	call   801001f0 <brelse>
		return addr;
8010140e:	83 c4 10             	add    $0x10,%esp
	}

	panic("bmap: out of range");
}
80101411:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101414:	89 d8                	mov    %ebx,%eax
80101416:	5b                   	pop    %ebx
80101417:	5e                   	pop    %esi
80101418:	5f                   	pop    %edi
80101419:	5d                   	pop    %ebp
8010141a:	c3                   	ret    
8010141b:	90                   	nop
8010141c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			a[bn] = addr = balloc(ip->dev);
80101420:	8b 06                	mov    (%esi),%eax
80101422:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101425:	e8 96 fd ff ff       	call   801011c0 <balloc>
8010142a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
			log_write(bp);
8010142d:	83 ec 0c             	sub    $0xc,%esp
			a[bn] = addr = balloc(ip->dev);
80101430:	89 c3                	mov    %eax,%ebx
80101432:	89 02                	mov    %eax,(%edx)
			log_write(bp);
80101434:	57                   	push   %edi
80101435:	e8 76 1a 00 00       	call   80102eb0 <log_write>
8010143a:	83 c4 10             	add    $0x10,%esp
8010143d:	eb c6                	jmp    80101405 <bmap+0x45>
8010143f:	90                   	nop
			ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101440:	e8 7b fd ff ff       	call   801011c0 <balloc>
80101445:	89 c2                	mov    %eax,%edx
80101447:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010144d:	8b 06                	mov    (%esi),%eax
8010144f:	eb 9b                	jmp    801013ec <bmap+0x2c>
80101451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if ((addr = ip->addrs[bn]) == 0)
80101458:	8d 3c 90             	lea    (%eax,%edx,4),%edi
8010145b:	8b 5f 5c             	mov    0x5c(%edi),%ebx
8010145e:	85 db                	test   %ebx,%ebx
80101460:	75 af                	jne    80101411 <bmap+0x51>
			ip->addrs[bn] = addr = balloc(ip->dev);
80101462:	8b 00                	mov    (%eax),%eax
80101464:	e8 57 fd ff ff       	call   801011c0 <balloc>
80101469:	89 47 5c             	mov    %eax,0x5c(%edi)
8010146c:	89 c3                	mov    %eax,%ebx
}
8010146e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101471:	89 d8                	mov    %ebx,%eax
80101473:	5b                   	pop    %ebx
80101474:	5e                   	pop    %esi
80101475:	5f                   	pop    %edi
80101476:	5d                   	pop    %ebp
80101477:	c3                   	ret    
	panic("bmap: out of range");
80101478:	83 ec 0c             	sub    $0xc,%esp
8010147b:	68 65 70 10 80       	push   $0x80107065
80101480:	e8 0b ef ff ff       	call   80100390 <panic>
80101485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101490 <readsb>:
{
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	56                   	push   %esi
80101494:	53                   	push   %ebx
80101495:	8b 75 0c             	mov    0xc(%ebp),%esi
	bp = bread(dev, 1);
80101498:	83 ec 08             	sub    $0x8,%esp
8010149b:	6a 01                	push   $0x1
8010149d:	ff 75 08             	pushl  0x8(%ebp)
801014a0:	e8 2b ec ff ff       	call   801000d0 <bread>
	memmove(sb, bp->data, sizeof(*sb));
801014a5:	83 c4 0c             	add    $0xc,%esp
	bp = bread(dev, 1);
801014a8:	89 c3                	mov    %eax,%ebx
	memmove(sb, bp->data, sizeof(*sb));
801014aa:	8d 40 5c             	lea    0x5c(%eax),%eax
801014ad:	6a 1c                	push   $0x1c
801014af:	50                   	push   %eax
801014b0:	56                   	push   %esi
801014b1:	e8 7a 31 00 00       	call   80104630 <memmove>
	brelse(bp);
801014b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801014b9:	83 c4 10             	add    $0x10,%esp
}
801014bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801014bf:	5b                   	pop    %ebx
801014c0:	5e                   	pop    %esi
801014c1:	5d                   	pop    %ebp
	brelse(bp);
801014c2:	e9 29 ed ff ff       	jmp    801001f0 <brelse>
801014c7:	89 f6                	mov    %esi,%esi
801014c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014d0 <bfree>:
{
801014d0:	55                   	push   %ebp
801014d1:	89 e5                	mov    %esp,%ebp
801014d3:	56                   	push   %esi
801014d4:	89 c6                	mov    %eax,%esi
801014d6:	53                   	push   %ebx
801014d7:	89 d3                	mov    %edx,%ebx
	readsb(dev, &sb);
801014d9:	83 ec 08             	sub    $0x8,%esp
801014dc:	68 20 0a 11 80       	push   $0x80110a20
801014e1:	50                   	push   %eax
801014e2:	e8 a9 ff ff ff       	call   80101490 <readsb>
	bp = bread(dev, BBLOCK(b, sb));
801014e7:	58                   	pop    %eax
801014e8:	5a                   	pop    %edx
801014e9:	89 da                	mov    %ebx,%edx
801014eb:	c1 ea 0c             	shr    $0xc,%edx
801014ee:	03 15 38 0a 11 80    	add    0x80110a38,%edx
801014f4:	52                   	push   %edx
801014f5:	56                   	push   %esi
801014f6:	e8 d5 eb ff ff       	call   801000d0 <bread>
	m = 1 << (bi % 8);
801014fb:	89 d9                	mov    %ebx,%ecx
	if ((bp->data[bi / 8] & m) == 0)
801014fd:	c1 fb 03             	sar    $0x3,%ebx
	m = 1 << (bi % 8);
80101500:	ba 01 00 00 00       	mov    $0x1,%edx
80101505:	83 e1 07             	and    $0x7,%ecx
	if ((bp->data[bi / 8] & m) == 0)
80101508:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010150e:	83 c4 10             	add    $0x10,%esp
	m = 1 << (bi % 8);
80101511:	d3 e2                	shl    %cl,%edx
	if ((bp->data[bi / 8] & m) == 0)
80101513:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101518:	85 d1                	test   %edx,%ecx
8010151a:	74 25                	je     80101541 <bfree+0x71>
	bp->data[bi / 8] &= ~m;
8010151c:	f7 d2                	not    %edx
8010151e:	89 c6                	mov    %eax,%esi
	log_write(bp);
80101520:	83 ec 0c             	sub    $0xc,%esp
	bp->data[bi / 8] &= ~m;
80101523:	21 ca                	and    %ecx,%edx
80101525:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
	log_write(bp);
80101529:	56                   	push   %esi
8010152a:	e8 81 19 00 00       	call   80102eb0 <log_write>
	brelse(bp);
8010152f:	89 34 24             	mov    %esi,(%esp)
80101532:	e8 b9 ec ff ff       	call   801001f0 <brelse>
}
80101537:	83 c4 10             	add    $0x10,%esp
8010153a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010153d:	5b                   	pop    %ebx
8010153e:	5e                   	pop    %esi
8010153f:	5d                   	pop    %ebp
80101540:	c3                   	ret    
		panic("freeing free block");
80101541:	83 ec 0c             	sub    $0xc,%esp
80101544:	68 78 70 10 80       	push   $0x80107078
80101549:	e8 42 ee ff ff       	call   80100390 <panic>
8010154e:	66 90                	xchg   %ax,%ax

80101550 <iinit>:
{
80101550:	55                   	push   %ebp
80101551:	89 e5                	mov    %esp,%ebp
80101553:	53                   	push   %ebx
80101554:	bb 80 0a 11 80       	mov    $0x80110a80,%ebx
80101559:	83 ec 0c             	sub    $0xc,%esp
	initlock(&icache.lock, "icache");
8010155c:	68 8b 70 10 80       	push   $0x8010708b
80101561:	68 40 0a 11 80       	push   $0x80110a40
80101566:	e8 b5 2d 00 00       	call   80104320 <initlock>
	for (i = 0; i < NINODE; i++) {
8010156b:	83 c4 10             	add    $0x10,%esp
8010156e:	66 90                	xchg   %ax,%ax
		initsleeplock(&icache.inode[i].lock, "inode");
80101570:	83 ec 08             	sub    $0x8,%esp
80101573:	68 92 70 10 80       	push   $0x80107092
80101578:	53                   	push   %ebx
80101579:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010157f:	e8 8c 2c 00 00       	call   80104210 <initsleeplock>
	for (i = 0; i < NINODE; i++) {
80101584:	83 c4 10             	add    $0x10,%esp
80101587:	81 fb a0 26 11 80    	cmp    $0x801126a0,%ebx
8010158d:	75 e1                	jne    80101570 <iinit+0x20>
	readsb(dev, &sb);
8010158f:	83 ec 08             	sub    $0x8,%esp
80101592:	68 20 0a 11 80       	push   $0x80110a20
80101597:	ff 75 08             	pushl  0x8(%ebp)
8010159a:	e8 f1 fe ff ff       	call   80101490 <readsb>
	cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010159f:	ff 35 38 0a 11 80    	pushl  0x80110a38
801015a5:	ff 35 34 0a 11 80    	pushl  0x80110a34
801015ab:	ff 35 30 0a 11 80    	pushl  0x80110a30
801015b1:	ff 35 2c 0a 11 80    	pushl  0x80110a2c
801015b7:	ff 35 28 0a 11 80    	pushl  0x80110a28
801015bd:	ff 35 24 0a 11 80    	pushl  0x80110a24
801015c3:	ff 35 20 0a 11 80    	pushl  0x80110a20
801015c9:	68 f8 70 10 80       	push   $0x801070f8
801015ce:	e8 dd f0 ff ff       	call   801006b0 <cprintf>
}
801015d3:	83 c4 30             	add    $0x30,%esp
801015d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801015d9:	c9                   	leave  
801015da:	c3                   	ret    
801015db:	90                   	nop
801015dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801015e0 <ialloc>:
{
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	57                   	push   %edi
801015e4:	56                   	push   %esi
801015e5:	53                   	push   %ebx
801015e6:	83 ec 1c             	sub    $0x1c,%esp
801015e9:	8b 45 0c             	mov    0xc(%ebp),%eax
	for (inum = 1; inum < sb.ninodes; inum++) {
801015ec:	83 3d 28 0a 11 80 01 	cmpl   $0x1,0x80110a28
{
801015f3:	8b 75 08             	mov    0x8(%ebp),%esi
801015f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	for (inum = 1; inum < sb.ninodes; inum++) {
801015f9:	0f 86 91 00 00 00    	jbe    80101690 <ialloc+0xb0>
801015ff:	bb 01 00 00 00       	mov    $0x1,%ebx
80101604:	eb 21                	jmp    80101627 <ialloc+0x47>
80101606:	8d 76 00             	lea    0x0(%esi),%esi
80101609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		brelse(bp);
80101610:	83 ec 0c             	sub    $0xc,%esp
	for (inum = 1; inum < sb.ninodes; inum++) {
80101613:	83 c3 01             	add    $0x1,%ebx
		brelse(bp);
80101616:	57                   	push   %edi
80101617:	e8 d4 eb ff ff       	call   801001f0 <brelse>
	for (inum = 1; inum < sb.ninodes; inum++) {
8010161c:	83 c4 10             	add    $0x10,%esp
8010161f:	3b 1d 28 0a 11 80    	cmp    0x80110a28,%ebx
80101625:	73 69                	jae    80101690 <ialloc+0xb0>
		bp = bread(dev, IBLOCK(inum, sb));
80101627:	89 d8                	mov    %ebx,%eax
80101629:	83 ec 08             	sub    $0x8,%esp
8010162c:	c1 e8 03             	shr    $0x3,%eax
8010162f:	03 05 34 0a 11 80    	add    0x80110a34,%eax
80101635:	50                   	push   %eax
80101636:	56                   	push   %esi
80101637:	e8 94 ea ff ff       	call   801000d0 <bread>
		if (dip->type == 0) { // a free inode
8010163c:	83 c4 10             	add    $0x10,%esp
		bp = bread(dev, IBLOCK(inum, sb));
8010163f:	89 c7                	mov    %eax,%edi
		dip = (struct dinode *)bp->data + inum % IPB;
80101641:	89 d8                	mov    %ebx,%eax
80101643:	83 e0 07             	and    $0x7,%eax
80101646:	c1 e0 06             	shl    $0x6,%eax
80101649:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
		if (dip->type == 0) { // a free inode
8010164d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101651:	75 bd                	jne    80101610 <ialloc+0x30>
			memset(dip, 0, sizeof(*dip));
80101653:	83 ec 04             	sub    $0x4,%esp
80101656:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101659:	6a 40                	push   $0x40
8010165b:	6a 00                	push   $0x0
8010165d:	51                   	push   %ecx
8010165e:	e8 2d 2f 00 00       	call   80104590 <memset>
			dip->type = type;
80101663:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101667:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010166a:	66 89 01             	mov    %ax,(%ecx)
			log_write(bp); // mark it allocated on the disk
8010166d:	89 3c 24             	mov    %edi,(%esp)
80101670:	e8 3b 18 00 00       	call   80102eb0 <log_write>
			brelse(bp);
80101675:	89 3c 24             	mov    %edi,(%esp)
80101678:	e8 73 eb ff ff       	call   801001f0 <brelse>
			return iget(dev, inum);
8010167d:	83 c4 10             	add    $0x10,%esp
}
80101680:	8d 65 f4             	lea    -0xc(%ebp),%esp
			return iget(dev, inum);
80101683:	89 da                	mov    %ebx,%edx
80101685:	89 f0                	mov    %esi,%eax
}
80101687:	5b                   	pop    %ebx
80101688:	5e                   	pop    %esi
80101689:	5f                   	pop    %edi
8010168a:	5d                   	pop    %ebp
			return iget(dev, inum);
8010168b:	e9 40 fc ff ff       	jmp    801012d0 <iget>
	panic("ialloc: no inodes");
80101690:	83 ec 0c             	sub    $0xc,%esp
80101693:	68 98 70 10 80       	push   $0x80107098
80101698:	e8 f3 ec ff ff       	call   80100390 <panic>
8010169d:	8d 76 00             	lea    0x0(%esi),%esi

801016a0 <iupdate>:
{
801016a0:	55                   	push   %ebp
801016a1:	89 e5                	mov    %esp,%ebp
801016a3:	56                   	push   %esi
801016a4:	53                   	push   %ebx
801016a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
	bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016a8:	8b 43 04             	mov    0x4(%ebx),%eax
	memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016ab:	83 c3 5c             	add    $0x5c,%ebx
	bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016ae:	83 ec 08             	sub    $0x8,%esp
801016b1:	c1 e8 03             	shr    $0x3,%eax
801016b4:	03 05 34 0a 11 80    	add    0x80110a34,%eax
801016ba:	50                   	push   %eax
801016bb:	ff 73 a4             	pushl  -0x5c(%ebx)
801016be:	e8 0d ea ff ff       	call   801000d0 <bread>
	dip->type = ip->type;
801016c3:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
	memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016c7:	83 c4 0c             	add    $0xc,%esp
	bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016ca:	89 c6                	mov    %eax,%esi
	dip = (struct dinode *)bp->data + ip->inum % IPB;
801016cc:	8b 43 a8             	mov    -0x58(%ebx),%eax
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
	dip->type = ip->type;
801016d9:	66 89 10             	mov    %dx,(%eax)
	dip->major = ip->major;
801016dc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
	memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016e0:	83 c0 0c             	add    $0xc,%eax
	dip->major = ip->major;
801016e3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
	dip->minor = ip->minor;
801016e7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801016eb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
	dip->nlink = ip->nlink;
801016ef:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801016f3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
	dip->size = ip->size;
801016f7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801016fa:	89 50 fc             	mov    %edx,-0x4(%eax)
	memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016fd:	6a 34                	push   $0x34
801016ff:	53                   	push   %ebx
80101700:	50                   	push   %eax
80101701:	e8 2a 2f 00 00       	call   80104630 <memmove>
	log_write(bp);
80101706:	89 34 24             	mov    %esi,(%esp)
80101709:	e8 a2 17 00 00       	call   80102eb0 <log_write>
	brelse(bp);
8010170e:	89 75 08             	mov    %esi,0x8(%ebp)
80101711:	83 c4 10             	add    $0x10,%esp
}
80101714:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101717:	5b                   	pop    %ebx
80101718:	5e                   	pop    %esi
80101719:	5d                   	pop    %ebp
	brelse(bp);
8010171a:	e9 d1 ea ff ff       	jmp    801001f0 <brelse>
8010171f:	90                   	nop

80101720 <idup>:
{
80101720:	55                   	push   %ebp
80101721:	89 e5                	mov    %esp,%ebp
80101723:	53                   	push   %ebx
80101724:	83 ec 10             	sub    $0x10,%esp
80101727:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquire(&icache.lock);
8010172a:	68 40 0a 11 80       	push   $0x80110a40
8010172f:	e8 ec 2c 00 00       	call   80104420 <acquire>
	ip->ref++;
80101734:	83 43 08 01          	addl   $0x1,0x8(%ebx)
	release(&icache.lock);
80101738:	c7 04 24 40 0a 11 80 	movl   $0x80110a40,(%esp)
8010173f:	e8 fc 2d 00 00       	call   80104540 <release>
}
80101744:	89 d8                	mov    %ebx,%eax
80101746:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101749:	c9                   	leave  
8010174a:	c3                   	ret    
8010174b:	90                   	nop
8010174c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101750 <ilock>:
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (ip == 0 || ip->ref < 1)
80101758:	85 db                	test   %ebx,%ebx
8010175a:	0f 84 b7 00 00 00    	je     80101817 <ilock+0xc7>
80101760:	8b 53 08             	mov    0x8(%ebx),%edx
80101763:	85 d2                	test   %edx,%edx
80101765:	0f 8e ac 00 00 00    	jle    80101817 <ilock+0xc7>
	acquiresleep(&ip->lock);
8010176b:	83 ec 0c             	sub    $0xc,%esp
8010176e:	8d 43 0c             	lea    0xc(%ebx),%eax
80101771:	50                   	push   %eax
80101772:	e8 d9 2a 00 00       	call   80104250 <acquiresleep>
	if (ip->valid == 0) {
80101777:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010177a:	83 c4 10             	add    $0x10,%esp
8010177d:	85 c0                	test   %eax,%eax
8010177f:	74 0f                	je     80101790 <ilock+0x40>
}
80101781:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101784:	5b                   	pop    %ebx
80101785:	5e                   	pop    %esi
80101786:	5d                   	pop    %ebp
80101787:	c3                   	ret    
80101788:	90                   	nop
80101789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101790:	8b 43 04             	mov    0x4(%ebx),%eax
80101793:	83 ec 08             	sub    $0x8,%esp
80101796:	c1 e8 03             	shr    $0x3,%eax
80101799:	03 05 34 0a 11 80    	add    0x80110a34,%eax
8010179f:	50                   	push   %eax
801017a0:	ff 33                	pushl  (%ebx)
801017a2:	e8 29 e9 ff ff       	call   801000d0 <bread>
		memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017a7:	83 c4 0c             	add    $0xc,%esp
		bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017aa:	89 c6                	mov    %eax,%esi
		dip = (struct dinode *)bp->data + ip->inum % IPB;
801017ac:	8b 43 04             	mov    0x4(%ebx),%eax
801017af:	83 e0 07             	and    $0x7,%eax
801017b2:	c1 e0 06             	shl    $0x6,%eax
801017b5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
		ip->type = dip->type;
801017b9:	0f b7 10             	movzwl (%eax),%edx
		memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017bc:	83 c0 0c             	add    $0xc,%eax
		ip->type = dip->type;
801017bf:	66 89 53 50          	mov    %dx,0x50(%ebx)
		ip->major = dip->major;
801017c3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017c7:	66 89 53 52          	mov    %dx,0x52(%ebx)
		ip->minor = dip->minor;
801017cb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017cf:	66 89 53 54          	mov    %dx,0x54(%ebx)
		ip->nlink = dip->nlink;
801017d3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801017d7:	66 89 53 56          	mov    %dx,0x56(%ebx)
		ip->size = dip->size;
801017db:	8b 50 fc             	mov    -0x4(%eax),%edx
801017de:	89 53 58             	mov    %edx,0x58(%ebx)
		memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017e1:	6a 34                	push   $0x34
801017e3:	50                   	push   %eax
801017e4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801017e7:	50                   	push   %eax
801017e8:	e8 43 2e 00 00       	call   80104630 <memmove>
		brelse(bp);
801017ed:	89 34 24             	mov    %esi,(%esp)
801017f0:	e8 fb e9 ff ff       	call   801001f0 <brelse>
		if (ip->type == 0)
801017f5:	83 c4 10             	add    $0x10,%esp
801017f8:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
		ip->valid = 1;
801017fd:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
		if (ip->type == 0)
80101804:	0f 85 77 ff ff ff    	jne    80101781 <ilock+0x31>
			panic("ilock: no type");
8010180a:	83 ec 0c             	sub    $0xc,%esp
8010180d:	68 b0 70 10 80       	push   $0x801070b0
80101812:	e8 79 eb ff ff       	call   80100390 <panic>
		panic("ilock");
80101817:	83 ec 0c             	sub    $0xc,%esp
8010181a:	68 aa 70 10 80       	push   $0x801070aa
8010181f:	e8 6c eb ff ff       	call   80100390 <panic>
80101824:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010182a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101830 <iunlock>:
{
80101830:	55                   	push   %ebp
80101831:	89 e5                	mov    %esp,%ebp
80101833:	56                   	push   %esi
80101834:	53                   	push   %ebx
80101835:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101838:	85 db                	test   %ebx,%ebx
8010183a:	74 28                	je     80101864 <iunlock+0x34>
8010183c:	83 ec 0c             	sub    $0xc,%esp
8010183f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101842:	56                   	push   %esi
80101843:	e8 a8 2a 00 00       	call   801042f0 <holdingsleep>
80101848:	83 c4 10             	add    $0x10,%esp
8010184b:	85 c0                	test   %eax,%eax
8010184d:	74 15                	je     80101864 <iunlock+0x34>
8010184f:	8b 43 08             	mov    0x8(%ebx),%eax
80101852:	85 c0                	test   %eax,%eax
80101854:	7e 0e                	jle    80101864 <iunlock+0x34>
	releasesleep(&ip->lock);
80101856:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101859:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010185c:	5b                   	pop    %ebx
8010185d:	5e                   	pop    %esi
8010185e:	5d                   	pop    %ebp
	releasesleep(&ip->lock);
8010185f:	e9 4c 2a 00 00       	jmp    801042b0 <releasesleep>
		panic("iunlock");
80101864:	83 ec 0c             	sub    $0xc,%esp
80101867:	68 bf 70 10 80       	push   $0x801070bf
8010186c:	e8 1f eb ff ff       	call   80100390 <panic>
80101871:	eb 0d                	jmp    80101880 <iput>
80101873:	90                   	nop
80101874:	90                   	nop
80101875:	90                   	nop
80101876:	90                   	nop
80101877:	90                   	nop
80101878:	90                   	nop
80101879:	90                   	nop
8010187a:	90                   	nop
8010187b:	90                   	nop
8010187c:	90                   	nop
8010187d:	90                   	nop
8010187e:	90                   	nop
8010187f:	90                   	nop

80101880 <iput>:
{
80101880:	55                   	push   %ebp
80101881:	89 e5                	mov    %esp,%ebp
80101883:	57                   	push   %edi
80101884:	56                   	push   %esi
80101885:	53                   	push   %ebx
80101886:	83 ec 28             	sub    $0x28,%esp
80101889:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquiresleep(&ip->lock);
8010188c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010188f:	57                   	push   %edi
80101890:	e8 bb 29 00 00       	call   80104250 <acquiresleep>
	if (ip->valid && ip->nlink == 0) {
80101895:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101898:	83 c4 10             	add    $0x10,%esp
8010189b:	85 d2                	test   %edx,%edx
8010189d:	74 07                	je     801018a6 <iput+0x26>
8010189f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801018a4:	74 32                	je     801018d8 <iput+0x58>
	releasesleep(&ip->lock);
801018a6:	83 ec 0c             	sub    $0xc,%esp
801018a9:	57                   	push   %edi
801018aa:	e8 01 2a 00 00       	call   801042b0 <releasesleep>
	acquire(&icache.lock);
801018af:	c7 04 24 40 0a 11 80 	movl   $0x80110a40,(%esp)
801018b6:	e8 65 2b 00 00       	call   80104420 <acquire>
	ip->ref--;
801018bb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
	release(&icache.lock);
801018bf:	83 c4 10             	add    $0x10,%esp
801018c2:	c7 45 08 40 0a 11 80 	movl   $0x80110a40,0x8(%ebp)
}
801018c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018cc:	5b                   	pop    %ebx
801018cd:	5e                   	pop    %esi
801018ce:	5f                   	pop    %edi
801018cf:	5d                   	pop    %ebp
	release(&icache.lock);
801018d0:	e9 6b 2c 00 00       	jmp    80104540 <release>
801018d5:	8d 76 00             	lea    0x0(%esi),%esi
		acquire(&icache.lock);
801018d8:	83 ec 0c             	sub    $0xc,%esp
801018db:	68 40 0a 11 80       	push   $0x80110a40
801018e0:	e8 3b 2b 00 00       	call   80104420 <acquire>
		int r = ip->ref;
801018e5:	8b 73 08             	mov    0x8(%ebx),%esi
		release(&icache.lock);
801018e8:	c7 04 24 40 0a 11 80 	movl   $0x80110a40,(%esp)
801018ef:	e8 4c 2c 00 00       	call   80104540 <release>
		if (r == 1) {
801018f4:	83 c4 10             	add    $0x10,%esp
801018f7:	83 fe 01             	cmp    $0x1,%esi
801018fa:	75 aa                	jne    801018a6 <iput+0x26>
801018fc:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101902:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101905:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101908:	89 cf                	mov    %ecx,%edi
8010190a:	eb 0b                	jmp    80101917 <iput+0x97>
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101910:	83 c6 04             	add    $0x4,%esi
{
	int i, j;
	struct buf *bp;
	uint *a;

	for (i = 0; i < NDIRECT; i++) {
80101913:	39 fe                	cmp    %edi,%esi
80101915:	74 19                	je     80101930 <iput+0xb0>
		if (ip->addrs[i]) {
80101917:	8b 16                	mov    (%esi),%edx
80101919:	85 d2                	test   %edx,%edx
8010191b:	74 f3                	je     80101910 <iput+0x90>
			bfree(ip->dev, ip->addrs[i]);
8010191d:	8b 03                	mov    (%ebx),%eax
8010191f:	e8 ac fb ff ff       	call   801014d0 <bfree>
			ip->addrs[i] = 0;
80101924:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010192a:	eb e4                	jmp    80101910 <iput+0x90>
8010192c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		}
	}

	if (ip->addrs[NDIRECT]) {
80101930:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101936:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101939:	85 c0                	test   %eax,%eax
8010193b:	75 33                	jne    80101970 <iput+0xf0>
		bfree(ip->dev, ip->addrs[NDIRECT]);
		ip->addrs[NDIRECT] = 0;
	}

	ip->size = 0;
	iupdate(ip);
8010193d:	83 ec 0c             	sub    $0xc,%esp
	ip->size = 0;
80101940:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
	iupdate(ip);
80101947:	53                   	push   %ebx
80101948:	e8 53 fd ff ff       	call   801016a0 <iupdate>
			ip->type = 0;
8010194d:	31 c0                	xor    %eax,%eax
8010194f:	66 89 43 50          	mov    %ax,0x50(%ebx)
			iupdate(ip);
80101953:	89 1c 24             	mov    %ebx,(%esp)
80101956:	e8 45 fd ff ff       	call   801016a0 <iupdate>
			ip->valid = 0;
8010195b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101962:	83 c4 10             	add    $0x10,%esp
80101965:	e9 3c ff ff ff       	jmp    801018a6 <iput+0x26>
8010196a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101970:	83 ec 08             	sub    $0x8,%esp
80101973:	50                   	push   %eax
80101974:	ff 33                	pushl  (%ebx)
80101976:	e8 55 e7 ff ff       	call   801000d0 <bread>
8010197b:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010197e:	83 c4 10             	add    $0x10,%esp
80101981:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101987:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		for (j = 0; j < NINDIRECT; j++) {
8010198a:	8d 70 5c             	lea    0x5c(%eax),%esi
8010198d:	89 cf                	mov    %ecx,%edi
8010198f:	eb 0e                	jmp    8010199f <iput+0x11f>
80101991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101998:	83 c6 04             	add    $0x4,%esi
8010199b:	39 f7                	cmp    %esi,%edi
8010199d:	74 11                	je     801019b0 <iput+0x130>
			if (a[j])
8010199f:	8b 16                	mov    (%esi),%edx
801019a1:	85 d2                	test   %edx,%edx
801019a3:	74 f3                	je     80101998 <iput+0x118>
				bfree(ip->dev, a[j]);
801019a5:	8b 03                	mov    (%ebx),%eax
801019a7:	e8 24 fb ff ff       	call   801014d0 <bfree>
801019ac:	eb ea                	jmp    80101998 <iput+0x118>
801019ae:	66 90                	xchg   %ax,%ax
		brelse(bp);
801019b0:	83 ec 0c             	sub    $0xc,%esp
801019b3:	ff 75 e4             	pushl  -0x1c(%ebp)
801019b6:	8b 7d e0             	mov    -0x20(%ebp),%edi
801019b9:	e8 32 e8 ff ff       	call   801001f0 <brelse>
		bfree(ip->dev, ip->addrs[NDIRECT]);
801019be:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801019c4:	8b 03                	mov    (%ebx),%eax
801019c6:	e8 05 fb ff ff       	call   801014d0 <bfree>
		ip->addrs[NDIRECT] = 0;
801019cb:	83 c4 10             	add    $0x10,%esp
801019ce:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801019d5:	00 00 00 
801019d8:	e9 60 ff ff ff       	jmp    8010193d <iput+0xbd>
801019dd:	8d 76 00             	lea    0x0(%esi),%esi

801019e0 <iunlockput>:
{
801019e0:	55                   	push   %ebp
801019e1:	89 e5                	mov    %esp,%ebp
801019e3:	53                   	push   %ebx
801019e4:	83 ec 10             	sub    $0x10,%esp
801019e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	iunlock(ip);
801019ea:	53                   	push   %ebx
801019eb:	e8 40 fe ff ff       	call   80101830 <iunlock>
	iput(ip);
801019f0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801019f3:	83 c4 10             	add    $0x10,%esp
}
801019f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801019f9:	c9                   	leave  
	iput(ip);
801019fa:	e9 81 fe ff ff       	jmp    80101880 <iput>
801019ff:	90                   	nop

80101a00 <stati>:
}

// Copy stat information from inode.
// Caller must hold ip->lock.
void stati(struct inode *ip, struct stat *st)
{
80101a00:	55                   	push   %ebp
80101a01:	89 e5                	mov    %esp,%ebp
80101a03:	8b 55 08             	mov    0x8(%ebp),%edx
80101a06:	8b 45 0c             	mov    0xc(%ebp),%eax
	st->dev = ip->dev;
80101a09:	8b 0a                	mov    (%edx),%ecx
80101a0b:	89 48 04             	mov    %ecx,0x4(%eax)
	st->ino = ip->inum;
80101a0e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a11:	89 48 08             	mov    %ecx,0x8(%eax)
	st->type = ip->type;
80101a14:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a18:	66 89 08             	mov    %cx,(%eax)
	st->nlink = ip->nlink;
80101a1b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a1f:	66 89 48 0c          	mov    %cx,0xc(%eax)
	st->size = ip->size;
80101a23:	8b 52 58             	mov    0x58(%edx),%edx
80101a26:	89 50 10             	mov    %edx,0x10(%eax)
}
80101a29:	5d                   	pop    %ebp
80101a2a:	c3                   	ret    
80101a2b:	90                   	nop
80101a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101a30 <readi>:

// Read data from inode.
// Caller must hold ip->lock.
int readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a30:	55                   	push   %ebp
80101a31:	89 e5                	mov    %esp,%ebp
80101a33:	57                   	push   %edi
80101a34:	56                   	push   %esi
80101a35:	53                   	push   %ebx
80101a36:	83 ec 1c             	sub    $0x1c,%esp
80101a39:	8b 45 08             	mov    0x8(%ebp),%eax
80101a3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a3f:	8b 7d 14             	mov    0x14(%ebp),%edi
	uint tot, m;
	struct buf *bp;

	if (ip->type == T_DEV) {
80101a42:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a47:	89 75 e0             	mov    %esi,-0x20(%ebp)
80101a4a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a4d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a50:	89 7d e4             	mov    %edi,-0x1c(%ebp)
	if (ip->type == T_DEV) {
80101a53:	0f 84 a7 00 00 00    	je     80101b00 <readi+0xd0>
		    || !devsw[ip->major].read)
			return -1;
		return devsw[ip->major].read(ip, dst, n);
	}

	if (off > ip->size || off + n < off)
80101a59:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a5c:	8b 40 58             	mov    0x58(%eax),%eax
80101a5f:	39 c6                	cmp    %eax,%esi
80101a61:	0f 87 ba 00 00 00    	ja     80101b21 <readi+0xf1>
80101a67:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101a6a:	89 f9                	mov    %edi,%ecx
80101a6c:	01 f1                	add    %esi,%ecx
80101a6e:	0f 82 ad 00 00 00    	jb     80101b21 <readi+0xf1>
		return -1;
	if (off + n > ip->size)
		n = ip->size - off;
80101a74:	89 c2                	mov    %eax,%edx
80101a76:	29 f2                	sub    %esi,%edx
80101a78:	39 c8                	cmp    %ecx,%eax
80101a7a:	0f 43 d7             	cmovae %edi,%edx

	for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80101a7d:	31 ff                	xor    %edi,%edi
		n = ip->size - off;
80101a7f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
	for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80101a82:	85 d2                	test   %edx,%edx
80101a84:	74 6c                	je     80101af2 <readi+0xc2>
80101a86:	8d 76 00             	lea    0x0(%esi),%esi
80101a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		bp = bread(ip->dev, bmap(ip, off / BSIZE));
80101a90:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101a93:	89 f2                	mov    %esi,%edx
80101a95:	c1 ea 09             	shr    $0x9,%edx
80101a98:	89 d8                	mov    %ebx,%eax
80101a9a:	e8 21 f9 ff ff       	call   801013c0 <bmap>
80101a9f:	83 ec 08             	sub    $0x8,%esp
80101aa2:	50                   	push   %eax
80101aa3:	ff 33                	pushl  (%ebx)
80101aa5:	e8 26 e6 ff ff       	call   801000d0 <bread>
		m = min(n - tot, BSIZE - off % BSIZE);
80101aaa:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101aad:	b9 00 02 00 00       	mov    $0x200,%ecx
80101ab2:	83 c4 0c             	add    $0xc,%esp
		bp = bread(ip->dev, bmap(ip, off / BSIZE));
80101ab5:	89 c2                	mov    %eax,%edx
		m = min(n - tot, BSIZE - off % BSIZE);
80101ab7:	89 f0                	mov    %esi,%eax
80101ab9:	25 ff 01 00 00       	and    $0x1ff,%eax
80101abe:	29 fb                	sub    %edi,%ebx
		memmove(dst, bp->data + off % BSIZE, m);
80101ac0:	89 55 dc             	mov    %edx,-0x24(%ebp)
		m = min(n - tot, BSIZE - off % BSIZE);
80101ac3:	29 c1                	sub    %eax,%ecx
		memmove(dst, bp->data + off % BSIZE, m);
80101ac5:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
		m = min(n - tot, BSIZE - off % BSIZE);
80101ac9:	39 d9                	cmp    %ebx,%ecx
80101acb:	0f 46 d9             	cmovbe %ecx,%ebx
		memmove(dst, bp->data + off % BSIZE, m);
80101ace:	53                   	push   %ebx
	for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80101acf:	01 df                	add    %ebx,%edi
80101ad1:	01 de                	add    %ebx,%esi
		memmove(dst, bp->data + off % BSIZE, m);
80101ad3:	50                   	push   %eax
80101ad4:	ff 75 e0             	pushl  -0x20(%ebp)
80101ad7:	e8 54 2b 00 00       	call   80104630 <memmove>
		brelse(bp);
80101adc:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101adf:	89 14 24             	mov    %edx,(%esp)
80101ae2:	e8 09 e7 ff ff       	call   801001f0 <brelse>
	for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80101ae7:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101aea:	83 c4 10             	add    $0x10,%esp
80101aed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101af0:	77 9e                	ja     80101a90 <readi+0x60>
	}
	return n;
80101af2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101af5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101af8:	5b                   	pop    %ebx
80101af9:	5e                   	pop    %esi
80101afa:	5f                   	pop    %edi
80101afb:	5d                   	pop    %ebp
80101afc:	c3                   	ret    
80101afd:	8d 76 00             	lea    0x0(%esi),%esi
		if (ip->major < 0 || ip->major >= NDEV
80101b00:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b04:	66 83 f8 09          	cmp    $0x9,%ax
80101b08:	77 17                	ja     80101b21 <readi+0xf1>
		    || !devsw[ip->major].read)
80101b0a:	8b 04 c5 c0 09 11 80 	mov    -0x7feef640(,%eax,8),%eax
80101b11:	85 c0                	test   %eax,%eax
80101b13:	74 0c                	je     80101b21 <readi+0xf1>
		return devsw[ip->major].read(ip, dst, n);
80101b15:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b1b:	5b                   	pop    %ebx
80101b1c:	5e                   	pop    %esi
80101b1d:	5f                   	pop    %edi
80101b1e:	5d                   	pop    %ebp
		return devsw[ip->major].read(ip, dst, n);
80101b1f:	ff e0                	jmp    *%eax
			return -1;
80101b21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b26:	eb cd                	jmp    80101af5 <readi+0xc5>
80101b28:	90                   	nop
80101b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101b30 <writei>:

// Write data to inode.
// Caller must hold ip->lock.
int writei(struct inode *ip, char *src, uint off, uint n)
{
80101b30:	55                   	push   %ebp
80101b31:	89 e5                	mov    %esp,%ebp
80101b33:	57                   	push   %edi
80101b34:	56                   	push   %esi
80101b35:	53                   	push   %ebx
80101b36:	83 ec 1c             	sub    $0x1c,%esp
80101b39:	8b 45 08             	mov    0x8(%ebp),%eax
80101b3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b3f:	8b 7d 14             	mov    0x14(%ebp),%edi
	uint tot, m;
	struct buf *bp;

	if (ip->type == T_DEV) {
80101b42:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101b47:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101b4a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101b4d:	8b 75 10             	mov    0x10(%ebp),%esi
80101b50:	89 7d e0             	mov    %edi,-0x20(%ebp)
	if (ip->type == T_DEV) {
80101b53:	0f 84 b7 00 00 00    	je     80101c10 <writei+0xe0>
		    || !devsw[ip->major].write)
			return -1;
		return devsw[ip->major].write(ip, src, n);
	}

	if (off > ip->size || off + n < off)
80101b59:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b5c:	39 70 58             	cmp    %esi,0x58(%eax)
80101b5f:	0f 82 e7 00 00 00    	jb     80101c4c <writei+0x11c>
		return -1;
	if (off + n > MAXFILE * BSIZE)
80101b65:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101b68:	89 f8                	mov    %edi,%eax
80101b6a:	01 f0                	add    %esi,%eax
80101b6c:	0f 82 da 00 00 00    	jb     80101c4c <writei+0x11c>
80101b72:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101b77:	0f 87 cf 00 00 00    	ja     80101c4c <writei+0x11c>
		return -1;

	for (tot = 0; tot < n; tot += m, off += m, src += m) {
80101b7d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101b84:	85 ff                	test   %edi,%edi
80101b86:	74 79                	je     80101c01 <writei+0xd1>
80101b88:	90                   	nop
80101b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		bp = bread(ip->dev, bmap(ip, off / BSIZE));
80101b90:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101b93:	89 f2                	mov    %esi,%edx
80101b95:	c1 ea 09             	shr    $0x9,%edx
80101b98:	89 f8                	mov    %edi,%eax
80101b9a:	e8 21 f8 ff ff       	call   801013c0 <bmap>
80101b9f:	83 ec 08             	sub    $0x8,%esp
80101ba2:	50                   	push   %eax
80101ba3:	ff 37                	pushl  (%edi)
80101ba5:	e8 26 e5 ff ff       	call   801000d0 <bread>
		m = min(n - tot, BSIZE - off % BSIZE);
80101baa:	b9 00 02 00 00       	mov    $0x200,%ecx
80101baf:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101bb2:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
		bp = bread(ip->dev, bmap(ip, off / BSIZE));
80101bb5:	89 c7                	mov    %eax,%edi
		m = min(n - tot, BSIZE - off % BSIZE);
80101bb7:	89 f0                	mov    %esi,%eax
80101bb9:	83 c4 0c             	add    $0xc,%esp
80101bbc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101bc1:	29 c1                	sub    %eax,%ecx
		memmove(bp->data + off % BSIZE, src, m);
80101bc3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
		m = min(n - tot, BSIZE - off % BSIZE);
80101bc7:	39 d9                	cmp    %ebx,%ecx
80101bc9:	0f 46 d9             	cmovbe %ecx,%ebx
		memmove(bp->data + off % BSIZE, src, m);
80101bcc:	53                   	push   %ebx
	for (tot = 0; tot < n; tot += m, off += m, src += m) {
80101bcd:	01 de                	add    %ebx,%esi
		memmove(bp->data + off % BSIZE, src, m);
80101bcf:	ff 75 dc             	pushl  -0x24(%ebp)
80101bd2:	50                   	push   %eax
80101bd3:	e8 58 2a 00 00       	call   80104630 <memmove>
		log_write(bp);
80101bd8:	89 3c 24             	mov    %edi,(%esp)
80101bdb:	e8 d0 12 00 00       	call   80102eb0 <log_write>
		brelse(bp);
80101be0:	89 3c 24             	mov    %edi,(%esp)
80101be3:	e8 08 e6 ff ff       	call   801001f0 <brelse>
	for (tot = 0; tot < n; tot += m, off += m, src += m) {
80101be8:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101beb:	83 c4 10             	add    $0x10,%esp
80101bee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101bf1:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101bf4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101bf7:	77 97                	ja     80101b90 <writei+0x60>
	}

	if (n > 0 && off > ip->size) {
80101bf9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bfc:	3b 70 58             	cmp    0x58(%eax),%esi
80101bff:	77 37                	ja     80101c38 <writei+0x108>
		ip->size = off;
		iupdate(ip);
	}
	return n;
80101c01:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101c04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c07:	5b                   	pop    %ebx
80101c08:	5e                   	pop    %esi
80101c09:	5f                   	pop    %edi
80101c0a:	5d                   	pop    %ebp
80101c0b:	c3                   	ret    
80101c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (ip->major < 0 || ip->major >= NDEV
80101c10:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c14:	66 83 f8 09          	cmp    $0x9,%ax
80101c18:	77 32                	ja     80101c4c <writei+0x11c>
		    || !devsw[ip->major].write)
80101c1a:	8b 04 c5 c4 09 11 80 	mov    -0x7feef63c(,%eax,8),%eax
80101c21:	85 c0                	test   %eax,%eax
80101c23:	74 27                	je     80101c4c <writei+0x11c>
		return devsw[ip->major].write(ip, src, n);
80101c25:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101c28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c2b:	5b                   	pop    %ebx
80101c2c:	5e                   	pop    %esi
80101c2d:	5f                   	pop    %edi
80101c2e:	5d                   	pop    %ebp
		return devsw[ip->major].write(ip, src, n);
80101c2f:	ff e0                	jmp    *%eax
80101c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		ip->size = off;
80101c38:	8b 45 d8             	mov    -0x28(%ebp),%eax
		iupdate(ip);
80101c3b:	83 ec 0c             	sub    $0xc,%esp
		ip->size = off;
80101c3e:	89 70 58             	mov    %esi,0x58(%eax)
		iupdate(ip);
80101c41:	50                   	push   %eax
80101c42:	e8 59 fa ff ff       	call   801016a0 <iupdate>
80101c47:	83 c4 10             	add    $0x10,%esp
80101c4a:	eb b5                	jmp    80101c01 <writei+0xd1>
			return -1;
80101c4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c51:	eb b1                	jmp    80101c04 <writei+0xd4>
80101c53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c60 <namecmp>:

// Directories

int namecmp(const char *s, const char *t)
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	83 ec 0c             	sub    $0xc,%esp
	return strncmp(s, t, DIRSIZ);
80101c66:	6a 0e                	push   $0xe
80101c68:	ff 75 0c             	pushl  0xc(%ebp)
80101c6b:	ff 75 08             	pushl  0x8(%ebp)
80101c6e:	e8 2d 2a 00 00       	call   801046a0 <strncmp>
}
80101c73:	c9                   	leave  
80101c74:	c3                   	ret    
80101c75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c80 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode *dirlookup(struct inode *dp, char *name, uint *poff)
{
80101c80:	55                   	push   %ebp
80101c81:	89 e5                	mov    %esp,%ebp
80101c83:	57                   	push   %edi
80101c84:	56                   	push   %esi
80101c85:	53                   	push   %ebx
80101c86:	83 ec 1c             	sub    $0x1c,%esp
80101c89:	8b 5d 08             	mov    0x8(%ebp),%ebx
	uint off, inum;
	struct dirent de;

	if (dp->type != T_DIR)
80101c8c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c91:	0f 85 85 00 00 00    	jne    80101d1c <dirlookup+0x9c>
		panic("dirlookup not DIR");

	for (off = 0; off < dp->size; off += sizeof(de)) {
80101c97:	8b 53 58             	mov    0x58(%ebx),%edx
80101c9a:	31 ff                	xor    %edi,%edi
80101c9c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c9f:	85 d2                	test   %edx,%edx
80101ca1:	74 3e                	je     80101ce1 <dirlookup+0x61>
80101ca3:	90                   	nop
80101ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (readi(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80101ca8:	6a 10                	push   $0x10
80101caa:	57                   	push   %edi
80101cab:	56                   	push   %esi
80101cac:	53                   	push   %ebx
80101cad:	e8 7e fd ff ff       	call   80101a30 <readi>
80101cb2:	83 c4 10             	add    $0x10,%esp
80101cb5:	83 f8 10             	cmp    $0x10,%eax
80101cb8:	75 55                	jne    80101d0f <dirlookup+0x8f>
			panic("dirlookup read");
		if (de.inum == 0)
80101cba:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101cbf:	74 18                	je     80101cd9 <dirlookup+0x59>
	return strncmp(s, t, DIRSIZ);
80101cc1:	83 ec 04             	sub    $0x4,%esp
80101cc4:	8d 45 da             	lea    -0x26(%ebp),%eax
80101cc7:	6a 0e                	push   $0xe
80101cc9:	50                   	push   %eax
80101cca:	ff 75 0c             	pushl  0xc(%ebp)
80101ccd:	e8 ce 29 00 00       	call   801046a0 <strncmp>
			continue;
		if (namecmp(name, de.name) == 0) {
80101cd2:	83 c4 10             	add    $0x10,%esp
80101cd5:	85 c0                	test   %eax,%eax
80101cd7:	74 17                	je     80101cf0 <dirlookup+0x70>
	for (off = 0; off < dp->size; off += sizeof(de)) {
80101cd9:	83 c7 10             	add    $0x10,%edi
80101cdc:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101cdf:	72 c7                	jb     80101ca8 <dirlookup+0x28>
			return iget(dp->dev, inum);
		}
	}

	return 0;
}
80101ce1:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return 0;
80101ce4:	31 c0                	xor    %eax,%eax
}
80101ce6:	5b                   	pop    %ebx
80101ce7:	5e                   	pop    %esi
80101ce8:	5f                   	pop    %edi
80101ce9:	5d                   	pop    %ebp
80101cea:	c3                   	ret    
80101ceb:	90                   	nop
80101cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			if (poff)
80101cf0:	8b 45 10             	mov    0x10(%ebp),%eax
80101cf3:	85 c0                	test   %eax,%eax
80101cf5:	74 05                	je     80101cfc <dirlookup+0x7c>
				*poff = off;
80101cf7:	8b 45 10             	mov    0x10(%ebp),%eax
80101cfa:	89 38                	mov    %edi,(%eax)
			inum = de.inum;
80101cfc:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
			return iget(dp->dev, inum);
80101d00:	8b 03                	mov    (%ebx),%eax
80101d02:	e8 c9 f5 ff ff       	call   801012d0 <iget>
}
80101d07:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d0a:	5b                   	pop    %ebx
80101d0b:	5e                   	pop    %esi
80101d0c:	5f                   	pop    %edi
80101d0d:	5d                   	pop    %ebp
80101d0e:	c3                   	ret    
			panic("dirlookup read");
80101d0f:	83 ec 0c             	sub    $0xc,%esp
80101d12:	68 d9 70 10 80       	push   $0x801070d9
80101d17:	e8 74 e6 ff ff       	call   80100390 <panic>
		panic("dirlookup not DIR");
80101d1c:	83 ec 0c             	sub    $0xc,%esp
80101d1f:	68 c7 70 10 80       	push   $0x801070c7
80101d24:	e8 67 e6 ff ff       	call   80100390 <panic>
80101d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101d30 <namex>:
// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode *namex(char *path, int nameiparent, char *name)
{
80101d30:	55                   	push   %ebp
80101d31:	89 e5                	mov    %esp,%ebp
80101d33:	57                   	push   %edi
80101d34:	56                   	push   %esi
80101d35:	53                   	push   %ebx
80101d36:	89 c3                	mov    %eax,%ebx
80101d38:	83 ec 1c             	sub    $0x1c,%esp
	struct inode *ip, *next;

	if (*path == '/')
80101d3b:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101d3e:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101d41:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
	if (*path == '/')
80101d44:	0f 84 86 01 00 00    	je     80101ed0 <namex+0x1a0>
		ip = iget(ROOTDEV, ROOTINO);
	else
		ip = idup(myproc()->cwd);
80101d4a:	e8 c1 1b 00 00       	call   80103910 <myproc>
	acquire(&icache.lock);
80101d4f:	83 ec 0c             	sub    $0xc,%esp
80101d52:	89 df                	mov    %ebx,%edi
		ip = idup(myproc()->cwd);
80101d54:	8b 70 68             	mov    0x68(%eax),%esi
	acquire(&icache.lock);
80101d57:	68 40 0a 11 80       	push   $0x80110a40
80101d5c:	e8 bf 26 00 00       	call   80104420 <acquire>
	ip->ref++;
80101d61:	83 46 08 01          	addl   $0x1,0x8(%esi)
	release(&icache.lock);
80101d65:	c7 04 24 40 0a 11 80 	movl   $0x80110a40,(%esp)
80101d6c:	e8 cf 27 00 00       	call   80104540 <release>
80101d71:	83 c4 10             	add    $0x10,%esp
80101d74:	eb 0d                	jmp    80101d83 <namex+0x53>
80101d76:	8d 76 00             	lea    0x0(%esi),%esi
80101d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		path++;
80101d80:	83 c7 01             	add    $0x1,%edi
	while (*path == '/')
80101d83:	0f b6 07             	movzbl (%edi),%eax
80101d86:	3c 2f                	cmp    $0x2f,%al
80101d88:	74 f6                	je     80101d80 <namex+0x50>
	if (*path == 0)
80101d8a:	84 c0                	test   %al,%al
80101d8c:	0f 84 ee 00 00 00    	je     80101e80 <namex+0x150>
	while (*path != '/' && *path != 0)
80101d92:	0f b6 07             	movzbl (%edi),%eax
80101d95:	3c 2f                	cmp    $0x2f,%al
80101d97:	0f 84 fb 00 00 00    	je     80101e98 <namex+0x168>
80101d9d:	89 fb                	mov    %edi,%ebx
80101d9f:	84 c0                	test   %al,%al
80101da1:	0f 84 f1 00 00 00    	je     80101e98 <namex+0x168>
80101da7:	89 f6                	mov    %esi,%esi
80101da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		path++;
80101db0:	83 c3 01             	add    $0x1,%ebx
	while (*path != '/' && *path != 0)
80101db3:	0f b6 03             	movzbl (%ebx),%eax
80101db6:	3c 2f                	cmp    $0x2f,%al
80101db8:	74 04                	je     80101dbe <namex+0x8e>
80101dba:	84 c0                	test   %al,%al
80101dbc:	75 f2                	jne    80101db0 <namex+0x80>
	len = path - s;
80101dbe:	89 d8                	mov    %ebx,%eax
80101dc0:	29 f8                	sub    %edi,%eax
	if (len >= DIRSIZ)
80101dc2:	83 f8 0d             	cmp    $0xd,%eax
80101dc5:	0f 8e 85 00 00 00    	jle    80101e50 <namex+0x120>
		memmove(name, s, DIRSIZ);
80101dcb:	83 ec 04             	sub    $0x4,%esp
80101dce:	6a 0e                	push   $0xe
80101dd0:	57                   	push   %edi
		path++;
80101dd1:	89 df                	mov    %ebx,%edi
		memmove(name, s, DIRSIZ);
80101dd3:	ff 75 e4             	pushl  -0x1c(%ebp)
80101dd6:	e8 55 28 00 00       	call   80104630 <memmove>
80101ddb:	83 c4 10             	add    $0x10,%esp
	while (*path == '/')
80101dde:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101de1:	75 0d                	jne    80101df0 <namex+0xc0>
80101de3:	90                   	nop
80101de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		path++;
80101de8:	83 c7 01             	add    $0x1,%edi
	while (*path == '/')
80101deb:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101dee:	74 f8                	je     80101de8 <namex+0xb8>

	while ((path = skipelem(path, name)) != 0) {
		ilock(ip);
80101df0:	83 ec 0c             	sub    $0xc,%esp
80101df3:	56                   	push   %esi
80101df4:	e8 57 f9 ff ff       	call   80101750 <ilock>
		if (ip->type != T_DIR) {
80101df9:	83 c4 10             	add    $0x10,%esp
80101dfc:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e01:	0f 85 a1 00 00 00    	jne    80101ea8 <namex+0x178>
			iunlockput(ip);
			return 0;
		}
		if (nameiparent && *path == '\0') {
80101e07:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101e0a:	85 d2                	test   %edx,%edx
80101e0c:	74 09                	je     80101e17 <namex+0xe7>
80101e0e:	80 3f 00             	cmpb   $0x0,(%edi)
80101e11:	0f 84 d9 00 00 00    	je     80101ef0 <namex+0x1c0>
			// Stop one level early.
			iunlock(ip);
			return ip;
		}
		if ((next = dirlookup(ip, name, 0)) == 0) {
80101e17:	83 ec 04             	sub    $0x4,%esp
80101e1a:	6a 00                	push   $0x0
80101e1c:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e1f:	56                   	push   %esi
80101e20:	e8 5b fe ff ff       	call   80101c80 <dirlookup>
80101e25:	83 c4 10             	add    $0x10,%esp
80101e28:	89 c3                	mov    %eax,%ebx
80101e2a:	85 c0                	test   %eax,%eax
80101e2c:	74 7a                	je     80101ea8 <namex+0x178>
	iunlock(ip);
80101e2e:	83 ec 0c             	sub    $0xc,%esp
80101e31:	56                   	push   %esi
80101e32:	e8 f9 f9 ff ff       	call   80101830 <iunlock>
	iput(ip);
80101e37:	89 34 24             	mov    %esi,(%esp)
80101e3a:	89 de                	mov    %ebx,%esi
80101e3c:	e8 3f fa ff ff       	call   80101880 <iput>
	while (*path == '/')
80101e41:	83 c4 10             	add    $0x10,%esp
80101e44:	e9 3a ff ff ff       	jmp    80101d83 <namex+0x53>
80101e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101e53:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
80101e56:	89 4d dc             	mov    %ecx,-0x24(%ebp)
		memmove(name, s, len);
80101e59:	83 ec 04             	sub    $0x4,%esp
80101e5c:	50                   	push   %eax
80101e5d:	57                   	push   %edi
		name[len] = 0;
80101e5e:	89 df                	mov    %ebx,%edi
		memmove(name, s, len);
80101e60:	ff 75 e4             	pushl  -0x1c(%ebp)
80101e63:	e8 c8 27 00 00       	call   80104630 <memmove>
		name[len] = 0;
80101e68:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e6b:	83 c4 10             	add    $0x10,%esp
80101e6e:	c6 00 00             	movb   $0x0,(%eax)
80101e71:	e9 68 ff ff ff       	jmp    80101dde <namex+0xae>
80101e76:	8d 76 00             	lea    0x0(%esi),%esi
80101e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			return 0;
		}
		iunlockput(ip);
		ip = next;
	}
	if (nameiparent) {
80101e80:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101e83:	85 c0                	test   %eax,%eax
80101e85:	0f 85 85 00 00 00    	jne    80101f10 <namex+0x1e0>
		iput(ip);
		return 0;
	}
	return ip;
}
80101e8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e8e:	89 f0                	mov    %esi,%eax
80101e90:	5b                   	pop    %ebx
80101e91:	5e                   	pop    %esi
80101e92:	5f                   	pop    %edi
80101e93:	5d                   	pop    %ebp
80101e94:	c3                   	ret    
80101e95:	8d 76 00             	lea    0x0(%esi),%esi
	while (*path != '/' && *path != 0)
80101e98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e9b:	89 fb                	mov    %edi,%ebx
80101e9d:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101ea0:	31 c0                	xor    %eax,%eax
80101ea2:	eb b5                	jmp    80101e59 <namex+0x129>
80101ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	iunlock(ip);
80101ea8:	83 ec 0c             	sub    $0xc,%esp
80101eab:	56                   	push   %esi
80101eac:	e8 7f f9 ff ff       	call   80101830 <iunlock>
	iput(ip);
80101eb1:	89 34 24             	mov    %esi,(%esp)
			return 0;
80101eb4:	31 f6                	xor    %esi,%esi
	iput(ip);
80101eb6:	e8 c5 f9 ff ff       	call   80101880 <iput>
			return 0;
80101ebb:	83 c4 10             	add    $0x10,%esp
}
80101ebe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ec1:	89 f0                	mov    %esi,%eax
80101ec3:	5b                   	pop    %ebx
80101ec4:	5e                   	pop    %esi
80101ec5:	5f                   	pop    %edi
80101ec6:	5d                   	pop    %ebp
80101ec7:	c3                   	ret    
80101ec8:	90                   	nop
80101ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		ip = iget(ROOTDEV, ROOTINO);
80101ed0:	ba 01 00 00 00       	mov    $0x1,%edx
80101ed5:	b8 01 00 00 00       	mov    $0x1,%eax
80101eda:	89 df                	mov    %ebx,%edi
80101edc:	e8 ef f3 ff ff       	call   801012d0 <iget>
80101ee1:	89 c6                	mov    %eax,%esi
80101ee3:	e9 9b fe ff ff       	jmp    80101d83 <namex+0x53>
80101ee8:	90                   	nop
80101ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			iunlock(ip);
80101ef0:	83 ec 0c             	sub    $0xc,%esp
80101ef3:	56                   	push   %esi
80101ef4:	e8 37 f9 ff ff       	call   80101830 <iunlock>
			return ip;
80101ef9:	83 c4 10             	add    $0x10,%esp
}
80101efc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eff:	89 f0                	mov    %esi,%eax
80101f01:	5b                   	pop    %ebx
80101f02:	5e                   	pop    %esi
80101f03:	5f                   	pop    %edi
80101f04:	5d                   	pop    %ebp
80101f05:	c3                   	ret    
80101f06:	8d 76 00             	lea    0x0(%esi),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		iput(ip);
80101f10:	83 ec 0c             	sub    $0xc,%esp
80101f13:	56                   	push   %esi
		return 0;
80101f14:	31 f6                	xor    %esi,%esi
		iput(ip);
80101f16:	e8 65 f9 ff ff       	call   80101880 <iput>
		return 0;
80101f1b:	83 c4 10             	add    $0x10,%esp
80101f1e:	e9 68 ff ff ff       	jmp    80101e8b <namex+0x15b>
80101f23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f30 <dirlink>:
{
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 20             	sub    $0x20,%esp
80101f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if ((ip = dirlookup(dp, name, 0)) != 0) {
80101f3c:	6a 00                	push   $0x0
80101f3e:	ff 75 0c             	pushl  0xc(%ebp)
80101f41:	53                   	push   %ebx
80101f42:	e8 39 fd ff ff       	call   80101c80 <dirlookup>
80101f47:	83 c4 10             	add    $0x10,%esp
80101f4a:	85 c0                	test   %eax,%eax
80101f4c:	75 67                	jne    80101fb5 <dirlink+0x85>
	for (off = 0; off < dp->size; off += sizeof(de)) {
80101f4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101f51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f54:	85 ff                	test   %edi,%edi
80101f56:	74 29                	je     80101f81 <dirlink+0x51>
80101f58:	31 ff                	xor    %edi,%edi
80101f5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f5d:	eb 09                	jmp    80101f68 <dirlink+0x38>
80101f5f:	90                   	nop
80101f60:	83 c7 10             	add    $0x10,%edi
80101f63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101f66:	73 19                	jae    80101f81 <dirlink+0x51>
		if (readi(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80101f68:	6a 10                	push   $0x10
80101f6a:	57                   	push   %edi
80101f6b:	56                   	push   %esi
80101f6c:	53                   	push   %ebx
80101f6d:	e8 be fa ff ff       	call   80101a30 <readi>
80101f72:	83 c4 10             	add    $0x10,%esp
80101f75:	83 f8 10             	cmp    $0x10,%eax
80101f78:	75 4e                	jne    80101fc8 <dirlink+0x98>
		if (de.inum == 0)
80101f7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101f7f:	75 df                	jne    80101f60 <dirlink+0x30>
	strncpy(de.name, name, DIRSIZ);
80101f81:	83 ec 04             	sub    $0x4,%esp
80101f84:	8d 45 da             	lea    -0x26(%ebp),%eax
80101f87:	6a 0e                	push   $0xe
80101f89:	ff 75 0c             	pushl  0xc(%ebp)
80101f8c:	50                   	push   %eax
80101f8d:	e8 6e 27 00 00       	call   80104700 <strncpy>
	if (writei(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80101f92:	6a 10                	push   $0x10
	de.inum = inum;
80101f94:	8b 45 10             	mov    0x10(%ebp),%eax
	if (writei(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80101f97:	57                   	push   %edi
80101f98:	56                   	push   %esi
80101f99:	53                   	push   %ebx
	de.inum = inum;
80101f9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
	if (writei(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80101f9e:	e8 8d fb ff ff       	call   80101b30 <writei>
80101fa3:	83 c4 20             	add    $0x20,%esp
80101fa6:	83 f8 10             	cmp    $0x10,%eax
80101fa9:	75 2a                	jne    80101fd5 <dirlink+0xa5>
	return 0;
80101fab:	31 c0                	xor    %eax,%eax
}
80101fad:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fb0:	5b                   	pop    %ebx
80101fb1:	5e                   	pop    %esi
80101fb2:	5f                   	pop    %edi
80101fb3:	5d                   	pop    %ebp
80101fb4:	c3                   	ret    
		iput(ip);
80101fb5:	83 ec 0c             	sub    $0xc,%esp
80101fb8:	50                   	push   %eax
80101fb9:	e8 c2 f8 ff ff       	call   80101880 <iput>
		return -1;
80101fbe:	83 c4 10             	add    $0x10,%esp
80101fc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101fc6:	eb e5                	jmp    80101fad <dirlink+0x7d>
			panic("dirlink read");
80101fc8:	83 ec 0c             	sub    $0xc,%esp
80101fcb:	68 e8 70 10 80       	push   $0x801070e8
80101fd0:	e8 bb e3 ff ff       	call   80100390 <panic>
		panic("dirlink");
80101fd5:	83 ec 0c             	sub    $0xc,%esp
80101fd8:	68 de 76 10 80       	push   $0x801076de
80101fdd:	e8 ae e3 ff ff       	call   80100390 <panic>
80101fe2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ff0 <namei>:

struct inode *namei(char *path)
{
80101ff0:	55                   	push   %ebp
	char name[DIRSIZ];
	return namex(path, 0, name);
80101ff1:	31 d2                	xor    %edx,%edx
{
80101ff3:	89 e5                	mov    %esp,%ebp
80101ff5:	83 ec 18             	sub    $0x18,%esp
	return namex(path, 0, name);
80101ff8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ffb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ffe:	e8 2d fd ff ff       	call   80101d30 <namex>
}
80102003:	c9                   	leave  
80102004:	c3                   	ret    
80102005:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <nameiparent>:

struct inode *nameiparent(char *path, char *name)
{
80102010:	55                   	push   %ebp
	return namex(path, 1, name);
80102011:	ba 01 00 00 00       	mov    $0x1,%edx
{
80102016:	89 e5                	mov    %esp,%ebp
	return namex(path, 1, name);
80102018:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010201b:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010201e:	5d                   	pop    %ebp
	return namex(path, 1, name);
8010201f:	e9 0c fd ff ff       	jmp    80101d30 <namex>
80102024:	66 90                	xchg   %ax,%ax
80102026:	66 90                	xchg   %ax,%ax
80102028:	66 90                	xchg   %ax,%ax
8010202a:	66 90                	xchg   %ax,%ax
8010202c:	66 90                	xchg   %ax,%ax
8010202e:	66 90                	xchg   %ax,%ax

80102030 <idestart>:
	outb(0x1f6, 0xe0 | (0 << 4));
}

// Start the request for b.  Caller must hold idelock.
static void idestart(struct buf *b)
{
80102030:	55                   	push   %ebp
80102031:	89 e5                	mov    %esp,%ebp
80102033:	57                   	push   %edi
80102034:	56                   	push   %esi
80102035:	53                   	push   %ebx
80102036:	83 ec 0c             	sub    $0xc,%esp
	if (b == 0)
80102039:	85 c0                	test   %eax,%eax
8010203b:	0f 84 b4 00 00 00    	je     801020f5 <idestart+0xc5>
		panic("idestart");
	if (b->blockno >= FSSIZE)
80102041:	8b 70 08             	mov    0x8(%eax),%esi
80102044:	89 c3                	mov    %eax,%ebx
80102046:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
8010204c:	0f 87 96 00 00 00    	ja     801020e8 <idestart+0xb8>
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102052:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102057:	89 f6                	mov    %esi,%esi
80102059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102060:	89 ca                	mov    %ecx,%edx
80102062:	ec                   	in     (%dx),%al
	while (((r = inb(0x1f7)) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY)
80102063:	83 e0 c0             	and    $0xffffffc0,%eax
80102066:	3c 40                	cmp    $0x40,%al
80102068:	75 f6                	jne    80102060 <idestart+0x30>
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
8010206a:	31 ff                	xor    %edi,%edi
8010206c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102071:	89 f8                	mov    %edi,%eax
80102073:	ee                   	out    %al,(%dx)
80102074:	b8 01 00 00 00       	mov    $0x1,%eax
80102079:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010207e:	ee                   	out    %al,(%dx)
8010207f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102084:	89 f0                	mov    %esi,%eax
80102086:	ee                   	out    %al,(%dx)

	idewait(0);
	outb(0x3f6, 0);		       // generate interrupt
	outb(0x1f2, sector_per_block); // number of sectors
	outb(0x1f3, sector & 0xff);
	outb(0x1f4, (sector >> 8) & 0xff);
80102087:	89 f0                	mov    %esi,%eax
80102089:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010208e:	c1 f8 08             	sar    $0x8,%eax
80102091:	ee                   	out    %al,(%dx)
80102092:	ba f5 01 00 00       	mov    $0x1f5,%edx
80102097:	89 f8                	mov    %edi,%eax
80102099:	ee                   	out    %al,(%dx)
	outb(0x1f5, (sector >> 16) & 0xff);
	outb(0x1f6, 0xe0 | ((b->dev & 1) << 4) | ((sector >> 24) & 0x0f));
8010209a:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
8010209e:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020a3:	c1 e0 04             	shl    $0x4,%eax
801020a6:	83 e0 10             	and    $0x10,%eax
801020a9:	83 c8 e0             	or     $0xffffffe0,%eax
801020ac:	ee                   	out    %al,(%dx)
	if (b->flags & B_DIRTY) {
801020ad:	f6 03 04             	testb  $0x4,(%ebx)
801020b0:	75 16                	jne    801020c8 <idestart+0x98>
801020b2:	b8 20 00 00 00       	mov    $0x20,%eax
801020b7:	89 ca                	mov    %ecx,%edx
801020b9:	ee                   	out    %al,(%dx)
		outb(0x1f7, write_cmd);
		outsl(0x1f0, b->data, BSIZE / 4);
	} else {
		outb(0x1f7, read_cmd);
	}
}
801020ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020bd:	5b                   	pop    %ebx
801020be:	5e                   	pop    %esi
801020bf:	5f                   	pop    %edi
801020c0:	5d                   	pop    %ebp
801020c1:	c3                   	ret    
801020c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801020c8:	b8 30 00 00 00       	mov    $0x30,%eax
801020cd:	89 ca                	mov    %ecx,%edx
801020cf:	ee                   	out    %al,(%dx)
	asm volatile("cld; rep outsl"
801020d0:	b9 80 00 00 00       	mov    $0x80,%ecx
		outsl(0x1f0, b->data, BSIZE / 4);
801020d5:	8d 73 5c             	lea    0x5c(%ebx),%esi
801020d8:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020dd:	fc                   	cld    
801020de:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
801020e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020e3:	5b                   	pop    %ebx
801020e4:	5e                   	pop    %esi
801020e5:	5f                   	pop    %edi
801020e6:	5d                   	pop    %ebp
801020e7:	c3                   	ret    
		panic("incorrect blockno");
801020e8:	83 ec 0c             	sub    $0xc,%esp
801020eb:	68 54 71 10 80       	push   $0x80107154
801020f0:	e8 9b e2 ff ff       	call   80100390 <panic>
		panic("idestart");
801020f5:	83 ec 0c             	sub    $0xc,%esp
801020f8:	68 4b 71 10 80       	push   $0x8010714b
801020fd:	e8 8e e2 ff ff       	call   80100390 <panic>
80102102:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102110 <ideinit>:
{
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	83 ec 10             	sub    $0x10,%esp
	initlock(&idelock, "ide");
80102116:	68 66 71 10 80       	push   $0x80107166
8010211b:	68 e0 a5 10 80       	push   $0x8010a5e0
80102120:	e8 fb 21 00 00       	call   80104320 <initlock>
	ioapicenable(IRQ_IDE, ncpu - 1);
80102125:	58                   	pop    %eax
80102126:	a1 60 2d 11 80       	mov    0x80112d60,%eax
8010212b:	5a                   	pop    %edx
8010212c:	83 e8 01             	sub    $0x1,%eax
8010212f:	50                   	push   %eax
80102130:	6a 0e                	push   $0xe
80102132:	e8 a9 02 00 00       	call   801023e0 <ioapicenable>
80102137:	83 c4 10             	add    $0x10,%esp
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
8010213a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010213f:	90                   	nop
80102140:	ec                   	in     (%dx),%al
	while (((r = inb(0x1f7)) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY)
80102141:	83 e0 c0             	and    $0xffffffc0,%eax
80102144:	3c 40                	cmp    $0x40,%al
80102146:	75 f8                	jne    80102140 <ideinit+0x30>
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102148:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010214d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102152:	ee                   	out    %al,(%dx)
80102153:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102158:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010215d:	eb 06                	jmp    80102165 <ideinit+0x55>
8010215f:	90                   	nop
	for (i = 0; i < 1000; i++) {
80102160:	83 e9 01             	sub    $0x1,%ecx
80102163:	74 0f                	je     80102174 <ideinit+0x64>
80102165:	ec                   	in     (%dx),%al
		if (inb(0x1f7) != 0) {
80102166:	84 c0                	test   %al,%al
80102168:	74 f6                	je     80102160 <ideinit+0x50>
			havedisk1 = 1;
8010216a:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80102171:	00 00 00 
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102174:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102179:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010217e:	ee                   	out    %al,(%dx)
}
8010217f:	c9                   	leave  
80102180:	c3                   	ret    
80102181:	eb 0d                	jmp    80102190 <ideintr>
80102183:	90                   	nop
80102184:	90                   	nop
80102185:	90                   	nop
80102186:	90                   	nop
80102187:	90                   	nop
80102188:	90                   	nop
80102189:	90                   	nop
8010218a:	90                   	nop
8010218b:	90                   	nop
8010218c:	90                   	nop
8010218d:	90                   	nop
8010218e:	90                   	nop
8010218f:	90                   	nop

80102190 <ideintr>:

// Interrupt handler.
void ideintr(void)
{
80102190:	55                   	push   %ebp
80102191:	89 e5                	mov    %esp,%ebp
80102193:	57                   	push   %edi
80102194:	56                   	push   %esi
80102195:	53                   	push   %ebx
80102196:	83 ec 18             	sub    $0x18,%esp
	struct buf *b;

	// First queued buffer is the active request.
	acquire(&idelock);
80102199:	68 e0 a5 10 80       	push   $0x8010a5e0
8010219e:	e8 7d 22 00 00       	call   80104420 <acquire>

	if ((b = idequeue) == 0) {
801021a3:	8b 1d c4 a5 10 80    	mov    0x8010a5c4,%ebx
801021a9:	83 c4 10             	add    $0x10,%esp
801021ac:	85 db                	test   %ebx,%ebx
801021ae:	74 63                	je     80102213 <ideintr+0x83>
		release(&idelock);
		return;
	}
	idequeue = b->qnext;
801021b0:	8b 43 58             	mov    0x58(%ebx),%eax
801021b3:	a3 c4 a5 10 80       	mov    %eax,0x8010a5c4

	// Read data if needed.
	if (!(b->flags & B_DIRTY) && idewait(1) >= 0)
801021b8:	8b 33                	mov    (%ebx),%esi
801021ba:	f7 c6 04 00 00 00    	test   $0x4,%esi
801021c0:	75 2f                	jne    801021f1 <ideintr+0x61>
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
801021c2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021c7:	89 f6                	mov    %esi,%esi
801021c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801021d0:	ec                   	in     (%dx),%al
	while (((r = inb(0x1f7)) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY)
801021d1:	89 c1                	mov    %eax,%ecx
801021d3:	83 e1 c0             	and    $0xffffffc0,%ecx
801021d6:	80 f9 40             	cmp    $0x40,%cl
801021d9:	75 f5                	jne    801021d0 <ideintr+0x40>
	if (checkerr && (r & (IDE_DF | IDE_ERR)) != 0)
801021db:	a8 21                	test   $0x21,%al
801021dd:	75 12                	jne    801021f1 <ideintr+0x61>
		insl(0x1f0, b->data, BSIZE / 4);
801021df:	8d 7b 5c             	lea    0x5c(%ebx),%edi
	asm volatile("cld; rep insl"
801021e2:	b9 80 00 00 00       	mov    $0x80,%ecx
801021e7:	ba f0 01 00 00       	mov    $0x1f0,%edx
801021ec:	fc                   	cld    
801021ed:	f3 6d                	rep insl (%dx),%es:(%edi)
801021ef:	8b 33                	mov    (%ebx),%esi

	// Wake process waiting for this buf.
	b->flags |= B_VALID;
	b->flags &= ~B_DIRTY;
801021f1:	83 e6 fb             	and    $0xfffffffb,%esi
	wakeup(b);
801021f4:	83 ec 0c             	sub    $0xc,%esp
	b->flags &= ~B_DIRTY;
801021f7:	83 ce 02             	or     $0x2,%esi
801021fa:	89 33                	mov    %esi,(%ebx)
	wakeup(b);
801021fc:	53                   	push   %ebx
801021fd:	e8 6e 1e 00 00       	call   80104070 <wakeup>

	// Start disk on next buf in queue.
	if (idequeue != 0)
80102202:	a1 c4 a5 10 80       	mov    0x8010a5c4,%eax
80102207:	83 c4 10             	add    $0x10,%esp
8010220a:	85 c0                	test   %eax,%eax
8010220c:	74 05                	je     80102213 <ideintr+0x83>
		idestart(idequeue);
8010220e:	e8 1d fe ff ff       	call   80102030 <idestart>
		release(&idelock);
80102213:	83 ec 0c             	sub    $0xc,%esp
80102216:	68 e0 a5 10 80       	push   $0x8010a5e0
8010221b:	e8 20 23 00 00       	call   80104540 <release>

	release(&idelock);
}
80102220:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102223:	5b                   	pop    %ebx
80102224:	5e                   	pop    %esi
80102225:	5f                   	pop    %edi
80102226:	5d                   	pop    %ebp
80102227:	c3                   	ret    
80102228:	90                   	nop
80102229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102230 <iderw>:

// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void iderw(struct buf *b)
{
80102230:	55                   	push   %ebp
80102231:	89 e5                	mov    %esp,%ebp
80102233:	53                   	push   %ebx
80102234:	83 ec 10             	sub    $0x10,%esp
80102237:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct buf **pp;

	if (!holdingsleep(&b->lock))
8010223a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010223d:	50                   	push   %eax
8010223e:	e8 ad 20 00 00       	call   801042f0 <holdingsleep>
80102243:	83 c4 10             	add    $0x10,%esp
80102246:	85 c0                	test   %eax,%eax
80102248:	0f 84 d3 00 00 00    	je     80102321 <iderw+0xf1>
		panic("iderw: buf not locked");
	if ((b->flags & (B_VALID | B_DIRTY)) == B_VALID)
8010224e:	8b 03                	mov    (%ebx),%eax
80102250:	83 e0 06             	and    $0x6,%eax
80102253:	83 f8 02             	cmp    $0x2,%eax
80102256:	0f 84 b8 00 00 00    	je     80102314 <iderw+0xe4>
		panic("iderw: nothing to do");
	if (b->dev != 0 && !havedisk1)
8010225c:	8b 53 04             	mov    0x4(%ebx),%edx
8010225f:	85 d2                	test   %edx,%edx
80102261:	74 0d                	je     80102270 <iderw+0x40>
80102263:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80102268:	85 c0                	test   %eax,%eax
8010226a:	0f 84 97 00 00 00    	je     80102307 <iderw+0xd7>
		panic("iderw: ide disk 1 not present");

	acquire(&idelock); // DOC:acquire-lock
80102270:	83 ec 0c             	sub    $0xc,%esp
80102273:	68 e0 a5 10 80       	push   $0x8010a5e0
80102278:	e8 a3 21 00 00       	call   80104420 <acquire>

	// Append b to idequeue.
	b->qnext = 0;
	for (pp = &idequeue; *pp; pp = &(*pp)->qnext) // DOC:insert-queue
8010227d:	8b 15 c4 a5 10 80    	mov    0x8010a5c4,%edx
	b->qnext = 0;
80102283:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
	for (pp = &idequeue; *pp; pp = &(*pp)->qnext) // DOC:insert-queue
8010228a:	83 c4 10             	add    $0x10,%esp
8010228d:	85 d2                	test   %edx,%edx
8010228f:	75 09                	jne    8010229a <iderw+0x6a>
80102291:	eb 6d                	jmp    80102300 <iderw+0xd0>
80102293:	90                   	nop
80102294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102298:	89 c2                	mov    %eax,%edx
8010229a:	8b 42 58             	mov    0x58(%edx),%eax
8010229d:	85 c0                	test   %eax,%eax
8010229f:	75 f7                	jne    80102298 <iderw+0x68>
801022a1:	83 c2 58             	add    $0x58,%edx
		;
	*pp = b;
801022a4:	89 1a                	mov    %ebx,(%edx)

	// Start disk if necessary.
	if (idequeue == b)
801022a6:	39 1d c4 a5 10 80    	cmp    %ebx,0x8010a5c4
801022ac:	74 42                	je     801022f0 <iderw+0xc0>
		idestart(b);

	// Wait for request to finish.
	while ((b->flags & (B_VALID | B_DIRTY)) != B_VALID) {
801022ae:	8b 03                	mov    (%ebx),%eax
801022b0:	83 e0 06             	and    $0x6,%eax
801022b3:	83 f8 02             	cmp    $0x2,%eax
801022b6:	74 23                	je     801022db <iderw+0xab>
801022b8:	90                   	nop
801022b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		sleep(b, &idelock);
801022c0:	83 ec 08             	sub    $0x8,%esp
801022c3:	68 e0 a5 10 80       	push   $0x8010a5e0
801022c8:	53                   	push   %ebx
801022c9:	e8 f2 1b 00 00       	call   80103ec0 <sleep>
	while ((b->flags & (B_VALID | B_DIRTY)) != B_VALID) {
801022ce:	8b 03                	mov    (%ebx),%eax
801022d0:	83 c4 10             	add    $0x10,%esp
801022d3:	83 e0 06             	and    $0x6,%eax
801022d6:	83 f8 02             	cmp    $0x2,%eax
801022d9:	75 e5                	jne    801022c0 <iderw+0x90>
	}

	release(&idelock);
801022db:	c7 45 08 e0 a5 10 80 	movl   $0x8010a5e0,0x8(%ebp)
}
801022e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801022e5:	c9                   	leave  
	release(&idelock);
801022e6:	e9 55 22 00 00       	jmp    80104540 <release>
801022eb:	90                   	nop
801022ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		idestart(b);
801022f0:	89 d8                	mov    %ebx,%eax
801022f2:	e8 39 fd ff ff       	call   80102030 <idestart>
801022f7:	eb b5                	jmp    801022ae <iderw+0x7e>
801022f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	for (pp = &idequeue; *pp; pp = &(*pp)->qnext) // DOC:insert-queue
80102300:	ba c4 a5 10 80       	mov    $0x8010a5c4,%edx
80102305:	eb 9d                	jmp    801022a4 <iderw+0x74>
		panic("iderw: ide disk 1 not present");
80102307:	83 ec 0c             	sub    $0xc,%esp
8010230a:	68 95 71 10 80       	push   $0x80107195
8010230f:	e8 7c e0 ff ff       	call   80100390 <panic>
		panic("iderw: nothing to do");
80102314:	83 ec 0c             	sub    $0xc,%esp
80102317:	68 80 71 10 80       	push   $0x80107180
8010231c:	e8 6f e0 ff ff       	call   80100390 <panic>
		panic("iderw: buf not locked");
80102321:	83 ec 0c             	sub    $0xc,%esp
80102324:	68 6a 71 10 80       	push   $0x8010716a
80102329:	e8 62 e0 ff ff       	call   80100390 <panic>
8010232e:	66 90                	xchg   %ax,%ax

80102330 <ioapicinit>:
	ioapic->reg = reg;
	ioapic->data = data;
}

void ioapicinit(void)
{
80102330:	55                   	push   %ebp
	int i, id, maxintr;

	ioapic = (volatile struct ioapic *)IOAPIC;
80102331:	c7 05 94 26 11 80 00 	movl   $0xfec00000,0x80112694
80102338:	00 c0 fe 
{
8010233b:	89 e5                	mov    %esp,%ebp
8010233d:	56                   	push   %esi
8010233e:	53                   	push   %ebx
	ioapic->reg = reg;
8010233f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102346:	00 00 00 
	return ioapic->data;
80102349:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010234f:	8b 72 10             	mov    0x10(%edx),%esi
	ioapic->reg = reg;
80102352:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
	return ioapic->data;
80102358:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
	maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
	id = ioapicread(REG_ID) >> 24;
	if (id != ioapicid)
8010235e:	0f b6 15 c0 27 11 80 	movzbl 0x801127c0,%edx
	maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102365:	c1 ee 10             	shr    $0x10,%esi
80102368:	89 f0                	mov    %esi,%eax
8010236a:	0f b6 f0             	movzbl %al,%esi
	return ioapic->data;
8010236d:	8b 41 10             	mov    0x10(%ecx),%eax
	id = ioapicread(REG_ID) >> 24;
80102370:	c1 e8 18             	shr    $0x18,%eax
	if (id != ioapicid)
80102373:	39 c2                	cmp    %eax,%edx
80102375:	74 16                	je     8010238d <ioapicinit+0x5d>
		cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102377:	83 ec 0c             	sub    $0xc,%esp
8010237a:	68 b4 71 10 80       	push   $0x801071b4
8010237f:	e8 2c e3 ff ff       	call   801006b0 <cprintf>
80102384:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
8010238a:	83 c4 10             	add    $0x10,%esp
8010238d:	83 c6 21             	add    $0x21,%esi
{
80102390:	ba 10 00 00 00       	mov    $0x10,%edx
80102395:	b8 20 00 00 00       	mov    $0x20,%eax
8010239a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	ioapic->reg = reg;
801023a0:	89 11                	mov    %edx,(%ecx)

	// Mark all interrupts edge-triggered, active high, disabled,
	// and not routed to any CPUs.
	for (i = 0; i <= maxintr; i++) {
		ioapicwrite(REG_TABLE + 2 * i, INT_DISABLED | (T_IRQ0 + i));
801023a2:	89 c3                	mov    %eax,%ebx
	ioapic->data = data;
801023a4:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
801023aa:	83 c0 01             	add    $0x1,%eax
		ioapicwrite(REG_TABLE + 2 * i, INT_DISABLED | (T_IRQ0 + i));
801023ad:	81 cb 00 00 01 00    	or     $0x10000,%ebx
	ioapic->data = data;
801023b3:	89 59 10             	mov    %ebx,0x10(%ecx)
	ioapic->reg = reg;
801023b6:	8d 5a 01             	lea    0x1(%edx),%ebx
801023b9:	83 c2 02             	add    $0x2,%edx
801023bc:	89 19                	mov    %ebx,(%ecx)
	ioapic->data = data;
801023be:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
801023c4:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
	for (i = 0; i <= maxintr; i++) {
801023cb:	39 f0                	cmp    %esi,%eax
801023cd:	75 d1                	jne    801023a0 <ioapicinit+0x70>
		ioapicwrite(REG_TABLE + 2 * i + 1, 0);
	}
}
801023cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023d2:	5b                   	pop    %ebx
801023d3:	5e                   	pop    %esi
801023d4:	5d                   	pop    %ebp
801023d5:	c3                   	ret    
801023d6:	8d 76 00             	lea    0x0(%esi),%esi
801023d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801023e0 <ioapicenable>:

void ioapicenable(int irq, int cpunum)
{
801023e0:	55                   	push   %ebp
	ioapic->reg = reg;
801023e1:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
{
801023e7:	89 e5                	mov    %esp,%ebp
801023e9:	8b 45 08             	mov    0x8(%ebp),%eax
	// Mark interrupt edge-triggered, active high,
	// enabled, and routed to the given cpunum,
	// which happens to be that cpu's APIC ID.
	ioapicwrite(REG_TABLE + 2 * irq, T_IRQ0 + irq);
801023ec:	8d 50 20             	lea    0x20(%eax),%edx
801023ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
	ioapic->reg = reg;
801023f3:	89 01                	mov    %eax,(%ecx)
	ioapic->data = data;
801023f5:	8b 0d 94 26 11 80    	mov    0x80112694,%ecx
	ioapicwrite(REG_TABLE + 2 * irq + 1, cpunum << 24);
801023fb:	83 c0 01             	add    $0x1,%eax
	ioapic->data = data;
801023fe:	89 51 10             	mov    %edx,0x10(%ecx)
	ioapicwrite(REG_TABLE + 2 * irq + 1, cpunum << 24);
80102401:	8b 55 0c             	mov    0xc(%ebp),%edx
	ioapic->reg = reg;
80102404:	89 01                	mov    %eax,(%ecx)
	ioapic->data = data;
80102406:	a1 94 26 11 80       	mov    0x80112694,%eax
	ioapicwrite(REG_TABLE + 2 * irq + 1, cpunum << 24);
8010240b:	c1 e2 18             	shl    $0x18,%edx
	ioapic->data = data;
8010240e:	89 50 10             	mov    %edx,0x10(%eax)
}
80102411:	5d                   	pop    %ebp
80102412:	c3                   	ret    
80102413:	66 90                	xchg   %ax,%ax
80102415:	66 90                	xchg   %ax,%ax
80102417:	66 90                	xchg   %ax,%ax
80102419:	66 90                	xchg   %ax,%ax
8010241b:	66 90                	xchg   %ax,%ax
8010241d:	66 90                	xchg   %ax,%ax
8010241f:	90                   	nop

80102420 <kfree>:
// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void kfree(char *v)
{
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	53                   	push   %ebx
80102424:	83 ec 04             	sub    $0x4,%esp
80102427:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct run *r;

	if ((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010242a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102430:	75 76                	jne    801024a8 <kfree+0x88>
80102432:	81 fb 08 55 11 80    	cmp    $0x80115508,%ebx
80102438:	72 6e                	jb     801024a8 <kfree+0x88>
8010243a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102440:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102445:	77 61                	ja     801024a8 <kfree+0x88>
		panic("kfree");

	// Fill with junk to catch dangling refs.
	memset(v, 1, PGSIZE);
80102447:	83 ec 04             	sub    $0x4,%esp
8010244a:	68 00 10 00 00       	push   $0x1000
8010244f:	6a 01                	push   $0x1
80102451:	53                   	push   %ebx
80102452:	e8 39 21 00 00       	call   80104590 <memset>

	if (kmem.use_lock)
80102457:	8b 15 d4 26 11 80    	mov    0x801126d4,%edx
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	85 d2                	test   %edx,%edx
80102462:	75 1c                	jne    80102480 <kfree+0x60>
		acquire(&kmem.lock);
	r = (struct run *)v;
	r->next = kmem.freelist;
80102464:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102469:	89 03                	mov    %eax,(%ebx)
	kmem.freelist = r;
	if (kmem.use_lock)
8010246b:	a1 d4 26 11 80       	mov    0x801126d4,%eax
	kmem.freelist = r;
80102470:	89 1d d8 26 11 80    	mov    %ebx,0x801126d8
	if (kmem.use_lock)
80102476:	85 c0                	test   %eax,%eax
80102478:	75 1e                	jne    80102498 <kfree+0x78>
		release(&kmem.lock);
}
8010247a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010247d:	c9                   	leave  
8010247e:	c3                   	ret    
8010247f:	90                   	nop
		acquire(&kmem.lock);
80102480:	83 ec 0c             	sub    $0xc,%esp
80102483:	68 a0 26 11 80       	push   $0x801126a0
80102488:	e8 93 1f 00 00       	call   80104420 <acquire>
8010248d:	83 c4 10             	add    $0x10,%esp
80102490:	eb d2                	jmp    80102464 <kfree+0x44>
80102492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		release(&kmem.lock);
80102498:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
8010249f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024a2:	c9                   	leave  
		release(&kmem.lock);
801024a3:	e9 98 20 00 00       	jmp    80104540 <release>
		panic("kfree");
801024a8:	83 ec 0c             	sub    $0xc,%esp
801024ab:	68 e6 71 10 80       	push   $0x801071e6
801024b0:	e8 db de ff ff       	call   80100390 <panic>
801024b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024c0 <freerange>:
{
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	56                   	push   %esi
	p = (char *)PGROUNDUP((uint)vstart);
801024c4:	8b 45 08             	mov    0x8(%ebp),%eax
{
801024c7:	8b 75 0c             	mov    0xc(%ebp),%esi
801024ca:	53                   	push   %ebx
	p = (char *)PGROUNDUP((uint)vstart);
801024cb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024d1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
801024d7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024dd:	39 de                	cmp    %ebx,%esi
801024df:	72 23                	jb     80102504 <freerange+0x44>
801024e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		kfree(p);
801024e8:	83 ec 0c             	sub    $0xc,%esp
801024eb:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
801024f1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
		kfree(p);
801024f7:	50                   	push   %eax
801024f8:	e8 23 ff ff ff       	call   80102420 <kfree>
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
801024fd:	83 c4 10             	add    $0x10,%esp
80102500:	39 f3                	cmp    %esi,%ebx
80102502:	76 e4                	jbe    801024e8 <freerange+0x28>
}
80102504:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102507:	5b                   	pop    %ebx
80102508:	5e                   	pop    %esi
80102509:	5d                   	pop    %ebp
8010250a:	c3                   	ret    
8010250b:	90                   	nop
8010250c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102510 <kinit1>:
{
80102510:	55                   	push   %ebp
80102511:	89 e5                	mov    %esp,%ebp
80102513:	56                   	push   %esi
80102514:	53                   	push   %ebx
80102515:	8b 75 0c             	mov    0xc(%ebp),%esi
	initlock(&kmem.lock, "kmem");
80102518:	83 ec 08             	sub    $0x8,%esp
8010251b:	68 ec 71 10 80       	push   $0x801071ec
80102520:	68 a0 26 11 80       	push   $0x801126a0
80102525:	e8 f6 1d 00 00       	call   80104320 <initlock>
	p = (char *)PGROUNDUP((uint)vstart);
8010252a:	8b 45 08             	mov    0x8(%ebp),%eax
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
8010252d:	83 c4 10             	add    $0x10,%esp
	kmem.use_lock = 0;
80102530:	c7 05 d4 26 11 80 00 	movl   $0x0,0x801126d4
80102537:	00 00 00 
	p = (char *)PGROUNDUP((uint)vstart);
8010253a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102540:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
80102546:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010254c:	39 de                	cmp    %ebx,%esi
8010254e:	72 1c                	jb     8010256c <kinit1+0x5c>
		kfree(p);
80102550:	83 ec 0c             	sub    $0xc,%esp
80102553:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
80102559:	81 c3 00 10 00 00    	add    $0x1000,%ebx
		kfree(p);
8010255f:	50                   	push   %eax
80102560:	e8 bb fe ff ff       	call   80102420 <kfree>
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
80102565:	83 c4 10             	add    $0x10,%esp
80102568:	39 de                	cmp    %ebx,%esi
8010256a:	73 e4                	jae    80102550 <kinit1+0x40>
}
8010256c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010256f:	5b                   	pop    %ebx
80102570:	5e                   	pop    %esi
80102571:	5d                   	pop    %ebp
80102572:	c3                   	ret    
80102573:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102580 <kinit2>:
{
80102580:	55                   	push   %ebp
80102581:	89 e5                	mov    %esp,%ebp
80102583:	56                   	push   %esi
	p = (char *)PGROUNDUP((uint)vstart);
80102584:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102587:	8b 75 0c             	mov    0xc(%ebp),%esi
8010258a:	53                   	push   %ebx
	p = (char *)PGROUNDUP((uint)vstart);
8010258b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102591:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
80102597:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010259d:	39 de                	cmp    %ebx,%esi
8010259f:	72 23                	jb     801025c4 <kinit2+0x44>
801025a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		kfree(p);
801025a8:	83 ec 0c             	sub    $0xc,%esp
801025ab:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
801025b1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
		kfree(p);
801025b7:	50                   	push   %eax
801025b8:	e8 63 fe ff ff       	call   80102420 <kfree>
	for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
801025bd:	83 c4 10             	add    $0x10,%esp
801025c0:	39 de                	cmp    %ebx,%esi
801025c2:	73 e4                	jae    801025a8 <kinit2+0x28>
	kmem.use_lock = 1;
801025c4:	c7 05 d4 26 11 80 01 	movl   $0x1,0x801126d4
801025cb:	00 00 00 
}
801025ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025d1:	5b                   	pop    %ebx
801025d2:	5e                   	pop    %esi
801025d3:	5d                   	pop    %ebp
801025d4:	c3                   	ret    
801025d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025e0 <kalloc>:

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char *kalloc(void)
{
801025e0:	55                   	push   %ebp
801025e1:	89 e5                	mov    %esp,%ebp
801025e3:	53                   	push   %ebx
801025e4:	83 ec 04             	sub    $0x4,%esp
	struct run *r;

	if (kmem.use_lock)
801025e7:	a1 d4 26 11 80       	mov    0x801126d4,%eax
801025ec:	85 c0                	test   %eax,%eax
801025ee:	75 20                	jne    80102610 <kalloc+0x30>
		acquire(&kmem.lock);
	r = kmem.freelist;
801025f0:	8b 1d d8 26 11 80    	mov    0x801126d8,%ebx
	if (r)
801025f6:	85 db                	test   %ebx,%ebx
801025f8:	74 07                	je     80102601 <kalloc+0x21>
		kmem.freelist = r->next;
801025fa:	8b 03                	mov    (%ebx),%eax
801025fc:	a3 d8 26 11 80       	mov    %eax,0x801126d8
	if (kmem.use_lock)
		release(&kmem.lock);
	return (char *)r;
}
80102601:	89 d8                	mov    %ebx,%eax
80102603:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102606:	c9                   	leave  
80102607:	c3                   	ret    
80102608:	90                   	nop
80102609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		acquire(&kmem.lock);
80102610:	83 ec 0c             	sub    $0xc,%esp
80102613:	68 a0 26 11 80       	push   $0x801126a0
80102618:	e8 03 1e 00 00       	call   80104420 <acquire>
	r = kmem.freelist;
8010261d:	8b 1d d8 26 11 80    	mov    0x801126d8,%ebx
	if (r)
80102623:	83 c4 10             	add    $0x10,%esp
80102626:	a1 d4 26 11 80       	mov    0x801126d4,%eax
8010262b:	85 db                	test   %ebx,%ebx
8010262d:	74 08                	je     80102637 <kalloc+0x57>
		kmem.freelist = r->next;
8010262f:	8b 13                	mov    (%ebx),%edx
80102631:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
	if (kmem.use_lock)
80102637:	85 c0                	test   %eax,%eax
80102639:	74 c6                	je     80102601 <kalloc+0x21>
		release(&kmem.lock);
8010263b:	83 ec 0c             	sub    $0xc,%esp
8010263e:	68 a0 26 11 80       	push   $0x801126a0
80102643:	e8 f8 1e 00 00       	call   80104540 <release>
}
80102648:	89 d8                	mov    %ebx,%eax
		release(&kmem.lock);
8010264a:	83 c4 10             	add    $0x10,%esp
}
8010264d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102650:	c9                   	leave  
80102651:	c3                   	ret    
80102652:	66 90                	xchg   %ax,%ax
80102654:	66 90                	xchg   %ax,%ax
80102656:	66 90                	xchg   %ax,%ax
80102658:	66 90                	xchg   %ax,%ax
8010265a:	66 90                	xchg   %ax,%ax
8010265c:	66 90                	xchg   %ax,%ax
8010265e:	66 90                	xchg   %ax,%ax

80102660 <kbdgetc>:
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102660:	ba 64 00 00 00       	mov    $0x64,%edx
80102665:	ec                   	in     (%dx),%al
	static uint shift;
	static uchar *charcode[4] = {normalmap, shiftmap, ctlmap, ctlmap};
	uint st, data, c;

	st = inb(KBSTATP);
	if ((st & KBS_DIB) == 0)
80102666:	a8 01                	test   $0x1,%al
80102668:	0f 84 c2 00 00 00    	je     80102730 <kbdgetc+0xd0>
{
8010266e:	55                   	push   %ebp
8010266f:	ba 60 00 00 00       	mov    $0x60,%edx
80102674:	89 e5                	mov    %esp,%ebp
80102676:	53                   	push   %ebx
80102677:	ec                   	in     (%dx),%al
		return -1;
	data = inb(KBDATAP);
80102678:	0f b6 d0             	movzbl %al,%edx

	if (data == 0xE0) {
8010267b:	8b 1d 14 a6 10 80    	mov    0x8010a614,%ebx
80102681:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102687:	74 57                	je     801026e0 <kbdgetc+0x80>
		shift |= E0ESC;
		return 0;
	} else if (data & 0x80) {
80102689:	89 d9                	mov    %ebx,%ecx
8010268b:	83 e1 40             	and    $0x40,%ecx
8010268e:	84 c0                	test   %al,%al
80102690:	78 5e                	js     801026f0 <kbdgetc+0x90>
		// Key released
		data = (shift & E0ESC ? data : data & 0x7F);
		shift &= ~(shiftcode[data] | E0ESC);
		return 0;
	} else if (shift & E0ESC) {
80102692:	85 c9                	test   %ecx,%ecx
80102694:	74 09                	je     8010269f <kbdgetc+0x3f>
		// Last character was an E0 escape; or with 0x80
		data |= 0x80;
80102696:	83 c8 80             	or     $0xffffff80,%eax
		shift &= ~E0ESC;
80102699:	83 e3 bf             	and    $0xffffffbf,%ebx
		data |= 0x80;
8010269c:	0f b6 d0             	movzbl %al,%edx
	}

	shift |= shiftcode[data];
8010269f:	0f b6 8a 20 73 10 80 	movzbl -0x7fef8ce0(%edx),%ecx
	shift ^= togglecode[data];
801026a6:	0f b6 82 20 72 10 80 	movzbl -0x7fef8de0(%edx),%eax
	shift |= shiftcode[data];
801026ad:	09 d9                	or     %ebx,%ecx
	shift ^= togglecode[data];
801026af:	31 c1                	xor    %eax,%ecx
	c = charcode[shift & (CTL | SHIFT)][data];
801026b1:	89 c8                	mov    %ecx,%eax
	shift ^= togglecode[data];
801026b3:	89 0d 14 a6 10 80    	mov    %ecx,0x8010a614
	c = charcode[shift & (CTL | SHIFT)][data];
801026b9:	83 e0 03             	and    $0x3,%eax
	if (shift & CAPSLOCK) {
801026bc:	83 e1 08             	and    $0x8,%ecx
	c = charcode[shift & (CTL | SHIFT)][data];
801026bf:	8b 04 85 00 72 10 80 	mov    -0x7fef8e00(,%eax,4),%eax
801026c6:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
	if (shift & CAPSLOCK) {
801026ca:	74 0b                	je     801026d7 <kbdgetc+0x77>
		if ('a' <= c && c <= 'z')
801026cc:	8d 50 9f             	lea    -0x61(%eax),%edx
801026cf:	83 fa 19             	cmp    $0x19,%edx
801026d2:	77 44                	ja     80102718 <kbdgetc+0xb8>
			c += 'A' - 'a';
801026d4:	83 e8 20             	sub    $0x20,%eax
		else if ('A' <= c && c <= 'Z')
			c += 'a' - 'A';
	}
	return c;
}
801026d7:	5b                   	pop    %ebx
801026d8:	5d                   	pop    %ebp
801026d9:	c3                   	ret    
801026da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		shift |= E0ESC;
801026e0:	83 cb 40             	or     $0x40,%ebx
		return 0;
801026e3:	31 c0                	xor    %eax,%eax
		shift |= E0ESC;
801026e5:	89 1d 14 a6 10 80    	mov    %ebx,0x8010a614
}
801026eb:	5b                   	pop    %ebx
801026ec:	5d                   	pop    %ebp
801026ed:	c3                   	ret    
801026ee:	66 90                	xchg   %ax,%ax
		data = (shift & E0ESC ? data : data & 0x7F);
801026f0:	83 e0 7f             	and    $0x7f,%eax
801026f3:	85 c9                	test   %ecx,%ecx
801026f5:	0f 44 d0             	cmove  %eax,%edx
		return 0;
801026f8:	31 c0                	xor    %eax,%eax
		shift &= ~(shiftcode[data] | E0ESC);
801026fa:	0f b6 8a 20 73 10 80 	movzbl -0x7fef8ce0(%edx),%ecx
80102701:	83 c9 40             	or     $0x40,%ecx
80102704:	0f b6 c9             	movzbl %cl,%ecx
80102707:	f7 d1                	not    %ecx
80102709:	21 d9                	and    %ebx,%ecx
}
8010270b:	5b                   	pop    %ebx
8010270c:	5d                   	pop    %ebp
		shift &= ~(shiftcode[data] | E0ESC);
8010270d:	89 0d 14 a6 10 80    	mov    %ecx,0x8010a614
}
80102713:	c3                   	ret    
80102714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		else if ('A' <= c && c <= 'Z')
80102718:	8d 48 bf             	lea    -0x41(%eax),%ecx
			c += 'a' - 'A';
8010271b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010271e:	5b                   	pop    %ebx
8010271f:	5d                   	pop    %ebp
			c += 'a' - 'A';
80102720:	83 f9 1a             	cmp    $0x1a,%ecx
80102723:	0f 42 c2             	cmovb  %edx,%eax
}
80102726:	c3                   	ret    
80102727:	89 f6                	mov    %esi,%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		return -1;
80102730:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102735:	c3                   	ret    
80102736:	8d 76 00             	lea    0x0(%esi),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <kbdintr>:

void kbdintr(void)
{
80102740:	55                   	push   %ebp
80102741:	89 e5                	mov    %esp,%ebp
80102743:	83 ec 14             	sub    $0x14,%esp
	consoleintr(kbdgetc);
80102746:	68 60 26 10 80       	push   $0x80102660
8010274b:	e8 10 e1 ff ff       	call   80100860 <consoleintr>
}
80102750:	83 c4 10             	add    $0x10,%esp
80102753:	c9                   	leave  
80102754:	c3                   	ret    
80102755:	66 90                	xchg   %ax,%ax
80102757:	66 90                	xchg   %ax,%ax
80102759:	66 90                	xchg   %ax,%ax
8010275b:	66 90                	xchg   %ax,%ax
8010275d:	66 90                	xchg   %ax,%ax
8010275f:	90                   	nop

80102760 <lapicinit>:
	lapic[ID]; // wait for write to finish, by reading
}

void lapicinit(void)
{
	if (!lapic)
80102760:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102765:	85 c0                	test   %eax,%eax
80102767:	0f 84 cb 00 00 00    	je     80102838 <lapicinit+0xd8>
	lapic[index] = value;
8010276d:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102774:	01 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102777:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
8010277a:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102781:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102784:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
80102787:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010278e:	00 02 00 
	lapic[ID]; // wait for write to finish, by reading
80102791:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
80102794:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010279b:	96 98 00 
	lapic[ID]; // wait for write to finish, by reading
8010279e:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
801027a1:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801027a8:	00 01 00 
	lapic[ID]; // wait for write to finish, by reading
801027ab:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
801027ae:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801027b5:	00 01 00 
	lapic[ID]; // wait for write to finish, by reading
801027b8:	8b 50 20             	mov    0x20(%eax),%edx
	lapicw(LINT0, MASKED);
	lapicw(LINT1, MASKED);

	// Disable performance counter overflow interrupts
	// on machines that provide that interrupt entry.
	if (((lapic[VER] >> 16) & 0xFF) >= 4)
801027bb:	8b 50 30             	mov    0x30(%eax),%edx
801027be:	c1 ea 10             	shr    $0x10,%edx
801027c1:	81 e2 fc 00 00 00    	and    $0xfc,%edx
801027c7:	75 77                	jne    80102840 <lapicinit+0xe0>
	lapic[index] = value;
801027c9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801027d0:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
801027d3:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
801027d6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027dd:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
801027e0:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
801027e3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027ea:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
801027ed:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
801027f0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027f7:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
801027fa:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
801027fd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102804:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102807:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
8010280a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102811:	85 08 00 
	lapic[ID]; // wait for write to finish, by reading
80102814:	8b 50 20             	mov    0x20(%eax),%edx
80102817:	89 f6                	mov    %esi,%esi
80102819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	lapicw(EOI, 0);

	// Send an Init Level De-Assert to synchronise arbitration ID's.
	lapicw(ICRHI, 0);
	lapicw(ICRLO, BCAST | INIT | LEVEL);
	while (lapic[ICRLO] & DELIVS)
80102820:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102826:	80 e6 10             	and    $0x10,%dh
80102829:	75 f5                	jne    80102820 <lapicinit+0xc0>
	lapic[index] = value;
8010282b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102832:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102835:	8b 40 20             	mov    0x20(%eax),%eax
		;

	// Enable interrupts on the APIC (but not on the processor).
	lapicw(TPR, 0);
}
80102838:	c3                   	ret    
80102839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	lapic[index] = value;
80102840:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102847:	00 01 00 
	lapic[ID]; // wait for write to finish, by reading
8010284a:	8b 50 20             	mov    0x20(%eax),%edx
8010284d:	e9 77 ff ff ff       	jmp    801027c9 <lapicinit+0x69>
80102852:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102860 <lapicid>:

int lapicid(void)
{
	if (!lapic)
80102860:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102865:	85 c0                	test   %eax,%eax
80102867:	74 07                	je     80102870 <lapicid+0x10>
		return 0;
	return lapic[ID] >> 24;
80102869:	8b 40 20             	mov    0x20(%eax),%eax
8010286c:	c1 e8 18             	shr    $0x18,%eax
8010286f:	c3                   	ret    
		return 0;
80102870:	31 c0                	xor    %eax,%eax
}
80102872:	c3                   	ret    
80102873:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102880 <lapiceoi>:

// Acknowledge interrupt.
void lapiceoi(void)
{
	if (lapic)
80102880:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102885:	85 c0                	test   %eax,%eax
80102887:	74 0d                	je     80102896 <lapiceoi+0x16>
	lapic[index] = value;
80102889:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102890:	00 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102893:	8b 40 20             	mov    0x20(%eax),%eax
		lapicw(EOI, 0);
}
80102896:	c3                   	ret    
80102897:	89 f6                	mov    %esi,%esi
80102899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801028a0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void microdelay(int us)
{
}
801028a0:	c3                   	ret    
801028a1:	eb 0d                	jmp    801028b0 <lapicstartap>
801028a3:	90                   	nop
801028a4:	90                   	nop
801028a5:	90                   	nop
801028a6:	90                   	nop
801028a7:	90                   	nop
801028a8:	90                   	nop
801028a9:	90                   	nop
801028aa:	90                   	nop
801028ab:	90                   	nop
801028ac:	90                   	nop
801028ad:	90                   	nop
801028ae:	90                   	nop
801028af:	90                   	nop

801028b0 <lapicstartap>:
#define CMOS_RETURN 0x71

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void lapicstartap(uchar apicid, uint addr)
{
801028b0:	55                   	push   %ebp
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801028b1:	b8 0f 00 00 00       	mov    $0xf,%eax
801028b6:	ba 70 00 00 00       	mov    $0x70,%edx
801028bb:	89 e5                	mov    %esp,%ebp
801028bd:	53                   	push   %ebx
801028be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801028c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801028c4:	ee                   	out    %al,(%dx)
801028c5:	b8 0a 00 00 00       	mov    $0xa,%eax
801028ca:	ba 71 00 00 00       	mov    $0x71,%edx
801028cf:	ee                   	out    %al,(%dx)
	// and the warm reset vector (DWORD based at 40:67) to point at
	// the AP startup code prior to the [universal startup algorithm]."
	outb(CMOS_PORT, 0xF); // offset 0xF is shutdown code
	outb(CMOS_PORT + 1, 0x0A);
	wrv = (ushort *)P2V((0x40 << 4 | 0x67)); // Warm reset vector
	wrv[0] = 0;
801028d0:	31 c0                	xor    %eax,%eax
	wrv[1] = addr >> 4;

	// "Universal startup algorithm."
	// Send INIT (level-triggered) interrupt to reset other CPU.
	lapicw(ICRHI, apicid << 24);
801028d2:	c1 e3 18             	shl    $0x18,%ebx
	wrv[0] = 0;
801028d5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
	wrv[1] = addr >> 4;
801028db:	89 c8                	mov    %ecx,%eax
	// when it is in the halted state due to an INIT.  So the second
	// should be ignored, but it is part of the official Intel algorithm.
	// Bochs complains about the second one.  Too bad for Bochs.
	for (i = 0; i < 2; i++) {
		lapicw(ICRHI, apicid << 24);
		lapicw(ICRLO, STARTUP | (addr >> 12));
801028dd:	c1 e9 0c             	shr    $0xc,%ecx
	lapicw(ICRHI, apicid << 24);
801028e0:	89 da                	mov    %ebx,%edx
	wrv[1] = addr >> 4;
801028e2:	c1 e8 04             	shr    $0x4,%eax
		lapicw(ICRLO, STARTUP | (addr >> 12));
801028e5:	80 cd 06             	or     $0x6,%ch
	wrv[1] = addr >> 4;
801028e8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
	lapic[index] = value;
801028ee:	a1 dc 26 11 80       	mov    0x801126dc,%eax
801028f3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
	lapic[ID]; // wait for write to finish, by reading
801028f9:	8b 58 20             	mov    0x20(%eax),%ebx
	lapic[index] = value;
801028fc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102903:	c5 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102906:	8b 58 20             	mov    0x20(%eax),%ebx
	lapic[index] = value;
80102909:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102910:	85 00 00 
	lapic[ID]; // wait for write to finish, by reading
80102913:	8b 58 20             	mov    0x20(%eax),%ebx
	lapic[index] = value;
80102916:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
	lapic[ID]; // wait for write to finish, by reading
8010291c:	8b 58 20             	mov    0x20(%eax),%ebx
	lapic[index] = value;
8010291f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
	lapic[ID]; // wait for write to finish, by reading
80102925:	8b 58 20             	mov    0x20(%eax),%ebx
	lapic[index] = value;
80102928:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
	lapic[ID]; // wait for write to finish, by reading
8010292e:	8b 50 20             	mov    0x20(%eax),%edx
	lapic[index] = value;
80102931:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
		microdelay(200);
	}
}
80102937:	5b                   	pop    %ebx
	lapic[ID]; // wait for write to finish, by reading
80102938:	8b 40 20             	mov    0x20(%eax),%eax
}
8010293b:	5d                   	pop    %ebp
8010293c:	c3                   	ret    
8010293d:	8d 76 00             	lea    0x0(%esi),%esi

80102940 <cmostime>:
	r->year = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102940:	55                   	push   %ebp
80102941:	b8 0b 00 00 00       	mov    $0xb,%eax
80102946:	ba 70 00 00 00       	mov    $0x70,%edx
8010294b:	89 e5                	mov    %esp,%ebp
8010294d:	57                   	push   %edi
8010294e:	56                   	push   %esi
8010294f:	53                   	push   %ebx
80102950:	83 ec 4c             	sub    $0x4c,%esp
80102953:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102954:	ba 71 00 00 00       	mov    $0x71,%edx
80102959:	ec                   	in     (%dx),%al
	struct rtcdate t1, t2;
	int sb, bcd;

	sb = cmos_read(CMOS_STATB);

	bcd = (sb & (1 << 2)) == 0;
8010295a:	83 e0 04             	and    $0x4,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
8010295d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102962:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102965:	8d 76 00             	lea    0x0(%esi),%esi
80102968:	31 c0                	xor    %eax,%eax
8010296a:	89 da                	mov    %ebx,%edx
8010296c:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
8010296d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102972:	89 ca                	mov    %ecx,%edx
80102974:	ec                   	in     (%dx),%al
80102975:	88 45 b7             	mov    %al,-0x49(%ebp)
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102978:	89 da                	mov    %ebx,%edx
8010297a:	b8 02 00 00 00       	mov    $0x2,%eax
8010297f:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102980:	89 ca                	mov    %ecx,%edx
80102982:	ec                   	in     (%dx),%al
80102983:	88 45 b6             	mov    %al,-0x4a(%ebp)
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102986:	89 da                	mov    %ebx,%edx
80102988:	b8 04 00 00 00       	mov    $0x4,%eax
8010298d:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
8010298e:	89 ca                	mov    %ecx,%edx
80102990:	ec                   	in     (%dx),%al
80102991:	88 45 b5             	mov    %al,-0x4b(%ebp)
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102994:	89 da                	mov    %ebx,%edx
80102996:	b8 07 00 00 00       	mov    $0x7,%eax
8010299b:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
8010299c:	89 ca                	mov    %ecx,%edx
8010299e:	ec                   	in     (%dx),%al
8010299f:	88 45 b4             	mov    %al,-0x4c(%ebp)
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801029a2:	89 da                	mov    %ebx,%edx
801029a4:	b8 08 00 00 00       	mov    $0x8,%eax
801029a9:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
801029aa:	89 ca                	mov    %ecx,%edx
801029ac:	ec                   	in     (%dx),%al
801029ad:	89 c7                	mov    %eax,%edi
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801029af:	89 da                	mov    %ebx,%edx
801029b1:	b8 09 00 00 00       	mov    $0x9,%eax
801029b6:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
801029b7:	89 ca                	mov    %ecx,%edx
801029b9:	ec                   	in     (%dx),%al
801029ba:	89 c6                	mov    %eax,%esi
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801029bc:	89 da                	mov    %ebx,%edx
801029be:	b8 0a 00 00 00       	mov    $0xa,%eax
801029c3:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
801029c4:	89 ca                	mov    %ecx,%edx
801029c6:	ec                   	in     (%dx),%al

	// make sure CMOS doesn't modify time while we read it
	for (;;) {
		fill_rtcdate(&t1);
		if (cmos_read(CMOS_STATA) & CMOS_UIP)
801029c7:	84 c0                	test   %al,%al
801029c9:	78 9d                	js     80102968 <cmostime+0x28>
	return inb(CMOS_RETURN);
801029cb:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801029cf:	89 fa                	mov    %edi,%edx
801029d1:	0f b6 fa             	movzbl %dl,%edi
801029d4:	89 f2                	mov    %esi,%edx
801029d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029d9:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801029dd:	0f b6 f2             	movzbl %dl,%esi
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801029e0:	89 da                	mov    %ebx,%edx
801029e2:	89 7d c8             	mov    %edi,-0x38(%ebp)
801029e5:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029e8:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801029ec:	89 75 cc             	mov    %esi,-0x34(%ebp)
801029ef:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029f2:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801029f6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029f9:	31 c0                	xor    %eax,%eax
801029fb:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
801029fc:	89 ca                	mov    %ecx,%edx
801029fe:	ec                   	in     (%dx),%al
801029ff:	0f b6 c0             	movzbl %al,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102a02:	89 da                	mov    %ebx,%edx
80102a04:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102a07:	b8 02 00 00 00       	mov    $0x2,%eax
80102a0c:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102a0d:	89 ca                	mov    %ecx,%edx
80102a0f:	ec                   	in     (%dx),%al
80102a10:	0f b6 c0             	movzbl %al,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102a13:	89 da                	mov    %ebx,%edx
80102a15:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102a18:	b8 04 00 00 00       	mov    $0x4,%eax
80102a1d:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102a1e:	89 ca                	mov    %ecx,%edx
80102a20:	ec                   	in     (%dx),%al
80102a21:	0f b6 c0             	movzbl %al,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102a24:	89 da                	mov    %ebx,%edx
80102a26:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102a29:	b8 07 00 00 00       	mov    $0x7,%eax
80102a2e:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102a2f:	89 ca                	mov    %ecx,%edx
80102a31:	ec                   	in     (%dx),%al
80102a32:	0f b6 c0             	movzbl %al,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102a35:	89 da                	mov    %ebx,%edx
80102a37:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102a3a:	b8 08 00 00 00       	mov    $0x8,%eax
80102a3f:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102a40:	89 ca                	mov    %ecx,%edx
80102a42:	ec                   	in     (%dx),%al
80102a43:	0f b6 c0             	movzbl %al,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80102a46:	89 da                	mov    %ebx,%edx
80102a48:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102a4b:	b8 09 00 00 00       	mov    $0x9,%eax
80102a50:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80102a51:	89 ca                	mov    %ecx,%edx
80102a53:	ec                   	in     (%dx),%al
80102a54:	0f b6 c0             	movzbl %al,%eax
			continue;
		fill_rtcdate(&t2);
		if (memcmp(&t1, &t2, sizeof(t1)) == 0)
80102a57:	83 ec 04             	sub    $0x4,%esp
	return inb(CMOS_RETURN);
80102a5a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (memcmp(&t1, &t2, sizeof(t1)) == 0)
80102a5d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102a60:	6a 18                	push   $0x18
80102a62:	50                   	push   %eax
80102a63:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102a66:	50                   	push   %eax
80102a67:	e8 74 1b 00 00       	call   801045e0 <memcmp>
80102a6c:	83 c4 10             	add    $0x10,%esp
80102a6f:	85 c0                	test   %eax,%eax
80102a71:	0f 85 f1 fe ff ff    	jne    80102968 <cmostime+0x28>
			break;
	}

	// convert
	if (bcd) {
80102a77:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102a7b:	75 78                	jne    80102af5 <cmostime+0x1b5>
#define CONV(x) (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
		CONV(second);
80102a7d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a80:	89 c2                	mov    %eax,%edx
80102a82:	83 e0 0f             	and    $0xf,%eax
80102a85:	c1 ea 04             	shr    $0x4,%edx
80102a88:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a8b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a8e:	89 45 b8             	mov    %eax,-0x48(%ebp)
		CONV(minute);
80102a91:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a94:	89 c2                	mov    %eax,%edx
80102a96:	83 e0 0f             	and    $0xf,%eax
80102a99:	c1 ea 04             	shr    $0x4,%edx
80102a9c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a9f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102aa2:	89 45 bc             	mov    %eax,-0x44(%ebp)
		CONV(hour);
80102aa5:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102aa8:	89 c2                	mov    %eax,%edx
80102aaa:	83 e0 0f             	and    $0xf,%eax
80102aad:	c1 ea 04             	shr    $0x4,%edx
80102ab0:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ab3:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ab6:	89 45 c0             	mov    %eax,-0x40(%ebp)
		CONV(day);
80102ab9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102abc:	89 c2                	mov    %eax,%edx
80102abe:	83 e0 0f             	and    $0xf,%eax
80102ac1:	c1 ea 04             	shr    $0x4,%edx
80102ac4:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ac7:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102aca:	89 45 c4             	mov    %eax,-0x3c(%ebp)
		CONV(month);
80102acd:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102ad0:	89 c2                	mov    %eax,%edx
80102ad2:	83 e0 0f             	and    $0xf,%eax
80102ad5:	c1 ea 04             	shr    $0x4,%edx
80102ad8:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102adb:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ade:	89 45 c8             	mov    %eax,-0x38(%ebp)
		CONV(year);
80102ae1:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102ae4:	89 c2                	mov    %eax,%edx
80102ae6:	83 e0 0f             	and    $0xf,%eax
80102ae9:	c1 ea 04             	shr    $0x4,%edx
80102aec:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102aef:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102af2:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef CONV
	}

	*r = t1;
80102af5:	8b 75 08             	mov    0x8(%ebp),%esi
80102af8:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102afb:	89 06                	mov    %eax,(%esi)
80102afd:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b00:	89 46 04             	mov    %eax,0x4(%esi)
80102b03:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b06:	89 46 08             	mov    %eax,0x8(%esi)
80102b09:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b0c:	89 46 0c             	mov    %eax,0xc(%esi)
80102b0f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b12:	89 46 10             	mov    %eax,0x10(%esi)
80102b15:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b18:	89 46 14             	mov    %eax,0x14(%esi)
	r->year += 2000;
80102b1b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102b22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b25:	5b                   	pop    %ebx
80102b26:	5e                   	pop    %esi
80102b27:	5f                   	pop    %edi
80102b28:	5d                   	pop    %ebp
80102b29:	c3                   	ret    
80102b2a:	66 90                	xchg   %ax,%ax
80102b2c:	66 90                	xchg   %ax,%ax
80102b2e:	66 90                	xchg   %ax,%ax

80102b30 <install_trans>:
// Copy committed blocks from log to their home location
static void install_trans(void)
{
	int tail;

	for (tail = 0; tail < log.lh.n; tail++) {
80102b30:	8b 0d 28 27 11 80    	mov    0x80112728,%ecx
80102b36:	85 c9                	test   %ecx,%ecx
80102b38:	0f 8e 8a 00 00 00    	jle    80102bc8 <install_trans+0x98>
{
80102b3e:	55                   	push   %ebp
80102b3f:	89 e5                	mov    %esp,%ebp
80102b41:	57                   	push   %edi
80102b42:	56                   	push   %esi
80102b43:	53                   	push   %ebx
	for (tail = 0; tail < log.lh.n; tail++) {
80102b44:	31 db                	xor    %ebx,%ebx
{
80102b46:	83 ec 0c             	sub    $0xc,%esp
80102b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		struct buf *lbuf =
			bread(log.dev, log.start + tail + 1); // read log block
80102b50:	a1 14 27 11 80       	mov    0x80112714,%eax
80102b55:	83 ec 08             	sub    $0x8,%esp
80102b58:	01 d8                	add    %ebx,%eax
80102b5a:	83 c0 01             	add    $0x1,%eax
80102b5d:	50                   	push   %eax
80102b5e:	ff 35 24 27 11 80    	pushl  0x80112724
80102b64:	e8 67 d5 ff ff       	call   801000d0 <bread>
80102b69:	89 c7                	mov    %eax,%edi
		struct buf *dbuf =
			bread(log.dev, log.lh.block[tail]); // read dst
80102b6b:	58                   	pop    %eax
80102b6c:	5a                   	pop    %edx
80102b6d:	ff 34 9d 2c 27 11 80 	pushl  -0x7feed8d4(,%ebx,4)
80102b74:	ff 35 24 27 11 80    	pushl  0x80112724
	for (tail = 0; tail < log.lh.n; tail++) {
80102b7a:	83 c3 01             	add    $0x1,%ebx
			bread(log.dev, log.lh.block[tail]); // read dst
80102b7d:	e8 4e d5 ff ff       	call   801000d0 <bread>
		memmove(dbuf->data, lbuf->data, BSIZE);     // copy block to dst
80102b82:	83 c4 0c             	add    $0xc,%esp
			bread(log.dev, log.lh.block[tail]); // read dst
80102b85:	89 c6                	mov    %eax,%esi
		memmove(dbuf->data, lbuf->data, BSIZE);     // copy block to dst
80102b87:	8d 47 5c             	lea    0x5c(%edi),%eax
80102b8a:	68 00 02 00 00       	push   $0x200
80102b8f:	50                   	push   %eax
80102b90:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b93:	50                   	push   %eax
80102b94:	e8 97 1a 00 00       	call   80104630 <memmove>
		bwrite(dbuf);				    // write dst to disk
80102b99:	89 34 24             	mov    %esi,(%esp)
80102b9c:	e8 0f d6 ff ff       	call   801001b0 <bwrite>
		brelse(lbuf);
80102ba1:	89 3c 24             	mov    %edi,(%esp)
80102ba4:	e8 47 d6 ff ff       	call   801001f0 <brelse>
		brelse(dbuf);
80102ba9:	89 34 24             	mov    %esi,(%esp)
80102bac:	e8 3f d6 ff ff       	call   801001f0 <brelse>
	for (tail = 0; tail < log.lh.n; tail++) {
80102bb1:	83 c4 10             	add    $0x10,%esp
80102bb4:	39 1d 28 27 11 80    	cmp    %ebx,0x80112728
80102bba:	7f 94                	jg     80102b50 <install_trans+0x20>
	}
}
80102bbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102bbf:	5b                   	pop    %ebx
80102bc0:	5e                   	pop    %esi
80102bc1:	5f                   	pop    %edi
80102bc2:	5d                   	pop    %ebp
80102bc3:	c3                   	ret    
80102bc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102bc8:	c3                   	ret    
80102bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102bd0 <write_head>:

// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void write_head(void)
{
80102bd0:	55                   	push   %ebp
80102bd1:	89 e5                	mov    %esp,%ebp
80102bd3:	53                   	push   %ebx
80102bd4:	83 ec 0c             	sub    $0xc,%esp
	struct buf *buf = bread(log.dev, log.start);
80102bd7:	ff 35 14 27 11 80    	pushl  0x80112714
80102bdd:	ff 35 24 27 11 80    	pushl  0x80112724
80102be3:	e8 e8 d4 ff ff       	call   801000d0 <bread>
	struct logheader *hb = (struct logheader *)(buf->data);
	int i;
	hb->n = log.lh.n;
	for (i = 0; i < log.lh.n; i++) {
80102be8:	83 c4 10             	add    $0x10,%esp
	struct buf *buf = bread(log.dev, log.start);
80102beb:	89 c3                	mov    %eax,%ebx
	hb->n = log.lh.n;
80102bed:	a1 28 27 11 80       	mov    0x80112728,%eax
80102bf2:	89 43 5c             	mov    %eax,0x5c(%ebx)
	for (i = 0; i < log.lh.n; i++) {
80102bf5:	85 c0                	test   %eax,%eax
80102bf7:	7e 19                	jle    80102c12 <write_head+0x42>
80102bf9:	31 d2                	xor    %edx,%edx
80102bfb:	90                   	nop
80102bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		hb->block[i] = log.lh.block[i];
80102c00:	8b 0c 95 2c 27 11 80 	mov    -0x7feed8d4(,%edx,4),%ecx
80102c07:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
	for (i = 0; i < log.lh.n; i++) {
80102c0b:	83 c2 01             	add    $0x1,%edx
80102c0e:	39 d0                	cmp    %edx,%eax
80102c10:	75 ee                	jne    80102c00 <write_head+0x30>
	}
	bwrite(buf);
80102c12:	83 ec 0c             	sub    $0xc,%esp
80102c15:	53                   	push   %ebx
80102c16:	e8 95 d5 ff ff       	call   801001b0 <bwrite>
	brelse(buf);
80102c1b:	89 1c 24             	mov    %ebx,(%esp)
80102c1e:	e8 cd d5 ff ff       	call   801001f0 <brelse>
}
80102c23:	83 c4 10             	add    $0x10,%esp
80102c26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c29:	c9                   	leave  
80102c2a:	c3                   	ret    
80102c2b:	90                   	nop
80102c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102c30 <initlog>:
{
80102c30:	55                   	push   %ebp
80102c31:	89 e5                	mov    %esp,%ebp
80102c33:	53                   	push   %ebx
80102c34:	83 ec 2c             	sub    $0x2c,%esp
80102c37:	8b 5d 08             	mov    0x8(%ebp),%ebx
	initlock(&log.lock, "log");
80102c3a:	68 20 74 10 80       	push   $0x80107420
80102c3f:	68 e0 26 11 80       	push   $0x801126e0
80102c44:	e8 d7 16 00 00       	call   80104320 <initlock>
	readsb(dev, &sb);
80102c49:	58                   	pop    %eax
80102c4a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102c4d:	5a                   	pop    %edx
80102c4e:	50                   	push   %eax
80102c4f:	53                   	push   %ebx
80102c50:	e8 3b e8 ff ff       	call   80101490 <readsb>
	log.start = sb.logstart;
80102c55:	8b 45 ec             	mov    -0x14(%ebp),%eax
	struct buf *buf = bread(log.dev, log.start);
80102c58:	59                   	pop    %ecx
	log.dev = dev;
80102c59:	89 1d 24 27 11 80    	mov    %ebx,0x80112724
	log.size = sb.nlog;
80102c5f:	8b 55 e8             	mov    -0x18(%ebp),%edx
	log.start = sb.logstart;
80102c62:	a3 14 27 11 80       	mov    %eax,0x80112714
	log.size = sb.nlog;
80102c67:	89 15 18 27 11 80    	mov    %edx,0x80112718
	struct buf *buf = bread(log.dev, log.start);
80102c6d:	5a                   	pop    %edx
80102c6e:	50                   	push   %eax
80102c6f:	53                   	push   %ebx
80102c70:	e8 5b d4 ff ff       	call   801000d0 <bread>
	for (i = 0; i < log.lh.n; i++) {
80102c75:	83 c4 10             	add    $0x10,%esp
	log.lh.n = lh->n;
80102c78:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102c7b:	89 0d 28 27 11 80    	mov    %ecx,0x80112728
	for (i = 0; i < log.lh.n; i++) {
80102c81:	85 c9                	test   %ecx,%ecx
80102c83:	7e 1d                	jle    80102ca2 <initlog+0x72>
80102c85:	31 d2                	xor    %edx,%edx
80102c87:	89 f6                	mov    %esi,%esi
80102c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		log.lh.block[i] = lh->block[i];
80102c90:	8b 5c 90 60          	mov    0x60(%eax,%edx,4),%ebx
80102c94:	89 1c 95 2c 27 11 80 	mov    %ebx,-0x7feed8d4(,%edx,4)
	for (i = 0; i < log.lh.n; i++) {
80102c9b:	83 c2 01             	add    $0x1,%edx
80102c9e:	39 d1                	cmp    %edx,%ecx
80102ca0:	75 ee                	jne    80102c90 <initlog+0x60>
	brelse(buf);
80102ca2:	83 ec 0c             	sub    $0xc,%esp
80102ca5:	50                   	push   %eax
80102ca6:	e8 45 d5 ff ff       	call   801001f0 <brelse>

static void recover_from_log(void)
{
	read_head();
	install_trans(); // if committed, copy from log to disk
80102cab:	e8 80 fe ff ff       	call   80102b30 <install_trans>
	log.lh.n = 0;
80102cb0:	c7 05 28 27 11 80 00 	movl   $0x0,0x80112728
80102cb7:	00 00 00 
	write_head(); // clear the log
80102cba:	e8 11 ff ff ff       	call   80102bd0 <write_head>
}
80102cbf:	83 c4 10             	add    $0x10,%esp
80102cc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102cc5:	c9                   	leave  
80102cc6:	c3                   	ret    
80102cc7:	89 f6                	mov    %esi,%esi
80102cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102cd0 <begin_op>:
}

// called at the start of each FS system call.
void begin_op(void)
{
80102cd0:	55                   	push   %ebp
80102cd1:	89 e5                	mov    %esp,%ebp
80102cd3:	83 ec 14             	sub    $0x14,%esp
	acquire(&log.lock);
80102cd6:	68 e0 26 11 80       	push   $0x801126e0
80102cdb:	e8 40 17 00 00       	call   80104420 <acquire>
80102ce0:	83 c4 10             	add    $0x10,%esp
80102ce3:	eb 18                	jmp    80102cfd <begin_op+0x2d>
80102ce5:	8d 76 00             	lea    0x0(%esi),%esi
	while (1) {
		if (log.committing) {
			sleep(&log, &log.lock);
80102ce8:	83 ec 08             	sub    $0x8,%esp
80102ceb:	68 e0 26 11 80       	push   $0x801126e0
80102cf0:	68 e0 26 11 80       	push   $0x801126e0
80102cf5:	e8 c6 11 00 00       	call   80103ec0 <sleep>
80102cfa:	83 c4 10             	add    $0x10,%esp
		if (log.committing) {
80102cfd:	a1 20 27 11 80       	mov    0x80112720,%eax
80102d02:	85 c0                	test   %eax,%eax
80102d04:	75 e2                	jne    80102ce8 <begin_op+0x18>
		} else if (log.lh.n + (log.outstanding + 1) * MAXOPBLOCKS
80102d06:	a1 1c 27 11 80       	mov    0x8011271c,%eax
80102d0b:	8b 15 28 27 11 80    	mov    0x80112728,%edx
80102d11:	83 c0 01             	add    $0x1,%eax
80102d14:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102d17:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102d1a:	83 fa 1e             	cmp    $0x1e,%edx
80102d1d:	7f c9                	jg     80102ce8 <begin_op+0x18>
			   > LOGSIZE) {
			// this op might exhaust log space; wait for commit.
			sleep(&log, &log.lock);
		} else {
			log.outstanding += 1;
			release(&log.lock);
80102d1f:	83 ec 0c             	sub    $0xc,%esp
			log.outstanding += 1;
80102d22:	a3 1c 27 11 80       	mov    %eax,0x8011271c
			release(&log.lock);
80102d27:	68 e0 26 11 80       	push   $0x801126e0
80102d2c:	e8 0f 18 00 00       	call   80104540 <release>
			break;
		}
	}
}
80102d31:	83 c4 10             	add    $0x10,%esp
80102d34:	c9                   	leave  
80102d35:	c3                   	ret    
80102d36:	8d 76 00             	lea    0x0(%esi),%esi
80102d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d40 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void end_op(void)
{
80102d40:	55                   	push   %ebp
80102d41:	89 e5                	mov    %esp,%ebp
80102d43:	57                   	push   %edi
80102d44:	56                   	push   %esi
80102d45:	53                   	push   %ebx
80102d46:	83 ec 18             	sub    $0x18,%esp
	int do_commit = 0;

	acquire(&log.lock);
80102d49:	68 e0 26 11 80       	push   $0x801126e0
80102d4e:	e8 cd 16 00 00       	call   80104420 <acquire>
	log.outstanding -= 1;
80102d53:	a1 1c 27 11 80       	mov    0x8011271c,%eax
	if (log.committing)
80102d58:	8b 35 20 27 11 80    	mov    0x80112720,%esi
80102d5e:	83 c4 10             	add    $0x10,%esp
	log.outstanding -= 1;
80102d61:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102d64:	89 1d 1c 27 11 80    	mov    %ebx,0x8011271c
	if (log.committing)
80102d6a:	85 f6                	test   %esi,%esi
80102d6c:	0f 85 22 01 00 00    	jne    80102e94 <end_op+0x154>
		panic("log.committing");
	if (log.outstanding == 0) {
80102d72:	85 db                	test   %ebx,%ebx
80102d74:	0f 85 f6 00 00 00    	jne    80102e70 <end_op+0x130>
		do_commit = 1;
		log.committing = 1;
80102d7a:	c7 05 20 27 11 80 01 	movl   $0x1,0x80112720
80102d81:	00 00 00 
		// begin_op() may be waiting for log space,
		// and decrementing log.outstanding has decreased
		// the amount of reserved space.
		wakeup(&log);
	}
	release(&log.lock);
80102d84:	83 ec 0c             	sub    $0xc,%esp
80102d87:	68 e0 26 11 80       	push   $0x801126e0
80102d8c:	e8 af 17 00 00       	call   80104540 <release>
	}
}

static void commit()
{
	if (log.lh.n > 0) {
80102d91:	8b 0d 28 27 11 80    	mov    0x80112728,%ecx
80102d97:	83 c4 10             	add    $0x10,%esp
80102d9a:	85 c9                	test   %ecx,%ecx
80102d9c:	7f 42                	jg     80102de0 <end_op+0xa0>
		acquire(&log.lock);
80102d9e:	83 ec 0c             	sub    $0xc,%esp
80102da1:	68 e0 26 11 80       	push   $0x801126e0
80102da6:	e8 75 16 00 00       	call   80104420 <acquire>
		wakeup(&log);
80102dab:	c7 04 24 e0 26 11 80 	movl   $0x801126e0,(%esp)
		log.committing = 0;
80102db2:	c7 05 20 27 11 80 00 	movl   $0x0,0x80112720
80102db9:	00 00 00 
		wakeup(&log);
80102dbc:	e8 af 12 00 00       	call   80104070 <wakeup>
		release(&log.lock);
80102dc1:	c7 04 24 e0 26 11 80 	movl   $0x801126e0,(%esp)
80102dc8:	e8 73 17 00 00       	call   80104540 <release>
80102dcd:	83 c4 10             	add    $0x10,%esp
}
80102dd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dd3:	5b                   	pop    %ebx
80102dd4:	5e                   	pop    %esi
80102dd5:	5f                   	pop    %edi
80102dd6:	5d                   	pop    %ebp
80102dd7:	c3                   	ret    
80102dd8:	90                   	nop
80102dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			bread(log.dev, log.start + tail + 1); // log block
80102de0:	a1 14 27 11 80       	mov    0x80112714,%eax
80102de5:	83 ec 08             	sub    $0x8,%esp
80102de8:	01 d8                	add    %ebx,%eax
80102dea:	83 c0 01             	add    $0x1,%eax
80102ded:	50                   	push   %eax
80102dee:	ff 35 24 27 11 80    	pushl  0x80112724
80102df4:	e8 d7 d2 ff ff       	call   801000d0 <bread>
80102df9:	89 c6                	mov    %eax,%esi
			bread(log.dev, log.lh.block[tail]); // cache block
80102dfb:	58                   	pop    %eax
80102dfc:	5a                   	pop    %edx
80102dfd:	ff 34 9d 2c 27 11 80 	pushl  -0x7feed8d4(,%ebx,4)
80102e04:	ff 35 24 27 11 80    	pushl  0x80112724
	for (tail = 0; tail < log.lh.n; tail++) {
80102e0a:	83 c3 01             	add    $0x1,%ebx
			bread(log.dev, log.lh.block[tail]); // cache block
80102e0d:	e8 be d2 ff ff       	call   801000d0 <bread>
		memmove(to->data, from->data, BSIZE);
80102e12:	83 c4 0c             	add    $0xc,%esp
			bread(log.dev, log.lh.block[tail]); // cache block
80102e15:	89 c7                	mov    %eax,%edi
		memmove(to->data, from->data, BSIZE);
80102e17:	8d 40 5c             	lea    0x5c(%eax),%eax
80102e1a:	68 00 02 00 00       	push   $0x200
80102e1f:	50                   	push   %eax
80102e20:	8d 46 5c             	lea    0x5c(%esi),%eax
80102e23:	50                   	push   %eax
80102e24:	e8 07 18 00 00       	call   80104630 <memmove>
		bwrite(to); // write the log
80102e29:	89 34 24             	mov    %esi,(%esp)
80102e2c:	e8 7f d3 ff ff       	call   801001b0 <bwrite>
		brelse(from);
80102e31:	89 3c 24             	mov    %edi,(%esp)
80102e34:	e8 b7 d3 ff ff       	call   801001f0 <brelse>
		brelse(to);
80102e39:	89 34 24             	mov    %esi,(%esp)
80102e3c:	e8 af d3 ff ff       	call   801001f0 <brelse>
	for (tail = 0; tail < log.lh.n; tail++) {
80102e41:	83 c4 10             	add    $0x10,%esp
80102e44:	3b 1d 28 27 11 80    	cmp    0x80112728,%ebx
80102e4a:	7c 94                	jl     80102de0 <end_op+0xa0>
		write_log();     // Write modified blocks from cache to log
		write_head();    // Write header to disk -- the real commit
80102e4c:	e8 7f fd ff ff       	call   80102bd0 <write_head>
		install_trans(); // Now install writes to home locations
80102e51:	e8 da fc ff ff       	call   80102b30 <install_trans>
		log.lh.n = 0;
80102e56:	c7 05 28 27 11 80 00 	movl   $0x0,0x80112728
80102e5d:	00 00 00 
		write_head(); // Erase the transaction from the log
80102e60:	e8 6b fd ff ff       	call   80102bd0 <write_head>
80102e65:	e9 34 ff ff ff       	jmp    80102d9e <end_op+0x5e>
80102e6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		wakeup(&log);
80102e70:	83 ec 0c             	sub    $0xc,%esp
80102e73:	68 e0 26 11 80       	push   $0x801126e0
80102e78:	e8 f3 11 00 00       	call   80104070 <wakeup>
	release(&log.lock);
80102e7d:	c7 04 24 e0 26 11 80 	movl   $0x801126e0,(%esp)
80102e84:	e8 b7 16 00 00       	call   80104540 <release>
80102e89:	83 c4 10             	add    $0x10,%esp
}
80102e8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e8f:	5b                   	pop    %ebx
80102e90:	5e                   	pop    %esi
80102e91:	5f                   	pop    %edi
80102e92:	5d                   	pop    %ebp
80102e93:	c3                   	ret    
		panic("log.committing");
80102e94:	83 ec 0c             	sub    $0xc,%esp
80102e97:	68 24 74 10 80       	push   $0x80107424
80102e9c:	e8 ef d4 ff ff       	call   80100390 <panic>
80102ea1:	eb 0d                	jmp    80102eb0 <log_write>
80102ea3:	90                   	nop
80102ea4:	90                   	nop
80102ea5:	90                   	nop
80102ea6:	90                   	nop
80102ea7:	90                   	nop
80102ea8:	90                   	nop
80102ea9:	90                   	nop
80102eaa:	90                   	nop
80102eab:	90                   	nop
80102eac:	90                   	nop
80102ead:	90                   	nop
80102eae:	90                   	nop
80102eaf:	90                   	nop

80102eb0 <log_write>:
//   bp = bread(...)
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void log_write(struct buf *b)
{
80102eb0:	55                   	push   %ebp
80102eb1:	89 e5                	mov    %esp,%ebp
80102eb3:	53                   	push   %ebx
80102eb4:	83 ec 04             	sub    $0x4,%esp
	int i;

	if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102eb7:	8b 15 28 27 11 80    	mov    0x80112728,%edx
{
80102ebd:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102ec0:	83 fa 1d             	cmp    $0x1d,%edx
80102ec3:	0f 8f 94 00 00 00    	jg     80102f5d <log_write+0xad>
80102ec9:	a1 18 27 11 80       	mov    0x80112718,%eax
80102ece:	83 e8 01             	sub    $0x1,%eax
80102ed1:	39 c2                	cmp    %eax,%edx
80102ed3:	0f 8d 84 00 00 00    	jge    80102f5d <log_write+0xad>
		panic("too big a transaction");
	if (log.outstanding < 1)
80102ed9:	a1 1c 27 11 80       	mov    0x8011271c,%eax
80102ede:	85 c0                	test   %eax,%eax
80102ee0:	0f 8e 84 00 00 00    	jle    80102f6a <log_write+0xba>
		panic("log_write outside of trans");

	acquire(&log.lock);
80102ee6:	83 ec 0c             	sub    $0xc,%esp
80102ee9:	68 e0 26 11 80       	push   $0x801126e0
80102eee:	e8 2d 15 00 00       	call   80104420 <acquire>
	for (i = 0; i < log.lh.n; i++) {
80102ef3:	8b 15 28 27 11 80    	mov    0x80112728,%edx
80102ef9:	83 c4 10             	add    $0x10,%esp
80102efc:	85 d2                	test   %edx,%edx
80102efe:	7e 51                	jle    80102f51 <log_write+0xa1>
		if (log.lh.block[i] == b->blockno) // log absorbtion
80102f00:	8b 4b 08             	mov    0x8(%ebx),%ecx
	for (i = 0; i < log.lh.n; i++) {
80102f03:	31 c0                	xor    %eax,%eax
		if (log.lh.block[i] == b->blockno) // log absorbtion
80102f05:	3b 0d 2c 27 11 80    	cmp    0x8011272c,%ecx
80102f0b:	75 0c                	jne    80102f19 <log_write+0x69>
80102f0d:	eb 39                	jmp    80102f48 <log_write+0x98>
80102f0f:	90                   	nop
80102f10:	39 0c 85 2c 27 11 80 	cmp    %ecx,-0x7feed8d4(,%eax,4)
80102f17:	74 2f                	je     80102f48 <log_write+0x98>
	for (i = 0; i < log.lh.n; i++) {
80102f19:	83 c0 01             	add    $0x1,%eax
80102f1c:	39 c2                	cmp    %eax,%edx
80102f1e:	75 f0                	jne    80102f10 <log_write+0x60>
			break;
	}
	log.lh.block[i] = b->blockno;
80102f20:	89 0c 95 2c 27 11 80 	mov    %ecx,-0x7feed8d4(,%edx,4)
	if (i == log.lh.n)
		log.lh.n++;
80102f27:	83 c2 01             	add    $0x1,%edx
80102f2a:	89 15 28 27 11 80    	mov    %edx,0x80112728
	b->flags |= B_DIRTY; // prevent eviction
80102f30:	83 0b 04             	orl    $0x4,(%ebx)
	release(&log.lock);
}
80102f33:	8b 5d fc             	mov    -0x4(%ebp),%ebx
	release(&log.lock);
80102f36:	c7 45 08 e0 26 11 80 	movl   $0x801126e0,0x8(%ebp)
}
80102f3d:	c9                   	leave  
	release(&log.lock);
80102f3e:	e9 fd 15 00 00       	jmp    80104540 <release>
80102f43:	90                   	nop
80102f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	log.lh.block[i] = b->blockno;
80102f48:	89 0c 85 2c 27 11 80 	mov    %ecx,-0x7feed8d4(,%eax,4)
	if (i == log.lh.n)
80102f4f:	eb df                	jmp    80102f30 <log_write+0x80>
	log.lh.block[i] = b->blockno;
80102f51:	8b 43 08             	mov    0x8(%ebx),%eax
80102f54:	a3 2c 27 11 80       	mov    %eax,0x8011272c
	if (i == log.lh.n)
80102f59:	75 d5                	jne    80102f30 <log_write+0x80>
80102f5b:	eb ca                	jmp    80102f27 <log_write+0x77>
		panic("too big a transaction");
80102f5d:	83 ec 0c             	sub    $0xc,%esp
80102f60:	68 33 74 10 80       	push   $0x80107433
80102f65:	e8 26 d4 ff ff       	call   80100390 <panic>
		panic("log_write outside of trans");
80102f6a:	83 ec 0c             	sub    $0xc,%esp
80102f6d:	68 49 74 10 80       	push   $0x80107449
80102f72:	e8 19 d4 ff ff       	call   80100390 <panic>
80102f77:	66 90                	xchg   %ax,%ax
80102f79:	66 90                	xchg   %ax,%ax
80102f7b:	66 90                	xchg   %ax,%ax
80102f7d:	66 90                	xchg   %ax,%ax
80102f7f:	90                   	nop

80102f80 <mpmain>:
	mpmain();
}

// Common CPU setup code.
static void mpmain(void)
{
80102f80:	55                   	push   %ebp
80102f81:	89 e5                	mov    %esp,%ebp
80102f83:	53                   	push   %ebx
80102f84:	83 ec 04             	sub    $0x4,%esp
	cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102f87:	e8 64 09 00 00       	call   801038f0 <cpuid>
80102f8c:	89 c3                	mov    %eax,%ebx
80102f8e:	e8 5d 09 00 00       	call   801038f0 <cpuid>
80102f93:	83 ec 04             	sub    $0x4,%esp
80102f96:	53                   	push   %ebx
80102f97:	50                   	push   %eax
80102f98:	68 64 74 10 80       	push   $0x80107464
80102f9d:	e8 0e d7 ff ff       	call   801006b0 <cprintf>
	idtinit();		      // load idt register
80102fa2:	e8 19 28 00 00       	call   801057c0 <idtinit>
	xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102fa7:	e8 c4 08 00 00       	call   80103870 <mycpu>
80102fac:	89 c2                	mov    %eax,%edx
static inline uint xchg(volatile uint *addr, uint newval)
{
	uint result;

	// The + in "+m" denotes a read-modify-write operand.
	asm volatile("lock; xchgl %0, %1"
80102fae:	b8 01 00 00 00       	mov    $0x1,%eax
80102fb3:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
	scheduler();		      // start running processes
80102fba:	e8 11 0c 00 00       	call   80103bd0 <scheduler>
80102fbf:	90                   	nop

80102fc0 <mpenter>:
{
80102fc0:	55                   	push   %ebp
80102fc1:	89 e5                	mov    %esp,%ebp
80102fc3:	83 ec 08             	sub    $0x8,%esp
	switchkvm();
80102fc6:	e8 f5 38 00 00       	call   801068c0 <switchkvm>
	seginit();
80102fcb:	e8 60 38 00 00       	call   80106830 <seginit>
	lapicinit();
80102fd0:	e8 8b f7 ff ff       	call   80102760 <lapicinit>
	mpmain();
80102fd5:	e8 a6 ff ff ff       	call   80102f80 <mpmain>
80102fda:	66 90                	xchg   %ax,%ax
80102fdc:	66 90                	xchg   %ax,%ax
80102fde:	66 90                	xchg   %ax,%ax

80102fe0 <main>:
{
80102fe0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102fe4:	83 e4 f0             	and    $0xfffffff0,%esp
80102fe7:	ff 71 fc             	pushl  -0x4(%ecx)
80102fea:	55                   	push   %ebp
80102feb:	89 e5                	mov    %esp,%ebp
80102fed:	53                   	push   %ebx
80102fee:	51                   	push   %ecx
	kinit1(end, P2V(4 * 1024 * 1024)); // phys page allocator
80102fef:	83 ec 08             	sub    $0x8,%esp
80102ff2:	68 00 00 40 80       	push   $0x80400000
80102ff7:	68 08 55 11 80       	push   $0x80115508
80102ffc:	e8 0f f5 ff ff       	call   80102510 <kinit1>
	kvmalloc();			   // kernel page table
80103001:	e8 7a 3d 00 00       	call   80106d80 <kvmalloc>
	mpinit();			   // detect other processors
80103006:	e8 85 01 00 00       	call   80103190 <mpinit>
	lapicinit();			   // interrupt controller
8010300b:	e8 50 f7 ff ff       	call   80102760 <lapicinit>
	seginit();			   // segment descriptors
80103010:	e8 1b 38 00 00       	call   80106830 <seginit>
	picinit();			   // disable pic
80103015:	e8 46 03 00 00       	call   80103360 <picinit>
	ioapicinit();			   // another interrupt controller
8010301a:	e8 11 f3 ff ff       	call   80102330 <ioapicinit>
	consoleinit();			   // console hardware
8010301f:	e8 3c da ff ff       	call   80100a60 <consoleinit>
	uartinit();			   // serial port
80103024:	e8 c7 2a 00 00       	call   80105af0 <uartinit>
	pinit();			   // process table
80103029:	e8 22 08 00 00       	call   80103850 <pinit>
	tvinit();			   // trap vectors
8010302e:	e8 0d 27 00 00       	call   80105740 <tvinit>
	binit();			   // buffer cache
80103033:	e8 08 d0 ff ff       	call   80100040 <binit>
	fileinit();			   // file table
80103038:	e8 d3 dd ff ff       	call   80100e10 <fileinit>
	ideinit();			   // disk
8010303d:	e8 ce f0 ff ff       	call   80102110 <ideinit>

	// Write entry code to unused memory at 0x7000.
	// The linker has placed the image of entryother.S in
	// _binary_entryother_start.
	code = P2V(0x7000);
	memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103042:	83 c4 0c             	add    $0xc,%esp
80103045:	68 8a 00 00 00       	push   $0x8a
8010304a:	68 cc a4 10 80       	push   $0x8010a4cc
8010304f:	68 00 70 00 80       	push   $0x80007000
80103054:	e8 d7 15 00 00       	call   80104630 <memmove>

	for (c = cpus; c < cpus + ncpu; c++) {
80103059:	83 c4 10             	add    $0x10,%esp
8010305c:	69 05 60 2d 11 80 b0 	imul   $0xb0,0x80112d60,%eax
80103063:	00 00 00 
80103066:	05 e0 27 11 80       	add    $0x801127e0,%eax
8010306b:	3d e0 27 11 80       	cmp    $0x801127e0,%eax
80103070:	76 7e                	jbe    801030f0 <main+0x110>
80103072:	bb e0 27 11 80       	mov    $0x801127e0,%ebx
80103077:	eb 20                	jmp    80103099 <main+0xb9>
80103079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103080:	69 05 60 2d 11 80 b0 	imul   $0xb0,0x80112d60,%eax
80103087:	00 00 00 
8010308a:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103090:	05 e0 27 11 80       	add    $0x801127e0,%eax
80103095:	39 c3                	cmp    %eax,%ebx
80103097:	73 57                	jae    801030f0 <main+0x110>
		if (c == mycpu()) // We've started already.
80103099:	e8 d2 07 00 00       	call   80103870 <mycpu>
8010309e:	39 d8                	cmp    %ebx,%eax
801030a0:	74 de                	je     80103080 <main+0xa0>

		// Tell entryother.S what stack to use, where to enter, and what
		// pgdir to use. We cannot use kpgdir yet, because the AP
		// processor is running in low  memory, so we use entrypgdir for
		// the APs too.
		stack = kalloc();
801030a2:	e8 39 f5 ff ff       	call   801025e0 <kalloc>
		*(void **)(code - 4) = stack + KSTACKSIZE;
		*(void **)(code - 8) = mpenter;
		*(int **)(code - 12) = (void *)V2P(entrypgdir);

		lapicstartap(c->apicid, V2P(code));
801030a7:	83 ec 08             	sub    $0x8,%esp
		*(void **)(code - 8) = mpenter;
801030aa:	c7 05 f8 6f 00 80 c0 	movl   $0x80102fc0,0x80006ff8
801030b1:	2f 10 80 
		*(int **)(code - 12) = (void *)V2P(entrypgdir);
801030b4:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
801030bb:	90 10 00 
		*(void **)(code - 4) = stack + KSTACKSIZE;
801030be:	05 00 10 00 00       	add    $0x1000,%eax
801030c3:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
		lapicstartap(c->apicid, V2P(code));
801030c8:	0f b6 03             	movzbl (%ebx),%eax
801030cb:	68 00 70 00 00       	push   $0x7000
801030d0:	50                   	push   %eax
801030d1:	e8 da f7 ff ff       	call   801028b0 <lapicstartap>
801030d6:	83 c4 10             	add    $0x10,%esp
801030d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

		// wait for cpu to finish mpmain()
		while (c->started == 0)
801030e0:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801030e6:	85 c0                	test   %eax,%eax
801030e8:	74 f6                	je     801030e0 <main+0x100>
801030ea:	eb 94                	jmp    80103080 <main+0xa0>
801030ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	kinit2(P2V(4 * 1024 * 1024),
801030f0:	83 ec 08             	sub    $0x8,%esp
801030f3:	68 00 00 00 8e       	push   $0x8e000000
801030f8:	68 00 00 40 80       	push   $0x80400000
801030fd:	e8 7e f4 ff ff       	call   80102580 <kinit2>
	userinit();	   // first user process
80103102:	e8 39 08 00 00       	call   80103940 <userinit>
	mpmain();	     // finish this processor's setup
80103107:	e8 74 fe ff ff       	call   80102f80 <mpmain>
8010310c:	66 90                	xchg   %ax,%ax
8010310e:	66 90                	xchg   %ax,%ax

80103110 <mpsearch1>:
	return sum;
}

// Look for an MP structure in the len bytes at addr.
static struct mp *mpsearch1(uint a, int len)
{
80103110:	55                   	push   %ebp
80103111:	89 e5                	mov    %esp,%ebp
80103113:	57                   	push   %edi
80103114:	56                   	push   %esi
	uchar *e, *p, *addr;

	addr = P2V(a);
80103115:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010311b:	53                   	push   %ebx
	e = addr + len;
8010311c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010311f:	83 ec 0c             	sub    $0xc,%esp
	for (p = addr; p < e; p += sizeof(struct mp))
80103122:	39 de                	cmp    %ebx,%esi
80103124:	72 10                	jb     80103136 <mpsearch1+0x26>
80103126:	eb 50                	jmp    80103178 <mpsearch1+0x68>
80103128:	90                   	nop
80103129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103130:	89 fe                	mov    %edi,%esi
80103132:	39 fb                	cmp    %edi,%ebx
80103134:	76 42                	jbe    80103178 <mpsearch1+0x68>
		if (memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103136:	83 ec 04             	sub    $0x4,%esp
80103139:	8d 7e 10             	lea    0x10(%esi),%edi
8010313c:	6a 04                	push   $0x4
8010313e:	68 78 74 10 80       	push   $0x80107478
80103143:	56                   	push   %esi
80103144:	e8 97 14 00 00       	call   801045e0 <memcmp>
80103149:	83 c4 10             	add    $0x10,%esp
8010314c:	85 c0                	test   %eax,%eax
8010314e:	75 e0                	jne    80103130 <mpsearch1+0x20>
80103150:	89 f1                	mov    %esi,%ecx
80103152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		sum += addr[i];
80103158:	0f b6 11             	movzbl (%ecx),%edx
8010315b:	83 c1 01             	add    $0x1,%ecx
8010315e:	01 d0                	add    %edx,%eax
	for (i = 0; i < len; i++)
80103160:	39 f9                	cmp    %edi,%ecx
80103162:	75 f4                	jne    80103158 <mpsearch1+0x48>
		if (memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103164:	84 c0                	test   %al,%al
80103166:	75 c8                	jne    80103130 <mpsearch1+0x20>
			return (struct mp *)p;
	return 0;
}
80103168:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010316b:	89 f0                	mov    %esi,%eax
8010316d:	5b                   	pop    %ebx
8010316e:	5e                   	pop    %esi
8010316f:	5f                   	pop    %edi
80103170:	5d                   	pop    %ebp
80103171:	c3                   	ret    
80103172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103178:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return 0;
8010317b:	31 f6                	xor    %esi,%esi
}
8010317d:	5b                   	pop    %ebx
8010317e:	89 f0                	mov    %esi,%eax
80103180:	5e                   	pop    %esi
80103181:	5f                   	pop    %edi
80103182:	5d                   	pop    %ebp
80103183:	c3                   	ret    
80103184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010318a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103190 <mpinit>:
	*pmp = mp;
	return conf;
}

void mpinit(void)
{
80103190:	55                   	push   %ebp
80103191:	89 e5                	mov    %esp,%ebp
80103193:	57                   	push   %edi
80103194:	56                   	push   %esi
80103195:	53                   	push   %ebx
80103196:	83 ec 1c             	sub    $0x1c,%esp
	if ((p = ((bda[0x0F] << 8) | bda[0x0E]) << 4)) {
80103199:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801031a0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801031a7:	c1 e0 08             	shl    $0x8,%eax
801031aa:	09 d0                	or     %edx,%eax
801031ac:	c1 e0 04             	shl    $0x4,%eax
801031af:	75 1b                	jne    801031cc <mpinit+0x3c>
		p = ((bda[0x14] << 8) | bda[0x13]) * 1024;
801031b1:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801031b8:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801031bf:	c1 e0 08             	shl    $0x8,%eax
801031c2:	09 d0                	or     %edx,%eax
801031c4:	c1 e0 0a             	shl    $0xa,%eax
		if ((mp = mpsearch1(p - 1024, 1024)))
801031c7:	2d 00 04 00 00       	sub    $0x400,%eax
		if ((mp = mpsearch1(p, 1024)))
801031cc:	ba 00 04 00 00       	mov    $0x400,%edx
801031d1:	e8 3a ff ff ff       	call   80103110 <mpsearch1>
801031d6:	89 c7                	mov    %eax,%edi
801031d8:	85 c0                	test   %eax,%eax
801031da:	0f 84 c0 00 00 00    	je     801032a0 <mpinit+0x110>
	if ((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031e0:	8b 5f 04             	mov    0x4(%edi),%ebx
801031e3:	85 db                	test   %ebx,%ebx
801031e5:	0f 84 d5 00 00 00    	je     801032c0 <mpinit+0x130>
	if (memcmp(conf, "PCMP", 4) != 0)
801031eb:	83 ec 04             	sub    $0x4,%esp
	conf = (struct mpconf *)P2V((uint)mp->physaddr);
801031ee:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
	if (memcmp(conf, "PCMP", 4) != 0)
801031f4:	6a 04                	push   $0x4
801031f6:	68 95 74 10 80       	push   $0x80107495
801031fb:	50                   	push   %eax
	conf = (struct mpconf *)P2V((uint)mp->physaddr);
801031fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	if (memcmp(conf, "PCMP", 4) != 0)
801031ff:	e8 dc 13 00 00       	call   801045e0 <memcmp>
80103204:	83 c4 10             	add    $0x10,%esp
80103207:	85 c0                	test   %eax,%eax
80103209:	0f 85 b1 00 00 00    	jne    801032c0 <mpinit+0x130>
	if (conf->version != 1 && conf->version != 4)
8010320f:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103216:	3c 01                	cmp    $0x1,%al
80103218:	0f 95 c2             	setne  %dl
8010321b:	3c 04                	cmp    $0x4,%al
8010321d:	0f 95 c0             	setne  %al
80103220:	20 c2                	and    %al,%dl
80103222:	0f 85 98 00 00 00    	jne    801032c0 <mpinit+0x130>
	if (sum((uchar *)conf, conf->length) != 0)
80103228:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
	for (i = 0; i < len; i++)
8010322f:	66 85 c9             	test   %cx,%cx
80103232:	74 21                	je     80103255 <mpinit+0xc5>
80103234:	89 d8                	mov    %ebx,%eax
80103236:	8d 34 19             	lea    (%ecx,%ebx,1),%esi
	sum = 0;
80103239:	31 d2                	xor    %edx,%edx
8010323b:	90                   	nop
8010323c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		sum += addr[i];
80103240:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
80103247:	83 c0 01             	add    $0x1,%eax
8010324a:	01 ca                	add    %ecx,%edx
	for (i = 0; i < len; i++)
8010324c:	39 c6                	cmp    %eax,%esi
8010324e:	75 f0                	jne    80103240 <mpinit+0xb0>
80103250:	84 d2                	test   %dl,%dl
80103252:	0f 95 c2             	setne  %dl
	struct mp *mp;
	struct mpconf *conf;
	struct mpproc *proc;
	struct mpioapic *ioapic;

	if ((conf = mpconfig(&mp)) == 0)
80103255:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103258:	85 c9                	test   %ecx,%ecx
8010325a:	74 64                	je     801032c0 <mpinit+0x130>
8010325c:	84 d2                	test   %dl,%dl
8010325e:	75 60                	jne    801032c0 <mpinit+0x130>
		panic("Expect to run on an SMP");
	ismp = 1;
	lapic = (uint *)conf->lapicaddr;
80103260:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103266:	a3 dc 26 11 80       	mov    %eax,0x801126dc
	for (p = (uchar *)(conf + 1), e = (uchar *)conf + conf->length;
8010326b:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103272:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
	ismp = 1;
80103278:	bb 01 00 00 00       	mov    $0x1,%ebx
	for (p = (uchar *)(conf + 1), e = (uchar *)conf + conf->length;
8010327d:	01 d1                	add    %edx,%ecx
8010327f:	89 ce                	mov    %ecx,%esi
80103281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103288:	39 c6                	cmp    %eax,%esi
8010328a:	76 4b                	jbe    801032d7 <mpinit+0x147>
	     p < e;) {
		switch (*p) {
8010328c:	0f b6 10             	movzbl (%eax),%edx
8010328f:	80 fa 04             	cmp    $0x4,%dl
80103292:	0f 87 bf 00 00 00    	ja     80103357 <mpinit+0x1c7>
80103298:	ff 24 95 bc 74 10 80 	jmp    *-0x7fef8b44(,%edx,4)
8010329f:	90                   	nop
	return mpsearch1(0xF0000, 0x10000);
801032a0:	ba 00 00 01 00       	mov    $0x10000,%edx
801032a5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801032aa:	e8 61 fe ff ff       	call   80103110 <mpsearch1>
801032af:	89 c7                	mov    %eax,%edi
	if ((mp = mpsearch()) == 0 || mp->physaddr == 0)
801032b1:	85 c0                	test   %eax,%eax
801032b3:	0f 85 27 ff ff ff    	jne    801031e0 <mpinit+0x50>
801032b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		panic("Expect to run on an SMP");
801032c0:	83 ec 0c             	sub    $0xc,%esp
801032c3:	68 7d 74 10 80       	push   $0x8010747d
801032c8:	e8 c3 d0 ff ff       	call   80100390 <panic>
801032cd:	8d 76 00             	lea    0x0(%esi),%esi
			p += sizeof(struct mpioapic);
			continue;
		case MPBUS:
		case MPIOINTR:
		case MPLINTR:
			p += 8;
801032d0:	83 c0 08             	add    $0x8,%eax
	for (p = (uchar *)(conf + 1), e = (uchar *)conf + conf->length;
801032d3:	39 c6                	cmp    %eax,%esi
801032d5:	77 b5                	ja     8010328c <mpinit+0xfc>
		default:
			ismp = 0;
			break;
		}
	}
	if (!ismp)
801032d7:	85 db                	test   %ebx,%ebx
801032d9:	74 6f                	je     8010334a <mpinit+0x1ba>
		panic("Didn't find a suitable machine");

	if (mp->imcrp) {
801032db:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801032df:	74 15                	je     801032f6 <mpinit+0x166>
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801032e1:	b8 70 00 00 00       	mov    $0x70,%eax
801032e6:	ba 22 00 00 00       	mov    $0x22,%edx
801032eb:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
801032ec:	ba 23 00 00 00       	mov    $0x23,%edx
801032f1:	ec                   	in     (%dx),%al
		// Bochs doesn't support IMCR, so this doesn't run on Bochs.
		// But it would on real hardware.
		outb(0x22, 0x70);	  // Select IMCR
		outb(0x23, inb(0x23) | 1); // Mask external interrupts.
801032f2:	83 c8 01             	or     $0x1,%eax
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
801032f5:	ee                   	out    %al,(%dx)
	}
}
801032f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032f9:	5b                   	pop    %ebx
801032fa:	5e                   	pop    %esi
801032fb:	5f                   	pop    %edi
801032fc:	5d                   	pop    %ebp
801032fd:	c3                   	ret    
801032fe:	66 90                	xchg   %ax,%ax
			if (ncpu < NCPU) {
80103300:	8b 15 60 2d 11 80    	mov    0x80112d60,%edx
80103306:	83 fa 07             	cmp    $0x7,%edx
80103309:	7f 1f                	jg     8010332a <mpinit+0x19a>
				cpus[ncpu].apicid =
8010330b:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
80103311:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103314:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103318:	88 91 e0 27 11 80    	mov    %dl,-0x7feed820(%ecx)
				ncpu++;
8010331e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103321:	83 c2 01             	add    $0x1,%edx
80103324:	89 15 60 2d 11 80    	mov    %edx,0x80112d60
			p += sizeof(struct mpproc);
8010332a:	83 c0 14             	add    $0x14,%eax
			continue;
8010332d:	e9 56 ff ff ff       	jmp    80103288 <mpinit+0xf8>
80103332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			ioapicid = ioapic->apicno;
80103338:	0f b6 50 01          	movzbl 0x1(%eax),%edx
			p += sizeof(struct mpioapic);
8010333c:	83 c0 08             	add    $0x8,%eax
			ioapicid = ioapic->apicno;
8010333f:	88 15 c0 27 11 80    	mov    %dl,0x801127c0
			continue;
80103345:	e9 3e ff ff ff       	jmp    80103288 <mpinit+0xf8>
		panic("Didn't find a suitable machine");
8010334a:	83 ec 0c             	sub    $0xc,%esp
8010334d:	68 9c 74 10 80       	push   $0x8010749c
80103352:	e8 39 d0 ff ff       	call   80100390 <panic>
			ismp = 0;
80103357:	31 db                	xor    %ebx,%ebx
80103359:	e9 31 ff ff ff       	jmp    8010328f <mpinit+0xff>
8010335e:	66 90                	xchg   %ax,%ax

80103360 <picinit>:
80103360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103365:	ba 21 00 00 00       	mov    $0x21,%edx
8010336a:	ee                   	out    %al,(%dx)
8010336b:	ba a1 00 00 00       	mov    $0xa1,%edx
80103370:	ee                   	out    %al,(%dx)
void picinit(void)
{
	// mask all interrupts
	outb(IO_PIC1 + 1, 0xFF);
	outb(IO_PIC2 + 1, 0xFF);
}
80103371:	c3                   	ret    
80103372:	66 90                	xchg   %ax,%ax
80103374:	66 90                	xchg   %ax,%ax
80103376:	66 90                	xchg   %ax,%ax
80103378:	66 90                	xchg   %ax,%ax
8010337a:	66 90                	xchg   %ax,%ax
8010337c:	66 90                	xchg   %ax,%ax
8010337e:	66 90                	xchg   %ax,%ax

80103380 <pipealloc>:
	int readopen;  // read fd is still open
	int writeopen; // write fd is still open
};

int pipealloc(struct file **f0, struct file **f1)
{
80103380:	55                   	push   %ebp
80103381:	89 e5                	mov    %esp,%ebp
80103383:	57                   	push   %edi
80103384:	56                   	push   %esi
80103385:	53                   	push   %ebx
80103386:	83 ec 0c             	sub    $0xc,%esp
80103389:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010338c:	8b 75 0c             	mov    0xc(%ebp),%esi
	struct pipe *p;

	p = 0;
	*f0 = *f1 = 0;
8010338f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103395:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
	if ((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010339b:	e8 90 da ff ff       	call   80100e30 <filealloc>
801033a0:	89 03                	mov    %eax,(%ebx)
801033a2:	85 c0                	test   %eax,%eax
801033a4:	0f 84 a8 00 00 00    	je     80103452 <pipealloc+0xd2>
801033aa:	e8 81 da ff ff       	call   80100e30 <filealloc>
801033af:	89 06                	mov    %eax,(%esi)
801033b1:	85 c0                	test   %eax,%eax
801033b3:	0f 84 87 00 00 00    	je     80103440 <pipealloc+0xc0>
		goto bad;
	if ((p = (struct pipe *)kalloc()) == 0)
801033b9:	e8 22 f2 ff ff       	call   801025e0 <kalloc>
801033be:	89 c7                	mov    %eax,%edi
801033c0:	85 c0                	test   %eax,%eax
801033c2:	0f 84 b0 00 00 00    	je     80103478 <pipealloc+0xf8>
		goto bad;
	p->readopen = 1;
801033c8:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033cf:	00 00 00 
	p->writeopen = 1;
	p->nwrite = 0;
	p->nread = 0;
	initlock(&p->lock, "pipe");
801033d2:	83 ec 08             	sub    $0x8,%esp
	p->writeopen = 1;
801033d5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033dc:	00 00 00 
	p->nwrite = 0;
801033df:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801033e6:	00 00 00 
	p->nread = 0;
801033e9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033f0:	00 00 00 
	initlock(&p->lock, "pipe");
801033f3:	68 d0 74 10 80       	push   $0x801074d0
801033f8:	50                   	push   %eax
801033f9:	e8 22 0f 00 00       	call   80104320 <initlock>
	(*f0)->type = FD_PIPE;
801033fe:	8b 03                	mov    (%ebx),%eax
	(*f0)->pipe = p;
	(*f1)->type = FD_PIPE;
	(*f1)->readable = 0;
	(*f1)->writable = 1;
	(*f1)->pipe = p;
	return 0;
80103400:	83 c4 10             	add    $0x10,%esp
	(*f0)->type = FD_PIPE;
80103403:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
	(*f0)->readable = 1;
80103409:	8b 03                	mov    (%ebx),%eax
8010340b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
	(*f0)->writable = 0;
8010340f:	8b 03                	mov    (%ebx),%eax
80103411:	c6 40 09 00          	movb   $0x0,0x9(%eax)
	(*f0)->pipe = p;
80103415:	8b 03                	mov    (%ebx),%eax
80103417:	89 78 0c             	mov    %edi,0xc(%eax)
	(*f1)->type = FD_PIPE;
8010341a:	8b 06                	mov    (%esi),%eax
8010341c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
	(*f1)->readable = 0;
80103422:	8b 06                	mov    (%esi),%eax
80103424:	c6 40 08 00          	movb   $0x0,0x8(%eax)
	(*f1)->writable = 1;
80103428:	8b 06                	mov    (%esi),%eax
8010342a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
	(*f1)->pipe = p;
8010342e:	8b 06                	mov    (%esi),%eax
80103430:	89 78 0c             	mov    %edi,0xc(%eax)
	if (*f0)
		fileclose(*f0);
	if (*f1)
		fileclose(*f1);
	return -1;
}
80103433:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return 0;
80103436:	31 c0                	xor    %eax,%eax
}
80103438:	5b                   	pop    %ebx
80103439:	5e                   	pop    %esi
8010343a:	5f                   	pop    %edi
8010343b:	5d                   	pop    %ebp
8010343c:	c3                   	ret    
8010343d:	8d 76 00             	lea    0x0(%esi),%esi
	if (*f0)
80103440:	8b 03                	mov    (%ebx),%eax
80103442:	85 c0                	test   %eax,%eax
80103444:	74 1e                	je     80103464 <pipealloc+0xe4>
		fileclose(*f0);
80103446:	83 ec 0c             	sub    $0xc,%esp
80103449:	50                   	push   %eax
8010344a:	e8 a1 da ff ff       	call   80100ef0 <fileclose>
8010344f:	83 c4 10             	add    $0x10,%esp
	if (*f1)
80103452:	8b 06                	mov    (%esi),%eax
80103454:	85 c0                	test   %eax,%eax
80103456:	74 0c                	je     80103464 <pipealloc+0xe4>
		fileclose(*f1);
80103458:	83 ec 0c             	sub    $0xc,%esp
8010345b:	50                   	push   %eax
8010345c:	e8 8f da ff ff       	call   80100ef0 <fileclose>
80103461:	83 c4 10             	add    $0x10,%esp
}
80103464:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return -1;
80103467:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010346c:	5b                   	pop    %ebx
8010346d:	5e                   	pop    %esi
8010346e:	5f                   	pop    %edi
8010346f:	5d                   	pop    %ebp
80103470:	c3                   	ret    
80103471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	if (*f0)
80103478:	8b 03                	mov    (%ebx),%eax
8010347a:	85 c0                	test   %eax,%eax
8010347c:	75 c8                	jne    80103446 <pipealloc+0xc6>
8010347e:	eb d2                	jmp    80103452 <pipealloc+0xd2>

80103480 <pipeclose>:

void pipeclose(struct pipe *p, int writable)
{
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	56                   	push   %esi
80103484:	53                   	push   %ebx
80103485:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103488:	8b 75 0c             	mov    0xc(%ebp),%esi
	acquire(&p->lock);
8010348b:	83 ec 0c             	sub    $0xc,%esp
8010348e:	53                   	push   %ebx
8010348f:	e8 8c 0f 00 00       	call   80104420 <acquire>
	if (writable) {
80103494:	83 c4 10             	add    $0x10,%esp
80103497:	85 f6                	test   %esi,%esi
80103499:	74 65                	je     80103500 <pipeclose+0x80>
		p->writeopen = 0;
		wakeup(&p->nread);
8010349b:	83 ec 0c             	sub    $0xc,%esp
8010349e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
		p->writeopen = 0;
801034a4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801034ab:	00 00 00 
		wakeup(&p->nread);
801034ae:	50                   	push   %eax
801034af:	e8 bc 0b 00 00       	call   80104070 <wakeup>
801034b4:	83 c4 10             	add    $0x10,%esp
	} else {
		p->readopen = 0;
		wakeup(&p->nwrite);
	}
	if (p->readopen == 0 && p->writeopen == 0) {
801034b7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801034bd:	85 d2                	test   %edx,%edx
801034bf:	75 0a                	jne    801034cb <pipeclose+0x4b>
801034c1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034c7:	85 c0                	test   %eax,%eax
801034c9:	74 15                	je     801034e0 <pipeclose+0x60>
		release(&p->lock);
		kfree((char *)p);
	} else
		release(&p->lock);
801034cb:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801034ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034d1:	5b                   	pop    %ebx
801034d2:	5e                   	pop    %esi
801034d3:	5d                   	pop    %ebp
		release(&p->lock);
801034d4:	e9 67 10 00 00       	jmp    80104540 <release>
801034d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		release(&p->lock);
801034e0:	83 ec 0c             	sub    $0xc,%esp
801034e3:	53                   	push   %ebx
801034e4:	e8 57 10 00 00       	call   80104540 <release>
		kfree((char *)p);
801034e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034ec:	83 c4 10             	add    $0x10,%esp
}
801034ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034f2:	5b                   	pop    %ebx
801034f3:	5e                   	pop    %esi
801034f4:	5d                   	pop    %ebp
		kfree((char *)p);
801034f5:	e9 26 ef ff ff       	jmp    80102420 <kfree>
801034fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		wakeup(&p->nwrite);
80103500:	83 ec 0c             	sub    $0xc,%esp
80103503:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
		p->readopen = 0;
80103509:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103510:	00 00 00 
		wakeup(&p->nwrite);
80103513:	50                   	push   %eax
80103514:	e8 57 0b 00 00       	call   80104070 <wakeup>
80103519:	83 c4 10             	add    $0x10,%esp
8010351c:	eb 99                	jmp    801034b7 <pipeclose+0x37>
8010351e:	66 90                	xchg   %ax,%ax

80103520 <pipewrite>:

int pipewrite(struct pipe *p, char *addr, int n)
{
80103520:	55                   	push   %ebp
80103521:	89 e5                	mov    %esp,%ebp
80103523:	57                   	push   %edi
80103524:	56                   	push   %esi
80103525:	53                   	push   %ebx
80103526:	83 ec 28             	sub    $0x28,%esp
80103529:	8b 5d 08             	mov    0x8(%ebp),%ebx
	int i;

	acquire(&p->lock);
8010352c:	53                   	push   %ebx
8010352d:	e8 ee 0e 00 00       	call   80104420 <acquire>
	for (i = 0; i < n; i++) {
80103532:	8b 45 10             	mov    0x10(%ebp),%eax
80103535:	83 c4 10             	add    $0x10,%esp
80103538:	85 c0                	test   %eax,%eax
8010353a:	0f 8e c8 00 00 00    	jle    80103608 <pipewrite+0xe8>
80103540:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103543:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
		       == p->nread + PIPESIZE) { // DOC: pipewrite-full
			if (p->readopen == 0 || myproc()->killed) {
				release(&p->lock);
				return -1;
			}
			wakeup(&p->nread);
80103549:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010354f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103552:	03 4d 10             	add    0x10(%ebp),%ecx
80103555:	89 4d e0             	mov    %ecx,-0x20(%ebp)
		       == p->nread + PIPESIZE) { // DOC: pipewrite-full
80103558:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010355e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
		while (p->nwrite
80103564:	39 d0                	cmp    %edx,%eax
80103566:	75 71                	jne    801035d9 <pipewrite+0xb9>
			if (p->readopen == 0 || myproc()->killed) {
80103568:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010356e:	85 c0                	test   %eax,%eax
80103570:	74 4e                	je     801035c0 <pipewrite+0xa0>
			sleep(&p->nwrite, &p->lock); // DOC: pipewrite-sleep
80103572:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103578:	eb 3a                	jmp    801035b4 <pipewrite+0x94>
8010357a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			wakeup(&p->nread);
80103580:	83 ec 0c             	sub    $0xc,%esp
80103583:	57                   	push   %edi
80103584:	e8 e7 0a 00 00       	call   80104070 <wakeup>
			sleep(&p->nwrite, &p->lock); // DOC: pipewrite-sleep
80103589:	5a                   	pop    %edx
8010358a:	59                   	pop    %ecx
8010358b:	53                   	push   %ebx
8010358c:	56                   	push   %esi
8010358d:	e8 2e 09 00 00       	call   80103ec0 <sleep>
		       == p->nread + PIPESIZE) { // DOC: pipewrite-full
80103592:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
		while (p->nwrite
80103598:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010359e:	83 c4 10             	add    $0x10,%esp
		       == p->nread + PIPESIZE) { // DOC: pipewrite-full
801035a1:	05 00 02 00 00       	add    $0x200,%eax
		while (p->nwrite
801035a6:	39 c2                	cmp    %eax,%edx
801035a8:	75 36                	jne    801035e0 <pipewrite+0xc0>
			if (p->readopen == 0 || myproc()->killed) {
801035aa:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801035b0:	85 c0                	test   %eax,%eax
801035b2:	74 0c                	je     801035c0 <pipewrite+0xa0>
801035b4:	e8 57 03 00 00       	call   80103910 <myproc>
801035b9:	8b 40 24             	mov    0x24(%eax),%eax
801035bc:	85 c0                	test   %eax,%eax
801035be:	74 c0                	je     80103580 <pipewrite+0x60>
				release(&p->lock);
801035c0:	83 ec 0c             	sub    $0xc,%esp
801035c3:	53                   	push   %ebx
801035c4:	e8 77 0f 00 00       	call   80104540 <release>
				return -1;
801035c9:	83 c4 10             	add    $0x10,%esp
801035cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
		p->data[p->nwrite++ % PIPESIZE] = addr[i];
	}
	wakeup(&p->nread); // DOC: pipewrite-wakeup1
	release(&p->lock);
	return n;
}
801035d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035d4:	5b                   	pop    %ebx
801035d5:	5e                   	pop    %esi
801035d6:	5f                   	pop    %edi
801035d7:	5d                   	pop    %ebp
801035d8:	c3                   	ret    
		while (p->nwrite
801035d9:	89 c2                	mov    %eax,%edx
801035db:	90                   	nop
801035dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		p->data[p->nwrite++ % PIPESIZE] = addr[i];
801035e0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801035e3:	8d 42 01             	lea    0x1(%edx),%eax
801035e6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801035ec:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801035f2:	0f b6 0e             	movzbl (%esi),%ecx
801035f5:	83 c6 01             	add    $0x1,%esi
801035f8:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801035fb:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
	for (i = 0; i < n; i++) {
801035ff:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80103602:	0f 85 50 ff ff ff    	jne    80103558 <pipewrite+0x38>
	wakeup(&p->nread); // DOC: pipewrite-wakeup1
80103608:	83 ec 0c             	sub    $0xc,%esp
8010360b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103611:	50                   	push   %eax
80103612:	e8 59 0a 00 00       	call   80104070 <wakeup>
	release(&p->lock);
80103617:	89 1c 24             	mov    %ebx,(%esp)
8010361a:	e8 21 0f 00 00       	call   80104540 <release>
	return n;
8010361f:	83 c4 10             	add    $0x10,%esp
80103622:	8b 45 10             	mov    0x10(%ebp),%eax
80103625:	eb aa                	jmp    801035d1 <pipewrite+0xb1>
80103627:	89 f6                	mov    %esi,%esi
80103629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103630 <piperead>:

int piperead(struct pipe *p, char *addr, int n)
{
80103630:	55                   	push   %ebp
80103631:	89 e5                	mov    %esp,%ebp
80103633:	57                   	push   %edi
80103634:	56                   	push   %esi
80103635:	53                   	push   %ebx
80103636:	83 ec 18             	sub    $0x18,%esp
80103639:	8b 75 08             	mov    0x8(%ebp),%esi
8010363c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int i;

	acquire(&p->lock);
8010363f:	56                   	push   %esi
80103640:	e8 db 0d 00 00       	call   80104420 <acquire>
	while (p->nread == p->nwrite && p->writeopen) { // DOC: pipe-empty
80103645:	83 c4 10             	add    $0x10,%esp
80103648:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010364e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103654:	75 6a                	jne    801036c0 <piperead+0x90>
80103656:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010365c:	85 db                	test   %ebx,%ebx
8010365e:	0f 84 c4 00 00 00    	je     80103728 <piperead+0xf8>
		if (myproc()->killed) {
			release(&p->lock);
			return -1;
		}
		sleep(&p->nread, &p->lock); // DOC: piperead-sleep
80103664:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010366a:	eb 2d                	jmp    80103699 <piperead+0x69>
8010366c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103670:	83 ec 08             	sub    $0x8,%esp
80103673:	56                   	push   %esi
80103674:	53                   	push   %ebx
80103675:	e8 46 08 00 00       	call   80103ec0 <sleep>
	while (p->nread == p->nwrite && p->writeopen) { // DOC: pipe-empty
8010367a:	83 c4 10             	add    $0x10,%esp
8010367d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103683:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103689:	75 35                	jne    801036c0 <piperead+0x90>
8010368b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103691:	85 d2                	test   %edx,%edx
80103693:	0f 84 8f 00 00 00    	je     80103728 <piperead+0xf8>
		if (myproc()->killed) {
80103699:	e8 72 02 00 00       	call   80103910 <myproc>
8010369e:	8b 48 24             	mov    0x24(%eax),%ecx
801036a1:	85 c9                	test   %ecx,%ecx
801036a3:	74 cb                	je     80103670 <piperead+0x40>
			release(&p->lock);
801036a5:	83 ec 0c             	sub    $0xc,%esp
			return -1;
801036a8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
			release(&p->lock);
801036ad:	56                   	push   %esi
801036ae:	e8 8d 0e 00 00       	call   80104540 <release>
			return -1;
801036b3:	83 c4 10             	add    $0x10,%esp
		addr[i] = p->data[p->nread++ % PIPESIZE];
	}
	wakeup(&p->nwrite); // DOC: piperead-wakeup
	release(&p->lock);
	return i;
}
801036b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036b9:	89 d8                	mov    %ebx,%eax
801036bb:	5b                   	pop    %ebx
801036bc:	5e                   	pop    %esi
801036bd:	5f                   	pop    %edi
801036be:	5d                   	pop    %ebp
801036bf:	c3                   	ret    
	for (i = 0; i < n; i++) { // DOC: piperead-copy
801036c0:	8b 45 10             	mov    0x10(%ebp),%eax
801036c3:	85 c0                	test   %eax,%eax
801036c5:	7e 61                	jle    80103728 <piperead+0xf8>
		if (p->nread == p->nwrite)
801036c7:	31 db                	xor    %ebx,%ebx
801036c9:	eb 13                	jmp    801036de <piperead+0xae>
801036cb:	90                   	nop
801036cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036d0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801036d6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801036dc:	74 1f                	je     801036fd <piperead+0xcd>
		addr[i] = p->data[p->nread++ % PIPESIZE];
801036de:	8d 41 01             	lea    0x1(%ecx),%eax
801036e1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801036e7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801036ed:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801036f2:	88 04 1f             	mov    %al,(%edi,%ebx,1)
	for (i = 0; i < n; i++) { // DOC: piperead-copy
801036f5:	83 c3 01             	add    $0x1,%ebx
801036f8:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801036fb:	75 d3                	jne    801036d0 <piperead+0xa0>
	wakeup(&p->nwrite); // DOC: piperead-wakeup
801036fd:	83 ec 0c             	sub    $0xc,%esp
80103700:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103706:	50                   	push   %eax
80103707:	e8 64 09 00 00       	call   80104070 <wakeup>
	release(&p->lock);
8010370c:	89 34 24             	mov    %esi,(%esp)
8010370f:	e8 2c 0e 00 00       	call   80104540 <release>
	return i;
80103714:	83 c4 10             	add    $0x10,%esp
}
80103717:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010371a:	89 d8                	mov    %ebx,%eax
8010371c:	5b                   	pop    %ebx
8010371d:	5e                   	pop    %esi
8010371e:	5f                   	pop    %edi
8010371f:	5d                   	pop    %ebp
80103720:	c3                   	ret    
80103721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (p->nread == p->nwrite)
80103728:	31 db                	xor    %ebx,%ebx
8010372a:	eb d1                	jmp    801036fd <piperead+0xcd>
8010372c:	66 90                	xchg   %ax,%ax
8010372e:	66 90                	xchg   %ax,%ax

80103730 <allocproc>:
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc *allocproc(void)
{
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	53                   	push   %ebx
	struct proc *p;
	char *sp;

	acquire(&ptable.lock);

	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103734:	bb b4 2d 11 80       	mov    $0x80112db4,%ebx
{
80103739:	83 ec 10             	sub    $0x10,%esp
	acquire(&ptable.lock);
8010373c:	68 80 2d 11 80       	push   $0x80112d80
80103741:	e8 da 0c 00 00       	call   80104420 <acquire>
80103746:	83 c4 10             	add    $0x10,%esp
80103749:	eb 10                	jmp    8010375b <allocproc+0x2b>
8010374b:	90                   	nop
8010374c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103750:	83 c3 7c             	add    $0x7c,%ebx
80103753:	81 fb b4 4c 11 80    	cmp    $0x80114cb4,%ebx
80103759:	74 75                	je     801037d0 <allocproc+0xa0>
		if (p->state == UNUSED)
8010375b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010375e:	85 c0                	test   %eax,%eax
80103760:	75 ee                	jne    80103750 <allocproc+0x20>
	release(&ptable.lock);
	return 0;

found:
	p->state = EMBRYO;
	p->pid = nextpid++;
80103762:	a1 4c a0 10 80       	mov    0x8010a04c,%eax

	release(&ptable.lock);
80103767:	83 ec 0c             	sub    $0xc,%esp
	p->state = EMBRYO;
8010376a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
	p->pid = nextpid++;
80103771:	89 43 10             	mov    %eax,0x10(%ebx)
80103774:	8d 50 01             	lea    0x1(%eax),%edx
	release(&ptable.lock);
80103777:	68 80 2d 11 80       	push   $0x80112d80
	p->pid = nextpid++;
8010377c:	89 15 4c a0 10 80    	mov    %edx,0x8010a04c
	release(&ptable.lock);
80103782:	e8 b9 0d 00 00       	call   80104540 <release>

	// Allocate kernel stack.
	if ((p->kstack = kalloc()) == 0) {
80103787:	e8 54 ee ff ff       	call   801025e0 <kalloc>
8010378c:	83 c4 10             	add    $0x10,%esp
8010378f:	89 43 08             	mov    %eax,0x8(%ebx)
80103792:	85 c0                	test   %eax,%eax
80103794:	74 53                	je     801037e9 <allocproc+0xb9>
		return 0;
	}
	sp = p->kstack + KSTACKSIZE;

	// Leave room for trap frame.
	sp -= sizeof *p->tf;
80103796:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
	sp -= 4;
	*(uint *)sp = (uint)trapret;

	sp -= sizeof *p->context;
	p->context = (struct context *)sp;
	memset(p->context, 0, sizeof *p->context);
8010379c:	83 ec 04             	sub    $0x4,%esp
	sp -= sizeof *p->context;
8010379f:	05 9c 0f 00 00       	add    $0xf9c,%eax
	sp -= sizeof *p->tf;
801037a4:	89 53 18             	mov    %edx,0x18(%ebx)
	*(uint *)sp = (uint)trapret;
801037a7:	c7 40 14 32 57 10 80 	movl   $0x80105732,0x14(%eax)
	p->context = (struct context *)sp;
801037ae:	89 43 1c             	mov    %eax,0x1c(%ebx)
	memset(p->context, 0, sizeof *p->context);
801037b1:	6a 14                	push   $0x14
801037b3:	6a 00                	push   $0x0
801037b5:	50                   	push   %eax
801037b6:	e8 d5 0d 00 00       	call   80104590 <memset>
	p->context->eip = (uint)forkret;
801037bb:	8b 43 1c             	mov    0x1c(%ebx),%eax

	return p;
801037be:	83 c4 10             	add    $0x10,%esp
	p->context->eip = (uint)forkret;
801037c1:	c7 40 10 00 38 10 80 	movl   $0x80103800,0x10(%eax)
}
801037c8:	89 d8                	mov    %ebx,%eax
801037ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037cd:	c9                   	leave  
801037ce:	c3                   	ret    
801037cf:	90                   	nop
	release(&ptable.lock);
801037d0:	83 ec 0c             	sub    $0xc,%esp
	return 0;
801037d3:	31 db                	xor    %ebx,%ebx
	release(&ptable.lock);
801037d5:	68 80 2d 11 80       	push   $0x80112d80
801037da:	e8 61 0d 00 00       	call   80104540 <release>
}
801037df:	89 d8                	mov    %ebx,%eax
	return 0;
801037e1:	83 c4 10             	add    $0x10,%esp
}
801037e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037e7:	c9                   	leave  
801037e8:	c3                   	ret    
		p->state = UNUSED;
801037e9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
		return 0;
801037f0:	31 db                	xor    %ebx,%ebx
}
801037f2:	89 d8                	mov    %ebx,%eax
801037f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037f7:	c9                   	leave  
801037f8:	c3                   	ret    
801037f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103800 <forkret>:
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	83 ec 14             	sub    $0x14,%esp
	static int first = 1;
	// Still holding ptable.lock from scheduler.
	release(&ptable.lock);
80103806:	68 80 2d 11 80       	push   $0x80112d80
8010380b:	e8 30 0d 00 00       	call   80104540 <release>

	if (first) {
80103810:	a1 48 a0 10 80       	mov    0x8010a048,%eax
80103815:	83 c4 10             	add    $0x10,%esp
80103818:	85 c0                	test   %eax,%eax
8010381a:	75 04                	jne    80103820 <forkret+0x20>
		iinit(ROOTDEV);
		initlog(ROOTDEV);
	}

	// Return to "caller", actually trapret (see allocproc).
}
8010381c:	c9                   	leave  
8010381d:	c3                   	ret    
8010381e:	66 90                	xchg   %ax,%ax
		first = 0;
80103820:	c7 05 48 a0 10 80 00 	movl   $0x0,0x8010a048
80103827:	00 00 00 
		iinit(ROOTDEV);
8010382a:	83 ec 0c             	sub    $0xc,%esp
8010382d:	6a 01                	push   $0x1
8010382f:	e8 1c dd ff ff       	call   80101550 <iinit>
		initlog(ROOTDEV);
80103834:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010383b:	e8 f0 f3 ff ff       	call   80102c30 <initlog>
80103840:	83 c4 10             	add    $0x10,%esp
}
80103843:	c9                   	leave  
80103844:	c3                   	ret    
80103845:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103850 <pinit>:
{
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	83 ec 10             	sub    $0x10,%esp
	initlock(&ptable.lock, "ptable");
80103856:	68 d5 74 10 80       	push   $0x801074d5
8010385b:	68 80 2d 11 80       	push   $0x80112d80
80103860:	e8 bb 0a 00 00       	call   80104320 <initlock>
}
80103865:	83 c4 10             	add    $0x10,%esp
80103868:	c9                   	leave  
80103869:	c3                   	ret    
8010386a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103870 <mycpu>:
{
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	56                   	push   %esi
80103874:	53                   	push   %ebx
	asm volatile("pushfl; popl %0" : "=r"(eflags));
80103875:	9c                   	pushf  
80103876:	58                   	pop    %eax
	if (readeflags() & FL_IF)
80103877:	f6 c4 02             	test   $0x2,%ah
8010387a:	75 5d                	jne    801038d9 <mycpu+0x69>
	apicid = lapicid();
8010387c:	e8 df ef ff ff       	call   80102860 <lapicid>
	for (i = 0; i < ncpu; ++i) {
80103881:	8b 35 60 2d 11 80    	mov    0x80112d60,%esi
80103887:	85 f6                	test   %esi,%esi
80103889:	7e 41                	jle    801038cc <mycpu+0x5c>
		if (cpus[i].apicid == apicid)
8010388b:	0f b6 15 e0 27 11 80 	movzbl 0x801127e0,%edx
80103892:	39 d0                	cmp    %edx,%eax
80103894:	74 2f                	je     801038c5 <mycpu+0x55>
	for (i = 0; i < ncpu; ++i) {
80103896:	31 d2                	xor    %edx,%edx
80103898:	90                   	nop
80103899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801038a0:	83 c2 01             	add    $0x1,%edx
801038a3:	39 f2                	cmp    %esi,%edx
801038a5:	74 25                	je     801038cc <mycpu+0x5c>
		if (cpus[i].apicid == apicid)
801038a7:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
801038ad:	0f b6 99 e0 27 11 80 	movzbl -0x7feed820(%ecx),%ebx
801038b4:	39 c3                	cmp    %eax,%ebx
801038b6:	75 e8                	jne    801038a0 <mycpu+0x30>
801038b8:	8d 81 e0 27 11 80    	lea    -0x7feed820(%ecx),%eax
}
801038be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038c1:	5b                   	pop    %ebx
801038c2:	5e                   	pop    %esi
801038c3:	5d                   	pop    %ebp
801038c4:	c3                   	ret    
		if (cpus[i].apicid == apicid)
801038c5:	b8 e0 27 11 80       	mov    $0x801127e0,%eax
			return &cpus[i];
801038ca:	eb f2                	jmp    801038be <mycpu+0x4e>
	panic("unknown apicid\n");
801038cc:	83 ec 0c             	sub    $0xc,%esp
801038cf:	68 dc 74 10 80       	push   $0x801074dc
801038d4:	e8 b7 ca ff ff       	call   80100390 <panic>
		panic("mycpu called with interrupts enabled\n");
801038d9:	83 ec 0c             	sub    $0xc,%esp
801038dc:	68 b8 75 10 80       	push   $0x801075b8
801038e1:	e8 aa ca ff ff       	call   80100390 <panic>
801038e6:	8d 76 00             	lea    0x0(%esi),%esi
801038e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038f0 <cpuid>:
{
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	83 ec 08             	sub    $0x8,%esp
	return mycpu() - cpus;
801038f6:	e8 75 ff ff ff       	call   80103870 <mycpu>
}
801038fb:	c9                   	leave  
	return mycpu() - cpus;
801038fc:	2d e0 27 11 80       	sub    $0x801127e0,%eax
80103901:	c1 f8 04             	sar    $0x4,%eax
80103904:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010390a:	c3                   	ret    
8010390b:	90                   	nop
8010390c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103910 <myproc>:
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	53                   	push   %ebx
80103914:	83 ec 04             	sub    $0x4,%esp
	pushcli();
80103917:	e8 b4 0a 00 00       	call   801043d0 <pushcli>
	c = mycpu();
8010391c:	e8 4f ff ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103921:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
	popcli();
80103927:	e8 b4 0b 00 00       	call   801044e0 <popcli>
}
8010392c:	83 c4 04             	add    $0x4,%esp
8010392f:	89 d8                	mov    %ebx,%eax
80103931:	5b                   	pop    %ebx
80103932:	5d                   	pop    %ebp
80103933:	c3                   	ret    
80103934:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010393a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103940 <userinit>:
{
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	53                   	push   %ebx
80103944:	83 ec 04             	sub    $0x4,%esp
	p = allocproc();
80103947:	e8 e4 fd ff ff       	call   80103730 <allocproc>
8010394c:	89 c3                	mov    %eax,%ebx
	initproc = p;
8010394e:	a3 18 a6 10 80       	mov    %eax,0x8010a618
	if ((p->pgdir = setupkvm()) == 0)
80103953:	e8 a8 33 00 00       	call   80106d00 <setupkvm>
80103958:	89 43 04             	mov    %eax,0x4(%ebx)
8010395b:	85 c0                	test   %eax,%eax
8010395d:	0f 84 bd 00 00 00    	je     80103a20 <userinit+0xe0>
	inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103963:	83 ec 04             	sub    $0x4,%esp
80103966:	68 2c 00 00 00       	push   $0x2c
8010396b:	68 a0 a4 10 80       	push   $0x8010a4a0
80103970:	50                   	push   %eax
80103971:	e8 6a 30 00 00       	call   801069e0 <inituvm>
	memset(p->tf, 0, sizeof(*p->tf));
80103976:	83 c4 0c             	add    $0xc,%esp
	p->sz = PGSIZE;
80103979:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
	memset(p->tf, 0, sizeof(*p->tf));
8010397f:	6a 4c                	push   $0x4c
80103981:	6a 00                	push   $0x0
80103983:	ff 73 18             	pushl  0x18(%ebx)
80103986:	e8 05 0c 00 00       	call   80104590 <memset>
	p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010398b:	8b 43 18             	mov    0x18(%ebx),%eax
8010398e:	ba 1b 00 00 00       	mov    $0x1b,%edx
	safestrcpy(p->name, "initcode", sizeof(p->name));
80103993:	83 c4 0c             	add    $0xc,%esp
	p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103996:	b9 23 00 00 00       	mov    $0x23,%ecx
	p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010399b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
	p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010399f:	8b 43 18             	mov    0x18(%ebx),%eax
801039a2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
	p->tf->es = p->tf->ds;
801039a6:	8b 43 18             	mov    0x18(%ebx),%eax
801039a9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801039ad:	66 89 50 28          	mov    %dx,0x28(%eax)
	p->tf->ss = p->tf->ds;
801039b1:	8b 43 18             	mov    0x18(%ebx),%eax
801039b4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801039b8:	66 89 50 48          	mov    %dx,0x48(%eax)
	p->tf->eflags = FL_IF;
801039bc:	8b 43 18             	mov    0x18(%ebx),%eax
801039bf:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
	p->tf->esp = PGSIZE;
801039c6:	8b 43 18             	mov    0x18(%ebx),%eax
801039c9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
	p->tf->eip = 0; // beginning of initcode.S
801039d0:	8b 43 18             	mov    0x18(%ebx),%eax
801039d3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
	safestrcpy(p->name, "initcode", sizeof(p->name));
801039da:	8d 43 6c             	lea    0x6c(%ebx),%eax
801039dd:	6a 10                	push   $0x10
801039df:	68 05 75 10 80       	push   $0x80107505
801039e4:	50                   	push   %eax
801039e5:	e8 76 0d 00 00       	call   80104760 <safestrcpy>
	p->cwd = namei("/");
801039ea:	c7 04 24 0e 75 10 80 	movl   $0x8010750e,(%esp)
801039f1:	e8 fa e5 ff ff       	call   80101ff0 <namei>
801039f6:	89 43 68             	mov    %eax,0x68(%ebx)
	acquire(&ptable.lock);
801039f9:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103a00:	e8 1b 0a 00 00       	call   80104420 <acquire>
	p->state = RUNNABLE;
80103a05:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
	release(&ptable.lock);
80103a0c:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103a13:	e8 28 0b 00 00       	call   80104540 <release>
}
80103a18:	83 c4 10             	add    $0x10,%esp
80103a1b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a1e:	c9                   	leave  
80103a1f:	c3                   	ret    
		panic("userinit: out of memory?");
80103a20:	83 ec 0c             	sub    $0xc,%esp
80103a23:	68 ec 74 10 80       	push   $0x801074ec
80103a28:	e8 63 c9 ff ff       	call   80100390 <panic>
80103a2d:	8d 76 00             	lea    0x0(%esi),%esi

80103a30 <growproc>:
{
80103a30:	55                   	push   %ebp
80103a31:	89 e5                	mov    %esp,%ebp
80103a33:	56                   	push   %esi
80103a34:	53                   	push   %ebx
80103a35:	8b 75 08             	mov    0x8(%ebp),%esi
	pushcli();
80103a38:	e8 93 09 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103a3d:	e8 2e fe ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103a42:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
	popcli();
80103a48:	e8 93 0a 00 00       	call   801044e0 <popcli>
	sz = curproc->sz;
80103a4d:	8b 03                	mov    (%ebx),%eax
	if (n > 0) {
80103a4f:	85 f6                	test   %esi,%esi
80103a51:	7f 1d                	jg     80103a70 <growproc+0x40>
	} else if (n < 0) {
80103a53:	75 3b                	jne    80103a90 <growproc+0x60>
	switchuvm(curproc);
80103a55:	83 ec 0c             	sub    $0xc,%esp
	curproc->sz = sz;
80103a58:	89 03                	mov    %eax,(%ebx)
	switchuvm(curproc);
80103a5a:	53                   	push   %ebx
80103a5b:	e8 70 2e 00 00       	call   801068d0 <switchuvm>
	return 0;
80103a60:	83 c4 10             	add    $0x10,%esp
80103a63:	31 c0                	xor    %eax,%eax
}
80103a65:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a68:	5b                   	pop    %ebx
80103a69:	5e                   	pop    %esi
80103a6a:	5d                   	pop    %ebp
80103a6b:	c3                   	ret    
80103a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a70:	83 ec 04             	sub    $0x4,%esp
80103a73:	01 c6                	add    %eax,%esi
80103a75:	56                   	push   %esi
80103a76:	50                   	push   %eax
80103a77:	ff 73 04             	pushl  0x4(%ebx)
80103a7a:	e8 a1 30 00 00       	call   80106b20 <allocuvm>
80103a7f:	83 c4 10             	add    $0x10,%esp
80103a82:	85 c0                	test   %eax,%eax
80103a84:	75 cf                	jne    80103a55 <growproc+0x25>
			return -1;
80103a86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a8b:	eb d8                	jmp    80103a65 <growproc+0x35>
80103a8d:	8d 76 00             	lea    0x0(%esi),%esi
		if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a90:	83 ec 04             	sub    $0x4,%esp
80103a93:	01 c6                	add    %eax,%esi
80103a95:	56                   	push   %esi
80103a96:	50                   	push   %eax
80103a97:	ff 73 04             	pushl  0x4(%ebx)
80103a9a:	e8 b1 31 00 00       	call   80106c50 <deallocuvm>
80103a9f:	83 c4 10             	add    $0x10,%esp
80103aa2:	85 c0                	test   %eax,%eax
80103aa4:	75 af                	jne    80103a55 <growproc+0x25>
80103aa6:	eb de                	jmp    80103a86 <growproc+0x56>
80103aa8:	90                   	nop
80103aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ab0 <fork>:
{
80103ab0:	55                   	push   %ebp
80103ab1:	89 e5                	mov    %esp,%ebp
80103ab3:	57                   	push   %edi
80103ab4:	56                   	push   %esi
80103ab5:	53                   	push   %ebx
80103ab6:	83 ec 1c             	sub    $0x1c,%esp
	pushcli();
80103ab9:	e8 12 09 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103abe:	e8 ad fd ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103ac3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
	popcli();
80103ac9:	e8 12 0a 00 00       	call   801044e0 <popcli>
	if ((np = allocproc()) == 0) {
80103ace:	e8 5d fc ff ff       	call   80103730 <allocproc>
80103ad3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103ad6:	85 c0                	test   %eax,%eax
80103ad8:	0f 84 b7 00 00 00    	je     80103b95 <fork+0xe5>
	if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0) {
80103ade:	83 ec 08             	sub    $0x8,%esp
80103ae1:	ff 33                	pushl  (%ebx)
80103ae3:	89 c7                	mov    %eax,%edi
80103ae5:	ff 73 04             	pushl  0x4(%ebx)
80103ae8:	e8 e3 32 00 00       	call   80106dd0 <copyuvm>
80103aed:	83 c4 10             	add    $0x10,%esp
80103af0:	89 47 04             	mov    %eax,0x4(%edi)
80103af3:	85 c0                	test   %eax,%eax
80103af5:	0f 84 a1 00 00 00    	je     80103b9c <fork+0xec>
	np->sz = curproc->sz;
80103afb:	8b 03                	mov    (%ebx),%eax
80103afd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103b00:	89 01                	mov    %eax,(%ecx)
	*np->tf = *curproc->tf;
80103b02:	8b 79 18             	mov    0x18(%ecx),%edi
	np->parent = curproc;
80103b05:	89 c8                	mov    %ecx,%eax
80103b07:	89 59 14             	mov    %ebx,0x14(%ecx)
	*np->tf = *curproc->tf;
80103b0a:	b9 13 00 00 00       	mov    $0x13,%ecx
80103b0f:	8b 73 18             	mov    0x18(%ebx),%esi
80103b12:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	for (i = 0; i < NOFILE; i++)
80103b14:	31 f6                	xor    %esi,%esi
	np->tf->eax = 0;
80103b16:	8b 40 18             	mov    0x18(%eax),%eax
80103b19:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
		if (curproc->ofile[i])
80103b20:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103b24:	85 c0                	test   %eax,%eax
80103b26:	74 13                	je     80103b3b <fork+0x8b>
			np->ofile[i] = filedup(curproc->ofile[i]);
80103b28:	83 ec 0c             	sub    $0xc,%esp
80103b2b:	50                   	push   %eax
80103b2c:	e8 6f d3 ff ff       	call   80100ea0 <filedup>
80103b31:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b34:	83 c4 10             	add    $0x10,%esp
80103b37:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
	for (i = 0; i < NOFILE; i++)
80103b3b:	83 c6 01             	add    $0x1,%esi
80103b3e:	83 fe 10             	cmp    $0x10,%esi
80103b41:	75 dd                	jne    80103b20 <fork+0x70>
	np->cwd = idup(curproc->cwd);
80103b43:	83 ec 0c             	sub    $0xc,%esp
80103b46:	ff 73 68             	pushl  0x68(%ebx)
	safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b49:	83 c3 6c             	add    $0x6c,%ebx
	np->cwd = idup(curproc->cwd);
80103b4c:	e8 cf db ff ff       	call   80101720 <idup>
80103b51:	8b 7d e4             	mov    -0x1c(%ebp),%edi
	safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b54:	83 c4 0c             	add    $0xc,%esp
	np->cwd = idup(curproc->cwd);
80103b57:	89 47 68             	mov    %eax,0x68(%edi)
	safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b5a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b5d:	6a 10                	push   $0x10
80103b5f:	53                   	push   %ebx
80103b60:	50                   	push   %eax
80103b61:	e8 fa 0b 00 00       	call   80104760 <safestrcpy>
	pid = np->pid;
80103b66:	8b 5f 10             	mov    0x10(%edi),%ebx
	acquire(&ptable.lock);
80103b69:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103b70:	e8 ab 08 00 00       	call   80104420 <acquire>
	np->state = RUNNABLE;
80103b75:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
	release(&ptable.lock);
80103b7c:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103b83:	e8 b8 09 00 00       	call   80104540 <release>
	return pid;
80103b88:	83 c4 10             	add    $0x10,%esp
}
80103b8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b8e:	89 d8                	mov    %ebx,%eax
80103b90:	5b                   	pop    %ebx
80103b91:	5e                   	pop    %esi
80103b92:	5f                   	pop    %edi
80103b93:	5d                   	pop    %ebp
80103b94:	c3                   	ret    
		return -1;
80103b95:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103b9a:	eb ef                	jmp    80103b8b <fork+0xdb>
		kfree(np->kstack);
80103b9c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103b9f:	83 ec 0c             	sub    $0xc,%esp
80103ba2:	ff 73 08             	pushl  0x8(%ebx)
80103ba5:	e8 76 e8 ff ff       	call   80102420 <kfree>
		np->kstack = 0;
80103baa:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
		return -1;
80103bb1:	83 c4 10             	add    $0x10,%esp
		np->state = UNUSED;
80103bb4:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
		return -1;
80103bbb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103bc0:	eb c9                	jmp    80103b8b <fork+0xdb>
80103bc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103bd0 <scheduler>:
{
80103bd0:	55                   	push   %ebp
80103bd1:	89 e5                	mov    %esp,%ebp
80103bd3:	57                   	push   %edi
80103bd4:	56                   	push   %esi
80103bd5:	53                   	push   %ebx
80103bd6:	83 ec 1c             	sub    $0x1c,%esp
	struct cpu *c = mycpu();
80103bd9:	e8 92 fc ff ff       	call   80103870 <mycpu>
	c->proc = 0;
80103bde:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103be5:	00 00 00 
	struct cpu *c = mycpu();
80103be8:	89 c6                	mov    %eax,%esi
	int runnable = 1;
80103bea:	b8 01 00 00 00       	mov    $0x1,%eax
80103bef:	8d 7e 04             	lea    0x4(%esi),%edi
80103bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	asm volatile("sti");
80103bf8:	fb                   	sti    
		if (!runnable) {
80103bf9:	85 c0                	test   %eax,%eax
80103bfb:	75 01                	jne    80103bfe <scheduler+0x2e>
	asm volatile("hlt");
80103bfd:	f4                   	hlt    
		acquire(&ptable.lock);
80103bfe:	83 ec 0c             	sub    $0xc,%esp
		for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103c01:	bb b4 2d 11 80       	mov    $0x80112db4,%ebx
		acquire(&ptable.lock);
80103c06:	68 80 2d 11 80       	push   $0x80112d80
80103c0b:	e8 10 08 00 00       	call   80104420 <acquire>
80103c10:	83 c4 10             	add    $0x10,%esp
		runnable = 0;
80103c13:	31 c0                	xor    %eax,%eax
80103c15:	8d 76 00             	lea    0x0(%esi),%esi
			if (p->state != RUNNABLE) {
80103c18:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c1c:	75 38                	jne    80103c56 <scheduler+0x86>
			switchuvm(p);
80103c1e:	83 ec 0c             	sub    $0xc,%esp
			c->proc = p;
80103c21:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
			switchuvm(p);
80103c27:	53                   	push   %ebx
80103c28:	e8 a3 2c 00 00       	call   801068d0 <switchuvm>
			swtch(&(c->scheduler), p->context);
80103c2d:	58                   	pop    %eax
80103c2e:	5a                   	pop    %edx
80103c2f:	ff 73 1c             	pushl  0x1c(%ebx)
80103c32:	57                   	push   %edi
			p->state = RUNNING;
80103c33:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
			swtch(&(c->scheduler), p->context);
80103c3a:	e8 7c 0b 00 00       	call   801047bb <swtch>
			switchkvm();
80103c3f:	e8 7c 2c 00 00       	call   801068c0 <switchkvm>
			c->proc = 0;
80103c44:	83 c4 10             	add    $0x10,%esp
			runnable = 1;
80103c47:	b8 01 00 00 00       	mov    $0x1,%eax
			c->proc = 0;
80103c4c:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103c53:	00 00 00 
		for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103c56:	83 c3 7c             	add    $0x7c,%ebx
80103c59:	81 fb b4 4c 11 80    	cmp    $0x80114cb4,%ebx
80103c5f:	75 b7                	jne    80103c18 <scheduler+0x48>
		release(&ptable.lock);
80103c61:	83 ec 0c             	sub    $0xc,%esp
80103c64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103c67:	68 80 2d 11 80       	push   $0x80112d80
80103c6c:	e8 cf 08 00 00       	call   80104540 <release>
		sti();
80103c71:	83 c4 10             	add    $0x10,%esp
80103c74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103c77:	e9 7c ff ff ff       	jmp    80103bf8 <scheduler+0x28>
80103c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103c80 <sched>:
{
80103c80:	55                   	push   %ebp
80103c81:	89 e5                	mov    %esp,%ebp
80103c83:	56                   	push   %esi
80103c84:	53                   	push   %ebx
	pushcli();
80103c85:	e8 46 07 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103c8a:	e8 e1 fb ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103c8f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
	popcli();
80103c95:	e8 46 08 00 00       	call   801044e0 <popcli>
	if (!holding(&ptable.lock))
80103c9a:	83 ec 0c             	sub    $0xc,%esp
80103c9d:	68 80 2d 11 80       	push   $0x80112d80
80103ca2:	e8 e9 06 00 00       	call   80104390 <holding>
80103ca7:	83 c4 10             	add    $0x10,%esp
80103caa:	85 c0                	test   %eax,%eax
80103cac:	74 4f                	je     80103cfd <sched+0x7d>
	if (mycpu()->ncli != 1)
80103cae:	e8 bd fb ff ff       	call   80103870 <mycpu>
80103cb3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cba:	75 68                	jne    80103d24 <sched+0xa4>
	if (p->state == RUNNING)
80103cbc:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cc0:	74 55                	je     80103d17 <sched+0x97>
	asm volatile("pushfl; popl %0" : "=r"(eflags));
80103cc2:	9c                   	pushf  
80103cc3:	58                   	pop    %eax
	if (readeflags() & FL_IF)
80103cc4:	f6 c4 02             	test   $0x2,%ah
80103cc7:	75 41                	jne    80103d0a <sched+0x8a>
	intena = mycpu()->intena;
80103cc9:	e8 a2 fb ff ff       	call   80103870 <mycpu>
	swtch(&p->context, mycpu()->scheduler);
80103cce:	83 c3 1c             	add    $0x1c,%ebx
	intena = mycpu()->intena;
80103cd1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
	swtch(&p->context, mycpu()->scheduler);
80103cd7:	e8 94 fb ff ff       	call   80103870 <mycpu>
80103cdc:	83 ec 08             	sub    $0x8,%esp
80103cdf:	ff 70 04             	pushl  0x4(%eax)
80103ce2:	53                   	push   %ebx
80103ce3:	e8 d3 0a 00 00       	call   801047bb <swtch>
	mycpu()->intena = intena;
80103ce8:	e8 83 fb ff ff       	call   80103870 <mycpu>
}
80103ced:	83 c4 10             	add    $0x10,%esp
	mycpu()->intena = intena;
80103cf0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103cf6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103cf9:	5b                   	pop    %ebx
80103cfa:	5e                   	pop    %esi
80103cfb:	5d                   	pop    %ebp
80103cfc:	c3                   	ret    
		panic("sched ptable.lock");
80103cfd:	83 ec 0c             	sub    $0xc,%esp
80103d00:	68 10 75 10 80       	push   $0x80107510
80103d05:	e8 86 c6 ff ff       	call   80100390 <panic>
		panic("sched interruptible");
80103d0a:	83 ec 0c             	sub    $0xc,%esp
80103d0d:	68 3c 75 10 80       	push   $0x8010753c
80103d12:	e8 79 c6 ff ff       	call   80100390 <panic>
		panic("sched running");
80103d17:	83 ec 0c             	sub    $0xc,%esp
80103d1a:	68 2e 75 10 80       	push   $0x8010752e
80103d1f:	e8 6c c6 ff ff       	call   80100390 <panic>
		panic("sched locks");
80103d24:	83 ec 0c             	sub    $0xc,%esp
80103d27:	68 22 75 10 80       	push   $0x80107522
80103d2c:	e8 5f c6 ff ff       	call   80100390 <panic>
80103d31:	eb 0d                	jmp    80103d40 <exit>
80103d33:	90                   	nop
80103d34:	90                   	nop
80103d35:	90                   	nop
80103d36:	90                   	nop
80103d37:	90                   	nop
80103d38:	90                   	nop
80103d39:	90                   	nop
80103d3a:	90                   	nop
80103d3b:	90                   	nop
80103d3c:	90                   	nop
80103d3d:	90                   	nop
80103d3e:	90                   	nop
80103d3f:	90                   	nop

80103d40 <exit>:
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	57                   	push   %edi
80103d44:	56                   	push   %esi
80103d45:	53                   	push   %ebx
80103d46:	83 ec 0c             	sub    $0xc,%esp
	pushcli();
80103d49:	e8 82 06 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103d4e:	e8 1d fb ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103d53:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
	popcli();
80103d59:	e8 82 07 00 00       	call   801044e0 <popcli>
	if (curproc == initproc)
80103d5e:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d61:	8d 7e 68             	lea    0x68(%esi),%edi
80103d64:	39 35 18 a6 10 80    	cmp    %esi,0x8010a618
80103d6a:	0f 84 e7 00 00 00    	je     80103e57 <exit+0x117>
		if (curproc->ofile[fd]) {
80103d70:	8b 03                	mov    (%ebx),%eax
80103d72:	85 c0                	test   %eax,%eax
80103d74:	74 12                	je     80103d88 <exit+0x48>
			fileclose(curproc->ofile[fd]);
80103d76:	83 ec 0c             	sub    $0xc,%esp
80103d79:	50                   	push   %eax
80103d7a:	e8 71 d1 ff ff       	call   80100ef0 <fileclose>
			curproc->ofile[fd] = 0;
80103d7f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d85:	83 c4 10             	add    $0x10,%esp
80103d88:	83 c3 04             	add    $0x4,%ebx
	for (fd = 0; fd < NOFILE; fd++) {
80103d8b:	39 fb                	cmp    %edi,%ebx
80103d8d:	75 e1                	jne    80103d70 <exit+0x30>
	begin_op();
80103d8f:	e8 3c ef ff ff       	call   80102cd0 <begin_op>
	iput(curproc->cwd);
80103d94:	83 ec 0c             	sub    $0xc,%esp
80103d97:	ff 76 68             	pushl  0x68(%esi)
80103d9a:	e8 e1 da ff ff       	call   80101880 <iput>
	end_op();
80103d9f:	e8 9c ef ff ff       	call   80102d40 <end_op>
	curproc->cwd = 0;
80103da4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
	acquire(&ptable.lock);
80103dab:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103db2:	e8 69 06 00 00       	call   80104420 <acquire>
	wakeup1(curproc->parent);
80103db7:	8b 56 14             	mov    0x14(%esi),%edx
80103dba:	83 c4 10             	add    $0x10,%esp
// The ptable lock must be held.
static void wakeup1(void *chan)
{
	struct proc *p;

	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dbd:	b8 b4 2d 11 80       	mov    $0x80112db4,%eax
80103dc2:	eb 0e                	jmp    80103dd2 <exit+0x92>
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dc8:	83 c0 7c             	add    $0x7c,%eax
80103dcb:	3d b4 4c 11 80       	cmp    $0x80114cb4,%eax
80103dd0:	74 1c                	je     80103dee <exit+0xae>
		if (p->state == SLEEPING && p->chan == chan)
80103dd2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dd6:	75 f0                	jne    80103dc8 <exit+0x88>
80103dd8:	3b 50 20             	cmp    0x20(%eax),%edx
80103ddb:	75 eb                	jne    80103dc8 <exit+0x88>
			p->state = RUNNABLE;
80103ddd:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103de4:	83 c0 7c             	add    $0x7c,%eax
80103de7:	3d b4 4c 11 80       	cmp    $0x80114cb4,%eax
80103dec:	75 e4                	jne    80103dd2 <exit+0x92>
			p->parent = initproc;
80103dee:	8b 0d 18 a6 10 80    	mov    0x8010a618,%ecx
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103df4:	ba b4 2d 11 80       	mov    $0x80112db4,%edx
80103df9:	eb 10                	jmp    80103e0b <exit+0xcb>
80103dfb:	90                   	nop
80103dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e00:	83 c2 7c             	add    $0x7c,%edx
80103e03:	81 fa b4 4c 11 80    	cmp    $0x80114cb4,%edx
80103e09:	74 33                	je     80103e3e <exit+0xfe>
		if (p->parent == curproc) {
80103e0b:	39 72 14             	cmp    %esi,0x14(%edx)
80103e0e:	75 f0                	jne    80103e00 <exit+0xc0>
			if (p->state == ZOMBIE)
80103e10:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
			p->parent = initproc;
80103e14:	89 4a 14             	mov    %ecx,0x14(%edx)
			if (p->state == ZOMBIE)
80103e17:	75 e7                	jne    80103e00 <exit+0xc0>
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e19:	b8 b4 2d 11 80       	mov    $0x80112db4,%eax
80103e1e:	eb 0a                	jmp    80103e2a <exit+0xea>
80103e20:	83 c0 7c             	add    $0x7c,%eax
80103e23:	3d b4 4c 11 80       	cmp    $0x80114cb4,%eax
80103e28:	74 d6                	je     80103e00 <exit+0xc0>
		if (p->state == SLEEPING && p->chan == chan)
80103e2a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e2e:	75 f0                	jne    80103e20 <exit+0xe0>
80103e30:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e33:	75 eb                	jne    80103e20 <exit+0xe0>
			p->state = RUNNABLE;
80103e35:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e3c:	eb e2                	jmp    80103e20 <exit+0xe0>
	curproc->state = ZOMBIE;
80103e3e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
	sched();
80103e45:	e8 36 fe ff ff       	call   80103c80 <sched>
	panic("zombie exit");
80103e4a:	83 ec 0c             	sub    $0xc,%esp
80103e4d:	68 5d 75 10 80       	push   $0x8010755d
80103e52:	e8 39 c5 ff ff       	call   80100390 <panic>
		panic("init exiting");
80103e57:	83 ec 0c             	sub    $0xc,%esp
80103e5a:	68 50 75 10 80       	push   $0x80107550
80103e5f:	e8 2c c5 ff ff       	call   80100390 <panic>
80103e64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103e70 <yield>:
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	53                   	push   %ebx
80103e74:	83 ec 10             	sub    $0x10,%esp
	acquire(&ptable.lock); // DOC: yieldlock
80103e77:	68 80 2d 11 80       	push   $0x80112d80
80103e7c:	e8 9f 05 00 00       	call   80104420 <acquire>
	pushcli();
80103e81:	e8 4a 05 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103e86:	e8 e5 f9 ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103e8b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
	popcli();
80103e91:	e8 4a 06 00 00       	call   801044e0 <popcli>
	myproc()->state = RUNNABLE;
80103e96:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
	sched();
80103e9d:	e8 de fd ff ff       	call   80103c80 <sched>
	release(&ptable.lock);
80103ea2:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103ea9:	e8 92 06 00 00       	call   80104540 <release>
}
80103eae:	83 c4 10             	add    $0x10,%esp
80103eb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103eb4:	c9                   	leave  
80103eb5:	c3                   	ret    
80103eb6:	8d 76 00             	lea    0x0(%esi),%esi
80103eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ec0 <sleep>:
{
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	57                   	push   %edi
80103ec4:	56                   	push   %esi
80103ec5:	53                   	push   %ebx
80103ec6:	83 ec 0c             	sub    $0xc,%esp
80103ec9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103ecc:	8b 75 0c             	mov    0xc(%ebp),%esi
	pushcli();
80103ecf:	e8 fc 04 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103ed4:	e8 97 f9 ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103ed9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
	popcli();
80103edf:	e8 fc 05 00 00       	call   801044e0 <popcli>
	if (p == 0)
80103ee4:	85 db                	test   %ebx,%ebx
80103ee6:	0f 84 87 00 00 00    	je     80103f73 <sleep+0xb3>
	if (lk == 0)
80103eec:	85 f6                	test   %esi,%esi
80103eee:	74 76                	je     80103f66 <sleep+0xa6>
	if (lk != &ptable.lock) {      // DOC: sleeplock0
80103ef0:	81 fe 80 2d 11 80    	cmp    $0x80112d80,%esi
80103ef6:	74 50                	je     80103f48 <sleep+0x88>
		acquire(&ptable.lock); // DOC: sleeplock1
80103ef8:	83 ec 0c             	sub    $0xc,%esp
80103efb:	68 80 2d 11 80       	push   $0x80112d80
80103f00:	e8 1b 05 00 00       	call   80104420 <acquire>
		release(lk);
80103f05:	89 34 24             	mov    %esi,(%esp)
80103f08:	e8 33 06 00 00       	call   80104540 <release>
	p->chan = chan;
80103f0d:	89 7b 20             	mov    %edi,0x20(%ebx)
	p->state = SLEEPING;
80103f10:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
	sched();
80103f17:	e8 64 fd ff ff       	call   80103c80 <sched>
	p->chan = 0;
80103f1c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
		release(&ptable.lock);
80103f23:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
80103f2a:	e8 11 06 00 00       	call   80104540 <release>
		acquire(lk);
80103f2f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f32:	83 c4 10             	add    $0x10,%esp
}
80103f35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f38:	5b                   	pop    %ebx
80103f39:	5e                   	pop    %esi
80103f3a:	5f                   	pop    %edi
80103f3b:	5d                   	pop    %ebp
		acquire(lk);
80103f3c:	e9 df 04 00 00       	jmp    80104420 <acquire>
80103f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	p->chan = chan;
80103f48:	89 7b 20             	mov    %edi,0x20(%ebx)
	p->state = SLEEPING;
80103f4b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
	sched();
80103f52:	e8 29 fd ff ff       	call   80103c80 <sched>
	p->chan = 0;
80103f57:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103f5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f61:	5b                   	pop    %ebx
80103f62:	5e                   	pop    %esi
80103f63:	5f                   	pop    %edi
80103f64:	5d                   	pop    %ebp
80103f65:	c3                   	ret    
		panic("sleep without lk");
80103f66:	83 ec 0c             	sub    $0xc,%esp
80103f69:	68 6f 75 10 80       	push   $0x8010756f
80103f6e:	e8 1d c4 ff ff       	call   80100390 <panic>
		panic("sleep");
80103f73:	83 ec 0c             	sub    $0xc,%esp
80103f76:	68 69 75 10 80       	push   $0x80107569
80103f7b:	e8 10 c4 ff ff       	call   80100390 <panic>

80103f80 <wait>:
{
80103f80:	55                   	push   %ebp
80103f81:	89 e5                	mov    %esp,%ebp
80103f83:	56                   	push   %esi
80103f84:	53                   	push   %ebx
	pushcli();
80103f85:	e8 46 04 00 00       	call   801043d0 <pushcli>
	c = mycpu();
80103f8a:	e8 e1 f8 ff ff       	call   80103870 <mycpu>
	p = c->proc;
80103f8f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
	popcli();
80103f95:	e8 46 05 00 00       	call   801044e0 <popcli>
	acquire(&ptable.lock);
80103f9a:	83 ec 0c             	sub    $0xc,%esp
80103f9d:	68 80 2d 11 80       	push   $0x80112d80
80103fa2:	e8 79 04 00 00       	call   80104420 <acquire>
80103fa7:	83 c4 10             	add    $0x10,%esp
		havekids = 0;
80103faa:	31 c0                	xor    %eax,%eax
		for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103fac:	bb b4 2d 11 80       	mov    $0x80112db4,%ebx
80103fb1:	eb 10                	jmp    80103fc3 <wait+0x43>
80103fb3:	90                   	nop
80103fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fb8:	83 c3 7c             	add    $0x7c,%ebx
80103fbb:	81 fb b4 4c 11 80    	cmp    $0x80114cb4,%ebx
80103fc1:	74 1b                	je     80103fde <wait+0x5e>
			if (p->parent != curproc)
80103fc3:	39 73 14             	cmp    %esi,0x14(%ebx)
80103fc6:	75 f0                	jne    80103fb8 <wait+0x38>
			if (p->state == ZOMBIE) {
80103fc8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fcc:	74 32                	je     80104000 <wait+0x80>
		for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103fce:	83 c3 7c             	add    $0x7c,%ebx
			havekids = 1;
80103fd1:	b8 01 00 00 00       	mov    $0x1,%eax
		for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103fd6:	81 fb b4 4c 11 80    	cmp    $0x80114cb4,%ebx
80103fdc:	75 e5                	jne    80103fc3 <wait+0x43>
		if (!havekids || curproc->killed) {
80103fde:	85 c0                	test   %eax,%eax
80103fe0:	74 74                	je     80104056 <wait+0xd6>
80103fe2:	8b 46 24             	mov    0x24(%esi),%eax
80103fe5:	85 c0                	test   %eax,%eax
80103fe7:	75 6d                	jne    80104056 <wait+0xd6>
		sleep(curproc, &ptable.lock); // DOC: wait-sleep
80103fe9:	83 ec 08             	sub    $0x8,%esp
80103fec:	68 80 2d 11 80       	push   $0x80112d80
80103ff1:	56                   	push   %esi
80103ff2:	e8 c9 fe ff ff       	call   80103ec0 <sleep>
		havekids = 0;
80103ff7:	83 c4 10             	add    $0x10,%esp
80103ffa:	eb ae                	jmp    80103faa <wait+0x2a>
80103ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				kfree(p->kstack);
80104000:	83 ec 0c             	sub    $0xc,%esp
80104003:	ff 73 08             	pushl  0x8(%ebx)
				pid = p->pid;
80104006:	8b 73 10             	mov    0x10(%ebx),%esi
				kfree(p->kstack);
80104009:	e8 12 e4 ff ff       	call   80102420 <kfree>
				freevm(p->pgdir);
8010400e:	5a                   	pop    %edx
8010400f:	ff 73 04             	pushl  0x4(%ebx)
				p->kstack = 0;
80104012:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
				freevm(p->pgdir);
80104019:	e8 62 2c 00 00       	call   80106c80 <freevm>
				release(&ptable.lock);
8010401e:	c7 04 24 80 2d 11 80 	movl   $0x80112d80,(%esp)
				p->pid = 0;
80104025:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
				p->parent = 0;
8010402c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
				p->name[0] = 0;
80104033:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
				p->killed = 0;
80104037:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
				p->state = UNUSED;
8010403e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
				release(&ptable.lock);
80104045:	e8 f6 04 00 00       	call   80104540 <release>
				return pid;
8010404a:	83 c4 10             	add    $0x10,%esp
}
8010404d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104050:	89 f0                	mov    %esi,%eax
80104052:	5b                   	pop    %ebx
80104053:	5e                   	pop    %esi
80104054:	5d                   	pop    %ebp
80104055:	c3                   	ret    
			release(&ptable.lock);
80104056:	83 ec 0c             	sub    $0xc,%esp
			return -1;
80104059:	be ff ff ff ff       	mov    $0xffffffff,%esi
			release(&ptable.lock);
8010405e:	68 80 2d 11 80       	push   $0x80112d80
80104063:	e8 d8 04 00 00       	call   80104540 <release>
			return -1;
80104068:	83 c4 10             	add    $0x10,%esp
8010406b:	eb e0                	jmp    8010404d <wait+0xcd>
8010406d:	8d 76 00             	lea    0x0(%esi),%esi

80104070 <wakeup>:
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
80104070:	55                   	push   %ebp
80104071:	89 e5                	mov    %esp,%ebp
80104073:	53                   	push   %ebx
80104074:	83 ec 10             	sub    $0x10,%esp
80104077:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquire(&ptable.lock);
8010407a:	68 80 2d 11 80       	push   $0x80112d80
8010407f:	e8 9c 03 00 00       	call   80104420 <acquire>
80104084:	83 c4 10             	add    $0x10,%esp
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104087:	b8 b4 2d 11 80       	mov    $0x80112db4,%eax
8010408c:	eb 0c                	jmp    8010409a <wakeup+0x2a>
8010408e:	66 90                	xchg   %ax,%ax
80104090:	83 c0 7c             	add    $0x7c,%eax
80104093:	3d b4 4c 11 80       	cmp    $0x80114cb4,%eax
80104098:	74 1c                	je     801040b6 <wakeup+0x46>
		if (p->state == SLEEPING && p->chan == chan)
8010409a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010409e:	75 f0                	jne    80104090 <wakeup+0x20>
801040a0:	3b 58 20             	cmp    0x20(%eax),%ebx
801040a3:	75 eb                	jne    80104090 <wakeup+0x20>
			p->state = RUNNABLE;
801040a5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040ac:	83 c0 7c             	add    $0x7c,%eax
801040af:	3d b4 4c 11 80       	cmp    $0x80114cb4,%eax
801040b4:	75 e4                	jne    8010409a <wakeup+0x2a>
	wakeup1(chan);
	release(&ptable.lock);
801040b6:	c7 45 08 80 2d 11 80 	movl   $0x80112d80,0x8(%ebp)
}
801040bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040c0:	c9                   	leave  
	release(&ptable.lock);
801040c1:	e9 7a 04 00 00       	jmp    80104540 <release>
801040c6:	8d 76 00             	lea    0x0(%esi),%esi
801040c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040d0 <kill>:

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	53                   	push   %ebx
801040d4:	83 ec 10             	sub    $0x10,%esp
801040d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct proc *p;

	acquire(&ptable.lock);
801040da:	68 80 2d 11 80       	push   $0x80112d80
801040df:	e8 3c 03 00 00       	call   80104420 <acquire>
801040e4:	83 c4 10             	add    $0x10,%esp
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801040e7:	b8 b4 2d 11 80       	mov    $0x80112db4,%eax
801040ec:	eb 0c                	jmp    801040fa <kill+0x2a>
801040ee:	66 90                	xchg   %ax,%ax
801040f0:	83 c0 7c             	add    $0x7c,%eax
801040f3:	3d b4 4c 11 80       	cmp    $0x80114cb4,%eax
801040f8:	74 36                	je     80104130 <kill+0x60>
		if (p->pid == pid) {
801040fa:	39 58 10             	cmp    %ebx,0x10(%eax)
801040fd:	75 f1                	jne    801040f0 <kill+0x20>
			p->killed = 1;
			// Wake process from sleep if necessary.
			if (p->state == SLEEPING)
801040ff:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
			p->killed = 1;
80104103:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
			if (p->state == SLEEPING)
8010410a:	75 07                	jne    80104113 <kill+0x43>
				p->state = RUNNABLE;
8010410c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
			release(&ptable.lock);
80104113:	83 ec 0c             	sub    $0xc,%esp
80104116:	68 80 2d 11 80       	push   $0x80112d80
8010411b:	e8 20 04 00 00       	call   80104540 <release>
			return 0;
80104120:	83 c4 10             	add    $0x10,%esp
80104123:	31 c0                	xor    %eax,%eax
		}
	}
	release(&ptable.lock);
	return -1;
}
80104125:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104128:	c9                   	leave  
80104129:	c3                   	ret    
8010412a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	release(&ptable.lock);
80104130:	83 ec 0c             	sub    $0xc,%esp
80104133:	68 80 2d 11 80       	push   $0x80112d80
80104138:	e8 03 04 00 00       	call   80104540 <release>
	return -1;
8010413d:	83 c4 10             	add    $0x10,%esp
80104140:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104145:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104148:	c9                   	leave  
80104149:	c3                   	ret    
8010414a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104150 <procdump>:

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
80104150:	55                   	push   %ebp
80104151:	89 e5                	mov    %esp,%ebp
80104153:	57                   	push   %edi
80104154:	56                   	push   %esi
80104155:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104158:	53                   	push   %ebx
80104159:	bb 20 2e 11 80       	mov    $0x80112e20,%ebx
8010415e:	83 ec 3c             	sub    $0x3c,%esp
80104161:	eb 24                	jmp    80104187 <procdump+0x37>
80104163:	90                   	nop
80104164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (p->state == SLEEPING) {
			getcallerpcs((uint *)p->context->ebp + 2, pc);
			for (i = 0; i < 10 && pc[i] != 0; i++)
				cprintf(" %p", pc[i]);
		}
		cprintf("\n");
80104168:	83 ec 0c             	sub    $0xc,%esp
8010416b:	68 03 79 10 80       	push   $0x80107903
80104170:	e8 3b c5 ff ff       	call   801006b0 <cprintf>
80104175:	83 c4 10             	add    $0x10,%esp
80104178:	83 c3 7c             	add    $0x7c,%ebx
	for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010417b:	81 fb 20 4d 11 80    	cmp    $0x80114d20,%ebx
80104181:	0f 84 81 00 00 00    	je     80104208 <procdump+0xb8>
		if (p->state == UNUSED)
80104187:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010418a:	85 c0                	test   %eax,%eax
8010418c:	74 ea                	je     80104178 <procdump+0x28>
			state = "???";
8010418e:	ba 80 75 10 80       	mov    $0x80107580,%edx
		if (p->state >= 0 && p->state < NELEM(states)
80104193:	83 f8 05             	cmp    $0x5,%eax
80104196:	77 11                	ja     801041a9 <procdump+0x59>
		    && states[p->state])
80104198:	8b 14 85 e0 75 10 80 	mov    -0x7fef8a20(,%eax,4),%edx
			state = "???";
8010419f:	b8 80 75 10 80       	mov    $0x80107580,%eax
801041a4:	85 d2                	test   %edx,%edx
801041a6:	0f 44 d0             	cmove  %eax,%edx
		cprintf("%d %s %s", p->pid, state, p->name);
801041a9:	53                   	push   %ebx
801041aa:	52                   	push   %edx
801041ab:	ff 73 a4             	pushl  -0x5c(%ebx)
801041ae:	68 84 75 10 80       	push   $0x80107584
801041b3:	e8 f8 c4 ff ff       	call   801006b0 <cprintf>
		if (p->state == SLEEPING) {
801041b8:	83 c4 10             	add    $0x10,%esp
801041bb:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801041bf:	75 a7                	jne    80104168 <procdump+0x18>
			getcallerpcs((uint *)p->context->ebp + 2, pc);
801041c1:	83 ec 08             	sub    $0x8,%esp
801041c4:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041c7:	8d 7d c0             	lea    -0x40(%ebp),%edi
801041ca:	50                   	push   %eax
801041cb:	8b 43 b0             	mov    -0x50(%ebx),%eax
801041ce:	8b 40 0c             	mov    0xc(%eax),%eax
801041d1:	83 c0 08             	add    $0x8,%eax
801041d4:	50                   	push   %eax
801041d5:	e8 66 01 00 00       	call   80104340 <getcallerpcs>
			for (i = 0; i < 10 && pc[i] != 0; i++)
801041da:	83 c4 10             	add    $0x10,%esp
801041dd:	8d 76 00             	lea    0x0(%esi),%esi
801041e0:	8b 17                	mov    (%edi),%edx
801041e2:	85 d2                	test   %edx,%edx
801041e4:	74 82                	je     80104168 <procdump+0x18>
				cprintf(" %p", pc[i]);
801041e6:	83 ec 08             	sub    $0x8,%esp
801041e9:	83 c7 04             	add    $0x4,%edi
801041ec:	52                   	push   %edx
801041ed:	68 c1 6f 10 80       	push   $0x80106fc1
801041f2:	e8 b9 c4 ff ff       	call   801006b0 <cprintf>
			for (i = 0; i < 10 && pc[i] != 0; i++)
801041f7:	83 c4 10             	add    $0x10,%esp
801041fa:	39 fe                	cmp    %edi,%esi
801041fc:	75 e2                	jne    801041e0 <procdump+0x90>
801041fe:	e9 65 ff ff ff       	jmp    80104168 <procdump+0x18>
80104203:	90                   	nop
80104204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	}
}
80104208:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010420b:	5b                   	pop    %ebx
8010420c:	5e                   	pop    %esi
8010420d:	5f                   	pop    %edi
8010420e:	5d                   	pop    %ebp
8010420f:	c3                   	ret    

80104210 <initsleeplock>:
#include "proc.h"
#include "spinlock.h"
#include "sleeplock.h"

void initsleeplock(struct sleeplock *lk, char *name)
{
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	53                   	push   %ebx
80104214:	83 ec 0c             	sub    $0xc,%esp
80104217:	8b 5d 08             	mov    0x8(%ebp),%ebx
	initlock(&lk->lk, "sleep lock");
8010421a:	68 f8 75 10 80       	push   $0x801075f8
8010421f:	8d 43 04             	lea    0x4(%ebx),%eax
80104222:	50                   	push   %eax
80104223:	e8 f8 00 00 00       	call   80104320 <initlock>
	lk->name = name;
80104228:	8b 45 0c             	mov    0xc(%ebp),%eax
	lk->locked = 0;
8010422b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
	lk->pid = 0;
}
80104231:	83 c4 10             	add    $0x10,%esp
	lk->pid = 0;
80104234:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
	lk->name = name;
8010423b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010423e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104241:	c9                   	leave  
80104242:	c3                   	ret    
80104243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104250 <acquiresleep>:

void acquiresleep(struct sleeplock *lk)
{
80104250:	55                   	push   %ebp
80104251:	89 e5                	mov    %esp,%ebp
80104253:	56                   	push   %esi
80104254:	53                   	push   %ebx
80104255:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquire(&lk->lk);
80104258:	8d 73 04             	lea    0x4(%ebx),%esi
8010425b:	83 ec 0c             	sub    $0xc,%esp
8010425e:	56                   	push   %esi
8010425f:	e8 bc 01 00 00       	call   80104420 <acquire>
	while (lk->locked) {
80104264:	8b 13                	mov    (%ebx),%edx
80104266:	83 c4 10             	add    $0x10,%esp
80104269:	85 d2                	test   %edx,%edx
8010426b:	74 16                	je     80104283 <acquiresleep+0x33>
8010426d:	8d 76 00             	lea    0x0(%esi),%esi
		sleep(lk, &lk->lk);
80104270:	83 ec 08             	sub    $0x8,%esp
80104273:	56                   	push   %esi
80104274:	53                   	push   %ebx
80104275:	e8 46 fc ff ff       	call   80103ec0 <sleep>
	while (lk->locked) {
8010427a:	8b 03                	mov    (%ebx),%eax
8010427c:	83 c4 10             	add    $0x10,%esp
8010427f:	85 c0                	test   %eax,%eax
80104281:	75 ed                	jne    80104270 <acquiresleep+0x20>
	}
	lk->locked = 1;
80104283:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
	lk->pid = myproc()->pid;
80104289:	e8 82 f6 ff ff       	call   80103910 <myproc>
8010428e:	8b 40 10             	mov    0x10(%eax),%eax
80104291:	89 43 3c             	mov    %eax,0x3c(%ebx)
	release(&lk->lk);
80104294:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104297:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010429a:	5b                   	pop    %ebx
8010429b:	5e                   	pop    %esi
8010429c:	5d                   	pop    %ebp
	release(&lk->lk);
8010429d:	e9 9e 02 00 00       	jmp    80104540 <release>
801042a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042b0 <releasesleep>:

void releasesleep(struct sleeplock *lk)
{
801042b0:	55                   	push   %ebp
801042b1:	89 e5                	mov    %esp,%ebp
801042b3:	56                   	push   %esi
801042b4:	53                   	push   %ebx
801042b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquire(&lk->lk);
801042b8:	8d 73 04             	lea    0x4(%ebx),%esi
801042bb:	83 ec 0c             	sub    $0xc,%esp
801042be:	56                   	push   %esi
801042bf:	e8 5c 01 00 00       	call   80104420 <acquire>
	lk->locked = 0;
801042c4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
	lk->pid = 0;
801042ca:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
	wakeup(lk);
801042d1:	89 1c 24             	mov    %ebx,(%esp)
801042d4:	e8 97 fd ff ff       	call   80104070 <wakeup>
	release(&lk->lk);
801042d9:	89 75 08             	mov    %esi,0x8(%ebp)
801042dc:	83 c4 10             	add    $0x10,%esp
}
801042df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042e2:	5b                   	pop    %ebx
801042e3:	5e                   	pop    %esi
801042e4:	5d                   	pop    %ebp
	release(&lk->lk);
801042e5:	e9 56 02 00 00       	jmp    80104540 <release>
801042ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801042f0 <holdingsleep>:

int holdingsleep(struct sleeplock *lk)
{
801042f0:	55                   	push   %ebp
801042f1:	89 e5                	mov    %esp,%ebp
801042f3:	56                   	push   %esi
801042f4:	53                   	push   %ebx
801042f5:	8b 75 08             	mov    0x8(%ebp),%esi
	int r;

	acquire(&lk->lk);
801042f8:	8d 5e 04             	lea    0x4(%esi),%ebx
801042fb:	83 ec 0c             	sub    $0xc,%esp
801042fe:	53                   	push   %ebx
801042ff:	e8 1c 01 00 00       	call   80104420 <acquire>
	r = lk->locked;
80104304:	8b 36                	mov    (%esi),%esi
	release(&lk->lk);
80104306:	89 1c 24             	mov    %ebx,(%esp)
80104309:	e8 32 02 00 00       	call   80104540 <release>
	return r;
}
8010430e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104311:	89 f0                	mov    %esi,%eax
80104313:	5b                   	pop    %ebx
80104314:	5e                   	pop    %esi
80104315:	5d                   	pop    %ebp
80104316:	c3                   	ret    
80104317:	66 90                	xchg   %ax,%ax
80104319:	66 90                	xchg   %ax,%ax
8010431b:	66 90                	xchg   %ax,%ax
8010431d:	66 90                	xchg   %ax,%ax
8010431f:	90                   	nop

80104320 <initlock>:
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

void initlock(struct spinlock *lk, char *name)
{
80104320:	55                   	push   %ebp
80104321:	89 e5                	mov    %esp,%ebp
80104323:	8b 45 08             	mov    0x8(%ebp),%eax
	lk->name = name;
80104326:	8b 55 0c             	mov    0xc(%ebp),%edx
	lk->locked = 0;
80104329:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	lk->name = name;
8010432f:	89 50 04             	mov    %edx,0x4(%eax)
	lk->cpu = 0;
80104332:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104339:	5d                   	pop    %ebp
8010433a:	c3                   	ret    
8010433b:	90                   	nop
8010433c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104340 <getcallerpcs>:
	popcli();
}

// Record the current call stack in pcs[] by following the %ebp chain.
void getcallerpcs(void *v, uint pcs[])
{
80104340:	55                   	push   %ebp
	uint *ebp;
	int i;

	ebp = (uint *)v - 2;
	for (i = 0; i < 10; i++) {
80104341:	31 d2                	xor    %edx,%edx
{
80104343:	89 e5                	mov    %esp,%ebp
80104345:	53                   	push   %ebx
	ebp = (uint *)v - 2;
80104346:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104349:	8b 4d 0c             	mov    0xc(%ebp),%ecx
	ebp = (uint *)v - 2;
8010434c:	83 e8 08             	sub    $0x8,%eax
8010434f:	90                   	nop
		if (ebp == 0 || ebp < (uint *)KERNBASE
		    || ebp == (uint *)0xffffffff)
80104350:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
		if (ebp == 0 || ebp < (uint *)KERNBASE
80104356:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010435c:	77 1a                	ja     80104378 <getcallerpcs+0x38>
			break;
		pcs[i] = ebp[1];      // saved %eip
8010435e:	8b 58 04             	mov    0x4(%eax),%ebx
80104361:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
	for (i = 0; i < 10; i++) {
80104364:	83 c2 01             	add    $0x1,%edx
		ebp = (uint *)ebp[0]; // saved %ebp
80104367:	8b 00                	mov    (%eax),%eax
	for (i = 0; i < 10; i++) {
80104369:	83 fa 0a             	cmp    $0xa,%edx
8010436c:	75 e2                	jne    80104350 <getcallerpcs+0x10>
	}
	for (; i < 10; i++)
		pcs[i] = 0;
}
8010436e:	5b                   	pop    %ebx
8010436f:	5d                   	pop    %ebp
80104370:	c3                   	ret    
80104371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104378:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010437b:	8d 51 28             	lea    0x28(%ecx),%edx
8010437e:	66 90                	xchg   %ax,%ax
		pcs[i] = 0;
80104380:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104386:	83 c0 04             	add    $0x4,%eax
	for (; i < 10; i++)
80104389:	39 c2                	cmp    %eax,%edx
8010438b:	75 f3                	jne    80104380 <getcallerpcs+0x40>
}
8010438d:	5b                   	pop    %ebx
8010438e:	5d                   	pop    %ebp
8010438f:	c3                   	ret    

80104390 <holding>:

// Check whether this cpu is holding the lock.
int holding(struct spinlock *lock)
{
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
80104393:	53                   	push   %ebx
80104394:	83 ec 04             	sub    $0x4,%esp
80104397:	8b 55 08             	mov    0x8(%ebp),%edx
	return lock->locked && lock->cpu == mycpu();
8010439a:	8b 02                	mov    (%edx),%eax
8010439c:	85 c0                	test   %eax,%eax
8010439e:	75 10                	jne    801043b0 <holding+0x20>
}
801043a0:	83 c4 04             	add    $0x4,%esp
801043a3:	31 c0                	xor    %eax,%eax
801043a5:	5b                   	pop    %ebx
801043a6:	5d                   	pop    %ebp
801043a7:	c3                   	ret    
801043a8:	90                   	nop
801043a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	return lock->locked && lock->cpu == mycpu();
801043b0:	8b 5a 08             	mov    0x8(%edx),%ebx
801043b3:	e8 b8 f4 ff ff       	call   80103870 <mycpu>
801043b8:	39 c3                	cmp    %eax,%ebx
801043ba:	0f 94 c0             	sete   %al
}
801043bd:	83 c4 04             	add    $0x4,%esp
	return lock->locked && lock->cpu == mycpu();
801043c0:	0f b6 c0             	movzbl %al,%eax
}
801043c3:	5b                   	pop    %ebx
801043c4:	5d                   	pop    %ebp
801043c5:	c3                   	ret    
801043c6:	8d 76 00             	lea    0x0(%esi),%esi
801043c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043d0 <pushcli>:
// Pushcli/popcli are like cli/sti except that they are matched:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void pushcli(void)
{
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	53                   	push   %ebx
801043d4:	83 ec 04             	sub    $0x4,%esp
801043d7:	9c                   	pushf  
801043d8:	5b                   	pop    %ebx
	asm volatile("cli");
801043d9:	fa                   	cli    
	int eflags;

	eflags = readeflags();
	cli();
	if (mycpu()->ncli == 0)
801043da:	e8 91 f4 ff ff       	call   80103870 <mycpu>
801043df:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801043e5:	85 c0                	test   %eax,%eax
801043e7:	74 17                	je     80104400 <pushcli+0x30>
		mycpu()->intena = eflags & FL_IF;
	mycpu()->ncli += 1;
801043e9:	e8 82 f4 ff ff       	call   80103870 <mycpu>
801043ee:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801043f5:	83 c4 04             	add    $0x4,%esp
801043f8:	5b                   	pop    %ebx
801043f9:	5d                   	pop    %ebp
801043fa:	c3                   	ret    
801043fb:	90                   	nop
801043fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		mycpu()->intena = eflags & FL_IF;
80104400:	e8 6b f4 ff ff       	call   80103870 <mycpu>
80104405:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010440b:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80104411:	eb d6                	jmp    801043e9 <pushcli+0x19>
80104413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104420 <acquire>:
{
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	56                   	push   %esi
80104424:	53                   	push   %ebx
	pushcli(); // disable interrupts to avoid deadlock.
80104425:	e8 a6 ff ff ff       	call   801043d0 <pushcli>
	if (holding(lk))
8010442a:	8b 5d 08             	mov    0x8(%ebp),%ebx
	return lock->locked && lock->cpu == mycpu();
8010442d:	8b 03                	mov    (%ebx),%eax
8010442f:	85 c0                	test   %eax,%eax
80104431:	0f 85 81 00 00 00    	jne    801044b8 <acquire+0x98>
	asm volatile("lock; xchgl %0, %1"
80104437:	ba 01 00 00 00       	mov    $0x1,%edx
8010443c:	eb 05                	jmp    80104443 <acquire+0x23>
8010443e:	66 90                	xchg   %ax,%ax
80104440:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104443:	89 d0                	mov    %edx,%eax
80104445:	f0 87 03             	lock xchg %eax,(%ebx)
	while (xchg(&lk->locked, 1) != 0)
80104448:	85 c0                	test   %eax,%eax
8010444a:	75 f4                	jne    80104440 <acquire+0x20>
	__sync_synchronize();
8010444c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
	lk->cpu = mycpu();
80104451:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104454:	e8 17 f4 ff ff       	call   80103870 <mycpu>
	ebp = (uint *)v - 2;
80104459:	89 ea                	mov    %ebp,%edx
	lk->cpu = mycpu();
8010445b:	89 43 08             	mov    %eax,0x8(%ebx)
	for (i = 0; i < 10; i++) {
8010445e:	31 c0                	xor    %eax,%eax
		    || ebp == (uint *)0xffffffff)
80104460:	8d 8a 00 00 00 80    	lea    -0x80000000(%edx),%ecx
		if (ebp == 0 || ebp < (uint *)KERNBASE
80104466:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
8010446c:	77 22                	ja     80104490 <acquire+0x70>
		pcs[i] = ebp[1];      // saved %eip
8010446e:	8b 4a 04             	mov    0x4(%edx),%ecx
80104471:	89 4c 83 0c          	mov    %ecx,0xc(%ebx,%eax,4)
	for (i = 0; i < 10; i++) {
80104475:	83 c0 01             	add    $0x1,%eax
		ebp = (uint *)ebp[0]; // saved %ebp
80104478:	8b 12                	mov    (%edx),%edx
	for (i = 0; i < 10; i++) {
8010447a:	83 f8 0a             	cmp    $0xa,%eax
8010447d:	75 e1                	jne    80104460 <acquire+0x40>
}
8010447f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104482:	5b                   	pop    %ebx
80104483:	5e                   	pop    %esi
80104484:	5d                   	pop    %ebp
80104485:	c3                   	ret    
80104486:	8d 76 00             	lea    0x0(%esi),%esi
80104489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104490:	8d 44 83 0c          	lea    0xc(%ebx,%eax,4),%eax
80104494:	83 c3 34             	add    $0x34,%ebx
80104497:	89 f6                	mov    %esi,%esi
80104499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		pcs[i] = 0;
801044a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801044a6:	83 c0 04             	add    $0x4,%eax
	for (; i < 10; i++)
801044a9:	39 c3                	cmp    %eax,%ebx
801044ab:	75 f3                	jne    801044a0 <acquire+0x80>
}
801044ad:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044b0:	5b                   	pop    %ebx
801044b1:	5e                   	pop    %esi
801044b2:	5d                   	pop    %ebp
801044b3:	c3                   	ret    
801044b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	return lock->locked && lock->cpu == mycpu();
801044b8:	8b 73 08             	mov    0x8(%ebx),%esi
801044bb:	e8 b0 f3 ff ff       	call   80103870 <mycpu>
801044c0:	39 c6                	cmp    %eax,%esi
801044c2:	0f 85 6f ff ff ff    	jne    80104437 <acquire+0x17>
		panic("acquire");
801044c8:	83 ec 0c             	sub    $0xc,%esp
801044cb:	68 03 76 10 80       	push   $0x80107603
801044d0:	e8 bb be ff ff       	call   80100390 <panic>
801044d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044e0 <popcli>:

void popcli(void)
{
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	83 ec 08             	sub    $0x8,%esp
	asm volatile("pushfl; popl %0" : "=r"(eflags));
801044e6:	9c                   	pushf  
801044e7:	58                   	pop    %eax
	if (readeflags() & FL_IF)
801044e8:	f6 c4 02             	test   $0x2,%ah
801044eb:	75 35                	jne    80104522 <popcli+0x42>
		panic("popcli - interruptible");
	if (--mycpu()->ncli < 0)
801044ed:	e8 7e f3 ff ff       	call   80103870 <mycpu>
801044f2:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
801044f9:	78 34                	js     8010452f <popcli+0x4f>
		panic("popcli");
	if (mycpu()->ncli == 0 && mycpu()->intena)
801044fb:	e8 70 f3 ff ff       	call   80103870 <mycpu>
80104500:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104506:	85 d2                	test   %edx,%edx
80104508:	74 06                	je     80104510 <popcli+0x30>
		sti();
}
8010450a:	c9                   	leave  
8010450b:	c3                   	ret    
8010450c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	if (mycpu()->ncli == 0 && mycpu()->intena)
80104510:	e8 5b f3 ff ff       	call   80103870 <mycpu>
80104515:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010451b:	85 c0                	test   %eax,%eax
8010451d:	74 eb                	je     8010450a <popcli+0x2a>
	asm volatile("sti");
8010451f:	fb                   	sti    
}
80104520:	c9                   	leave  
80104521:	c3                   	ret    
		panic("popcli - interruptible");
80104522:	83 ec 0c             	sub    $0xc,%esp
80104525:	68 0b 76 10 80       	push   $0x8010760b
8010452a:	e8 61 be ff ff       	call   80100390 <panic>
		panic("popcli");
8010452f:	83 ec 0c             	sub    $0xc,%esp
80104532:	68 22 76 10 80       	push   $0x80107622
80104537:	e8 54 be ff ff       	call   80100390 <panic>
8010453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104540 <release>:
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	56                   	push   %esi
80104544:	53                   	push   %ebx
80104545:	8b 5d 08             	mov    0x8(%ebp),%ebx
	return lock->locked && lock->cpu == mycpu();
80104548:	8b 03                	mov    (%ebx),%eax
8010454a:	85 c0                	test   %eax,%eax
8010454c:	75 12                	jne    80104560 <release+0x20>
		panic("release");
8010454e:	83 ec 0c             	sub    $0xc,%esp
80104551:	68 29 76 10 80       	push   $0x80107629
80104556:	e8 35 be ff ff       	call   80100390 <panic>
8010455b:	90                   	nop
8010455c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	return lock->locked && lock->cpu == mycpu();
80104560:	8b 73 08             	mov    0x8(%ebx),%esi
80104563:	e8 08 f3 ff ff       	call   80103870 <mycpu>
80104568:	39 c6                	cmp    %eax,%esi
8010456a:	75 e2                	jne    8010454e <release+0xe>
	lk->pcs[0] = 0;
8010456c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
	lk->cpu = 0;
80104573:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
	__sync_synchronize();
8010457a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
	asm volatile("movl $0, %0" : "+m"(lk->locked) :);
8010457f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80104585:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104588:	5b                   	pop    %ebx
80104589:	5e                   	pop    %esi
8010458a:	5d                   	pop    %ebp
	popcli();
8010458b:	e9 50 ff ff ff       	jmp    801044e0 <popcli>

80104590 <memset>:
#include "types.h"
#include "x86.h"

void *memset(void *dst, int c, uint n)
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	57                   	push   %edi
80104594:	8b 55 08             	mov    0x8(%ebp),%edx
80104597:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010459a:	53                   	push   %ebx
	if ((int)dst % 4 == 0 && n % 4 == 0) {
8010459b:	89 d0                	mov    %edx,%eax
8010459d:	09 c8                	or     %ecx,%eax
8010459f:	a8 03                	test   $0x3,%al
801045a1:	75 2d                	jne    801045d0 <memset+0x40>
		c &= 0xFF;
801045a3:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
		stosl(dst, (c << 24) | (c << 16) | (c << 8) | c, n / 4);
801045a7:	c1 e9 02             	shr    $0x2,%ecx
801045aa:	89 f8                	mov    %edi,%eax
801045ac:	89 fb                	mov    %edi,%ebx
801045ae:	c1 e0 18             	shl    $0x18,%eax
801045b1:	c1 e3 10             	shl    $0x10,%ebx
801045b4:	09 d8                	or     %ebx,%eax
801045b6:	09 f8                	or     %edi,%eax
801045b8:	c1 e7 08             	shl    $0x8,%edi
801045bb:	09 f8                	or     %edi,%eax
	asm volatile("cld; rep stosl"
801045bd:	89 d7                	mov    %edx,%edi
801045bf:	fc                   	cld    
801045c0:	f3 ab                	rep stos %eax,%es:(%edi)
	} else
		stosb(dst, c, n);
	return dst;
}
801045c2:	5b                   	pop    %ebx
801045c3:	89 d0                	mov    %edx,%eax
801045c5:	5f                   	pop    %edi
801045c6:	5d                   	pop    %ebp
801045c7:	c3                   	ret    
801045c8:	90                   	nop
801045c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	asm volatile("cld; rep stosb"
801045d0:	89 d7                	mov    %edx,%edi
801045d2:	8b 45 0c             	mov    0xc(%ebp),%eax
801045d5:	fc                   	cld    
801045d6:	f3 aa                	rep stos %al,%es:(%edi)
801045d8:	5b                   	pop    %ebx
801045d9:	89 d0                	mov    %edx,%eax
801045db:	5f                   	pop    %edi
801045dc:	5d                   	pop    %ebp
801045dd:	c3                   	ret    
801045de:	66 90                	xchg   %ax,%ax

801045e0 <memcmp>:

int memcmp(const void *v1, const void *v2, uint n)
{
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	56                   	push   %esi
801045e4:	8b 75 10             	mov    0x10(%ebp),%esi
801045e7:	8b 45 08             	mov    0x8(%ebp),%eax
801045ea:	53                   	push   %ebx
801045eb:	8b 55 0c             	mov    0xc(%ebp),%edx
	const uchar *s1, *s2;

	s1 = v1;
	s2 = v2;
	while (n-- > 0) {
801045ee:	85 f6                	test   %esi,%esi
801045f0:	74 22                	je     80104614 <memcmp+0x34>
		if (*s1 != *s2)
801045f2:	0f b6 08             	movzbl (%eax),%ecx
801045f5:	0f b6 1a             	movzbl (%edx),%ebx
801045f8:	01 c6                	add    %eax,%esi
801045fa:	38 cb                	cmp    %cl,%bl
801045fc:	74 0c                	je     8010460a <memcmp+0x2a>
801045fe:	eb 20                	jmp    80104620 <memcmp+0x40>
80104600:	0f b6 08             	movzbl (%eax),%ecx
80104603:	0f b6 1a             	movzbl (%edx),%ebx
80104606:	38 d9                	cmp    %bl,%cl
80104608:	75 16                	jne    80104620 <memcmp+0x40>
			return *s1 - *s2;
		s1++, s2++;
8010460a:	83 c0 01             	add    $0x1,%eax
8010460d:	83 c2 01             	add    $0x1,%edx
	while (n-- > 0) {
80104610:	39 c6                	cmp    %eax,%esi
80104612:	75 ec                	jne    80104600 <memcmp+0x20>
	}

	return 0;
}
80104614:	5b                   	pop    %ebx
	return 0;
80104615:	31 c0                	xor    %eax,%eax
}
80104617:	5e                   	pop    %esi
80104618:	5d                   	pop    %ebp
80104619:	c3                   	ret    
8010461a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			return *s1 - *s2;
80104620:	0f b6 c1             	movzbl %cl,%eax
80104623:	29 d8                	sub    %ebx,%eax
}
80104625:	5b                   	pop    %ebx
80104626:	5e                   	pop    %esi
80104627:	5d                   	pop    %ebp
80104628:	c3                   	ret    
80104629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104630 <memmove>:

void *memmove(void *dst, const void *src, uint n)
{
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	57                   	push   %edi
80104634:	8b 45 08             	mov    0x8(%ebp),%eax
80104637:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010463a:	56                   	push   %esi
8010463b:	8b 75 0c             	mov    0xc(%ebp),%esi
	const char *s;
	char *d;

	s = src;
	d = dst;
	if (s < d && s + n > d) {
8010463e:	39 c6                	cmp    %eax,%esi
80104640:	73 26                	jae    80104668 <memmove+0x38>
80104642:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
80104645:	39 f8                	cmp    %edi,%eax
80104647:	73 1f                	jae    80104668 <memmove+0x38>
80104649:	8d 51 ff             	lea    -0x1(%ecx),%edx
		s += n;
		d += n;
		while (n-- > 0)
8010464c:	85 c9                	test   %ecx,%ecx
8010464e:	74 0f                	je     8010465f <memmove+0x2f>
			*--d = *--s;
80104650:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104654:	88 0c 10             	mov    %cl,(%eax,%edx,1)
		while (n-- > 0)
80104657:	83 ea 01             	sub    $0x1,%edx
8010465a:	83 fa ff             	cmp    $0xffffffff,%edx
8010465d:	75 f1                	jne    80104650 <memmove+0x20>
	} else
		while (n-- > 0)
			*d++ = *s++;

	return dst;
}
8010465f:	5e                   	pop    %esi
80104660:	5f                   	pop    %edi
80104661:	5d                   	pop    %ebp
80104662:	c3                   	ret    
80104663:	90                   	nop
80104664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104668:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
		while (n-- > 0)
8010466b:	89 c7                	mov    %eax,%edi
8010466d:	85 c9                	test   %ecx,%ecx
8010466f:	74 ee                	je     8010465f <memmove+0x2f>
80104671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			*d++ = *s++;
80104678:	a4                   	movsb  %ds:(%esi),%es:(%edi)
		while (n-- > 0)
80104679:	39 d6                	cmp    %edx,%esi
8010467b:	75 fb                	jne    80104678 <memmove+0x48>
}
8010467d:	5e                   	pop    %esi
8010467e:	5f                   	pop    %edi
8010467f:	5d                   	pop    %ebp
80104680:	c3                   	ret    
80104681:	eb 0d                	jmp    80104690 <memcpy>
80104683:	90                   	nop
80104684:	90                   	nop
80104685:	90                   	nop
80104686:	90                   	nop
80104687:	90                   	nop
80104688:	90                   	nop
80104689:	90                   	nop
8010468a:	90                   	nop
8010468b:	90                   	nop
8010468c:	90                   	nop
8010468d:	90                   	nop
8010468e:	90                   	nop
8010468f:	90                   	nop

80104690 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void *memcpy(void *dst, const void *src, uint n)
{
	return memmove(dst, src, n);
80104690:	eb 9e                	jmp    80104630 <memmove>
80104692:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046a0 <strncmp>:
}

int strncmp(const char *p, const char *q, uint n)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	57                   	push   %edi
801046a4:	8b 7d 10             	mov    0x10(%ebp),%edi
801046a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
801046aa:	56                   	push   %esi
801046ab:	8b 75 0c             	mov    0xc(%ebp),%esi
801046ae:	53                   	push   %ebx
	while (n > 0 && *p && *p == *q)
801046af:	85 ff                	test   %edi,%edi
801046b1:	74 2f                	je     801046e2 <strncmp+0x42>
801046b3:	0f b6 11             	movzbl (%ecx),%edx
801046b6:	0f b6 1e             	movzbl (%esi),%ebx
801046b9:	84 d2                	test   %dl,%dl
801046bb:	74 37                	je     801046f4 <strncmp+0x54>
801046bd:	38 da                	cmp    %bl,%dl
801046bf:	75 33                	jne    801046f4 <strncmp+0x54>
801046c1:	01 f7                	add    %esi,%edi
801046c3:	eb 13                	jmp    801046d8 <strncmp+0x38>
801046c5:	8d 76 00             	lea    0x0(%esi),%esi
801046c8:	0f b6 11             	movzbl (%ecx),%edx
801046cb:	84 d2                	test   %dl,%dl
801046cd:	74 21                	je     801046f0 <strncmp+0x50>
801046cf:	0f b6 18             	movzbl (%eax),%ebx
801046d2:	89 c6                	mov    %eax,%esi
801046d4:	38 da                	cmp    %bl,%dl
801046d6:	75 1c                	jne    801046f4 <strncmp+0x54>
		n--, p++, q++;
801046d8:	8d 46 01             	lea    0x1(%esi),%eax
801046db:	83 c1 01             	add    $0x1,%ecx
	while (n > 0 && *p && *p == *q)
801046de:	39 f8                	cmp    %edi,%eax
801046e0:	75 e6                	jne    801046c8 <strncmp+0x28>
	if (n == 0)
		return 0;
	return (uchar)*p - (uchar)*q;
}
801046e2:	5b                   	pop    %ebx
		return 0;
801046e3:	31 c0                	xor    %eax,%eax
}
801046e5:	5e                   	pop    %esi
801046e6:	5f                   	pop    %edi
801046e7:	5d                   	pop    %ebp
801046e8:	c3                   	ret    
801046e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046f0:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
	return (uchar)*p - (uchar)*q;
801046f4:	0f b6 c2             	movzbl %dl,%eax
801046f7:	29 d8                	sub    %ebx,%eax
}
801046f9:	5b                   	pop    %ebx
801046fa:	5e                   	pop    %esi
801046fb:	5f                   	pop    %edi
801046fc:	5d                   	pop    %ebp
801046fd:	c3                   	ret    
801046fe:	66 90                	xchg   %ax,%ax

80104700 <strncpy>:

char *strncpy(char *s, const char *t, int n)
{
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	57                   	push   %edi
80104704:	8b 55 0c             	mov    0xc(%ebp),%edx
	char *os;

	os = s;
	while (n-- > 0 && (*s++ = *t++) != 0)
80104707:	8b 4d 08             	mov    0x8(%ebp),%ecx
{
8010470a:	56                   	push   %esi
8010470b:	53                   	push   %ebx
8010470c:	8b 5d 10             	mov    0x10(%ebp),%ebx
	while (n-- > 0 && (*s++ = *t++) != 0)
8010470f:	eb 1a                	jmp    8010472b <strncpy+0x2b>
80104711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104718:	83 c2 01             	add    $0x1,%edx
8010471b:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
8010471f:	83 c1 01             	add    $0x1,%ecx
80104722:	88 41 ff             	mov    %al,-0x1(%ecx)
80104725:	84 c0                	test   %al,%al
80104727:	74 09                	je     80104732 <strncpy+0x32>
80104729:	89 fb                	mov    %edi,%ebx
8010472b:	8d 7b ff             	lea    -0x1(%ebx),%edi
8010472e:	85 db                	test   %ebx,%ebx
80104730:	7f e6                	jg     80104718 <strncpy+0x18>
		;
	while (n-- > 0)
80104732:	89 ce                	mov    %ecx,%esi
80104734:	85 ff                	test   %edi,%edi
80104736:	7e 1b                	jle    80104753 <strncpy+0x53>
80104738:	90                   	nop
80104739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		*s++ = 0;
80104740:	83 c6 01             	add    $0x1,%esi
80104743:	c6 46 ff 00          	movb   $0x0,-0x1(%esi)
80104747:	89 f2                	mov    %esi,%edx
80104749:	f7 d2                	not    %edx
8010474b:	01 ca                	add    %ecx,%edx
8010474d:	01 da                	add    %ebx,%edx
	while (n-- > 0)
8010474f:	85 d2                	test   %edx,%edx
80104751:	7f ed                	jg     80104740 <strncpy+0x40>
	return os;
}
80104753:	5b                   	pop    %ebx
80104754:	8b 45 08             	mov    0x8(%ebp),%eax
80104757:	5e                   	pop    %esi
80104758:	5f                   	pop    %edi
80104759:	5d                   	pop    %ebp
8010475a:	c3                   	ret    
8010475b:	90                   	nop
8010475c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104760 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char *safestrcpy(char *s, const char *t, int n)
{
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	56                   	push   %esi
80104764:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104767:	8b 45 08             	mov    0x8(%ebp),%eax
8010476a:	53                   	push   %ebx
8010476b:	8b 55 0c             	mov    0xc(%ebp),%edx
	char *os;

	os = s;
	if (n <= 0)
8010476e:	85 c9                	test   %ecx,%ecx
80104770:	7e 26                	jle    80104798 <safestrcpy+0x38>
80104772:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104776:	89 c1                	mov    %eax,%ecx
80104778:	eb 17                	jmp    80104791 <safestrcpy+0x31>
8010477a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		return os;
	while (--n > 0 && (*s++ = *t++) != 0)
80104780:	83 c2 01             	add    $0x1,%edx
80104783:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104787:	83 c1 01             	add    $0x1,%ecx
8010478a:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010478d:	84 db                	test   %bl,%bl
8010478f:	74 04                	je     80104795 <safestrcpy+0x35>
80104791:	39 f2                	cmp    %esi,%edx
80104793:	75 eb                	jne    80104780 <safestrcpy+0x20>
		;
	*s = 0;
80104795:	c6 01 00             	movb   $0x0,(%ecx)
	return os;
}
80104798:	5b                   	pop    %ebx
80104799:	5e                   	pop    %esi
8010479a:	5d                   	pop    %ebp
8010479b:	c3                   	ret    
8010479c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047a0 <strlen>:

int strlen(const char *s)
{
801047a0:	55                   	push   %ebp
	int n;

	for (n = 0; s[n]; n++)
801047a1:	31 c0                	xor    %eax,%eax
{
801047a3:	89 e5                	mov    %esp,%ebp
801047a5:	8b 55 08             	mov    0x8(%ebp),%edx
	for (n = 0; s[n]; n++)
801047a8:	80 3a 00             	cmpb   $0x0,(%edx)
801047ab:	74 0c                	je     801047b9 <strlen+0x19>
801047ad:	8d 76 00             	lea    0x0(%esi),%esi
801047b0:	83 c0 01             	add    $0x1,%eax
801047b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801047b7:	75 f7                	jne    801047b0 <strlen+0x10>
		;
	return n;
}
801047b9:	5d                   	pop    %ebp
801047ba:	c3                   	ret    

801047bb <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
801047bb:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
801047bf:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
801047c3:	55                   	push   %ebp
  pushl %ebx
801047c4:	53                   	push   %ebx
  pushl %esi
801047c5:	56                   	push   %esi
  pushl %edi
801047c6:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
801047c7:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
801047c9:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
801047cb:	5f                   	pop    %edi
  popl %esi
801047cc:	5e                   	pop    %esi
  popl %ebx
801047cd:	5b                   	pop    %ebx
  popl %ebp
801047ce:	5d                   	pop    %ebp
  ret
801047cf:	c3                   	ret    

801047d0 <fetchint>:
// library system call function. The saved user %esp points
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int fetchint(uint addr, int *ip)
{
801047d0:	55                   	push   %ebp
801047d1:	89 e5                	mov    %esp,%ebp
801047d3:	53                   	push   %ebx
801047d4:	83 ec 04             	sub    $0x4,%esp
801047d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	struct proc *curproc = myproc();
801047da:	e8 31 f1 ff ff       	call   80103910 <myproc>

	if (addr >= curproc->sz || addr + 4 > curproc->sz)
801047df:	8b 00                	mov    (%eax),%eax
801047e1:	39 d8                	cmp    %ebx,%eax
801047e3:	76 1b                	jbe    80104800 <fetchint+0x30>
801047e5:	8d 53 04             	lea    0x4(%ebx),%edx
801047e8:	39 d0                	cmp    %edx,%eax
801047ea:	72 14                	jb     80104800 <fetchint+0x30>
		return -1;
	*ip = *(int *)(addr);
801047ec:	8b 45 0c             	mov    0xc(%ebp),%eax
801047ef:	8b 13                	mov    (%ebx),%edx
801047f1:	89 10                	mov    %edx,(%eax)
	return 0;
801047f3:	31 c0                	xor    %eax,%eax
}
801047f5:	83 c4 04             	add    $0x4,%esp
801047f8:	5b                   	pop    %ebx
801047f9:	5d                   	pop    %ebp
801047fa:	c3                   	ret    
801047fb:	90                   	nop
801047fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		return -1;
80104800:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104805:	eb ee                	jmp    801047f5 <fetchint+0x25>
80104807:	89 f6                	mov    %esi,%esi
80104809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104810 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int fetchstr(uint addr, char **pp)
{
80104810:	55                   	push   %ebp
80104811:	89 e5                	mov    %esp,%ebp
80104813:	53                   	push   %ebx
80104814:	83 ec 04             	sub    $0x4,%esp
80104817:	8b 5d 08             	mov    0x8(%ebp),%ebx
	char *s, *ep;
	struct proc *curproc = myproc();
8010481a:	e8 f1 f0 ff ff       	call   80103910 <myproc>

	if (addr >= curproc->sz)
8010481f:	39 18                	cmp    %ebx,(%eax)
80104821:	76 29                	jbe    8010484c <fetchstr+0x3c>
		return -1;
	*pp = (char *)addr;
80104823:	8b 55 0c             	mov    0xc(%ebp),%edx
80104826:	89 1a                	mov    %ebx,(%edx)
	ep = (char *)curproc->sz;
80104828:	8b 10                	mov    (%eax),%edx
	for (s = *pp; s < ep; s++) {
8010482a:	39 d3                	cmp    %edx,%ebx
8010482c:	73 1e                	jae    8010484c <fetchstr+0x3c>
		if (*s == 0)
8010482e:	80 3b 00             	cmpb   $0x0,(%ebx)
80104831:	74 35                	je     80104868 <fetchstr+0x58>
80104833:	89 d8                	mov    %ebx,%eax
80104835:	eb 0e                	jmp    80104845 <fetchstr+0x35>
80104837:	89 f6                	mov    %esi,%esi
80104839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104840:	80 38 00             	cmpb   $0x0,(%eax)
80104843:	74 1b                	je     80104860 <fetchstr+0x50>
	for (s = *pp; s < ep; s++) {
80104845:	83 c0 01             	add    $0x1,%eax
80104848:	39 c2                	cmp    %eax,%edx
8010484a:	77 f4                	ja     80104840 <fetchstr+0x30>
		return -1;
8010484c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
			return s - *pp;
	}
	return -1;
}
80104851:	83 c4 04             	add    $0x4,%esp
80104854:	5b                   	pop    %ebx
80104855:	5d                   	pop    %ebp
80104856:	c3                   	ret    
80104857:	89 f6                	mov    %esi,%esi
80104859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104860:	83 c4 04             	add    $0x4,%esp
80104863:	29 d8                	sub    %ebx,%eax
80104865:	5b                   	pop    %ebx
80104866:	5d                   	pop    %ebp
80104867:	c3                   	ret    
		if (*s == 0)
80104868:	31 c0                	xor    %eax,%eax
			return s - *pp;
8010486a:	eb e5                	jmp    80104851 <fetchstr+0x41>
8010486c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104870 <argint>:

// Fetch the nth 32-bit system call argument.
int argint(int n, int *ip)
{
80104870:	55                   	push   %ebp
80104871:	89 e5                	mov    %esp,%ebp
80104873:	56                   	push   %esi
80104874:	53                   	push   %ebx
	return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
80104875:	e8 96 f0 ff ff       	call   80103910 <myproc>
8010487a:	8b 55 08             	mov    0x8(%ebp),%edx
8010487d:	8b 40 18             	mov    0x18(%eax),%eax
80104880:	8b 40 44             	mov    0x44(%eax),%eax
80104883:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
	struct proc *curproc = myproc();
80104886:	e8 85 f0 ff ff       	call   80103910 <myproc>
	return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
8010488b:	8d 73 04             	lea    0x4(%ebx),%esi
	if (addr >= curproc->sz || addr + 4 > curproc->sz)
8010488e:	8b 00                	mov    (%eax),%eax
80104890:	39 c6                	cmp    %eax,%esi
80104892:	73 1c                	jae    801048b0 <argint+0x40>
80104894:	8d 53 08             	lea    0x8(%ebx),%edx
80104897:	39 d0                	cmp    %edx,%eax
80104899:	72 15                	jb     801048b0 <argint+0x40>
	*ip = *(int *)(addr);
8010489b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010489e:	8b 53 04             	mov    0x4(%ebx),%edx
801048a1:	89 10                	mov    %edx,(%eax)
	return 0;
801048a3:	31 c0                	xor    %eax,%eax
}
801048a5:	5b                   	pop    %ebx
801048a6:	5e                   	pop    %esi
801048a7:	5d                   	pop    %ebp
801048a8:	c3                   	ret    
801048a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		return -1;
801048b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	return fetchint((myproc()->tf->esp) + 4 + 4 * n, ip);
801048b5:	eb ee                	jmp    801048a5 <argint+0x35>
801048b7:	89 f6                	mov    %esi,%esi
801048b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048c0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.
//
// TODO: Check that the pointer lies within the process address space.
int argptr(int n, char **pp, int size)
{
801048c0:	55                   	push   %ebp
801048c1:	89 e5                	mov    %esp,%ebp
801048c3:	83 ec 18             	sub    $0x18,%esp
	int i;
	struct proc *curproc = myproc();
801048c6:	e8 45 f0 ff ff       	call   80103910 <myproc>

	if (argint(n, &i) < 0)
801048cb:	83 ec 08             	sub    $0x8,%esp
801048ce:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048d1:	50                   	push   %eax
801048d2:	ff 75 08             	pushl  0x8(%ebp)
801048d5:	e8 96 ff ff ff       	call   80104870 <argint>
801048da:	83 c4 10             	add    $0x10,%esp
801048dd:	85 c0                	test   %eax,%eax
801048df:	78 0c                	js     801048ed <argptr+0x2d>
		return -1;
	*pp = (char *)i;
801048e1:	8b 45 0c             	mov    0xc(%ebp),%eax
801048e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
801048e7:	89 10                	mov    %edx,(%eax)
	return 0;
801048e9:	31 c0                	xor    %eax,%eax
}
801048eb:	c9                   	leave  
801048ec:	c3                   	ret    
801048ed:	c9                   	leave  
		return -1;
801048ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801048f3:	c3                   	ret    
801048f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104900 <argstr>:
// Fetch the nth word-sized system call argument as a string pointer.
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int argstr(int n, char **pp)
{
80104900:	55                   	push   %ebp
80104901:	89 e5                	mov    %esp,%ebp
80104903:	83 ec 20             	sub    $0x20,%esp
	int addr;
	if (argint(n, &addr) < 0)
80104906:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104909:	50                   	push   %eax
8010490a:	ff 75 08             	pushl  0x8(%ebp)
8010490d:	e8 5e ff ff ff       	call   80104870 <argint>
80104912:	83 c4 10             	add    $0x10,%esp
80104915:	85 c0                	test   %eax,%eax
80104917:	78 17                	js     80104930 <argstr+0x30>
		return -1;
	return fetchstr(addr, pp);
80104919:	83 ec 08             	sub    $0x8,%esp
8010491c:	ff 75 0c             	pushl  0xc(%ebp)
8010491f:	ff 75 f4             	pushl  -0xc(%ebp)
80104922:	e8 e9 fe ff ff       	call   80104810 <fetchstr>
80104927:	83 c4 10             	add    $0x10,%esp
}
8010492a:	c9                   	leave  
8010492b:	c3                   	ret    
8010492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104930:	c9                   	leave  
		return -1;
80104931:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104936:	c3                   	ret    
80104937:	89 f6                	mov    %esi,%esi
80104939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104940 <syscall>:
	[SYS_write] sys_write, [SYS_mknod] sys_mknod,   [SYS_unlink] sys_unlink,
	[SYS_link] sys_link,   [SYS_mkdir] sys_mkdir,   [SYS_close] sys_close,
};

void syscall(void)
{
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	56                   	push   %esi
80104944:	53                   	push   %ebx
	int num;
	struct proc *curproc = myproc();
80104945:	e8 c6 ef ff ff       	call   80103910 <myproc>
8010494a:	89 c3                	mov    %eax,%ebx

	num = curproc->tf->eax;
8010494c:	8b 40 18             	mov    0x18(%eax),%eax
8010494f:	8b 40 1c             	mov    0x1c(%eax),%eax
	if (num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104952:	8d 50 ff             	lea    -0x1(%eax),%edx
80104955:	83 fa 14             	cmp    $0x14,%edx
80104958:	77 2e                	ja     80104988 <syscall+0x48>
8010495a:	8b 34 85 60 76 10 80 	mov    -0x7fef89a0(,%eax,4),%esi
80104961:	85 f6                	test   %esi,%esi
80104963:	74 23                	je     80104988 <syscall+0x48>
        cprintf("eax: %d\n", curproc->tf->eax);
80104965:	83 ec 08             	sub    $0x8,%esp
80104968:	50                   	push   %eax
80104969:	68 31 76 10 80       	push   $0x80107631
8010496e:	e8 3d bd ff ff       	call   801006b0 <cprintf>
        curproc->tf->eax = syscalls[num]();
80104973:	ff d6                	call   *%esi
80104975:	8b 53 18             	mov    0x18(%ebx),%edx
80104978:	83 c4 10             	add    $0x10,%esp
8010497b:	89 42 1c             	mov    %eax,0x1c(%edx)
			curproc->name,
			num); // BUG: Use this to access memory of other
			      // processes?
		curproc->tf->eax = -1;
	}
}
8010497e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104981:	5b                   	pop    %ebx
80104982:	5e                   	pop    %esi
80104983:	5d                   	pop    %ebp
80104984:	c3                   	ret    
80104985:	8d 76 00             	lea    0x0(%esi),%esi
		cprintf("%d %s: unknown sys call %d\n", curproc->pid,
80104988:	50                   	push   %eax
			curproc->name,
80104989:	8d 43 6c             	lea    0x6c(%ebx),%eax
		cprintf("%d %s: unknown sys call %d\n", curproc->pid,
8010498c:	50                   	push   %eax
8010498d:	ff 73 10             	pushl  0x10(%ebx)
80104990:	68 3a 76 10 80       	push   $0x8010763a
80104995:	e8 16 bd ff ff       	call   801006b0 <cprintf>
		curproc->tf->eax = -1;
8010499a:	8b 43 18             	mov    0x18(%ebx),%eax
8010499d:	83 c4 10             	add    $0x10,%esp
801049a0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
801049a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801049aa:	5b                   	pop    %ebx
801049ab:	5e                   	pop    %esi
801049ac:	5d                   	pop    %ebp
801049ad:	c3                   	ret    
801049ae:	66 90                	xchg   %ax,%ax

801049b0 <create>:
	end_op();
	return -1;
}

static struct inode *create(char *path, short type, short major, short minor)
{
801049b0:	55                   	push   %ebp
801049b1:	89 e5                	mov    %esp,%ebp
801049b3:	57                   	push   %edi
801049b4:	56                   	push   %esi
801049b5:	53                   	push   %ebx
	uint off;
	struct inode *ip, *dp;
	char name[DIRSIZ];

	if ((dp = nameiparent(path, name)) == 0)
801049b6:	8d 5d da             	lea    -0x26(%ebp),%ebx
{
801049b9:	83 ec 44             	sub    $0x44,%esp
801049bc:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801049bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
	if ((dp = nameiparent(path, name)) == 0)
801049c2:	53                   	push   %ebx
801049c3:	50                   	push   %eax
{
801049c4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801049c7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
	if ((dp = nameiparent(path, name)) == 0)
801049ca:	e8 41 d6 ff ff       	call   80102010 <nameiparent>
801049cf:	83 c4 10             	add    $0x10,%esp
801049d2:	85 c0                	test   %eax,%eax
801049d4:	0f 84 46 01 00 00    	je     80104b20 <create+0x170>
		return 0;
	ilock(dp);
801049da:	83 ec 0c             	sub    $0xc,%esp
801049dd:	89 c6                	mov    %eax,%esi
801049df:	50                   	push   %eax
801049e0:	e8 6b cd ff ff       	call   80101750 <ilock>

	if ((ip = dirlookup(dp, name, &off)) != 0) {
801049e5:	83 c4 0c             	add    $0xc,%esp
801049e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801049eb:	50                   	push   %eax
801049ec:	53                   	push   %ebx
801049ed:	56                   	push   %esi
801049ee:	e8 8d d2 ff ff       	call   80101c80 <dirlookup>
801049f3:	83 c4 10             	add    $0x10,%esp
801049f6:	89 c7                	mov    %eax,%edi
801049f8:	85 c0                	test   %eax,%eax
801049fa:	74 54                	je     80104a50 <create+0xa0>
		iunlockput(dp);
801049fc:	83 ec 0c             	sub    $0xc,%esp
801049ff:	56                   	push   %esi
80104a00:	e8 db cf ff ff       	call   801019e0 <iunlockput>
		ilock(ip);
80104a05:	89 3c 24             	mov    %edi,(%esp)
80104a08:	e8 43 cd ff ff       	call   80101750 <ilock>
		if (type == T_FILE && ip->type == T_FILE)
80104a0d:	83 c4 10             	add    $0x10,%esp
80104a10:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104a15:	75 19                	jne    80104a30 <create+0x80>
80104a17:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104a1c:	75 12                	jne    80104a30 <create+0x80>
		panic("create: dirlink");

	iunlockput(dp);

	return ip;
}
80104a1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a21:	89 f8                	mov    %edi,%eax
80104a23:	5b                   	pop    %ebx
80104a24:	5e                   	pop    %esi
80104a25:	5f                   	pop    %edi
80104a26:	5d                   	pop    %ebp
80104a27:	c3                   	ret    
80104a28:	90                   	nop
80104a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		iunlockput(ip);
80104a30:	83 ec 0c             	sub    $0xc,%esp
80104a33:	57                   	push   %edi
		return 0;
80104a34:	31 ff                	xor    %edi,%edi
		iunlockput(ip);
80104a36:	e8 a5 cf ff ff       	call   801019e0 <iunlockput>
		return 0;
80104a3b:	83 c4 10             	add    $0x10,%esp
}
80104a3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a41:	89 f8                	mov    %edi,%eax
80104a43:	5b                   	pop    %ebx
80104a44:	5e                   	pop    %esi
80104a45:	5f                   	pop    %edi
80104a46:	5d                   	pop    %ebp
80104a47:	c3                   	ret    
80104a48:	90                   	nop
80104a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	if ((ip = ialloc(dp->dev, type)) == 0)
80104a50:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a54:	83 ec 08             	sub    $0x8,%esp
80104a57:	50                   	push   %eax
80104a58:	ff 36                	pushl  (%esi)
80104a5a:	e8 81 cb ff ff       	call   801015e0 <ialloc>
80104a5f:	83 c4 10             	add    $0x10,%esp
80104a62:	89 c7                	mov    %eax,%edi
80104a64:	85 c0                	test   %eax,%eax
80104a66:	0f 84 cd 00 00 00    	je     80104b39 <create+0x189>
	ilock(ip);
80104a6c:	83 ec 0c             	sub    $0xc,%esp
80104a6f:	50                   	push   %eax
80104a70:	e8 db cc ff ff       	call   80101750 <ilock>
	ip->major = major;
80104a75:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a79:	66 89 47 52          	mov    %ax,0x52(%edi)
	ip->minor = minor;
80104a7d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104a81:	66 89 47 54          	mov    %ax,0x54(%edi)
	ip->nlink = 1;
80104a85:	b8 01 00 00 00       	mov    $0x1,%eax
80104a8a:	66 89 47 56          	mov    %ax,0x56(%edi)
	iupdate(ip);
80104a8e:	89 3c 24             	mov    %edi,(%esp)
80104a91:	e8 0a cc ff ff       	call   801016a0 <iupdate>
	if (type == T_DIR) { // Create . and .. entries.
80104a96:	83 c4 10             	add    $0x10,%esp
80104a99:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104a9e:	74 30                	je     80104ad0 <create+0x120>
	if (dirlink(dp, name, ip->inum) < 0)
80104aa0:	83 ec 04             	sub    $0x4,%esp
80104aa3:	ff 77 04             	pushl  0x4(%edi)
80104aa6:	53                   	push   %ebx
80104aa7:	56                   	push   %esi
80104aa8:	e8 83 d4 ff ff       	call   80101f30 <dirlink>
80104aad:	83 c4 10             	add    $0x10,%esp
80104ab0:	85 c0                	test   %eax,%eax
80104ab2:	78 78                	js     80104b2c <create+0x17c>
	iunlockput(dp);
80104ab4:	83 ec 0c             	sub    $0xc,%esp
80104ab7:	56                   	push   %esi
80104ab8:	e8 23 cf ff ff       	call   801019e0 <iunlockput>
	return ip;
80104abd:	83 c4 10             	add    $0x10,%esp
}
80104ac0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ac3:	89 f8                	mov    %edi,%eax
80104ac5:	5b                   	pop    %ebx
80104ac6:	5e                   	pop    %esi
80104ac7:	5f                   	pop    %edi
80104ac8:	5d                   	pop    %ebp
80104ac9:	c3                   	ret    
80104aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		iupdate(dp);
80104ad0:	83 ec 0c             	sub    $0xc,%esp
		dp->nlink++; // for ".."
80104ad3:	66 83 46 56 01       	addw   $0x1,0x56(%esi)
		iupdate(dp);
80104ad8:	56                   	push   %esi
80104ad9:	e8 c2 cb ff ff       	call   801016a0 <iupdate>
		if (dirlink(ip, ".", ip->inum) < 0
80104ade:	83 c4 0c             	add    $0xc,%esp
80104ae1:	ff 77 04             	pushl  0x4(%edi)
80104ae4:	68 d4 76 10 80       	push   $0x801076d4
80104ae9:	57                   	push   %edi
80104aea:	e8 41 d4 ff ff       	call   80101f30 <dirlink>
80104aef:	83 c4 10             	add    $0x10,%esp
80104af2:	85 c0                	test   %eax,%eax
80104af4:	78 18                	js     80104b0e <create+0x15e>
		    || dirlink(ip, "..", dp->inum) < 0)
80104af6:	83 ec 04             	sub    $0x4,%esp
80104af9:	ff 76 04             	pushl  0x4(%esi)
80104afc:	68 d3 76 10 80       	push   $0x801076d3
80104b01:	57                   	push   %edi
80104b02:	e8 29 d4 ff ff       	call   80101f30 <dirlink>
80104b07:	83 c4 10             	add    $0x10,%esp
80104b0a:	85 c0                	test   %eax,%eax
80104b0c:	79 92                	jns    80104aa0 <create+0xf0>
			panic("create dots");
80104b0e:	83 ec 0c             	sub    $0xc,%esp
80104b11:	68 c7 76 10 80       	push   $0x801076c7
80104b16:	e8 75 b8 ff ff       	call   80100390 <panic>
80104b1b:	90                   	nop
80104b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
80104b20:	8d 65 f4             	lea    -0xc(%ebp),%esp
		return 0;
80104b23:	31 ff                	xor    %edi,%edi
}
80104b25:	5b                   	pop    %ebx
80104b26:	89 f8                	mov    %edi,%eax
80104b28:	5e                   	pop    %esi
80104b29:	5f                   	pop    %edi
80104b2a:	5d                   	pop    %ebp
80104b2b:	c3                   	ret    
		panic("create: dirlink");
80104b2c:	83 ec 0c             	sub    $0xc,%esp
80104b2f:	68 d6 76 10 80       	push   $0x801076d6
80104b34:	e8 57 b8 ff ff       	call   80100390 <panic>
		panic("create: ialloc");
80104b39:	83 ec 0c             	sub    $0xc,%esp
80104b3c:	68 b8 76 10 80       	push   $0x801076b8
80104b41:	e8 4a b8 ff ff       	call   80100390 <panic>
80104b46:	8d 76 00             	lea    0x0(%esi),%esi
80104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b50 <argfd.constprop.0>:
static int argfd(int n, int *pfd, struct file **pf)
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	56                   	push   %esi
80104b54:	89 d6                	mov    %edx,%esi
80104b56:	53                   	push   %ebx
80104b57:	89 c3                	mov    %eax,%ebx
	if (argint(n, &fd) < 0)
80104b59:	8d 45 f4             	lea    -0xc(%ebp),%eax
static int argfd(int n, int *pfd, struct file **pf)
80104b5c:	83 ec 18             	sub    $0x18,%esp
	if (argint(n, &fd) < 0)
80104b5f:	50                   	push   %eax
80104b60:	6a 00                	push   $0x0
80104b62:	e8 09 fd ff ff       	call   80104870 <argint>
80104b67:	83 c4 10             	add    $0x10,%esp
80104b6a:	85 c0                	test   %eax,%eax
80104b6c:	78 2a                	js     80104b98 <argfd.constprop.0+0x48>
	if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
80104b6e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104b72:	77 24                	ja     80104b98 <argfd.constprop.0+0x48>
80104b74:	e8 97 ed ff ff       	call   80103910 <myproc>
80104b79:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b7c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104b80:	85 c0                	test   %eax,%eax
80104b82:	74 14                	je     80104b98 <argfd.constprop.0+0x48>
	if (pfd)
80104b84:	85 db                	test   %ebx,%ebx
80104b86:	74 02                	je     80104b8a <argfd.constprop.0+0x3a>
		*pfd = fd;
80104b88:	89 13                	mov    %edx,(%ebx)
		*pf = f;
80104b8a:	89 06                	mov    %eax,(%esi)
	return 0;
80104b8c:	31 c0                	xor    %eax,%eax
}
80104b8e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b91:	5b                   	pop    %ebx
80104b92:	5e                   	pop    %esi
80104b93:	5d                   	pop    %ebp
80104b94:	c3                   	ret    
80104b95:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
80104b98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b9d:	eb ef                	jmp    80104b8e <argfd.constprop.0+0x3e>
80104b9f:	90                   	nop

80104ba0 <sys_dup>:
{
80104ba0:	55                   	push   %ebp
	if (argfd(0, 0, &f) < 0)
80104ba1:	31 c0                	xor    %eax,%eax
{
80104ba3:	89 e5                	mov    %esp,%ebp
80104ba5:	56                   	push   %esi
80104ba6:	53                   	push   %ebx
	if (argfd(0, 0, &f) < 0)
80104ba7:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104baa:	83 ec 10             	sub    $0x10,%esp
	if (argfd(0, 0, &f) < 0)
80104bad:	e8 9e ff ff ff       	call   80104b50 <argfd.constprop.0>
80104bb2:	85 c0                	test   %eax,%eax
80104bb4:	78 1a                	js     80104bd0 <sys_dup+0x30>
	if ((fd = fdalloc(f)) < 0)
80104bb6:	8b 75 f4             	mov    -0xc(%ebp),%esi
	for (fd = 0; fd < NOFILE; fd++) {
80104bb9:	31 db                	xor    %ebx,%ebx
	struct proc *curproc = myproc();
80104bbb:	e8 50 ed ff ff       	call   80103910 <myproc>
		if (curproc->ofile[fd] == 0) {
80104bc0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104bc4:	85 d2                	test   %edx,%edx
80104bc6:	74 18                	je     80104be0 <sys_dup+0x40>
	for (fd = 0; fd < NOFILE; fd++) {
80104bc8:	83 c3 01             	add    $0x1,%ebx
80104bcb:	83 fb 10             	cmp    $0x10,%ebx
80104bce:	75 f0                	jne    80104bc0 <sys_dup+0x20>
}
80104bd0:	8d 65 f8             	lea    -0x8(%ebp),%esp
		return -1;
80104bd3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104bd8:	89 d8                	mov    %ebx,%eax
80104bda:	5b                   	pop    %ebx
80104bdb:	5e                   	pop    %esi
80104bdc:	5d                   	pop    %ebp
80104bdd:	c3                   	ret    
80104bde:	66 90                	xchg   %ax,%ax
			curproc->ofile[fd] = f;
80104be0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
	filedup(f);
80104be4:	83 ec 0c             	sub    $0xc,%esp
80104be7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bea:	e8 b1 c2 ff ff       	call   80100ea0 <filedup>
	return fd;
80104bef:	83 c4 10             	add    $0x10,%esp
}
80104bf2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104bf5:	89 d8                	mov    %ebx,%eax
80104bf7:	5b                   	pop    %ebx
80104bf8:	5e                   	pop    %esi
80104bf9:	5d                   	pop    %ebp
80104bfa:	c3                   	ret    
80104bfb:	90                   	nop
80104bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c00 <sys_read>:
{
80104c00:	55                   	push   %ebp
	if (argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c01:	31 c0                	xor    %eax,%eax
{
80104c03:	89 e5                	mov    %esp,%ebp
80104c05:	83 ec 18             	sub    $0x18,%esp
	if (argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c08:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c0b:	e8 40 ff ff ff       	call   80104b50 <argfd.constprop.0>
80104c10:	85 c0                	test   %eax,%eax
80104c12:	78 4c                	js     80104c60 <sys_read+0x60>
80104c14:	83 ec 08             	sub    $0x8,%esp
80104c17:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c1a:	50                   	push   %eax
80104c1b:	6a 02                	push   $0x2
80104c1d:	e8 4e fc ff ff       	call   80104870 <argint>
80104c22:	83 c4 10             	add    $0x10,%esp
80104c25:	85 c0                	test   %eax,%eax
80104c27:	78 37                	js     80104c60 <sys_read+0x60>
80104c29:	83 ec 04             	sub    $0x4,%esp
80104c2c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c2f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c32:	50                   	push   %eax
80104c33:	6a 01                	push   $0x1
80104c35:	e8 86 fc ff ff       	call   801048c0 <argptr>
80104c3a:	83 c4 10             	add    $0x10,%esp
80104c3d:	85 c0                	test   %eax,%eax
80104c3f:	78 1f                	js     80104c60 <sys_read+0x60>
	return fileread(f, p, n);
80104c41:	83 ec 04             	sub    $0x4,%esp
80104c44:	ff 75 f0             	pushl  -0x10(%ebp)
80104c47:	ff 75 f4             	pushl  -0xc(%ebp)
80104c4a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c4d:	e8 ce c3 ff ff       	call   80101020 <fileread>
80104c52:	83 c4 10             	add    $0x10,%esp
}
80104c55:	c9                   	leave  
80104c56:	c3                   	ret    
80104c57:	89 f6                	mov    %esi,%esi
80104c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c60:	c9                   	leave  
		return -1;
80104c61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c66:	c3                   	ret    
80104c67:	89 f6                	mov    %esi,%esi
80104c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c70 <sys_write>:
{
80104c70:	55                   	push   %ebp
	if (argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c71:	31 c0                	xor    %eax,%eax
{
80104c73:	89 e5                	mov    %esp,%ebp
80104c75:	83 ec 18             	sub    $0x18,%esp
	if (argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104c78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c7b:	e8 d0 fe ff ff       	call   80104b50 <argfd.constprop.0>
80104c80:	85 c0                	test   %eax,%eax
80104c82:	78 5c                	js     80104ce0 <sys_write+0x70>
80104c84:	83 ec 08             	sub    $0x8,%esp
80104c87:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c8a:	50                   	push   %eax
80104c8b:	6a 02                	push   $0x2
80104c8d:	e8 de fb ff ff       	call   80104870 <argint>
80104c92:	83 c4 10             	add    $0x10,%esp
80104c95:	85 c0                	test   %eax,%eax
80104c97:	78 47                	js     80104ce0 <sys_write+0x70>
80104c99:	83 ec 04             	sub    $0x4,%esp
80104c9c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104ca2:	50                   	push   %eax
80104ca3:	6a 01                	push   $0x1
80104ca5:	e8 16 fc ff ff       	call   801048c0 <argptr>
80104caa:	83 c4 10             	add    $0x10,%esp
80104cad:	85 c0                	test   %eax,%eax
80104caf:	78 2f                	js     80104ce0 <sys_write+0x70>
    cprintf("%p %d %p\n", f, n, p);
80104cb1:	ff 75 f4             	pushl  -0xc(%ebp)
80104cb4:	ff 75 f0             	pushl  -0x10(%ebp)
80104cb7:	ff 75 ec             	pushl  -0x14(%ebp)
80104cba:	68 e6 76 10 80       	push   $0x801076e6
80104cbf:	e8 ec b9 ff ff       	call   801006b0 <cprintf>
    return filewrite(f, p, n);
80104cc4:	83 c4 0c             	add    $0xc,%esp
80104cc7:	ff 75 f0             	pushl  -0x10(%ebp)
80104cca:	ff 75 f4             	pushl  -0xc(%ebp)
80104ccd:	ff 75 ec             	pushl  -0x14(%ebp)
80104cd0:	e8 db c3 ff ff       	call   801010b0 <filewrite>
80104cd5:	83 c4 10             	add    $0x10,%esp
}
80104cd8:	c9                   	leave  
80104cd9:	c3                   	ret    
80104cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ce0:	c9                   	leave  
		return -1;
80104ce1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ce6:	c3                   	ret    
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <sys_close>:
{
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	83 ec 18             	sub    $0x18,%esp
	if (argfd(0, &fd, &f) < 0)
80104cf6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104cf9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cfc:	e8 4f fe ff ff       	call   80104b50 <argfd.constprop.0>
80104d01:	85 c0                	test   %eax,%eax
80104d03:	78 2b                	js     80104d30 <sys_close+0x40>
	myproc()->ofile[fd] = 0;
80104d05:	e8 06 ec ff ff       	call   80103910 <myproc>
80104d0a:	8b 55 f0             	mov    -0x10(%ebp),%edx
	fileclose(f);
80104d0d:	83 ec 0c             	sub    $0xc,%esp
	myproc()->ofile[fd] = 0;
80104d10:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d17:	00 
	fileclose(f);
80104d18:	ff 75 f4             	pushl  -0xc(%ebp)
80104d1b:	e8 d0 c1 ff ff       	call   80100ef0 <fileclose>
	return 0;
80104d20:	83 c4 10             	add    $0x10,%esp
80104d23:	31 c0                	xor    %eax,%eax
}
80104d25:	c9                   	leave  
80104d26:	c3                   	ret    
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d30:	c9                   	leave  
		return -1;
80104d31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d36:	c3                   	ret    
80104d37:	89 f6                	mov    %esi,%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d40 <sys_fstat>:
{
80104d40:	55                   	push   %ebp
	if (argfd(0, 0, &f) < 0 || argptr(1, (void *)&st, sizeof(*st)) < 0)
80104d41:	31 c0                	xor    %eax,%eax
{
80104d43:	89 e5                	mov    %esp,%ebp
80104d45:	83 ec 18             	sub    $0x18,%esp
	if (argfd(0, 0, &f) < 0 || argptr(1, (void *)&st, sizeof(*st)) < 0)
80104d48:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d4b:	e8 00 fe ff ff       	call   80104b50 <argfd.constprop.0>
80104d50:	85 c0                	test   %eax,%eax
80104d52:	78 2c                	js     80104d80 <sys_fstat+0x40>
80104d54:	83 ec 04             	sub    $0x4,%esp
80104d57:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d5a:	6a 14                	push   $0x14
80104d5c:	50                   	push   %eax
80104d5d:	6a 01                	push   $0x1
80104d5f:	e8 5c fb ff ff       	call   801048c0 <argptr>
80104d64:	83 c4 10             	add    $0x10,%esp
80104d67:	85 c0                	test   %eax,%eax
80104d69:	78 15                	js     80104d80 <sys_fstat+0x40>
	return filestat(f, st);
80104d6b:	83 ec 08             	sub    $0x8,%esp
80104d6e:	ff 75 f4             	pushl  -0xc(%ebp)
80104d71:	ff 75 f0             	pushl  -0x10(%ebp)
80104d74:	e8 57 c2 ff ff       	call   80100fd0 <filestat>
80104d79:	83 c4 10             	add    $0x10,%esp
}
80104d7c:	c9                   	leave  
80104d7d:	c3                   	ret    
80104d7e:	66 90                	xchg   %ax,%ax
80104d80:	c9                   	leave  
		return -1;
80104d81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d86:	c3                   	ret    
80104d87:	89 f6                	mov    %esi,%esi
80104d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d90 <sys_link>:
{
80104d90:	55                   	push   %ebp
80104d91:	89 e5                	mov    %esp,%ebp
80104d93:	57                   	push   %edi
80104d94:	56                   	push   %esi
	if (argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d95:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104d98:	53                   	push   %ebx
80104d99:	83 ec 34             	sub    $0x34,%esp
	if (argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d9c:	50                   	push   %eax
80104d9d:	6a 00                	push   $0x0
80104d9f:	e8 5c fb ff ff       	call   80104900 <argstr>
80104da4:	83 c4 10             	add    $0x10,%esp
80104da7:	85 c0                	test   %eax,%eax
80104da9:	0f 88 fb 00 00 00    	js     80104eaa <sys_link+0x11a>
80104daf:	83 ec 08             	sub    $0x8,%esp
80104db2:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104db5:	50                   	push   %eax
80104db6:	6a 01                	push   $0x1
80104db8:	e8 43 fb ff ff       	call   80104900 <argstr>
80104dbd:	83 c4 10             	add    $0x10,%esp
80104dc0:	85 c0                	test   %eax,%eax
80104dc2:	0f 88 e2 00 00 00    	js     80104eaa <sys_link+0x11a>
	begin_op();
80104dc8:	e8 03 df ff ff       	call   80102cd0 <begin_op>
	if ((ip = namei(old)) == 0) {
80104dcd:	83 ec 0c             	sub    $0xc,%esp
80104dd0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104dd3:	e8 18 d2 ff ff       	call   80101ff0 <namei>
80104dd8:	83 c4 10             	add    $0x10,%esp
80104ddb:	89 c3                	mov    %eax,%ebx
80104ddd:	85 c0                	test   %eax,%eax
80104ddf:	0f 84 e4 00 00 00    	je     80104ec9 <sys_link+0x139>
	ilock(ip);
80104de5:	83 ec 0c             	sub    $0xc,%esp
80104de8:	50                   	push   %eax
80104de9:	e8 62 c9 ff ff       	call   80101750 <ilock>
	if (ip->type == T_DIR) {
80104dee:	83 c4 10             	add    $0x10,%esp
80104df1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104df6:	0f 84 b5 00 00 00    	je     80104eb1 <sys_link+0x121>
	iupdate(ip);
80104dfc:	83 ec 0c             	sub    $0xc,%esp
	ip->nlink++;
80104dff:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
	if ((dp = nameiparent(new, name)) == 0)
80104e04:	8d 7d da             	lea    -0x26(%ebp),%edi
	iupdate(ip);
80104e07:	53                   	push   %ebx
80104e08:	e8 93 c8 ff ff       	call   801016a0 <iupdate>
	iunlock(ip);
80104e0d:	89 1c 24             	mov    %ebx,(%esp)
80104e10:	e8 1b ca ff ff       	call   80101830 <iunlock>
	if ((dp = nameiparent(new, name)) == 0)
80104e15:	58                   	pop    %eax
80104e16:	5a                   	pop    %edx
80104e17:	57                   	push   %edi
80104e18:	ff 75 d0             	pushl  -0x30(%ebp)
80104e1b:	e8 f0 d1 ff ff       	call   80102010 <nameiparent>
80104e20:	83 c4 10             	add    $0x10,%esp
80104e23:	89 c6                	mov    %eax,%esi
80104e25:	85 c0                	test   %eax,%eax
80104e27:	74 5b                	je     80104e84 <sys_link+0xf4>
	ilock(dp);
80104e29:	83 ec 0c             	sub    $0xc,%esp
80104e2c:	50                   	push   %eax
80104e2d:	e8 1e c9 ff ff       	call   80101750 <ilock>
	if (dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0) {
80104e32:	83 c4 10             	add    $0x10,%esp
80104e35:	8b 03                	mov    (%ebx),%eax
80104e37:	39 06                	cmp    %eax,(%esi)
80104e39:	75 3d                	jne    80104e78 <sys_link+0xe8>
80104e3b:	83 ec 04             	sub    $0x4,%esp
80104e3e:	ff 73 04             	pushl  0x4(%ebx)
80104e41:	57                   	push   %edi
80104e42:	56                   	push   %esi
80104e43:	e8 e8 d0 ff ff       	call   80101f30 <dirlink>
80104e48:	83 c4 10             	add    $0x10,%esp
80104e4b:	85 c0                	test   %eax,%eax
80104e4d:	78 29                	js     80104e78 <sys_link+0xe8>
	iunlockput(dp);
80104e4f:	83 ec 0c             	sub    $0xc,%esp
80104e52:	56                   	push   %esi
80104e53:	e8 88 cb ff ff       	call   801019e0 <iunlockput>
	iput(ip);
80104e58:	89 1c 24             	mov    %ebx,(%esp)
80104e5b:	e8 20 ca ff ff       	call   80101880 <iput>
	end_op();
80104e60:	e8 db de ff ff       	call   80102d40 <end_op>
	return 0;
80104e65:	83 c4 10             	add    $0x10,%esp
80104e68:	31 c0                	xor    %eax,%eax
}
80104e6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e6d:	5b                   	pop    %ebx
80104e6e:	5e                   	pop    %esi
80104e6f:	5f                   	pop    %edi
80104e70:	5d                   	pop    %ebp
80104e71:	c3                   	ret    
80104e72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		iunlockput(dp);
80104e78:	83 ec 0c             	sub    $0xc,%esp
80104e7b:	56                   	push   %esi
80104e7c:	e8 5f cb ff ff       	call   801019e0 <iunlockput>
		goto bad;
80104e81:	83 c4 10             	add    $0x10,%esp
	ilock(ip);
80104e84:	83 ec 0c             	sub    $0xc,%esp
80104e87:	53                   	push   %ebx
80104e88:	e8 c3 c8 ff ff       	call   80101750 <ilock>
	ip->nlink--;
80104e8d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
	iupdate(ip);
80104e92:	89 1c 24             	mov    %ebx,(%esp)
80104e95:	e8 06 c8 ff ff       	call   801016a0 <iupdate>
	iunlockput(ip);
80104e9a:	89 1c 24             	mov    %ebx,(%esp)
80104e9d:	e8 3e cb ff ff       	call   801019e0 <iunlockput>
	end_op();
80104ea2:	e8 99 de ff ff       	call   80102d40 <end_op>
	return -1;
80104ea7:	83 c4 10             	add    $0x10,%esp
80104eaa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104eaf:	eb b9                	jmp    80104e6a <sys_link+0xda>
		iunlockput(ip);
80104eb1:	83 ec 0c             	sub    $0xc,%esp
80104eb4:	53                   	push   %ebx
80104eb5:	e8 26 cb ff ff       	call   801019e0 <iunlockput>
		end_op();
80104eba:	e8 81 de ff ff       	call   80102d40 <end_op>
		return -1;
80104ebf:	83 c4 10             	add    $0x10,%esp
80104ec2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ec7:	eb a1                	jmp    80104e6a <sys_link+0xda>
		end_op();
80104ec9:	e8 72 de ff ff       	call   80102d40 <end_op>
		return -1;
80104ece:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ed3:	eb 95                	jmp    80104e6a <sys_link+0xda>
80104ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ee0 <sys_unlink>:
{
80104ee0:	55                   	push   %ebp
80104ee1:	89 e5                	mov    %esp,%ebp
80104ee3:	57                   	push   %edi
80104ee4:	56                   	push   %esi
	if (argstr(0, &path) < 0)
80104ee5:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104ee8:	53                   	push   %ebx
80104ee9:	83 ec 54             	sub    $0x54,%esp
	if (argstr(0, &path) < 0)
80104eec:	50                   	push   %eax
80104eed:	6a 00                	push   $0x0
80104eef:	e8 0c fa ff ff       	call   80104900 <argstr>
80104ef4:	83 c4 10             	add    $0x10,%esp
80104ef7:	85 c0                	test   %eax,%eax
80104ef9:	0f 88 91 01 00 00    	js     80105090 <sys_unlink+0x1b0>
	begin_op();
80104eff:	e8 cc dd ff ff       	call   80102cd0 <begin_op>
	if ((dp = nameiparent(path, name)) == 0) {
80104f04:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104f07:	83 ec 08             	sub    $0x8,%esp
80104f0a:	53                   	push   %ebx
80104f0b:	ff 75 c0             	pushl  -0x40(%ebp)
80104f0e:	e8 fd d0 ff ff       	call   80102010 <nameiparent>
80104f13:	83 c4 10             	add    $0x10,%esp
80104f16:	89 c6                	mov    %eax,%esi
80104f18:	85 c0                	test   %eax,%eax
80104f1a:	0f 84 7a 01 00 00    	je     8010509a <sys_unlink+0x1ba>
	ilock(dp);
80104f20:	83 ec 0c             	sub    $0xc,%esp
80104f23:	50                   	push   %eax
80104f24:	e8 27 c8 ff ff       	call   80101750 <ilock>
	if (namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104f29:	58                   	pop    %eax
80104f2a:	5a                   	pop    %edx
80104f2b:	68 d4 76 10 80       	push   $0x801076d4
80104f30:	53                   	push   %ebx
80104f31:	e8 2a cd ff ff       	call   80101c60 <namecmp>
80104f36:	83 c4 10             	add    $0x10,%esp
80104f39:	85 c0                	test   %eax,%eax
80104f3b:	0f 84 0f 01 00 00    	je     80105050 <sys_unlink+0x170>
80104f41:	83 ec 08             	sub    $0x8,%esp
80104f44:	68 d3 76 10 80       	push   $0x801076d3
80104f49:	53                   	push   %ebx
80104f4a:	e8 11 cd ff ff       	call   80101c60 <namecmp>
80104f4f:	83 c4 10             	add    $0x10,%esp
80104f52:	85 c0                	test   %eax,%eax
80104f54:	0f 84 f6 00 00 00    	je     80105050 <sys_unlink+0x170>
	if ((ip = dirlookup(dp, name, &off)) == 0)
80104f5a:	83 ec 04             	sub    $0x4,%esp
80104f5d:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f60:	50                   	push   %eax
80104f61:	53                   	push   %ebx
80104f62:	56                   	push   %esi
80104f63:	e8 18 cd ff ff       	call   80101c80 <dirlookup>
80104f68:	83 c4 10             	add    $0x10,%esp
80104f6b:	89 c3                	mov    %eax,%ebx
80104f6d:	85 c0                	test   %eax,%eax
80104f6f:	0f 84 db 00 00 00    	je     80105050 <sys_unlink+0x170>
	ilock(ip);
80104f75:	83 ec 0c             	sub    $0xc,%esp
80104f78:	50                   	push   %eax
80104f79:	e8 d2 c7 ff ff       	call   80101750 <ilock>
	if (ip->nlink < 1)
80104f7e:	83 c4 10             	add    $0x10,%esp
80104f81:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104f86:	0f 8e 37 01 00 00    	jle    801050c3 <sys_unlink+0x1e3>
	if (ip->type == T_DIR && !isdirempty(ip)) {
80104f8c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f91:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104f94:	74 6a                	je     80105000 <sys_unlink+0x120>
	memset(&de, 0, sizeof(de));
80104f96:	83 ec 04             	sub    $0x4,%esp
80104f99:	6a 10                	push   $0x10
80104f9b:	6a 00                	push   $0x0
80104f9d:	57                   	push   %edi
80104f9e:	e8 ed f5 ff ff       	call   80104590 <memset>
	if (writei(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
80104fa3:	6a 10                	push   $0x10
80104fa5:	ff 75 c4             	pushl  -0x3c(%ebp)
80104fa8:	57                   	push   %edi
80104fa9:	56                   	push   %esi
80104faa:	e8 81 cb ff ff       	call   80101b30 <writei>
80104faf:	83 c4 20             	add    $0x20,%esp
80104fb2:	83 f8 10             	cmp    $0x10,%eax
80104fb5:	0f 85 fb 00 00 00    	jne    801050b6 <sys_unlink+0x1d6>
	if (ip->type == T_DIR) {
80104fbb:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fc0:	0f 84 aa 00 00 00    	je     80105070 <sys_unlink+0x190>
	iunlockput(dp);
80104fc6:	83 ec 0c             	sub    $0xc,%esp
80104fc9:	56                   	push   %esi
80104fca:	e8 11 ca ff ff       	call   801019e0 <iunlockput>
	ip->nlink--;
80104fcf:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
	iupdate(ip);
80104fd4:	89 1c 24             	mov    %ebx,(%esp)
80104fd7:	e8 c4 c6 ff ff       	call   801016a0 <iupdate>
	iunlockput(ip);
80104fdc:	89 1c 24             	mov    %ebx,(%esp)
80104fdf:	e8 fc c9 ff ff       	call   801019e0 <iunlockput>
	end_op();
80104fe4:	e8 57 dd ff ff       	call   80102d40 <end_op>
	return 0;
80104fe9:	83 c4 10             	add    $0x10,%esp
80104fec:	31 c0                	xor    %eax,%eax
}
80104fee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ff1:	5b                   	pop    %ebx
80104ff2:	5e                   	pop    %esi
80104ff3:	5f                   	pop    %edi
80104ff4:	5d                   	pop    %ebp
80104ff5:	c3                   	ret    
80104ff6:	8d 76 00             	lea    0x0(%esi),%esi
80104ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
80105000:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105004:	76 90                	jbe    80104f96 <sys_unlink+0xb6>
80105006:	ba 20 00 00 00       	mov    $0x20,%edx
8010500b:	eb 0f                	jmp    8010501c <sys_unlink+0x13c>
8010500d:	8d 76 00             	lea    0x0(%esi),%esi
80105010:	83 c2 10             	add    $0x10,%edx
80105013:	39 53 58             	cmp    %edx,0x58(%ebx)
80105016:	0f 86 7a ff ff ff    	jbe    80104f96 <sys_unlink+0xb6>
		if (readi(dp, (char *)&de, off, sizeof(de)) != sizeof(de))
8010501c:	6a 10                	push   $0x10
8010501e:	52                   	push   %edx
8010501f:	57                   	push   %edi
80105020:	53                   	push   %ebx
80105021:	89 55 b4             	mov    %edx,-0x4c(%ebp)
80105024:	e8 07 ca ff ff       	call   80101a30 <readi>
80105029:	83 c4 10             	add    $0x10,%esp
8010502c:	8b 55 b4             	mov    -0x4c(%ebp),%edx
8010502f:	83 f8 10             	cmp    $0x10,%eax
80105032:	75 75                	jne    801050a9 <sys_unlink+0x1c9>
		if (de.inum != 0)
80105034:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105039:	74 d5                	je     80105010 <sys_unlink+0x130>
		iunlockput(ip);
8010503b:	83 ec 0c             	sub    $0xc,%esp
8010503e:	53                   	push   %ebx
8010503f:	e8 9c c9 ff ff       	call   801019e0 <iunlockput>
		goto bad;
80105044:	83 c4 10             	add    $0x10,%esp
80105047:	89 f6                	mov    %esi,%esi
80105049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	iunlockput(dp);
80105050:	83 ec 0c             	sub    $0xc,%esp
80105053:	56                   	push   %esi
80105054:	e8 87 c9 ff ff       	call   801019e0 <iunlockput>
	end_op();
80105059:	e8 e2 dc ff ff       	call   80102d40 <end_op>
	return -1;
8010505e:	83 c4 10             	add    $0x10,%esp
80105061:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105066:	eb 86                	jmp    80104fee <sys_unlink+0x10e>
80105068:	90                   	nop
80105069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		iupdate(dp);
80105070:	83 ec 0c             	sub    $0xc,%esp
		dp->nlink--;
80105073:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
		iupdate(dp);
80105078:	56                   	push   %esi
80105079:	e8 22 c6 ff ff       	call   801016a0 <iupdate>
8010507e:	83 c4 10             	add    $0x10,%esp
80105081:	e9 40 ff ff ff       	jmp    80104fc6 <sys_unlink+0xe6>
80105086:	8d 76 00             	lea    0x0(%esi),%esi
80105089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		return -1;
80105090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105095:	e9 54 ff ff ff       	jmp    80104fee <sys_unlink+0x10e>
		end_op();
8010509a:	e8 a1 dc ff ff       	call   80102d40 <end_op>
		return -1;
8010509f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050a4:	e9 45 ff ff ff       	jmp    80104fee <sys_unlink+0x10e>
			panic("isdirempty: readi");
801050a9:	83 ec 0c             	sub    $0xc,%esp
801050ac:	68 02 77 10 80       	push   $0x80107702
801050b1:	e8 da b2 ff ff       	call   80100390 <panic>
		panic("unlink: writei");
801050b6:	83 ec 0c             	sub    $0xc,%esp
801050b9:	68 14 77 10 80       	push   $0x80107714
801050be:	e8 cd b2 ff ff       	call   80100390 <panic>
		panic("unlink: nlink < 1");
801050c3:	83 ec 0c             	sub    $0xc,%esp
801050c6:	68 f0 76 10 80       	push   $0x801076f0
801050cb:	e8 c0 b2 ff ff       	call   80100390 <panic>

801050d0 <sys_open>:

int sys_open(void)
{
801050d0:	55                   	push   %ebp
801050d1:	89 e5                	mov    %esp,%ebp
801050d3:	57                   	push   %edi
801050d4:	56                   	push   %esi
	char *path;
	int fd, omode;
	struct file *f;
	struct inode *ip;

	if (argstr(0, &path) < 0 || argint(1, &omode) < 0)
801050d5:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
801050d8:	53                   	push   %ebx
801050d9:	83 ec 24             	sub    $0x24,%esp
	if (argstr(0, &path) < 0 || argint(1, &omode) < 0)
801050dc:	50                   	push   %eax
801050dd:	6a 00                	push   $0x0
801050df:	e8 1c f8 ff ff       	call   80104900 <argstr>
801050e4:	83 c4 10             	add    $0x10,%esp
801050e7:	85 c0                	test   %eax,%eax
801050e9:	0f 88 8e 00 00 00    	js     8010517d <sys_open+0xad>
801050ef:	83 ec 08             	sub    $0x8,%esp
801050f2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801050f5:	50                   	push   %eax
801050f6:	6a 01                	push   $0x1
801050f8:	e8 73 f7 ff ff       	call   80104870 <argint>
801050fd:	83 c4 10             	add    $0x10,%esp
80105100:	85 c0                	test   %eax,%eax
80105102:	78 79                	js     8010517d <sys_open+0xad>
		return -1;

	begin_op();
80105104:	e8 c7 db ff ff       	call   80102cd0 <begin_op>

	if (omode & O_CREATE) {
80105109:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
8010510d:	75 79                	jne    80105188 <sys_open+0xb8>
		if (ip == 0) {
			end_op();
			return -1;
		}
	} else {
		if ((ip = namei(path)) == 0) {
8010510f:	83 ec 0c             	sub    $0xc,%esp
80105112:	ff 75 e0             	pushl  -0x20(%ebp)
80105115:	e8 d6 ce ff ff       	call   80101ff0 <namei>
8010511a:	83 c4 10             	add    $0x10,%esp
8010511d:	89 c6                	mov    %eax,%esi
8010511f:	85 c0                	test   %eax,%eax
80105121:	0f 84 7e 00 00 00    	je     801051a5 <sys_open+0xd5>
			end_op();
			return -1;
		}
		ilock(ip);
80105127:	83 ec 0c             	sub    $0xc,%esp
8010512a:	50                   	push   %eax
8010512b:	e8 20 c6 ff ff       	call   80101750 <ilock>
		if (ip->type == T_DIR && omode != O_RDONLY) {
80105130:	83 c4 10             	add    $0x10,%esp
80105133:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105138:	0f 84 c2 00 00 00    	je     80105200 <sys_open+0x130>
			end_op();
			return -1;
		}
	}

	if ((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0) {
8010513e:	e8 ed bc ff ff       	call   80100e30 <filealloc>
80105143:	89 c7                	mov    %eax,%edi
80105145:	85 c0                	test   %eax,%eax
80105147:	74 23                	je     8010516c <sys_open+0x9c>
	struct proc *curproc = myproc();
80105149:	e8 c2 e7 ff ff       	call   80103910 <myproc>
	for (fd = 0; fd < NOFILE; fd++) {
8010514e:	31 db                	xor    %ebx,%ebx
		if (curproc->ofile[fd] == 0) {
80105150:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105154:	85 d2                	test   %edx,%edx
80105156:	74 60                	je     801051b8 <sys_open+0xe8>
	for (fd = 0; fd < NOFILE; fd++) {
80105158:	83 c3 01             	add    $0x1,%ebx
8010515b:	83 fb 10             	cmp    $0x10,%ebx
8010515e:	75 f0                	jne    80105150 <sys_open+0x80>
		if (f)
			fileclose(f);
80105160:	83 ec 0c             	sub    $0xc,%esp
80105163:	57                   	push   %edi
80105164:	e8 87 bd ff ff       	call   80100ef0 <fileclose>
80105169:	83 c4 10             	add    $0x10,%esp
		iunlockput(ip);
8010516c:	83 ec 0c             	sub    $0xc,%esp
8010516f:	56                   	push   %esi
80105170:	e8 6b c8 ff ff       	call   801019e0 <iunlockput>
		end_op();
80105175:	e8 c6 db ff ff       	call   80102d40 <end_op>
		return -1;
8010517a:	83 c4 10             	add    $0x10,%esp
8010517d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105182:	eb 6d                	jmp    801051f1 <sys_open+0x121>
80105184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		ip = create(path, T_FILE, 0, 0);
80105188:	83 ec 0c             	sub    $0xc,%esp
8010518b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010518e:	31 c9                	xor    %ecx,%ecx
80105190:	ba 02 00 00 00       	mov    $0x2,%edx
80105195:	6a 00                	push   $0x0
80105197:	e8 14 f8 ff ff       	call   801049b0 <create>
		if (ip == 0) {
8010519c:	83 c4 10             	add    $0x10,%esp
		ip = create(path, T_FILE, 0, 0);
8010519f:	89 c6                	mov    %eax,%esi
		if (ip == 0) {
801051a1:	85 c0                	test   %eax,%eax
801051a3:	75 99                	jne    8010513e <sys_open+0x6e>
			end_op();
801051a5:	e8 96 db ff ff       	call   80102d40 <end_op>
			return -1;
801051aa:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801051af:	eb 40                	jmp    801051f1 <sys_open+0x121>
801051b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	}
	iunlock(ip);
801051b8:	83 ec 0c             	sub    $0xc,%esp
			curproc->ofile[fd] = f;
801051bb:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
	iunlock(ip);
801051bf:	56                   	push   %esi
801051c0:	e8 6b c6 ff ff       	call   80101830 <iunlock>
	end_op();
801051c5:	e8 76 db ff ff       	call   80102d40 <end_op>

	f->type = FD_INODE;
801051ca:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
	f->ip = ip;
	f->off = 0;
	f->readable = !(omode & O_WRONLY);
801051d0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
	f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051d3:	83 c4 10             	add    $0x10,%esp
	f->ip = ip;
801051d6:	89 77 10             	mov    %esi,0x10(%edi)
	f->readable = !(omode & O_WRONLY);
801051d9:	89 d0                	mov    %edx,%eax
	f->off = 0;
801051db:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
	f->readable = !(omode & O_WRONLY);
801051e2:	f7 d0                	not    %eax
801051e4:	83 e0 01             	and    $0x1,%eax
	f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051e7:	83 e2 03             	and    $0x3,%edx
	f->readable = !(omode & O_WRONLY);
801051ea:	88 47 08             	mov    %al,0x8(%edi)
	f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801051ed:	0f 95 47 09          	setne  0x9(%edi)
	return fd;
}
801051f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051f4:	89 d8                	mov    %ebx,%eax
801051f6:	5b                   	pop    %ebx
801051f7:	5e                   	pop    %esi
801051f8:	5f                   	pop    %edi
801051f9:	5d                   	pop    %ebp
801051fa:	c3                   	ret    
801051fb:	90                   	nop
801051fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (ip->type == T_DIR && omode != O_RDONLY) {
80105200:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105203:	85 c9                	test   %ecx,%ecx
80105205:	0f 84 33 ff ff ff    	je     8010513e <sys_open+0x6e>
8010520b:	e9 5c ff ff ff       	jmp    8010516c <sys_open+0x9c>

80105210 <sys_mkdir>:

int sys_mkdir(void)
{
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	83 ec 18             	sub    $0x18,%esp
	char *path;
	struct inode *ip;

	begin_op();
80105216:	e8 b5 da ff ff       	call   80102cd0 <begin_op>
	if (argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0) {
8010521b:	83 ec 08             	sub    $0x8,%esp
8010521e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105221:	50                   	push   %eax
80105222:	6a 00                	push   $0x0
80105224:	e8 d7 f6 ff ff       	call   80104900 <argstr>
80105229:	83 c4 10             	add    $0x10,%esp
8010522c:	85 c0                	test   %eax,%eax
8010522e:	78 30                	js     80105260 <sys_mkdir+0x50>
80105230:	83 ec 0c             	sub    $0xc,%esp
80105233:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105236:	31 c9                	xor    %ecx,%ecx
80105238:	ba 01 00 00 00       	mov    $0x1,%edx
8010523d:	6a 00                	push   $0x0
8010523f:	e8 6c f7 ff ff       	call   801049b0 <create>
80105244:	83 c4 10             	add    $0x10,%esp
80105247:	85 c0                	test   %eax,%eax
80105249:	74 15                	je     80105260 <sys_mkdir+0x50>
		end_op();
		return -1;
	}
	iunlockput(ip);
8010524b:	83 ec 0c             	sub    $0xc,%esp
8010524e:	50                   	push   %eax
8010524f:	e8 8c c7 ff ff       	call   801019e0 <iunlockput>
	end_op();
80105254:	e8 e7 da ff ff       	call   80102d40 <end_op>
	return 0;
80105259:	83 c4 10             	add    $0x10,%esp
8010525c:	31 c0                	xor    %eax,%eax
}
8010525e:	c9                   	leave  
8010525f:	c3                   	ret    
		end_op();
80105260:	e8 db da ff ff       	call   80102d40 <end_op>
		return -1;
80105265:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010526a:	c9                   	leave  
8010526b:	c3                   	ret    
8010526c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105270 <sys_mknod>:

int sys_mknod(void)
{
80105270:	55                   	push   %ebp
80105271:	89 e5                	mov    %esp,%ebp
80105273:	83 ec 18             	sub    $0x18,%esp
	struct inode *ip;
	char *path;
	int major, minor;

	begin_op();
80105276:	e8 55 da ff ff       	call   80102cd0 <begin_op>
	if ((argstr(0, &path)) < 0 || argint(1, &major) < 0
8010527b:	83 ec 08             	sub    $0x8,%esp
8010527e:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105281:	50                   	push   %eax
80105282:	6a 00                	push   $0x0
80105284:	e8 77 f6 ff ff       	call   80104900 <argstr>
80105289:	83 c4 10             	add    $0x10,%esp
8010528c:	85 c0                	test   %eax,%eax
8010528e:	78 60                	js     801052f0 <sys_mknod+0x80>
80105290:	83 ec 08             	sub    $0x8,%esp
80105293:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105296:	50                   	push   %eax
80105297:	6a 01                	push   $0x1
80105299:	e8 d2 f5 ff ff       	call   80104870 <argint>
8010529e:	83 c4 10             	add    $0x10,%esp
801052a1:	85 c0                	test   %eax,%eax
801052a3:	78 4b                	js     801052f0 <sys_mknod+0x80>
	    || argint(2, &minor) < 0
801052a5:	83 ec 08             	sub    $0x8,%esp
801052a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052ab:	50                   	push   %eax
801052ac:	6a 02                	push   $0x2
801052ae:	e8 bd f5 ff ff       	call   80104870 <argint>
801052b3:	83 c4 10             	add    $0x10,%esp
801052b6:	85 c0                	test   %eax,%eax
801052b8:	78 36                	js     801052f0 <sys_mknod+0x80>
	    || (ip = create(path, T_DEV, major, minor)) == 0) {
801052ba:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801052be:	83 ec 0c             	sub    $0xc,%esp
801052c1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801052c5:	ba 03 00 00 00       	mov    $0x3,%edx
801052ca:	50                   	push   %eax
801052cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801052ce:	e8 dd f6 ff ff       	call   801049b0 <create>
801052d3:	83 c4 10             	add    $0x10,%esp
801052d6:	85 c0                	test   %eax,%eax
801052d8:	74 16                	je     801052f0 <sys_mknod+0x80>
		end_op();
		return -1;
	}
	iunlockput(ip);
801052da:	83 ec 0c             	sub    $0xc,%esp
801052dd:	50                   	push   %eax
801052de:	e8 fd c6 ff ff       	call   801019e0 <iunlockput>
	end_op();
801052e3:	e8 58 da ff ff       	call   80102d40 <end_op>
	return 0;
801052e8:	83 c4 10             	add    $0x10,%esp
801052eb:	31 c0                	xor    %eax,%eax
}
801052ed:	c9                   	leave  
801052ee:	c3                   	ret    
801052ef:	90                   	nop
		end_op();
801052f0:	e8 4b da ff ff       	call   80102d40 <end_op>
		return -1;
801052f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052fa:	c9                   	leave  
801052fb:	c3                   	ret    
801052fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105300 <sys_chdir>:

int sys_chdir(void)
{
80105300:	55                   	push   %ebp
80105301:	89 e5                	mov    %esp,%ebp
80105303:	56                   	push   %esi
80105304:	53                   	push   %ebx
80105305:	83 ec 10             	sub    $0x10,%esp
	char *path;
	struct inode *ip;
	struct proc *curproc = myproc();
80105308:	e8 03 e6 ff ff       	call   80103910 <myproc>
8010530d:	89 c6                	mov    %eax,%esi

	begin_op();
8010530f:	e8 bc d9 ff ff       	call   80102cd0 <begin_op>
	if (argstr(0, &path) < 0 || (ip = namei(path)) == 0) {
80105314:	83 ec 08             	sub    $0x8,%esp
80105317:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010531a:	50                   	push   %eax
8010531b:	6a 00                	push   $0x0
8010531d:	e8 de f5 ff ff       	call   80104900 <argstr>
80105322:	83 c4 10             	add    $0x10,%esp
80105325:	85 c0                	test   %eax,%eax
80105327:	78 77                	js     801053a0 <sys_chdir+0xa0>
80105329:	83 ec 0c             	sub    $0xc,%esp
8010532c:	ff 75 f4             	pushl  -0xc(%ebp)
8010532f:	e8 bc cc ff ff       	call   80101ff0 <namei>
80105334:	83 c4 10             	add    $0x10,%esp
80105337:	89 c3                	mov    %eax,%ebx
80105339:	85 c0                	test   %eax,%eax
8010533b:	74 63                	je     801053a0 <sys_chdir+0xa0>
		end_op();
		return -1;
	}
	ilock(ip);
8010533d:	83 ec 0c             	sub    $0xc,%esp
80105340:	50                   	push   %eax
80105341:	e8 0a c4 ff ff       	call   80101750 <ilock>
	if (ip->type != T_DIR) {
80105346:	83 c4 10             	add    $0x10,%esp
80105349:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010534e:	75 30                	jne    80105380 <sys_chdir+0x80>
		iunlockput(ip);
		end_op();
		return -1;
	}
	iunlock(ip);
80105350:	83 ec 0c             	sub    $0xc,%esp
80105353:	53                   	push   %ebx
80105354:	e8 d7 c4 ff ff       	call   80101830 <iunlock>
	iput(curproc->cwd);
80105359:	58                   	pop    %eax
8010535a:	ff 76 68             	pushl  0x68(%esi)
8010535d:	e8 1e c5 ff ff       	call   80101880 <iput>
	end_op();
80105362:	e8 d9 d9 ff ff       	call   80102d40 <end_op>
	curproc->cwd = ip;
80105367:	89 5e 68             	mov    %ebx,0x68(%esi)
	return 0;
8010536a:	83 c4 10             	add    $0x10,%esp
8010536d:	31 c0                	xor    %eax,%eax
}
8010536f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105372:	5b                   	pop    %ebx
80105373:	5e                   	pop    %esi
80105374:	5d                   	pop    %ebp
80105375:	c3                   	ret    
80105376:	8d 76 00             	lea    0x0(%esi),%esi
80105379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		iunlockput(ip);
80105380:	83 ec 0c             	sub    $0xc,%esp
80105383:	53                   	push   %ebx
80105384:	e8 57 c6 ff ff       	call   801019e0 <iunlockput>
		end_op();
80105389:	e8 b2 d9 ff ff       	call   80102d40 <end_op>
		return -1;
8010538e:	83 c4 10             	add    $0x10,%esp
80105391:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105396:	eb d7                	jmp    8010536f <sys_chdir+0x6f>
80105398:	90                   	nop
80105399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		end_op();
801053a0:	e8 9b d9 ff ff       	call   80102d40 <end_op>
		return -1;
801053a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053aa:	eb c3                	jmp    8010536f <sys_chdir+0x6f>
801053ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053b0 <sys_exec>:

int sys_exec(void)
{
801053b0:	55                   	push   %ebp
801053b1:	89 e5                	mov    %esp,%ebp
801053b3:	57                   	push   %edi
801053b4:	56                   	push   %esi
	char *path, *argv[MAXARG];
	int i;
	uint uargv, uarg;

	if (argstr(0, &path) < 0 || argint(1, (int *)&uargv) < 0) {
801053b5:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
801053bb:	53                   	push   %ebx
801053bc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
	if (argstr(0, &path) < 0 || argint(1, (int *)&uargv) < 0) {
801053c2:	50                   	push   %eax
801053c3:	6a 00                	push   $0x0
801053c5:	e8 36 f5 ff ff       	call   80104900 <argstr>
801053ca:	83 c4 10             	add    $0x10,%esp
801053cd:	85 c0                	test   %eax,%eax
801053cf:	0f 88 87 00 00 00    	js     8010545c <sys_exec+0xac>
801053d5:	83 ec 08             	sub    $0x8,%esp
801053d8:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801053de:	50                   	push   %eax
801053df:	6a 01                	push   $0x1
801053e1:	e8 8a f4 ff ff       	call   80104870 <argint>
801053e6:	83 c4 10             	add    $0x10,%esp
801053e9:	85 c0                	test   %eax,%eax
801053eb:	78 6f                	js     8010545c <sys_exec+0xac>
		return -1;
	}
	memset(argv, 0, sizeof(argv));
801053ed:	83 ec 04             	sub    $0x4,%esp
801053f0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
	for (i = 0;; i++) {
801053f6:	31 db                	xor    %ebx,%ebx
	memset(argv, 0, sizeof(argv));
801053f8:	68 80 00 00 00       	push   $0x80
801053fd:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105403:	6a 00                	push   $0x0
80105405:	50                   	push   %eax
80105406:	e8 85 f1 ff ff       	call   80104590 <memset>
8010540b:	83 c4 10             	add    $0x10,%esp
8010540e:	66 90                	xchg   %ax,%ax
		if (i >= NELEM(argv))
			return -1;
		if (fetchint(uargv + 4 * i, (int *)&uarg) < 0)
80105410:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105416:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
8010541d:	83 ec 08             	sub    $0x8,%esp
80105420:	57                   	push   %edi
80105421:	01 f0                	add    %esi,%eax
80105423:	50                   	push   %eax
80105424:	e8 a7 f3 ff ff       	call   801047d0 <fetchint>
80105429:	83 c4 10             	add    $0x10,%esp
8010542c:	85 c0                	test   %eax,%eax
8010542e:	78 2c                	js     8010545c <sys_exec+0xac>
			return -1;
		if (uarg == 0) {
80105430:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105436:	85 c0                	test   %eax,%eax
80105438:	74 36                	je     80105470 <sys_exec+0xc0>
			argv[i] = 0;
			break;
		}
		if (fetchstr(uarg, &argv[i]) < 0)
8010543a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105440:	83 ec 08             	sub    $0x8,%esp
80105443:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105446:	52                   	push   %edx
80105447:	50                   	push   %eax
80105448:	e8 c3 f3 ff ff       	call   80104810 <fetchstr>
8010544d:	83 c4 10             	add    $0x10,%esp
80105450:	85 c0                	test   %eax,%eax
80105452:	78 08                	js     8010545c <sys_exec+0xac>
	for (i = 0;; i++) {
80105454:	83 c3 01             	add    $0x1,%ebx
		if (i >= NELEM(argv))
80105457:	83 fb 20             	cmp    $0x20,%ebx
8010545a:	75 b4                	jne    80105410 <sys_exec+0x60>
			return -1;
	}
	return exec(path, argv);
}
8010545c:	8d 65 f4             	lea    -0xc(%ebp),%esp
		return -1;
8010545f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105464:	5b                   	pop    %ebx
80105465:	5e                   	pop    %esi
80105466:	5f                   	pop    %edi
80105467:	5d                   	pop    %ebp
80105468:	c3                   	ret    
80105469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	return exec(path, argv);
80105470:	83 ec 08             	sub    $0x8,%esp
80105473:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
			argv[i] = 0;
80105479:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105480:	00 00 00 00 
	return exec(path, argv);
80105484:	50                   	push   %eax
80105485:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010548b:	e8 20 b6 ff ff       	call   80100ab0 <exec>
80105490:	83 c4 10             	add    $0x10,%esp
}
80105493:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105496:	5b                   	pop    %ebx
80105497:	5e                   	pop    %esi
80105498:	5f                   	pop    %edi
80105499:	5d                   	pop    %ebp
8010549a:	c3                   	ret    
8010549b:	90                   	nop
8010549c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054a0 <sys_pipe>:

int sys_pipe(void)
{
801054a0:	55                   	push   %ebp
801054a1:	89 e5                	mov    %esp,%ebp
801054a3:	57                   	push   %edi
801054a4:	56                   	push   %esi
	int *fd;
	struct file *rf, *wf;
	int fd0, fd1;

	if (argptr(0, (void *)&fd, 2 * sizeof(fd[0])) < 0)
801054a5:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
801054a8:	53                   	push   %ebx
801054a9:	83 ec 20             	sub    $0x20,%esp
	if (argptr(0, (void *)&fd, 2 * sizeof(fd[0])) < 0)
801054ac:	6a 08                	push   $0x8
801054ae:	50                   	push   %eax
801054af:	6a 00                	push   $0x0
801054b1:	e8 0a f4 ff ff       	call   801048c0 <argptr>
801054b6:	83 c4 10             	add    $0x10,%esp
801054b9:	85 c0                	test   %eax,%eax
801054bb:	78 4a                	js     80105507 <sys_pipe+0x67>
		return -1;
	if (pipealloc(&rf, &wf) < 0)
801054bd:	83 ec 08             	sub    $0x8,%esp
801054c0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801054c3:	50                   	push   %eax
801054c4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801054c7:	50                   	push   %eax
801054c8:	e8 b3 de ff ff       	call   80103380 <pipealloc>
801054cd:	83 c4 10             	add    $0x10,%esp
801054d0:	85 c0                	test   %eax,%eax
801054d2:	78 33                	js     80105507 <sys_pipe+0x67>
		return -1;
	fd0 = -1;
	if ((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0) {
801054d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
	for (fd = 0; fd < NOFILE; fd++) {
801054d7:	31 db                	xor    %ebx,%ebx
	struct proc *curproc = myproc();
801054d9:	e8 32 e4 ff ff       	call   80103910 <myproc>
801054de:	66 90                	xchg   %ax,%ax
		if (curproc->ofile[fd] == 0) {
801054e0:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
801054e4:	85 f6                	test   %esi,%esi
801054e6:	74 28                	je     80105510 <sys_pipe+0x70>
	for (fd = 0; fd < NOFILE; fd++) {
801054e8:	83 c3 01             	add    $0x1,%ebx
801054eb:	83 fb 10             	cmp    $0x10,%ebx
801054ee:	75 f0                	jne    801054e0 <sys_pipe+0x40>
		if (fd0 >= 0)
			myproc()->ofile[fd0] = 0;
		fileclose(rf);
801054f0:	83 ec 0c             	sub    $0xc,%esp
801054f3:	ff 75 e0             	pushl  -0x20(%ebp)
801054f6:	e8 f5 b9 ff ff       	call   80100ef0 <fileclose>
		fileclose(wf);
801054fb:	58                   	pop    %eax
801054fc:	ff 75 e4             	pushl  -0x1c(%ebp)
801054ff:	e8 ec b9 ff ff       	call   80100ef0 <fileclose>
		return -1;
80105504:	83 c4 10             	add    $0x10,%esp
80105507:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010550c:	eb 53                	jmp    80105561 <sys_pipe+0xc1>
8010550e:	66 90                	xchg   %ax,%ax
			curproc->ofile[fd] = f;
80105510:	8d 73 08             	lea    0x8(%ebx),%esi
80105513:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
	if ((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0) {
80105517:	8b 7d e4             	mov    -0x1c(%ebp),%edi
	struct proc *curproc = myproc();
8010551a:	e8 f1 e3 ff ff       	call   80103910 <myproc>
	for (fd = 0; fd < NOFILE; fd++) {
8010551f:	31 d2                	xor    %edx,%edx
80105521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (curproc->ofile[fd] == 0) {
80105528:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
8010552c:	85 c9                	test   %ecx,%ecx
8010552e:	74 20                	je     80105550 <sys_pipe+0xb0>
	for (fd = 0; fd < NOFILE; fd++) {
80105530:	83 c2 01             	add    $0x1,%edx
80105533:	83 fa 10             	cmp    $0x10,%edx
80105536:	75 f0                	jne    80105528 <sys_pipe+0x88>
			myproc()->ofile[fd0] = 0;
80105538:	e8 d3 e3 ff ff       	call   80103910 <myproc>
8010553d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105544:	00 
80105545:	eb a9                	jmp    801054f0 <sys_pipe+0x50>
80105547:	89 f6                	mov    %esi,%esi
80105549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			curproc->ofile[fd] = f;
80105550:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
	}
	fd[0] = fd0;
80105554:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105557:	89 18                	mov    %ebx,(%eax)
	fd[1] = fd1;
80105559:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010555c:	89 50 04             	mov    %edx,0x4(%eax)
	return 0;
8010555f:	31 c0                	xor    %eax,%eax
}
80105561:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105564:	5b                   	pop    %ebx
80105565:	5e                   	pop    %esi
80105566:	5f                   	pop    %edi
80105567:	5d                   	pop    %ebp
80105568:	c3                   	ret    
80105569:	66 90                	xchg   %ax,%ax
8010556b:	66 90                	xchg   %ax,%ax
8010556d:	66 90                	xchg   %ax,%ax
8010556f:	90                   	nop

80105570 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int sys_fork(void)
{
	return fork();
80105570:	e9 3b e5 ff ff       	jmp    80103ab0 <fork>
80105575:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105580 <sys_exit>:
}

int sys_exit(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	83 ec 08             	sub    $0x8,%esp
	exit();
80105586:	e8 b5 e7 ff ff       	call   80103d40 <exit>
	return 0; // not reached
}
8010558b:	31 c0                	xor    %eax,%eax
8010558d:	c9                   	leave  
8010558e:	c3                   	ret    
8010558f:	90                   	nop

80105590 <sys_wait>:

int sys_wait(void)
{
	return wait();
80105590:	e9 eb e9 ff ff       	jmp    80103f80 <wait>
80105595:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055a0 <sys_kill>:
}

int sys_kill(void)
{
801055a0:	55                   	push   %ebp
801055a1:	89 e5                	mov    %esp,%ebp
801055a3:	83 ec 20             	sub    $0x20,%esp
	int pid;

	if (argint(0, &pid) < 0)
801055a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055a9:	50                   	push   %eax
801055aa:	6a 00                	push   $0x0
801055ac:	e8 bf f2 ff ff       	call   80104870 <argint>
801055b1:	83 c4 10             	add    $0x10,%esp
801055b4:	85 c0                	test   %eax,%eax
801055b6:	78 18                	js     801055d0 <sys_kill+0x30>
		return -1;
	return kill(pid);
801055b8:	83 ec 0c             	sub    $0xc,%esp
801055bb:	ff 75 f4             	pushl  -0xc(%ebp)
801055be:	e8 0d eb ff ff       	call   801040d0 <kill>
801055c3:	83 c4 10             	add    $0x10,%esp
}
801055c6:	c9                   	leave  
801055c7:	c3                   	ret    
801055c8:	90                   	nop
801055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055d0:	c9                   	leave  
		return -1;
801055d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801055d6:	c3                   	ret    
801055d7:	89 f6                	mov    %esi,%esi
801055d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055e0 <sys_getpid>:

int sys_getpid(void)
{
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	83 ec 08             	sub    $0x8,%esp
	return myproc()->pid;
801055e6:	e8 25 e3 ff ff       	call   80103910 <myproc>
801055eb:	8b 40 10             	mov    0x10(%eax),%eax
}
801055ee:	c9                   	leave  
801055ef:	c3                   	ret    

801055f0 <sys_sbrk>:

int sys_sbrk(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	53                   	push   %ebx
	int addr;
	int n;

	if (argint(0, &n) < 0)
801055f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801055f7:	83 ec 1c             	sub    $0x1c,%esp
	if (argint(0, &n) < 0)
801055fa:	50                   	push   %eax
801055fb:	6a 00                	push   $0x0
801055fd:	e8 6e f2 ff ff       	call   80104870 <argint>
80105602:	83 c4 10             	add    $0x10,%esp
80105605:	85 c0                	test   %eax,%eax
80105607:	78 27                	js     80105630 <sys_sbrk+0x40>
		return -1;
	addr = myproc()->sz;
80105609:	e8 02 e3 ff ff       	call   80103910 <myproc>
	if (growproc(n) < 0)
8010560e:	83 ec 0c             	sub    $0xc,%esp
	addr = myproc()->sz;
80105611:	8b 18                	mov    (%eax),%ebx
	if (growproc(n) < 0)
80105613:	ff 75 f4             	pushl  -0xc(%ebp)
80105616:	e8 15 e4 ff ff       	call   80103a30 <growproc>
8010561b:	83 c4 10             	add    $0x10,%esp
8010561e:	85 c0                	test   %eax,%eax
80105620:	78 0e                	js     80105630 <sys_sbrk+0x40>
		return -1;
	return addr;
}
80105622:	89 d8                	mov    %ebx,%eax
80105624:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105627:	c9                   	leave  
80105628:	c3                   	ret    
80105629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		return -1;
80105630:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105635:	eb eb                	jmp    80105622 <sys_sbrk+0x32>
80105637:	89 f6                	mov    %esi,%esi
80105639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105640 <sys_sleep>:

int sys_sleep(void)
{
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	53                   	push   %ebx
	int n;
	uint ticks0;

	if (argint(0, &n) < 0)
80105644:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105647:	83 ec 1c             	sub    $0x1c,%esp
	if (argint(0, &n) < 0)
8010564a:	50                   	push   %eax
8010564b:	6a 00                	push   $0x0
8010564d:	e8 1e f2 ff ff       	call   80104870 <argint>
80105652:	83 c4 10             	add    $0x10,%esp
80105655:	85 c0                	test   %eax,%eax
80105657:	0f 88 8a 00 00 00    	js     801056e7 <sys_sleep+0xa7>
		return -1;
	acquire(&tickslock);
8010565d:	83 ec 0c             	sub    $0xc,%esp
80105660:	68 c0 4c 11 80       	push   $0x80114cc0
80105665:	e8 b6 ed ff ff       	call   80104420 <acquire>
	ticks0 = ticks;
	while (ticks - ticks0 < n) {
8010566a:	8b 55 f4             	mov    -0xc(%ebp),%edx
	ticks0 = ticks;
8010566d:	8b 1d 00 55 11 80    	mov    0x80115500,%ebx
	while (ticks - ticks0 < n) {
80105673:	83 c4 10             	add    $0x10,%esp
80105676:	85 d2                	test   %edx,%edx
80105678:	75 27                	jne    801056a1 <sys_sleep+0x61>
8010567a:	eb 54                	jmp    801056d0 <sys_sleep+0x90>
8010567c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if (myproc()->killed) {
			release(&tickslock);
			return -1;
		}
		sleep(&ticks, &tickslock);
80105680:	83 ec 08             	sub    $0x8,%esp
80105683:	68 c0 4c 11 80       	push   $0x80114cc0
80105688:	68 00 55 11 80       	push   $0x80115500
8010568d:	e8 2e e8 ff ff       	call   80103ec0 <sleep>
	while (ticks - ticks0 < n) {
80105692:	a1 00 55 11 80       	mov    0x80115500,%eax
80105697:	83 c4 10             	add    $0x10,%esp
8010569a:	29 d8                	sub    %ebx,%eax
8010569c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010569f:	73 2f                	jae    801056d0 <sys_sleep+0x90>
		if (myproc()->killed) {
801056a1:	e8 6a e2 ff ff       	call   80103910 <myproc>
801056a6:	8b 40 24             	mov    0x24(%eax),%eax
801056a9:	85 c0                	test   %eax,%eax
801056ab:	74 d3                	je     80105680 <sys_sleep+0x40>
			release(&tickslock);
801056ad:	83 ec 0c             	sub    $0xc,%esp
801056b0:	68 c0 4c 11 80       	push   $0x80114cc0
801056b5:	e8 86 ee ff ff       	call   80104540 <release>
			return -1;
801056ba:	83 c4 10             	add    $0x10,%esp
801056bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
	release(&tickslock);
	return 0;
}
801056c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056c5:	c9                   	leave  
801056c6:	c3                   	ret    
801056c7:	89 f6                	mov    %esi,%esi
801056c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	release(&tickslock);
801056d0:	83 ec 0c             	sub    $0xc,%esp
801056d3:	68 c0 4c 11 80       	push   $0x80114cc0
801056d8:	e8 63 ee ff ff       	call   80104540 <release>
	return 0;
801056dd:	83 c4 10             	add    $0x10,%esp
801056e0:	31 c0                	xor    %eax,%eax
}
801056e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056e5:	c9                   	leave  
801056e6:	c3                   	ret    
		return -1;
801056e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056ec:	eb f4                	jmp    801056e2 <sys_sleep+0xa2>
801056ee:	66 90                	xchg   %ax,%ax

801056f0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int sys_uptime(void)
{
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	53                   	push   %ebx
801056f4:	83 ec 10             	sub    $0x10,%esp
	uint xticks;

	acquire(&tickslock);
801056f7:	68 c0 4c 11 80       	push   $0x80114cc0
801056fc:	e8 1f ed ff ff       	call   80104420 <acquire>
	xticks = ticks;
80105701:	8b 1d 00 55 11 80    	mov    0x80115500,%ebx
	release(&tickslock);
80105707:	c7 04 24 c0 4c 11 80 	movl   $0x80114cc0,(%esp)
8010570e:	e8 2d ee ff ff       	call   80104540 <release>
	return xticks;
}
80105713:	89 d8                	mov    %ebx,%eax
80105715:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105718:	c9                   	leave  
80105719:	c3                   	ret    

8010571a <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
8010571a:	1e                   	push   %ds
  pushl %es
8010571b:	06                   	push   %es
  pushl %fs
8010571c:	0f a0                	push   %fs
  pushl %gs
8010571e:	0f a8                	push   %gs
  pushal
80105720:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105721:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105725:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105727:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105729:	54                   	push   %esp
  call trap
8010572a:	e8 c1 00 00 00       	call   801057f0 <trap>
  addl $4, %esp
8010572f:	83 c4 04             	add    $0x4,%esp

80105732 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105732:	61                   	popa   
  popl %gs
80105733:	0f a9                	pop    %gs
  popl %fs
80105735:	0f a1                	pop    %fs
  popl %es
80105737:	07                   	pop    %es
  popl %ds
80105738:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105739:	83 c4 08             	add    $0x8,%esp
  iret
8010573c:	cf                   	iret   
8010573d:	66 90                	xchg   %ax,%ax
8010573f:	90                   	nop

80105740 <tvinit>:
extern uint vectors[]; // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

void tvinit(void)
{
80105740:	55                   	push   %ebp
	int i;

	for (i = 0; i < 256; i++)
80105741:	31 c0                	xor    %eax,%eax
{
80105743:	89 e5                	mov    %esp,%ebp
80105745:	83 ec 08             	sub    $0x8,%esp
80105748:	90                   	nop
80105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		SETGATE(idt[i], 0, SEG_KCODE << 3, vectors[i], 0);
80105750:	8b 14 85 50 a0 10 80 	mov    -0x7fef5fb0(,%eax,4),%edx
80105757:	c7 04 c5 02 4d 11 80 	movl   $0x8e000008,-0x7feeb2fe(,%eax,8)
8010575e:	08 00 00 8e 
80105762:	66 89 14 c5 00 4d 11 	mov    %dx,-0x7feeb300(,%eax,8)
80105769:	80 
8010576a:	c1 ea 10             	shr    $0x10,%edx
8010576d:	66 89 14 c5 06 4d 11 	mov    %dx,-0x7feeb2fa(,%eax,8)
80105774:	80 
	for (i = 0; i < 256; i++)
80105775:	83 c0 01             	add    $0x1,%eax
80105778:	3d 00 01 00 00       	cmp    $0x100,%eax
8010577d:	75 d1                	jne    80105750 <tvinit+0x10>
	SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL],
		DPL_USER);

	initlock(&tickslock, "time");
8010577f:	83 ec 08             	sub    $0x8,%esp
	SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL],
80105782:	a1 50 a1 10 80       	mov    0x8010a150,%eax
80105787:	c7 05 02 4f 11 80 08 	movl   $0xef000008,0x80114f02
8010578e:	00 00 ef 
	initlock(&tickslock, "time");
80105791:	68 23 77 10 80       	push   $0x80107723
80105796:	68 c0 4c 11 80       	push   $0x80114cc0
	SETGATE(idt[T_SYSCALL], 1, SEG_KCODE << 3, vectors[T_SYSCALL],
8010579b:	66 a3 00 4f 11 80    	mov    %ax,0x80114f00
801057a1:	c1 e8 10             	shr    $0x10,%eax
801057a4:	66 a3 06 4f 11 80    	mov    %ax,0x80114f06
	initlock(&tickslock, "time");
801057aa:	e8 71 eb ff ff       	call   80104320 <initlock>
}
801057af:	83 c4 10             	add    $0x10,%esp
801057b2:	c9                   	leave  
801057b3:	c3                   	ret    
801057b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801057ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801057c0 <idtinit>:

void idtinit(void)
{
801057c0:	55                   	push   %ebp
	pd[0] = size - 1;
801057c1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801057c6:	89 e5                	mov    %esp,%ebp
801057c8:	83 ec 10             	sub    $0x10,%esp
801057cb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
	pd[1] = (uint)p;
801057cf:	b8 00 4d 11 80       	mov    $0x80114d00,%eax
801057d4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
	pd[2] = (uint)p >> 16;
801057d8:	c1 e8 10             	shr    $0x10,%eax
801057db:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
	asm volatile("lidt (%0)" : : "r"(pd));
801057df:	8d 45 fa             	lea    -0x6(%ebp),%eax
801057e2:	0f 01 18             	lidtl  (%eax)
	lidt(idt, sizeof(idt));
}
801057e5:	c9                   	leave  
801057e6:	c3                   	ret    
801057e7:	89 f6                	mov    %esi,%esi
801057e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057f0 <trap>:

void trap(struct trapframe *tf)
{
801057f0:	55                   	push   %ebp
801057f1:	89 e5                	mov    %esp,%ebp
801057f3:	57                   	push   %edi
801057f4:	56                   	push   %esi
801057f5:	53                   	push   %ebx
801057f6:	83 ec 1c             	sub    $0x1c,%esp
801057f9:	8b 7d 08             	mov    0x8(%ebp),%edi
	if (tf->trapno == T_SYSCALL) {
801057fc:	8b 47 30             	mov    0x30(%edi),%eax
801057ff:	83 f8 40             	cmp    $0x40,%eax
80105802:	0f 84 b8 01 00 00    	je     801059c0 <trap+0x1d0>
		if (myproc()->killed)
			exit();
		return;
	}

	switch (tf->trapno) {
80105808:	83 e8 20             	sub    $0x20,%eax
8010580b:	83 f8 1f             	cmp    $0x1f,%eax
8010580e:	77 10                	ja     80105820 <trap+0x30>
80105810:	ff 24 85 cc 77 10 80 	jmp    *-0x7fef8834(,%eax,4)
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			tf->eip);
		lapiceoi();
		break;

	default:
		if (myproc() == 0 || (tf->cs & 3) == 0) {
80105820:	e8 eb e0 ff ff       	call   80103910 <myproc>
80105825:	8b 5f 38             	mov    0x38(%edi),%ebx
80105828:	85 c0                	test   %eax,%eax
8010582a:	0f 84 17 02 00 00    	je     80105a47 <trap+0x257>
80105830:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105834:	0f 84 0d 02 00 00    	je     80105a47 <trap+0x257>
}

static inline uint rcr2(void)
{
	uint val;
	asm volatile("movl %%cr2,%0" : "=r"(val));
8010583a:	0f 20 d1             	mov    %cr2,%ecx
8010583d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
			cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
				tf->trapno, cpuid(), tf->eip, rcr2());
			panic("trap");
		}
		// In user space, assume process misbehaved.
		cprintf("pid %d %s: trap %d err %d on cpu %d "
80105840:	e8 ab e0 ff ff       	call   801038f0 <cpuid>
80105845:	8b 77 30             	mov    0x30(%edi),%esi
80105848:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010584b:	8b 47 34             	mov    0x34(%edi),%eax
8010584e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			"eip 0x%x addr 0x%x--kill proc\n",
			myproc()->pid, myproc()->name, tf->trapno, tf->err,
80105851:	e8 ba e0 ff ff       	call   80103910 <myproc>
80105856:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105859:	e8 b2 e0 ff ff       	call   80103910 <myproc>
		cprintf("pid %d %s: trap %d err %d on cpu %d "
8010585e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105861:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105864:	51                   	push   %ecx
80105865:	53                   	push   %ebx
80105866:	52                   	push   %edx
			myproc()->pid, myproc()->name, tf->trapno, tf->err,
80105867:	8b 55 e0             	mov    -0x20(%ebp),%edx
		cprintf("pid %d %s: trap %d err %d on cpu %d "
8010586a:	ff 75 e4             	pushl  -0x1c(%ebp)
			myproc()->pid, myproc()->name, tf->trapno, tf->err,
8010586d:	83 c2 6c             	add    $0x6c,%edx
		cprintf("pid %d %s: trap %d err %d on cpu %d "
80105870:	56                   	push   %esi
80105871:	52                   	push   %edx
80105872:	ff 70 10             	pushl  0x10(%eax)
80105875:	68 88 77 10 80       	push   $0x80107788
8010587a:	e8 31 ae ff ff       	call   801006b0 <cprintf>
			cpuid(), tf->eip, rcr2());
		myproc()->killed = 1;
8010587f:	83 c4 20             	add    $0x20,%esp
80105882:	e8 89 e0 ff ff       	call   80103910 <myproc>
80105887:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
	}

	// Force process exit if it has been killed and is in user space.
	// (If it is still executing in the kernel, let it keep running
	// until it gets to the regular system call return.)
	if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
8010588e:	e8 7d e0 ff ff       	call   80103910 <myproc>
80105893:	85 c0                	test   %eax,%eax
80105895:	74 1d                	je     801058b4 <trap+0xc4>
80105897:	e8 74 e0 ff ff       	call   80103910 <myproc>
8010589c:	8b 50 24             	mov    0x24(%eax),%edx
8010589f:	85 d2                	test   %edx,%edx
801058a1:	74 11                	je     801058b4 <trap+0xc4>
801058a3:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058a7:	83 e0 03             	and    $0x3,%eax
801058aa:	66 83 f8 03          	cmp    $0x3,%ax
801058ae:	0f 84 44 01 00 00    	je     801059f8 <trap+0x208>
		exit();

	// Force process to give up CPU on clock tick.
	// If interrupts were on while locks held, would need to check nlock.
	if (myproc() && myproc()->state == RUNNING
801058b4:	e8 57 e0 ff ff       	call   80103910 <myproc>
801058b9:	85 c0                	test   %eax,%eax
801058bb:	74 0b                	je     801058c8 <trap+0xd8>
801058bd:	e8 4e e0 ff ff       	call   80103910 <myproc>
801058c2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801058c6:	74 38                	je     80105900 <trap+0x110>
	    && tf->trapno == T_IRQ0 + IRQ_TIMER)
		yield();

	// Check if the process has been killed since we yielded
	if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
801058c8:	e8 43 e0 ff ff       	call   80103910 <myproc>
801058cd:	85 c0                	test   %eax,%eax
801058cf:	74 1d                	je     801058ee <trap+0xfe>
801058d1:	e8 3a e0 ff ff       	call   80103910 <myproc>
801058d6:	8b 40 24             	mov    0x24(%eax),%eax
801058d9:	85 c0                	test   %eax,%eax
801058db:	74 11                	je     801058ee <trap+0xfe>
801058dd:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058e1:	83 e0 03             	and    $0x3,%eax
801058e4:	66 83 f8 03          	cmp    $0x3,%ax
801058e8:	0f 84 fb 00 00 00    	je     801059e9 <trap+0x1f9>
		exit();
}
801058ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058f1:	5b                   	pop    %ebx
801058f2:	5e                   	pop    %esi
801058f3:	5f                   	pop    %edi
801058f4:	5d                   	pop    %ebp
801058f5:	c3                   	ret    
801058f6:	8d 76 00             	lea    0x0(%esi),%esi
801058f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	    && tf->trapno == T_IRQ0 + IRQ_TIMER)
80105900:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105904:	75 c2                	jne    801058c8 <trap+0xd8>
		yield();
80105906:	e8 65 e5 ff ff       	call   80103e70 <yield>
8010590b:	eb bb                	jmp    801058c8 <trap+0xd8>
8010590d:	8d 76 00             	lea    0x0(%esi),%esi
		if (cpuid() == 0) {
80105910:	e8 db df ff ff       	call   801038f0 <cpuid>
80105915:	85 c0                	test   %eax,%eax
80105917:	0f 84 eb 00 00 00    	je     80105a08 <trap+0x218>
		lapiceoi();
8010591d:	e8 5e cf ff ff       	call   80102880 <lapiceoi>
	if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105922:	e8 e9 df ff ff       	call   80103910 <myproc>
80105927:	85 c0                	test   %eax,%eax
80105929:	0f 85 68 ff ff ff    	jne    80105897 <trap+0xa7>
8010592f:	eb 83                	jmp    801058b4 <trap+0xc4>
80105931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		kbdintr();
80105938:	e8 03 ce ff ff       	call   80102740 <kbdintr>
		lapiceoi();
8010593d:	e8 3e cf ff ff       	call   80102880 <lapiceoi>
	if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105942:	e8 c9 df ff ff       	call   80103910 <myproc>
80105947:	85 c0                	test   %eax,%eax
80105949:	0f 85 48 ff ff ff    	jne    80105897 <trap+0xa7>
8010594f:	e9 60 ff ff ff       	jmp    801058b4 <trap+0xc4>
80105954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		uartintr();
80105958:	e8 83 02 00 00       	call   80105be0 <uartintr>
		lapiceoi();
8010595d:	e8 1e cf ff ff       	call   80102880 <lapiceoi>
	if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105962:	e8 a9 df ff ff       	call   80103910 <myproc>
80105967:	85 c0                	test   %eax,%eax
80105969:	0f 85 28 ff ff ff    	jne    80105897 <trap+0xa7>
8010596f:	e9 40 ff ff ff       	jmp    801058b4 <trap+0xc4>
80105974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		cprintf("cpu%d: spurious interrupt at %x:%x\n", cpuid(), tf->cs,
80105978:	8b 77 38             	mov    0x38(%edi),%esi
8010597b:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
8010597f:	e8 6c df ff ff       	call   801038f0 <cpuid>
80105984:	56                   	push   %esi
80105985:	53                   	push   %ebx
80105986:	50                   	push   %eax
80105987:	68 30 77 10 80       	push   $0x80107730
8010598c:	e8 1f ad ff ff       	call   801006b0 <cprintf>
		lapiceoi();
80105991:	e8 ea ce ff ff       	call   80102880 <lapiceoi>
		break;
80105996:	83 c4 10             	add    $0x10,%esp
	if (myproc() && myproc()->killed && (tf->cs & 3) == DPL_USER)
80105999:	e8 72 df ff ff       	call   80103910 <myproc>
8010599e:	85 c0                	test   %eax,%eax
801059a0:	0f 85 f1 fe ff ff    	jne    80105897 <trap+0xa7>
801059a6:	e9 09 ff ff ff       	jmp    801058b4 <trap+0xc4>
801059ab:	90                   	nop
801059ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		ideintr();
801059b0:	e8 db c7 ff ff       	call   80102190 <ideintr>
801059b5:	e9 63 ff ff ff       	jmp    8010591d <trap+0x12d>
801059ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		if (myproc()->killed)
801059c0:	e8 4b df ff ff       	call   80103910 <myproc>
801059c5:	8b 58 24             	mov    0x24(%eax),%ebx
801059c8:	85 db                	test   %ebx,%ebx
801059ca:	75 74                	jne    80105a40 <trap+0x250>
		myproc()->tf = tf;
801059cc:	e8 3f df ff ff       	call   80103910 <myproc>
801059d1:	89 78 18             	mov    %edi,0x18(%eax)
		syscall();
801059d4:	e8 67 ef ff ff       	call   80104940 <syscall>
		if (myproc()->killed)
801059d9:	e8 32 df ff ff       	call   80103910 <myproc>
801059de:	8b 48 24             	mov    0x24(%eax),%ecx
801059e1:	85 c9                	test   %ecx,%ecx
801059e3:	0f 84 05 ff ff ff    	je     801058ee <trap+0xfe>
}
801059e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059ec:	5b                   	pop    %ebx
801059ed:	5e                   	pop    %esi
801059ee:	5f                   	pop    %edi
801059ef:	5d                   	pop    %ebp
			exit();
801059f0:	e9 4b e3 ff ff       	jmp    80103d40 <exit>
801059f5:	8d 76 00             	lea    0x0(%esi),%esi
		exit();
801059f8:	e8 43 e3 ff ff       	call   80103d40 <exit>
801059fd:	e9 b2 fe ff ff       	jmp    801058b4 <trap+0xc4>
80105a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			acquire(&tickslock);
80105a08:	83 ec 0c             	sub    $0xc,%esp
80105a0b:	68 c0 4c 11 80       	push   $0x80114cc0
80105a10:	e8 0b ea ff ff       	call   80104420 <acquire>
			wakeup(&ticks);
80105a15:	c7 04 24 00 55 11 80 	movl   $0x80115500,(%esp)
			ticks++;
80105a1c:	83 05 00 55 11 80 01 	addl   $0x1,0x80115500
			wakeup(&ticks);
80105a23:	e8 48 e6 ff ff       	call   80104070 <wakeup>
			release(&tickslock);
80105a28:	c7 04 24 c0 4c 11 80 	movl   $0x80114cc0,(%esp)
80105a2f:	e8 0c eb ff ff       	call   80104540 <release>
80105a34:	83 c4 10             	add    $0x10,%esp
		lapiceoi();
80105a37:	e9 e1 fe ff ff       	jmp    8010591d <trap+0x12d>
80105a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			exit();
80105a40:	e8 fb e2 ff ff       	call   80103d40 <exit>
80105a45:	eb 85                	jmp    801059cc <trap+0x1dc>
80105a47:	0f 20 d6             	mov    %cr2,%esi
			cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105a4a:	e8 a1 de ff ff       	call   801038f0 <cpuid>
80105a4f:	83 ec 0c             	sub    $0xc,%esp
80105a52:	56                   	push   %esi
80105a53:	53                   	push   %ebx
80105a54:	50                   	push   %eax
80105a55:	ff 77 30             	pushl  0x30(%edi)
80105a58:	68 54 77 10 80       	push   $0x80107754
80105a5d:	e8 4e ac ff ff       	call   801006b0 <cprintf>
			panic("trap");
80105a62:	83 c4 14             	add    $0x14,%esp
80105a65:	68 28 77 10 80       	push   $0x80107728
80105a6a:	e8 21 a9 ff ff       	call   80100390 <panic>
80105a6f:	90                   	nop

80105a70 <uartgetc>:
	outb(COM1 + 0, c);
}

static int uartgetc(void)
{
	if (!uart)
80105a70:	a1 1c a6 10 80       	mov    0x8010a61c,%eax
80105a75:	85 c0                	test   %eax,%eax
80105a77:	74 17                	je     80105a90 <uartgetc+0x20>
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80105a79:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a7e:	ec                   	in     (%dx),%al
		return -1;
	if (!(inb(COM1 + 5) & 0x01))
80105a7f:	a8 01                	test   $0x1,%al
80105a81:	74 0d                	je     80105a90 <uartgetc+0x20>
80105a83:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a88:	ec                   	in     (%dx),%al
		return -1;
	return inb(COM1 + 0);
80105a89:	0f b6 c0             	movzbl %al,%eax
80105a8c:	c3                   	ret    
80105a8d:	8d 76 00             	lea    0x0(%esi),%esi
		return -1;
80105a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a95:	c3                   	ret    
80105a96:	8d 76 00             	lea    0x0(%esi),%esi
80105a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105aa0 <uartputc.part.0>:
void uartputc(int c)
80105aa0:	55                   	push   %ebp
80105aa1:	89 e5                	mov    %esp,%ebp
80105aa3:	57                   	push   %edi
80105aa4:	89 c7                	mov    %eax,%edi
80105aa6:	56                   	push   %esi
80105aa7:	be fd 03 00 00       	mov    $0x3fd,%esi
80105aac:	53                   	push   %ebx
80105aad:	bb 80 00 00 00       	mov    $0x80,%ebx
80105ab2:	83 ec 0c             	sub    $0xc,%esp
80105ab5:	eb 1b                	jmp    80105ad2 <uartputc.part.0+0x32>
80105ab7:	89 f6                	mov    %esi,%esi
80105ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		microdelay(10);
80105ac0:	83 ec 0c             	sub    $0xc,%esp
80105ac3:	6a 0a                	push   $0xa
80105ac5:	e8 d6 cd ff ff       	call   801028a0 <microdelay>
	for (i = 0; i < 128 && !(inb(COM1 + 5) & 0x20); i++)
80105aca:	83 c4 10             	add    $0x10,%esp
80105acd:	83 eb 01             	sub    $0x1,%ebx
80105ad0:	74 07                	je     80105ad9 <uartputc.part.0+0x39>
80105ad2:	89 f2                	mov    %esi,%edx
80105ad4:	ec                   	in     (%dx),%al
80105ad5:	a8 20                	test   $0x20,%al
80105ad7:	74 e7                	je     80105ac0 <uartputc.part.0+0x20>
	asm volatile("out %0,%1" : : "a"(data), "d"(port));
80105ad9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ade:	89 f8                	mov    %edi,%eax
80105ae0:	ee                   	out    %al,(%dx)
}
80105ae1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ae4:	5b                   	pop    %ebx
80105ae5:	5e                   	pop    %esi
80105ae6:	5f                   	pop    %edi
80105ae7:	5d                   	pop    %ebp
80105ae8:	c3                   	ret    
80105ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105af0 <uartinit>:
{
80105af0:	55                   	push   %ebp
80105af1:	31 c9                	xor    %ecx,%ecx
80105af3:	89 c8                	mov    %ecx,%eax
80105af5:	89 e5                	mov    %esp,%ebp
80105af7:	57                   	push   %edi
80105af8:	56                   	push   %esi
80105af9:	53                   	push   %ebx
80105afa:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105aff:	89 da                	mov    %ebx,%edx
80105b01:	83 ec 0c             	sub    $0xc,%esp
80105b04:	ee                   	out    %al,(%dx)
80105b05:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105b0a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b0f:	89 fa                	mov    %edi,%edx
80105b11:	ee                   	out    %al,(%dx)
80105b12:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b17:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b1c:	ee                   	out    %al,(%dx)
80105b1d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b22:	89 c8                	mov    %ecx,%eax
80105b24:	89 f2                	mov    %esi,%edx
80105b26:	ee                   	out    %al,(%dx)
80105b27:	b8 03 00 00 00       	mov    $0x3,%eax
80105b2c:	89 fa                	mov    %edi,%edx
80105b2e:	ee                   	out    %al,(%dx)
80105b2f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b34:	89 c8                	mov    %ecx,%eax
80105b36:	ee                   	out    %al,(%dx)
80105b37:	b8 01 00 00 00       	mov    $0x1,%eax
80105b3c:	89 f2                	mov    %esi,%edx
80105b3e:	ee                   	out    %al,(%dx)
	asm volatile("in %1,%0" : "=a"(data) : "d"(port));
80105b3f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b44:	ec                   	in     (%dx),%al
	if (inb(COM1 + 5) == 0xFF)
80105b45:	3c ff                	cmp    $0xff,%al
80105b47:	74 56                	je     80105b9f <uartinit+0xaf>
	uart = 1;
80105b49:	c7 05 1c a6 10 80 01 	movl   $0x1,0x8010a61c
80105b50:	00 00 00 
80105b53:	89 da                	mov    %ebx,%edx
80105b55:	ec                   	in     (%dx),%al
80105b56:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b5b:	ec                   	in     (%dx),%al
	ioapicenable(IRQ_COM1, 0);
80105b5c:	83 ec 08             	sub    $0x8,%esp
80105b5f:	be 76 00 00 00       	mov    $0x76,%esi
	for (p = "xv6...\n"; *p; p++)
80105b64:	bb 4c 78 10 80       	mov    $0x8010784c,%ebx
	ioapicenable(IRQ_COM1, 0);
80105b69:	6a 00                	push   $0x0
80105b6b:	6a 04                	push   $0x4
80105b6d:	e8 6e c8 ff ff       	call   801023e0 <ioapicenable>
80105b72:	83 c4 10             	add    $0x10,%esp
	for (p = "xv6...\n"; *p; p++)
80105b75:	b8 78 00 00 00       	mov    $0x78,%eax
80105b7a:	eb 08                	jmp    80105b84 <uartinit+0x94>
80105b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105b80:	0f b6 73 01          	movzbl 0x1(%ebx),%esi
	if (!uart)
80105b84:	8b 15 1c a6 10 80    	mov    0x8010a61c,%edx
80105b8a:	85 d2                	test   %edx,%edx
80105b8c:	74 08                	je     80105b96 <uartinit+0xa6>
		uartputc(*p);
80105b8e:	0f be c0             	movsbl %al,%eax
80105b91:	e8 0a ff ff ff       	call   80105aa0 <uartputc.part.0>
	for (p = "xv6...\n"; *p; p++)
80105b96:	89 f0                	mov    %esi,%eax
80105b98:	83 c3 01             	add    $0x1,%ebx
80105b9b:	84 c0                	test   %al,%al
80105b9d:	75 e1                	jne    80105b80 <uartinit+0x90>
}
80105b9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ba2:	5b                   	pop    %ebx
80105ba3:	5e                   	pop    %esi
80105ba4:	5f                   	pop    %edi
80105ba5:	5d                   	pop    %ebp
80105ba6:	c3                   	ret    
80105ba7:	89 f6                	mov    %esi,%esi
80105ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bb0 <uartputc>:
{
80105bb0:	55                   	push   %ebp
	if (!uart)
80105bb1:	8b 15 1c a6 10 80    	mov    0x8010a61c,%edx
{
80105bb7:	89 e5                	mov    %esp,%ebp
80105bb9:	8b 45 08             	mov    0x8(%ebp),%eax
	if (!uart)
80105bbc:	85 d2                	test   %edx,%edx
80105bbe:	74 10                	je     80105bd0 <uartputc+0x20>
}
80105bc0:	5d                   	pop    %ebp
80105bc1:	e9 da fe ff ff       	jmp    80105aa0 <uartputc.part.0>
80105bc6:	8d 76 00             	lea    0x0(%esi),%esi
80105bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105bd0:	5d                   	pop    %ebp
80105bd1:	c3                   	ret    
80105bd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105be0 <uartintr>:

void uartintr(void)
{
80105be0:	55                   	push   %ebp
80105be1:	89 e5                	mov    %esp,%ebp
80105be3:	83 ec 14             	sub    $0x14,%esp
	consoleintr(uartgetc);
80105be6:	68 70 5a 10 80       	push   $0x80105a70
80105beb:	e8 70 ac ff ff       	call   80100860 <consoleintr>
}
80105bf0:	83 c4 10             	add    $0x10,%esp
80105bf3:	c9                   	leave  
80105bf4:	c3                   	ret    

80105bf5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105bf5:	6a 00                	push   $0x0
  pushl $0
80105bf7:	6a 00                	push   $0x0
  jmp alltraps
80105bf9:	e9 1c fb ff ff       	jmp    8010571a <alltraps>

80105bfe <vector1>:
.globl vector1
vector1:
  pushl $0
80105bfe:	6a 00                	push   $0x0
  pushl $1
80105c00:	6a 01                	push   $0x1
  jmp alltraps
80105c02:	e9 13 fb ff ff       	jmp    8010571a <alltraps>

80105c07 <vector2>:
.globl vector2
vector2:
  pushl $0
80105c07:	6a 00                	push   $0x0
  pushl $2
80105c09:	6a 02                	push   $0x2
  jmp alltraps
80105c0b:	e9 0a fb ff ff       	jmp    8010571a <alltraps>

80105c10 <vector3>:
.globl vector3
vector3:
  pushl $0
80105c10:	6a 00                	push   $0x0
  pushl $3
80105c12:	6a 03                	push   $0x3
  jmp alltraps
80105c14:	e9 01 fb ff ff       	jmp    8010571a <alltraps>

80105c19 <vector4>:
.globl vector4
vector4:
  pushl $0
80105c19:	6a 00                	push   $0x0
  pushl $4
80105c1b:	6a 04                	push   $0x4
  jmp alltraps
80105c1d:	e9 f8 fa ff ff       	jmp    8010571a <alltraps>

80105c22 <vector5>:
.globl vector5
vector5:
  pushl $0
80105c22:	6a 00                	push   $0x0
  pushl $5
80105c24:	6a 05                	push   $0x5
  jmp alltraps
80105c26:	e9 ef fa ff ff       	jmp    8010571a <alltraps>

80105c2b <vector6>:
.globl vector6
vector6:
  pushl $0
80105c2b:	6a 00                	push   $0x0
  pushl $6
80105c2d:	6a 06                	push   $0x6
  jmp alltraps
80105c2f:	e9 e6 fa ff ff       	jmp    8010571a <alltraps>

80105c34 <vector7>:
.globl vector7
vector7:
  pushl $0
80105c34:	6a 00                	push   $0x0
  pushl $7
80105c36:	6a 07                	push   $0x7
  jmp alltraps
80105c38:	e9 dd fa ff ff       	jmp    8010571a <alltraps>

80105c3d <vector8>:
.globl vector8
vector8:
  pushl $8
80105c3d:	6a 08                	push   $0x8
  jmp alltraps
80105c3f:	e9 d6 fa ff ff       	jmp    8010571a <alltraps>

80105c44 <vector9>:
.globl vector9
vector9:
  pushl $0
80105c44:	6a 00                	push   $0x0
  pushl $9
80105c46:	6a 09                	push   $0x9
  jmp alltraps
80105c48:	e9 cd fa ff ff       	jmp    8010571a <alltraps>

80105c4d <vector10>:
.globl vector10
vector10:
  pushl $10
80105c4d:	6a 0a                	push   $0xa
  jmp alltraps
80105c4f:	e9 c6 fa ff ff       	jmp    8010571a <alltraps>

80105c54 <vector11>:
.globl vector11
vector11:
  pushl $11
80105c54:	6a 0b                	push   $0xb
  jmp alltraps
80105c56:	e9 bf fa ff ff       	jmp    8010571a <alltraps>

80105c5b <vector12>:
.globl vector12
vector12:
  pushl $12
80105c5b:	6a 0c                	push   $0xc
  jmp alltraps
80105c5d:	e9 b8 fa ff ff       	jmp    8010571a <alltraps>

80105c62 <vector13>:
.globl vector13
vector13:
  pushl $13
80105c62:	6a 0d                	push   $0xd
  jmp alltraps
80105c64:	e9 b1 fa ff ff       	jmp    8010571a <alltraps>

80105c69 <vector14>:
.globl vector14
vector14:
  pushl $14
80105c69:	6a 0e                	push   $0xe
  jmp alltraps
80105c6b:	e9 aa fa ff ff       	jmp    8010571a <alltraps>

80105c70 <vector15>:
.globl vector15
vector15:
  pushl $0
80105c70:	6a 00                	push   $0x0
  pushl $15
80105c72:	6a 0f                	push   $0xf
  jmp alltraps
80105c74:	e9 a1 fa ff ff       	jmp    8010571a <alltraps>

80105c79 <vector16>:
.globl vector16
vector16:
  pushl $0
80105c79:	6a 00                	push   $0x0
  pushl $16
80105c7b:	6a 10                	push   $0x10
  jmp alltraps
80105c7d:	e9 98 fa ff ff       	jmp    8010571a <alltraps>

80105c82 <vector17>:
.globl vector17
vector17:
  pushl $17
80105c82:	6a 11                	push   $0x11
  jmp alltraps
80105c84:	e9 91 fa ff ff       	jmp    8010571a <alltraps>

80105c89 <vector18>:
.globl vector18
vector18:
  pushl $0
80105c89:	6a 00                	push   $0x0
  pushl $18
80105c8b:	6a 12                	push   $0x12
  jmp alltraps
80105c8d:	e9 88 fa ff ff       	jmp    8010571a <alltraps>

80105c92 <vector19>:
.globl vector19
vector19:
  pushl $0
80105c92:	6a 00                	push   $0x0
  pushl $19
80105c94:	6a 13                	push   $0x13
  jmp alltraps
80105c96:	e9 7f fa ff ff       	jmp    8010571a <alltraps>

80105c9b <vector20>:
.globl vector20
vector20:
  pushl $0
80105c9b:	6a 00                	push   $0x0
  pushl $20
80105c9d:	6a 14                	push   $0x14
  jmp alltraps
80105c9f:	e9 76 fa ff ff       	jmp    8010571a <alltraps>

80105ca4 <vector21>:
.globl vector21
vector21:
  pushl $0
80105ca4:	6a 00                	push   $0x0
  pushl $21
80105ca6:	6a 15                	push   $0x15
  jmp alltraps
80105ca8:	e9 6d fa ff ff       	jmp    8010571a <alltraps>

80105cad <vector22>:
.globl vector22
vector22:
  pushl $0
80105cad:	6a 00                	push   $0x0
  pushl $22
80105caf:	6a 16                	push   $0x16
  jmp alltraps
80105cb1:	e9 64 fa ff ff       	jmp    8010571a <alltraps>

80105cb6 <vector23>:
.globl vector23
vector23:
  pushl $0
80105cb6:	6a 00                	push   $0x0
  pushl $23
80105cb8:	6a 17                	push   $0x17
  jmp alltraps
80105cba:	e9 5b fa ff ff       	jmp    8010571a <alltraps>

80105cbf <vector24>:
.globl vector24
vector24:
  pushl $0
80105cbf:	6a 00                	push   $0x0
  pushl $24
80105cc1:	6a 18                	push   $0x18
  jmp alltraps
80105cc3:	e9 52 fa ff ff       	jmp    8010571a <alltraps>

80105cc8 <vector25>:
.globl vector25
vector25:
  pushl $0
80105cc8:	6a 00                	push   $0x0
  pushl $25
80105cca:	6a 19                	push   $0x19
  jmp alltraps
80105ccc:	e9 49 fa ff ff       	jmp    8010571a <alltraps>

80105cd1 <vector26>:
.globl vector26
vector26:
  pushl $0
80105cd1:	6a 00                	push   $0x0
  pushl $26
80105cd3:	6a 1a                	push   $0x1a
  jmp alltraps
80105cd5:	e9 40 fa ff ff       	jmp    8010571a <alltraps>

80105cda <vector27>:
.globl vector27
vector27:
  pushl $0
80105cda:	6a 00                	push   $0x0
  pushl $27
80105cdc:	6a 1b                	push   $0x1b
  jmp alltraps
80105cde:	e9 37 fa ff ff       	jmp    8010571a <alltraps>

80105ce3 <vector28>:
.globl vector28
vector28:
  pushl $0
80105ce3:	6a 00                	push   $0x0
  pushl $28
80105ce5:	6a 1c                	push   $0x1c
  jmp alltraps
80105ce7:	e9 2e fa ff ff       	jmp    8010571a <alltraps>

80105cec <vector29>:
.globl vector29
vector29:
  pushl $0
80105cec:	6a 00                	push   $0x0
  pushl $29
80105cee:	6a 1d                	push   $0x1d
  jmp alltraps
80105cf0:	e9 25 fa ff ff       	jmp    8010571a <alltraps>

80105cf5 <vector30>:
.globl vector30
vector30:
  pushl $0
80105cf5:	6a 00                	push   $0x0
  pushl $30
80105cf7:	6a 1e                	push   $0x1e
  jmp alltraps
80105cf9:	e9 1c fa ff ff       	jmp    8010571a <alltraps>

80105cfe <vector31>:
.globl vector31
vector31:
  pushl $0
80105cfe:	6a 00                	push   $0x0
  pushl $31
80105d00:	6a 1f                	push   $0x1f
  jmp alltraps
80105d02:	e9 13 fa ff ff       	jmp    8010571a <alltraps>

80105d07 <vector32>:
.globl vector32
vector32:
  pushl $0
80105d07:	6a 00                	push   $0x0
  pushl $32
80105d09:	6a 20                	push   $0x20
  jmp alltraps
80105d0b:	e9 0a fa ff ff       	jmp    8010571a <alltraps>

80105d10 <vector33>:
.globl vector33
vector33:
  pushl $0
80105d10:	6a 00                	push   $0x0
  pushl $33
80105d12:	6a 21                	push   $0x21
  jmp alltraps
80105d14:	e9 01 fa ff ff       	jmp    8010571a <alltraps>

80105d19 <vector34>:
.globl vector34
vector34:
  pushl $0
80105d19:	6a 00                	push   $0x0
  pushl $34
80105d1b:	6a 22                	push   $0x22
  jmp alltraps
80105d1d:	e9 f8 f9 ff ff       	jmp    8010571a <alltraps>

80105d22 <vector35>:
.globl vector35
vector35:
  pushl $0
80105d22:	6a 00                	push   $0x0
  pushl $35
80105d24:	6a 23                	push   $0x23
  jmp alltraps
80105d26:	e9 ef f9 ff ff       	jmp    8010571a <alltraps>

80105d2b <vector36>:
.globl vector36
vector36:
  pushl $0
80105d2b:	6a 00                	push   $0x0
  pushl $36
80105d2d:	6a 24                	push   $0x24
  jmp alltraps
80105d2f:	e9 e6 f9 ff ff       	jmp    8010571a <alltraps>

80105d34 <vector37>:
.globl vector37
vector37:
  pushl $0
80105d34:	6a 00                	push   $0x0
  pushl $37
80105d36:	6a 25                	push   $0x25
  jmp alltraps
80105d38:	e9 dd f9 ff ff       	jmp    8010571a <alltraps>

80105d3d <vector38>:
.globl vector38
vector38:
  pushl $0
80105d3d:	6a 00                	push   $0x0
  pushl $38
80105d3f:	6a 26                	push   $0x26
  jmp alltraps
80105d41:	e9 d4 f9 ff ff       	jmp    8010571a <alltraps>

80105d46 <vector39>:
.globl vector39
vector39:
  pushl $0
80105d46:	6a 00                	push   $0x0
  pushl $39
80105d48:	6a 27                	push   $0x27
  jmp alltraps
80105d4a:	e9 cb f9 ff ff       	jmp    8010571a <alltraps>

80105d4f <vector40>:
.globl vector40
vector40:
  pushl $0
80105d4f:	6a 00                	push   $0x0
  pushl $40
80105d51:	6a 28                	push   $0x28
  jmp alltraps
80105d53:	e9 c2 f9 ff ff       	jmp    8010571a <alltraps>

80105d58 <vector41>:
.globl vector41
vector41:
  pushl $0
80105d58:	6a 00                	push   $0x0
  pushl $41
80105d5a:	6a 29                	push   $0x29
  jmp alltraps
80105d5c:	e9 b9 f9 ff ff       	jmp    8010571a <alltraps>

80105d61 <vector42>:
.globl vector42
vector42:
  pushl $0
80105d61:	6a 00                	push   $0x0
  pushl $42
80105d63:	6a 2a                	push   $0x2a
  jmp alltraps
80105d65:	e9 b0 f9 ff ff       	jmp    8010571a <alltraps>

80105d6a <vector43>:
.globl vector43
vector43:
  pushl $0
80105d6a:	6a 00                	push   $0x0
  pushl $43
80105d6c:	6a 2b                	push   $0x2b
  jmp alltraps
80105d6e:	e9 a7 f9 ff ff       	jmp    8010571a <alltraps>

80105d73 <vector44>:
.globl vector44
vector44:
  pushl $0
80105d73:	6a 00                	push   $0x0
  pushl $44
80105d75:	6a 2c                	push   $0x2c
  jmp alltraps
80105d77:	e9 9e f9 ff ff       	jmp    8010571a <alltraps>

80105d7c <vector45>:
.globl vector45
vector45:
  pushl $0
80105d7c:	6a 00                	push   $0x0
  pushl $45
80105d7e:	6a 2d                	push   $0x2d
  jmp alltraps
80105d80:	e9 95 f9 ff ff       	jmp    8010571a <alltraps>

80105d85 <vector46>:
.globl vector46
vector46:
  pushl $0
80105d85:	6a 00                	push   $0x0
  pushl $46
80105d87:	6a 2e                	push   $0x2e
  jmp alltraps
80105d89:	e9 8c f9 ff ff       	jmp    8010571a <alltraps>

80105d8e <vector47>:
.globl vector47
vector47:
  pushl $0
80105d8e:	6a 00                	push   $0x0
  pushl $47
80105d90:	6a 2f                	push   $0x2f
  jmp alltraps
80105d92:	e9 83 f9 ff ff       	jmp    8010571a <alltraps>

80105d97 <vector48>:
.globl vector48
vector48:
  pushl $0
80105d97:	6a 00                	push   $0x0
  pushl $48
80105d99:	6a 30                	push   $0x30
  jmp alltraps
80105d9b:	e9 7a f9 ff ff       	jmp    8010571a <alltraps>

80105da0 <vector49>:
.globl vector49
vector49:
  pushl $0
80105da0:	6a 00                	push   $0x0
  pushl $49
80105da2:	6a 31                	push   $0x31
  jmp alltraps
80105da4:	e9 71 f9 ff ff       	jmp    8010571a <alltraps>

80105da9 <vector50>:
.globl vector50
vector50:
  pushl $0
80105da9:	6a 00                	push   $0x0
  pushl $50
80105dab:	6a 32                	push   $0x32
  jmp alltraps
80105dad:	e9 68 f9 ff ff       	jmp    8010571a <alltraps>

80105db2 <vector51>:
.globl vector51
vector51:
  pushl $0
80105db2:	6a 00                	push   $0x0
  pushl $51
80105db4:	6a 33                	push   $0x33
  jmp alltraps
80105db6:	e9 5f f9 ff ff       	jmp    8010571a <alltraps>

80105dbb <vector52>:
.globl vector52
vector52:
  pushl $0
80105dbb:	6a 00                	push   $0x0
  pushl $52
80105dbd:	6a 34                	push   $0x34
  jmp alltraps
80105dbf:	e9 56 f9 ff ff       	jmp    8010571a <alltraps>

80105dc4 <vector53>:
.globl vector53
vector53:
  pushl $0
80105dc4:	6a 00                	push   $0x0
  pushl $53
80105dc6:	6a 35                	push   $0x35
  jmp alltraps
80105dc8:	e9 4d f9 ff ff       	jmp    8010571a <alltraps>

80105dcd <vector54>:
.globl vector54
vector54:
  pushl $0
80105dcd:	6a 00                	push   $0x0
  pushl $54
80105dcf:	6a 36                	push   $0x36
  jmp alltraps
80105dd1:	e9 44 f9 ff ff       	jmp    8010571a <alltraps>

80105dd6 <vector55>:
.globl vector55
vector55:
  pushl $0
80105dd6:	6a 00                	push   $0x0
  pushl $55
80105dd8:	6a 37                	push   $0x37
  jmp alltraps
80105dda:	e9 3b f9 ff ff       	jmp    8010571a <alltraps>

80105ddf <vector56>:
.globl vector56
vector56:
  pushl $0
80105ddf:	6a 00                	push   $0x0
  pushl $56
80105de1:	6a 38                	push   $0x38
  jmp alltraps
80105de3:	e9 32 f9 ff ff       	jmp    8010571a <alltraps>

80105de8 <vector57>:
.globl vector57
vector57:
  pushl $0
80105de8:	6a 00                	push   $0x0
  pushl $57
80105dea:	6a 39                	push   $0x39
  jmp alltraps
80105dec:	e9 29 f9 ff ff       	jmp    8010571a <alltraps>

80105df1 <vector58>:
.globl vector58
vector58:
  pushl $0
80105df1:	6a 00                	push   $0x0
  pushl $58
80105df3:	6a 3a                	push   $0x3a
  jmp alltraps
80105df5:	e9 20 f9 ff ff       	jmp    8010571a <alltraps>

80105dfa <vector59>:
.globl vector59
vector59:
  pushl $0
80105dfa:	6a 00                	push   $0x0
  pushl $59
80105dfc:	6a 3b                	push   $0x3b
  jmp alltraps
80105dfe:	e9 17 f9 ff ff       	jmp    8010571a <alltraps>

80105e03 <vector60>:
.globl vector60
vector60:
  pushl $0
80105e03:	6a 00                	push   $0x0
  pushl $60
80105e05:	6a 3c                	push   $0x3c
  jmp alltraps
80105e07:	e9 0e f9 ff ff       	jmp    8010571a <alltraps>

80105e0c <vector61>:
.globl vector61
vector61:
  pushl $0
80105e0c:	6a 00                	push   $0x0
  pushl $61
80105e0e:	6a 3d                	push   $0x3d
  jmp alltraps
80105e10:	e9 05 f9 ff ff       	jmp    8010571a <alltraps>

80105e15 <vector62>:
.globl vector62
vector62:
  pushl $0
80105e15:	6a 00                	push   $0x0
  pushl $62
80105e17:	6a 3e                	push   $0x3e
  jmp alltraps
80105e19:	e9 fc f8 ff ff       	jmp    8010571a <alltraps>

80105e1e <vector63>:
.globl vector63
vector63:
  pushl $0
80105e1e:	6a 00                	push   $0x0
  pushl $63
80105e20:	6a 3f                	push   $0x3f
  jmp alltraps
80105e22:	e9 f3 f8 ff ff       	jmp    8010571a <alltraps>

80105e27 <vector64>:
.globl vector64
vector64:
  pushl $0
80105e27:	6a 00                	push   $0x0
  pushl $64
80105e29:	6a 40                	push   $0x40
  jmp alltraps
80105e2b:	e9 ea f8 ff ff       	jmp    8010571a <alltraps>

80105e30 <vector65>:
.globl vector65
vector65:
  pushl $0
80105e30:	6a 00                	push   $0x0
  pushl $65
80105e32:	6a 41                	push   $0x41
  jmp alltraps
80105e34:	e9 e1 f8 ff ff       	jmp    8010571a <alltraps>

80105e39 <vector66>:
.globl vector66
vector66:
  pushl $0
80105e39:	6a 00                	push   $0x0
  pushl $66
80105e3b:	6a 42                	push   $0x42
  jmp alltraps
80105e3d:	e9 d8 f8 ff ff       	jmp    8010571a <alltraps>

80105e42 <vector67>:
.globl vector67
vector67:
  pushl $0
80105e42:	6a 00                	push   $0x0
  pushl $67
80105e44:	6a 43                	push   $0x43
  jmp alltraps
80105e46:	e9 cf f8 ff ff       	jmp    8010571a <alltraps>

80105e4b <vector68>:
.globl vector68
vector68:
  pushl $0
80105e4b:	6a 00                	push   $0x0
  pushl $68
80105e4d:	6a 44                	push   $0x44
  jmp alltraps
80105e4f:	e9 c6 f8 ff ff       	jmp    8010571a <alltraps>

80105e54 <vector69>:
.globl vector69
vector69:
  pushl $0
80105e54:	6a 00                	push   $0x0
  pushl $69
80105e56:	6a 45                	push   $0x45
  jmp alltraps
80105e58:	e9 bd f8 ff ff       	jmp    8010571a <alltraps>

80105e5d <vector70>:
.globl vector70
vector70:
  pushl $0
80105e5d:	6a 00                	push   $0x0
  pushl $70
80105e5f:	6a 46                	push   $0x46
  jmp alltraps
80105e61:	e9 b4 f8 ff ff       	jmp    8010571a <alltraps>

80105e66 <vector71>:
.globl vector71
vector71:
  pushl $0
80105e66:	6a 00                	push   $0x0
  pushl $71
80105e68:	6a 47                	push   $0x47
  jmp alltraps
80105e6a:	e9 ab f8 ff ff       	jmp    8010571a <alltraps>

80105e6f <vector72>:
.globl vector72
vector72:
  pushl $0
80105e6f:	6a 00                	push   $0x0
  pushl $72
80105e71:	6a 48                	push   $0x48
  jmp alltraps
80105e73:	e9 a2 f8 ff ff       	jmp    8010571a <alltraps>

80105e78 <vector73>:
.globl vector73
vector73:
  pushl $0
80105e78:	6a 00                	push   $0x0
  pushl $73
80105e7a:	6a 49                	push   $0x49
  jmp alltraps
80105e7c:	e9 99 f8 ff ff       	jmp    8010571a <alltraps>

80105e81 <vector74>:
.globl vector74
vector74:
  pushl $0
80105e81:	6a 00                	push   $0x0
  pushl $74
80105e83:	6a 4a                	push   $0x4a
  jmp alltraps
80105e85:	e9 90 f8 ff ff       	jmp    8010571a <alltraps>

80105e8a <vector75>:
.globl vector75
vector75:
  pushl $0
80105e8a:	6a 00                	push   $0x0
  pushl $75
80105e8c:	6a 4b                	push   $0x4b
  jmp alltraps
80105e8e:	e9 87 f8 ff ff       	jmp    8010571a <alltraps>

80105e93 <vector76>:
.globl vector76
vector76:
  pushl $0
80105e93:	6a 00                	push   $0x0
  pushl $76
80105e95:	6a 4c                	push   $0x4c
  jmp alltraps
80105e97:	e9 7e f8 ff ff       	jmp    8010571a <alltraps>

80105e9c <vector77>:
.globl vector77
vector77:
  pushl $0
80105e9c:	6a 00                	push   $0x0
  pushl $77
80105e9e:	6a 4d                	push   $0x4d
  jmp alltraps
80105ea0:	e9 75 f8 ff ff       	jmp    8010571a <alltraps>

80105ea5 <vector78>:
.globl vector78
vector78:
  pushl $0
80105ea5:	6a 00                	push   $0x0
  pushl $78
80105ea7:	6a 4e                	push   $0x4e
  jmp alltraps
80105ea9:	e9 6c f8 ff ff       	jmp    8010571a <alltraps>

80105eae <vector79>:
.globl vector79
vector79:
  pushl $0
80105eae:	6a 00                	push   $0x0
  pushl $79
80105eb0:	6a 4f                	push   $0x4f
  jmp alltraps
80105eb2:	e9 63 f8 ff ff       	jmp    8010571a <alltraps>

80105eb7 <vector80>:
.globl vector80
vector80:
  pushl $0
80105eb7:	6a 00                	push   $0x0
  pushl $80
80105eb9:	6a 50                	push   $0x50
  jmp alltraps
80105ebb:	e9 5a f8 ff ff       	jmp    8010571a <alltraps>

80105ec0 <vector81>:
.globl vector81
vector81:
  pushl $0
80105ec0:	6a 00                	push   $0x0
  pushl $81
80105ec2:	6a 51                	push   $0x51
  jmp alltraps
80105ec4:	e9 51 f8 ff ff       	jmp    8010571a <alltraps>

80105ec9 <vector82>:
.globl vector82
vector82:
  pushl $0
80105ec9:	6a 00                	push   $0x0
  pushl $82
80105ecb:	6a 52                	push   $0x52
  jmp alltraps
80105ecd:	e9 48 f8 ff ff       	jmp    8010571a <alltraps>

80105ed2 <vector83>:
.globl vector83
vector83:
  pushl $0
80105ed2:	6a 00                	push   $0x0
  pushl $83
80105ed4:	6a 53                	push   $0x53
  jmp alltraps
80105ed6:	e9 3f f8 ff ff       	jmp    8010571a <alltraps>

80105edb <vector84>:
.globl vector84
vector84:
  pushl $0
80105edb:	6a 00                	push   $0x0
  pushl $84
80105edd:	6a 54                	push   $0x54
  jmp alltraps
80105edf:	e9 36 f8 ff ff       	jmp    8010571a <alltraps>

80105ee4 <vector85>:
.globl vector85
vector85:
  pushl $0
80105ee4:	6a 00                	push   $0x0
  pushl $85
80105ee6:	6a 55                	push   $0x55
  jmp alltraps
80105ee8:	e9 2d f8 ff ff       	jmp    8010571a <alltraps>

80105eed <vector86>:
.globl vector86
vector86:
  pushl $0
80105eed:	6a 00                	push   $0x0
  pushl $86
80105eef:	6a 56                	push   $0x56
  jmp alltraps
80105ef1:	e9 24 f8 ff ff       	jmp    8010571a <alltraps>

80105ef6 <vector87>:
.globl vector87
vector87:
  pushl $0
80105ef6:	6a 00                	push   $0x0
  pushl $87
80105ef8:	6a 57                	push   $0x57
  jmp alltraps
80105efa:	e9 1b f8 ff ff       	jmp    8010571a <alltraps>

80105eff <vector88>:
.globl vector88
vector88:
  pushl $0
80105eff:	6a 00                	push   $0x0
  pushl $88
80105f01:	6a 58                	push   $0x58
  jmp alltraps
80105f03:	e9 12 f8 ff ff       	jmp    8010571a <alltraps>

80105f08 <vector89>:
.globl vector89
vector89:
  pushl $0
80105f08:	6a 00                	push   $0x0
  pushl $89
80105f0a:	6a 59                	push   $0x59
  jmp alltraps
80105f0c:	e9 09 f8 ff ff       	jmp    8010571a <alltraps>

80105f11 <vector90>:
.globl vector90
vector90:
  pushl $0
80105f11:	6a 00                	push   $0x0
  pushl $90
80105f13:	6a 5a                	push   $0x5a
  jmp alltraps
80105f15:	e9 00 f8 ff ff       	jmp    8010571a <alltraps>

80105f1a <vector91>:
.globl vector91
vector91:
  pushl $0
80105f1a:	6a 00                	push   $0x0
  pushl $91
80105f1c:	6a 5b                	push   $0x5b
  jmp alltraps
80105f1e:	e9 f7 f7 ff ff       	jmp    8010571a <alltraps>

80105f23 <vector92>:
.globl vector92
vector92:
  pushl $0
80105f23:	6a 00                	push   $0x0
  pushl $92
80105f25:	6a 5c                	push   $0x5c
  jmp alltraps
80105f27:	e9 ee f7 ff ff       	jmp    8010571a <alltraps>

80105f2c <vector93>:
.globl vector93
vector93:
  pushl $0
80105f2c:	6a 00                	push   $0x0
  pushl $93
80105f2e:	6a 5d                	push   $0x5d
  jmp alltraps
80105f30:	e9 e5 f7 ff ff       	jmp    8010571a <alltraps>

80105f35 <vector94>:
.globl vector94
vector94:
  pushl $0
80105f35:	6a 00                	push   $0x0
  pushl $94
80105f37:	6a 5e                	push   $0x5e
  jmp alltraps
80105f39:	e9 dc f7 ff ff       	jmp    8010571a <alltraps>

80105f3e <vector95>:
.globl vector95
vector95:
  pushl $0
80105f3e:	6a 00                	push   $0x0
  pushl $95
80105f40:	6a 5f                	push   $0x5f
  jmp alltraps
80105f42:	e9 d3 f7 ff ff       	jmp    8010571a <alltraps>

80105f47 <vector96>:
.globl vector96
vector96:
  pushl $0
80105f47:	6a 00                	push   $0x0
  pushl $96
80105f49:	6a 60                	push   $0x60
  jmp alltraps
80105f4b:	e9 ca f7 ff ff       	jmp    8010571a <alltraps>

80105f50 <vector97>:
.globl vector97
vector97:
  pushl $0
80105f50:	6a 00                	push   $0x0
  pushl $97
80105f52:	6a 61                	push   $0x61
  jmp alltraps
80105f54:	e9 c1 f7 ff ff       	jmp    8010571a <alltraps>

80105f59 <vector98>:
.globl vector98
vector98:
  pushl $0
80105f59:	6a 00                	push   $0x0
  pushl $98
80105f5b:	6a 62                	push   $0x62
  jmp alltraps
80105f5d:	e9 b8 f7 ff ff       	jmp    8010571a <alltraps>

80105f62 <vector99>:
.globl vector99
vector99:
  pushl $0
80105f62:	6a 00                	push   $0x0
  pushl $99
80105f64:	6a 63                	push   $0x63
  jmp alltraps
80105f66:	e9 af f7 ff ff       	jmp    8010571a <alltraps>

80105f6b <vector100>:
.globl vector100
vector100:
  pushl $0
80105f6b:	6a 00                	push   $0x0
  pushl $100
80105f6d:	6a 64                	push   $0x64
  jmp alltraps
80105f6f:	e9 a6 f7 ff ff       	jmp    8010571a <alltraps>

80105f74 <vector101>:
.globl vector101
vector101:
  pushl $0
80105f74:	6a 00                	push   $0x0
  pushl $101
80105f76:	6a 65                	push   $0x65
  jmp alltraps
80105f78:	e9 9d f7 ff ff       	jmp    8010571a <alltraps>

80105f7d <vector102>:
.globl vector102
vector102:
  pushl $0
80105f7d:	6a 00                	push   $0x0
  pushl $102
80105f7f:	6a 66                	push   $0x66
  jmp alltraps
80105f81:	e9 94 f7 ff ff       	jmp    8010571a <alltraps>

80105f86 <vector103>:
.globl vector103
vector103:
  pushl $0
80105f86:	6a 00                	push   $0x0
  pushl $103
80105f88:	6a 67                	push   $0x67
  jmp alltraps
80105f8a:	e9 8b f7 ff ff       	jmp    8010571a <alltraps>

80105f8f <vector104>:
.globl vector104
vector104:
  pushl $0
80105f8f:	6a 00                	push   $0x0
  pushl $104
80105f91:	6a 68                	push   $0x68
  jmp alltraps
80105f93:	e9 82 f7 ff ff       	jmp    8010571a <alltraps>

80105f98 <vector105>:
.globl vector105
vector105:
  pushl $0
80105f98:	6a 00                	push   $0x0
  pushl $105
80105f9a:	6a 69                	push   $0x69
  jmp alltraps
80105f9c:	e9 79 f7 ff ff       	jmp    8010571a <alltraps>

80105fa1 <vector106>:
.globl vector106
vector106:
  pushl $0
80105fa1:	6a 00                	push   $0x0
  pushl $106
80105fa3:	6a 6a                	push   $0x6a
  jmp alltraps
80105fa5:	e9 70 f7 ff ff       	jmp    8010571a <alltraps>

80105faa <vector107>:
.globl vector107
vector107:
  pushl $0
80105faa:	6a 00                	push   $0x0
  pushl $107
80105fac:	6a 6b                	push   $0x6b
  jmp alltraps
80105fae:	e9 67 f7 ff ff       	jmp    8010571a <alltraps>

80105fb3 <vector108>:
.globl vector108
vector108:
  pushl $0
80105fb3:	6a 00                	push   $0x0
  pushl $108
80105fb5:	6a 6c                	push   $0x6c
  jmp alltraps
80105fb7:	e9 5e f7 ff ff       	jmp    8010571a <alltraps>

80105fbc <vector109>:
.globl vector109
vector109:
  pushl $0
80105fbc:	6a 00                	push   $0x0
  pushl $109
80105fbe:	6a 6d                	push   $0x6d
  jmp alltraps
80105fc0:	e9 55 f7 ff ff       	jmp    8010571a <alltraps>

80105fc5 <vector110>:
.globl vector110
vector110:
  pushl $0
80105fc5:	6a 00                	push   $0x0
  pushl $110
80105fc7:	6a 6e                	push   $0x6e
  jmp alltraps
80105fc9:	e9 4c f7 ff ff       	jmp    8010571a <alltraps>

80105fce <vector111>:
.globl vector111
vector111:
  pushl $0
80105fce:	6a 00                	push   $0x0
  pushl $111
80105fd0:	6a 6f                	push   $0x6f
  jmp alltraps
80105fd2:	e9 43 f7 ff ff       	jmp    8010571a <alltraps>

80105fd7 <vector112>:
.globl vector112
vector112:
  pushl $0
80105fd7:	6a 00                	push   $0x0
  pushl $112
80105fd9:	6a 70                	push   $0x70
  jmp alltraps
80105fdb:	e9 3a f7 ff ff       	jmp    8010571a <alltraps>

80105fe0 <vector113>:
.globl vector113
vector113:
  pushl $0
80105fe0:	6a 00                	push   $0x0
  pushl $113
80105fe2:	6a 71                	push   $0x71
  jmp alltraps
80105fe4:	e9 31 f7 ff ff       	jmp    8010571a <alltraps>

80105fe9 <vector114>:
.globl vector114
vector114:
  pushl $0
80105fe9:	6a 00                	push   $0x0
  pushl $114
80105feb:	6a 72                	push   $0x72
  jmp alltraps
80105fed:	e9 28 f7 ff ff       	jmp    8010571a <alltraps>

80105ff2 <vector115>:
.globl vector115
vector115:
  pushl $0
80105ff2:	6a 00                	push   $0x0
  pushl $115
80105ff4:	6a 73                	push   $0x73
  jmp alltraps
80105ff6:	e9 1f f7 ff ff       	jmp    8010571a <alltraps>

80105ffb <vector116>:
.globl vector116
vector116:
  pushl $0
80105ffb:	6a 00                	push   $0x0
  pushl $116
80105ffd:	6a 74                	push   $0x74
  jmp alltraps
80105fff:	e9 16 f7 ff ff       	jmp    8010571a <alltraps>

80106004 <vector117>:
.globl vector117
vector117:
  pushl $0
80106004:	6a 00                	push   $0x0
  pushl $117
80106006:	6a 75                	push   $0x75
  jmp alltraps
80106008:	e9 0d f7 ff ff       	jmp    8010571a <alltraps>

8010600d <vector118>:
.globl vector118
vector118:
  pushl $0
8010600d:	6a 00                	push   $0x0
  pushl $118
8010600f:	6a 76                	push   $0x76
  jmp alltraps
80106011:	e9 04 f7 ff ff       	jmp    8010571a <alltraps>

80106016 <vector119>:
.globl vector119
vector119:
  pushl $0
80106016:	6a 00                	push   $0x0
  pushl $119
80106018:	6a 77                	push   $0x77
  jmp alltraps
8010601a:	e9 fb f6 ff ff       	jmp    8010571a <alltraps>

8010601f <vector120>:
.globl vector120
vector120:
  pushl $0
8010601f:	6a 00                	push   $0x0
  pushl $120
80106021:	6a 78                	push   $0x78
  jmp alltraps
80106023:	e9 f2 f6 ff ff       	jmp    8010571a <alltraps>

80106028 <vector121>:
.globl vector121
vector121:
  pushl $0
80106028:	6a 00                	push   $0x0
  pushl $121
8010602a:	6a 79                	push   $0x79
  jmp alltraps
8010602c:	e9 e9 f6 ff ff       	jmp    8010571a <alltraps>

80106031 <vector122>:
.globl vector122
vector122:
  pushl $0
80106031:	6a 00                	push   $0x0
  pushl $122
80106033:	6a 7a                	push   $0x7a
  jmp alltraps
80106035:	e9 e0 f6 ff ff       	jmp    8010571a <alltraps>

8010603a <vector123>:
.globl vector123
vector123:
  pushl $0
8010603a:	6a 00                	push   $0x0
  pushl $123
8010603c:	6a 7b                	push   $0x7b
  jmp alltraps
8010603e:	e9 d7 f6 ff ff       	jmp    8010571a <alltraps>

80106043 <vector124>:
.globl vector124
vector124:
  pushl $0
80106043:	6a 00                	push   $0x0
  pushl $124
80106045:	6a 7c                	push   $0x7c
  jmp alltraps
80106047:	e9 ce f6 ff ff       	jmp    8010571a <alltraps>

8010604c <vector125>:
.globl vector125
vector125:
  pushl $0
8010604c:	6a 00                	push   $0x0
  pushl $125
8010604e:	6a 7d                	push   $0x7d
  jmp alltraps
80106050:	e9 c5 f6 ff ff       	jmp    8010571a <alltraps>

80106055 <vector126>:
.globl vector126
vector126:
  pushl $0
80106055:	6a 00                	push   $0x0
  pushl $126
80106057:	6a 7e                	push   $0x7e
  jmp alltraps
80106059:	e9 bc f6 ff ff       	jmp    8010571a <alltraps>

8010605e <vector127>:
.globl vector127
vector127:
  pushl $0
8010605e:	6a 00                	push   $0x0
  pushl $127
80106060:	6a 7f                	push   $0x7f
  jmp alltraps
80106062:	e9 b3 f6 ff ff       	jmp    8010571a <alltraps>

80106067 <vector128>:
.globl vector128
vector128:
  pushl $0
80106067:	6a 00                	push   $0x0
  pushl $128
80106069:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010606e:	e9 a7 f6 ff ff       	jmp    8010571a <alltraps>

80106073 <vector129>:
.globl vector129
vector129:
  pushl $0
80106073:	6a 00                	push   $0x0
  pushl $129
80106075:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010607a:	e9 9b f6 ff ff       	jmp    8010571a <alltraps>

8010607f <vector130>:
.globl vector130
vector130:
  pushl $0
8010607f:	6a 00                	push   $0x0
  pushl $130
80106081:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106086:	e9 8f f6 ff ff       	jmp    8010571a <alltraps>

8010608b <vector131>:
.globl vector131
vector131:
  pushl $0
8010608b:	6a 00                	push   $0x0
  pushl $131
8010608d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106092:	e9 83 f6 ff ff       	jmp    8010571a <alltraps>

80106097 <vector132>:
.globl vector132
vector132:
  pushl $0
80106097:	6a 00                	push   $0x0
  pushl $132
80106099:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010609e:	e9 77 f6 ff ff       	jmp    8010571a <alltraps>

801060a3 <vector133>:
.globl vector133
vector133:
  pushl $0
801060a3:	6a 00                	push   $0x0
  pushl $133
801060a5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801060aa:	e9 6b f6 ff ff       	jmp    8010571a <alltraps>

801060af <vector134>:
.globl vector134
vector134:
  pushl $0
801060af:	6a 00                	push   $0x0
  pushl $134
801060b1:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801060b6:	e9 5f f6 ff ff       	jmp    8010571a <alltraps>

801060bb <vector135>:
.globl vector135
vector135:
  pushl $0
801060bb:	6a 00                	push   $0x0
  pushl $135
801060bd:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801060c2:	e9 53 f6 ff ff       	jmp    8010571a <alltraps>

801060c7 <vector136>:
.globl vector136
vector136:
  pushl $0
801060c7:	6a 00                	push   $0x0
  pushl $136
801060c9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801060ce:	e9 47 f6 ff ff       	jmp    8010571a <alltraps>

801060d3 <vector137>:
.globl vector137
vector137:
  pushl $0
801060d3:	6a 00                	push   $0x0
  pushl $137
801060d5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801060da:	e9 3b f6 ff ff       	jmp    8010571a <alltraps>

801060df <vector138>:
.globl vector138
vector138:
  pushl $0
801060df:	6a 00                	push   $0x0
  pushl $138
801060e1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801060e6:	e9 2f f6 ff ff       	jmp    8010571a <alltraps>

801060eb <vector139>:
.globl vector139
vector139:
  pushl $0
801060eb:	6a 00                	push   $0x0
  pushl $139
801060ed:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801060f2:	e9 23 f6 ff ff       	jmp    8010571a <alltraps>

801060f7 <vector140>:
.globl vector140
vector140:
  pushl $0
801060f7:	6a 00                	push   $0x0
  pushl $140
801060f9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801060fe:	e9 17 f6 ff ff       	jmp    8010571a <alltraps>

80106103 <vector141>:
.globl vector141
vector141:
  pushl $0
80106103:	6a 00                	push   $0x0
  pushl $141
80106105:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010610a:	e9 0b f6 ff ff       	jmp    8010571a <alltraps>

8010610f <vector142>:
.globl vector142
vector142:
  pushl $0
8010610f:	6a 00                	push   $0x0
  pushl $142
80106111:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106116:	e9 ff f5 ff ff       	jmp    8010571a <alltraps>

8010611b <vector143>:
.globl vector143
vector143:
  pushl $0
8010611b:	6a 00                	push   $0x0
  pushl $143
8010611d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106122:	e9 f3 f5 ff ff       	jmp    8010571a <alltraps>

80106127 <vector144>:
.globl vector144
vector144:
  pushl $0
80106127:	6a 00                	push   $0x0
  pushl $144
80106129:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010612e:	e9 e7 f5 ff ff       	jmp    8010571a <alltraps>

80106133 <vector145>:
.globl vector145
vector145:
  pushl $0
80106133:	6a 00                	push   $0x0
  pushl $145
80106135:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010613a:	e9 db f5 ff ff       	jmp    8010571a <alltraps>

8010613f <vector146>:
.globl vector146
vector146:
  pushl $0
8010613f:	6a 00                	push   $0x0
  pushl $146
80106141:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106146:	e9 cf f5 ff ff       	jmp    8010571a <alltraps>

8010614b <vector147>:
.globl vector147
vector147:
  pushl $0
8010614b:	6a 00                	push   $0x0
  pushl $147
8010614d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106152:	e9 c3 f5 ff ff       	jmp    8010571a <alltraps>

80106157 <vector148>:
.globl vector148
vector148:
  pushl $0
80106157:	6a 00                	push   $0x0
  pushl $148
80106159:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010615e:	e9 b7 f5 ff ff       	jmp    8010571a <alltraps>

80106163 <vector149>:
.globl vector149
vector149:
  pushl $0
80106163:	6a 00                	push   $0x0
  pushl $149
80106165:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010616a:	e9 ab f5 ff ff       	jmp    8010571a <alltraps>

8010616f <vector150>:
.globl vector150
vector150:
  pushl $0
8010616f:	6a 00                	push   $0x0
  pushl $150
80106171:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106176:	e9 9f f5 ff ff       	jmp    8010571a <alltraps>

8010617b <vector151>:
.globl vector151
vector151:
  pushl $0
8010617b:	6a 00                	push   $0x0
  pushl $151
8010617d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106182:	e9 93 f5 ff ff       	jmp    8010571a <alltraps>

80106187 <vector152>:
.globl vector152
vector152:
  pushl $0
80106187:	6a 00                	push   $0x0
  pushl $152
80106189:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010618e:	e9 87 f5 ff ff       	jmp    8010571a <alltraps>

80106193 <vector153>:
.globl vector153
vector153:
  pushl $0
80106193:	6a 00                	push   $0x0
  pushl $153
80106195:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010619a:	e9 7b f5 ff ff       	jmp    8010571a <alltraps>

8010619f <vector154>:
.globl vector154
vector154:
  pushl $0
8010619f:	6a 00                	push   $0x0
  pushl $154
801061a1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801061a6:	e9 6f f5 ff ff       	jmp    8010571a <alltraps>

801061ab <vector155>:
.globl vector155
vector155:
  pushl $0
801061ab:	6a 00                	push   $0x0
  pushl $155
801061ad:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801061b2:	e9 63 f5 ff ff       	jmp    8010571a <alltraps>

801061b7 <vector156>:
.globl vector156
vector156:
  pushl $0
801061b7:	6a 00                	push   $0x0
  pushl $156
801061b9:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801061be:	e9 57 f5 ff ff       	jmp    8010571a <alltraps>

801061c3 <vector157>:
.globl vector157
vector157:
  pushl $0
801061c3:	6a 00                	push   $0x0
  pushl $157
801061c5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801061ca:	e9 4b f5 ff ff       	jmp    8010571a <alltraps>

801061cf <vector158>:
.globl vector158
vector158:
  pushl $0
801061cf:	6a 00                	push   $0x0
  pushl $158
801061d1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801061d6:	e9 3f f5 ff ff       	jmp    8010571a <alltraps>

801061db <vector159>:
.globl vector159
vector159:
  pushl $0
801061db:	6a 00                	push   $0x0
  pushl $159
801061dd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801061e2:	e9 33 f5 ff ff       	jmp    8010571a <alltraps>

801061e7 <vector160>:
.globl vector160
vector160:
  pushl $0
801061e7:	6a 00                	push   $0x0
  pushl $160
801061e9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801061ee:	e9 27 f5 ff ff       	jmp    8010571a <alltraps>

801061f3 <vector161>:
.globl vector161
vector161:
  pushl $0
801061f3:	6a 00                	push   $0x0
  pushl $161
801061f5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801061fa:	e9 1b f5 ff ff       	jmp    8010571a <alltraps>

801061ff <vector162>:
.globl vector162
vector162:
  pushl $0
801061ff:	6a 00                	push   $0x0
  pushl $162
80106201:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106206:	e9 0f f5 ff ff       	jmp    8010571a <alltraps>

8010620b <vector163>:
.globl vector163
vector163:
  pushl $0
8010620b:	6a 00                	push   $0x0
  pushl $163
8010620d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106212:	e9 03 f5 ff ff       	jmp    8010571a <alltraps>

80106217 <vector164>:
.globl vector164
vector164:
  pushl $0
80106217:	6a 00                	push   $0x0
  pushl $164
80106219:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010621e:	e9 f7 f4 ff ff       	jmp    8010571a <alltraps>

80106223 <vector165>:
.globl vector165
vector165:
  pushl $0
80106223:	6a 00                	push   $0x0
  pushl $165
80106225:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010622a:	e9 eb f4 ff ff       	jmp    8010571a <alltraps>

8010622f <vector166>:
.globl vector166
vector166:
  pushl $0
8010622f:	6a 00                	push   $0x0
  pushl $166
80106231:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106236:	e9 df f4 ff ff       	jmp    8010571a <alltraps>

8010623b <vector167>:
.globl vector167
vector167:
  pushl $0
8010623b:	6a 00                	push   $0x0
  pushl $167
8010623d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106242:	e9 d3 f4 ff ff       	jmp    8010571a <alltraps>

80106247 <vector168>:
.globl vector168
vector168:
  pushl $0
80106247:	6a 00                	push   $0x0
  pushl $168
80106249:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010624e:	e9 c7 f4 ff ff       	jmp    8010571a <alltraps>

80106253 <vector169>:
.globl vector169
vector169:
  pushl $0
80106253:	6a 00                	push   $0x0
  pushl $169
80106255:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010625a:	e9 bb f4 ff ff       	jmp    8010571a <alltraps>

8010625f <vector170>:
.globl vector170
vector170:
  pushl $0
8010625f:	6a 00                	push   $0x0
  pushl $170
80106261:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106266:	e9 af f4 ff ff       	jmp    8010571a <alltraps>

8010626b <vector171>:
.globl vector171
vector171:
  pushl $0
8010626b:	6a 00                	push   $0x0
  pushl $171
8010626d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106272:	e9 a3 f4 ff ff       	jmp    8010571a <alltraps>

80106277 <vector172>:
.globl vector172
vector172:
  pushl $0
80106277:	6a 00                	push   $0x0
  pushl $172
80106279:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010627e:	e9 97 f4 ff ff       	jmp    8010571a <alltraps>

80106283 <vector173>:
.globl vector173
vector173:
  pushl $0
80106283:	6a 00                	push   $0x0
  pushl $173
80106285:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010628a:	e9 8b f4 ff ff       	jmp    8010571a <alltraps>

8010628f <vector174>:
.globl vector174
vector174:
  pushl $0
8010628f:	6a 00                	push   $0x0
  pushl $174
80106291:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106296:	e9 7f f4 ff ff       	jmp    8010571a <alltraps>

8010629b <vector175>:
.globl vector175
vector175:
  pushl $0
8010629b:	6a 00                	push   $0x0
  pushl $175
8010629d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801062a2:	e9 73 f4 ff ff       	jmp    8010571a <alltraps>

801062a7 <vector176>:
.globl vector176
vector176:
  pushl $0
801062a7:	6a 00                	push   $0x0
  pushl $176
801062a9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801062ae:	e9 67 f4 ff ff       	jmp    8010571a <alltraps>

801062b3 <vector177>:
.globl vector177
vector177:
  pushl $0
801062b3:	6a 00                	push   $0x0
  pushl $177
801062b5:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801062ba:	e9 5b f4 ff ff       	jmp    8010571a <alltraps>

801062bf <vector178>:
.globl vector178
vector178:
  pushl $0
801062bf:	6a 00                	push   $0x0
  pushl $178
801062c1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801062c6:	e9 4f f4 ff ff       	jmp    8010571a <alltraps>

801062cb <vector179>:
.globl vector179
vector179:
  pushl $0
801062cb:	6a 00                	push   $0x0
  pushl $179
801062cd:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801062d2:	e9 43 f4 ff ff       	jmp    8010571a <alltraps>

801062d7 <vector180>:
.globl vector180
vector180:
  pushl $0
801062d7:	6a 00                	push   $0x0
  pushl $180
801062d9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801062de:	e9 37 f4 ff ff       	jmp    8010571a <alltraps>

801062e3 <vector181>:
.globl vector181
vector181:
  pushl $0
801062e3:	6a 00                	push   $0x0
  pushl $181
801062e5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801062ea:	e9 2b f4 ff ff       	jmp    8010571a <alltraps>

801062ef <vector182>:
.globl vector182
vector182:
  pushl $0
801062ef:	6a 00                	push   $0x0
  pushl $182
801062f1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801062f6:	e9 1f f4 ff ff       	jmp    8010571a <alltraps>

801062fb <vector183>:
.globl vector183
vector183:
  pushl $0
801062fb:	6a 00                	push   $0x0
  pushl $183
801062fd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106302:	e9 13 f4 ff ff       	jmp    8010571a <alltraps>

80106307 <vector184>:
.globl vector184
vector184:
  pushl $0
80106307:	6a 00                	push   $0x0
  pushl $184
80106309:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010630e:	e9 07 f4 ff ff       	jmp    8010571a <alltraps>

80106313 <vector185>:
.globl vector185
vector185:
  pushl $0
80106313:	6a 00                	push   $0x0
  pushl $185
80106315:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010631a:	e9 fb f3 ff ff       	jmp    8010571a <alltraps>

8010631f <vector186>:
.globl vector186
vector186:
  pushl $0
8010631f:	6a 00                	push   $0x0
  pushl $186
80106321:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106326:	e9 ef f3 ff ff       	jmp    8010571a <alltraps>

8010632b <vector187>:
.globl vector187
vector187:
  pushl $0
8010632b:	6a 00                	push   $0x0
  pushl $187
8010632d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106332:	e9 e3 f3 ff ff       	jmp    8010571a <alltraps>

80106337 <vector188>:
.globl vector188
vector188:
  pushl $0
80106337:	6a 00                	push   $0x0
  pushl $188
80106339:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010633e:	e9 d7 f3 ff ff       	jmp    8010571a <alltraps>

80106343 <vector189>:
.globl vector189
vector189:
  pushl $0
80106343:	6a 00                	push   $0x0
  pushl $189
80106345:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010634a:	e9 cb f3 ff ff       	jmp    8010571a <alltraps>

8010634f <vector190>:
.globl vector190
vector190:
  pushl $0
8010634f:	6a 00                	push   $0x0
  pushl $190
80106351:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106356:	e9 bf f3 ff ff       	jmp    8010571a <alltraps>

8010635b <vector191>:
.globl vector191
vector191:
  pushl $0
8010635b:	6a 00                	push   $0x0
  pushl $191
8010635d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106362:	e9 b3 f3 ff ff       	jmp    8010571a <alltraps>

80106367 <vector192>:
.globl vector192
vector192:
  pushl $0
80106367:	6a 00                	push   $0x0
  pushl $192
80106369:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010636e:	e9 a7 f3 ff ff       	jmp    8010571a <alltraps>

80106373 <vector193>:
.globl vector193
vector193:
  pushl $0
80106373:	6a 00                	push   $0x0
  pushl $193
80106375:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010637a:	e9 9b f3 ff ff       	jmp    8010571a <alltraps>

8010637f <vector194>:
.globl vector194
vector194:
  pushl $0
8010637f:	6a 00                	push   $0x0
  pushl $194
80106381:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106386:	e9 8f f3 ff ff       	jmp    8010571a <alltraps>

8010638b <vector195>:
.globl vector195
vector195:
  pushl $0
8010638b:	6a 00                	push   $0x0
  pushl $195
8010638d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106392:	e9 83 f3 ff ff       	jmp    8010571a <alltraps>

80106397 <vector196>:
.globl vector196
vector196:
  pushl $0
80106397:	6a 00                	push   $0x0
  pushl $196
80106399:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010639e:	e9 77 f3 ff ff       	jmp    8010571a <alltraps>

801063a3 <vector197>:
.globl vector197
vector197:
  pushl $0
801063a3:	6a 00                	push   $0x0
  pushl $197
801063a5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801063aa:	e9 6b f3 ff ff       	jmp    8010571a <alltraps>

801063af <vector198>:
.globl vector198
vector198:
  pushl $0
801063af:	6a 00                	push   $0x0
  pushl $198
801063b1:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
801063b6:	e9 5f f3 ff ff       	jmp    8010571a <alltraps>

801063bb <vector199>:
.globl vector199
vector199:
  pushl $0
801063bb:	6a 00                	push   $0x0
  pushl $199
801063bd:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801063c2:	e9 53 f3 ff ff       	jmp    8010571a <alltraps>

801063c7 <vector200>:
.globl vector200
vector200:
  pushl $0
801063c7:	6a 00                	push   $0x0
  pushl $200
801063c9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801063ce:	e9 47 f3 ff ff       	jmp    8010571a <alltraps>

801063d3 <vector201>:
.globl vector201
vector201:
  pushl $0
801063d3:	6a 00                	push   $0x0
  pushl $201
801063d5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801063da:	e9 3b f3 ff ff       	jmp    8010571a <alltraps>

801063df <vector202>:
.globl vector202
vector202:
  pushl $0
801063df:	6a 00                	push   $0x0
  pushl $202
801063e1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801063e6:	e9 2f f3 ff ff       	jmp    8010571a <alltraps>

801063eb <vector203>:
.globl vector203
vector203:
  pushl $0
801063eb:	6a 00                	push   $0x0
  pushl $203
801063ed:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801063f2:	e9 23 f3 ff ff       	jmp    8010571a <alltraps>

801063f7 <vector204>:
.globl vector204
vector204:
  pushl $0
801063f7:	6a 00                	push   $0x0
  pushl $204
801063f9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801063fe:	e9 17 f3 ff ff       	jmp    8010571a <alltraps>

80106403 <vector205>:
.globl vector205
vector205:
  pushl $0
80106403:	6a 00                	push   $0x0
  pushl $205
80106405:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010640a:	e9 0b f3 ff ff       	jmp    8010571a <alltraps>

8010640f <vector206>:
.globl vector206
vector206:
  pushl $0
8010640f:	6a 00                	push   $0x0
  pushl $206
80106411:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106416:	e9 ff f2 ff ff       	jmp    8010571a <alltraps>

8010641b <vector207>:
.globl vector207
vector207:
  pushl $0
8010641b:	6a 00                	push   $0x0
  pushl $207
8010641d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106422:	e9 f3 f2 ff ff       	jmp    8010571a <alltraps>

80106427 <vector208>:
.globl vector208
vector208:
  pushl $0
80106427:	6a 00                	push   $0x0
  pushl $208
80106429:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010642e:	e9 e7 f2 ff ff       	jmp    8010571a <alltraps>

80106433 <vector209>:
.globl vector209
vector209:
  pushl $0
80106433:	6a 00                	push   $0x0
  pushl $209
80106435:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010643a:	e9 db f2 ff ff       	jmp    8010571a <alltraps>

8010643f <vector210>:
.globl vector210
vector210:
  pushl $0
8010643f:	6a 00                	push   $0x0
  pushl $210
80106441:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106446:	e9 cf f2 ff ff       	jmp    8010571a <alltraps>

8010644b <vector211>:
.globl vector211
vector211:
  pushl $0
8010644b:	6a 00                	push   $0x0
  pushl $211
8010644d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106452:	e9 c3 f2 ff ff       	jmp    8010571a <alltraps>

80106457 <vector212>:
.globl vector212
vector212:
  pushl $0
80106457:	6a 00                	push   $0x0
  pushl $212
80106459:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010645e:	e9 b7 f2 ff ff       	jmp    8010571a <alltraps>

80106463 <vector213>:
.globl vector213
vector213:
  pushl $0
80106463:	6a 00                	push   $0x0
  pushl $213
80106465:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
8010646a:	e9 ab f2 ff ff       	jmp    8010571a <alltraps>

8010646f <vector214>:
.globl vector214
vector214:
  pushl $0
8010646f:	6a 00                	push   $0x0
  pushl $214
80106471:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106476:	e9 9f f2 ff ff       	jmp    8010571a <alltraps>

8010647b <vector215>:
.globl vector215
vector215:
  pushl $0
8010647b:	6a 00                	push   $0x0
  pushl $215
8010647d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106482:	e9 93 f2 ff ff       	jmp    8010571a <alltraps>

80106487 <vector216>:
.globl vector216
vector216:
  pushl $0
80106487:	6a 00                	push   $0x0
  pushl $216
80106489:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
8010648e:	e9 87 f2 ff ff       	jmp    8010571a <alltraps>

80106493 <vector217>:
.globl vector217
vector217:
  pushl $0
80106493:	6a 00                	push   $0x0
  pushl $217
80106495:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
8010649a:	e9 7b f2 ff ff       	jmp    8010571a <alltraps>

8010649f <vector218>:
.globl vector218
vector218:
  pushl $0
8010649f:	6a 00                	push   $0x0
  pushl $218
801064a1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801064a6:	e9 6f f2 ff ff       	jmp    8010571a <alltraps>

801064ab <vector219>:
.globl vector219
vector219:
  pushl $0
801064ab:	6a 00                	push   $0x0
  pushl $219
801064ad:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
801064b2:	e9 63 f2 ff ff       	jmp    8010571a <alltraps>

801064b7 <vector220>:
.globl vector220
vector220:
  pushl $0
801064b7:	6a 00                	push   $0x0
  pushl $220
801064b9:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
801064be:	e9 57 f2 ff ff       	jmp    8010571a <alltraps>

801064c3 <vector221>:
.globl vector221
vector221:
  pushl $0
801064c3:	6a 00                	push   $0x0
  pushl $221
801064c5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
801064ca:	e9 4b f2 ff ff       	jmp    8010571a <alltraps>

801064cf <vector222>:
.globl vector222
vector222:
  pushl $0
801064cf:	6a 00                	push   $0x0
  pushl $222
801064d1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
801064d6:	e9 3f f2 ff ff       	jmp    8010571a <alltraps>

801064db <vector223>:
.globl vector223
vector223:
  pushl $0
801064db:	6a 00                	push   $0x0
  pushl $223
801064dd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
801064e2:	e9 33 f2 ff ff       	jmp    8010571a <alltraps>

801064e7 <vector224>:
.globl vector224
vector224:
  pushl $0
801064e7:	6a 00                	push   $0x0
  pushl $224
801064e9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
801064ee:	e9 27 f2 ff ff       	jmp    8010571a <alltraps>

801064f3 <vector225>:
.globl vector225
vector225:
  pushl $0
801064f3:	6a 00                	push   $0x0
  pushl $225
801064f5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
801064fa:	e9 1b f2 ff ff       	jmp    8010571a <alltraps>

801064ff <vector226>:
.globl vector226
vector226:
  pushl $0
801064ff:	6a 00                	push   $0x0
  pushl $226
80106501:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106506:	e9 0f f2 ff ff       	jmp    8010571a <alltraps>

8010650b <vector227>:
.globl vector227
vector227:
  pushl $0
8010650b:	6a 00                	push   $0x0
  pushl $227
8010650d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106512:	e9 03 f2 ff ff       	jmp    8010571a <alltraps>

80106517 <vector228>:
.globl vector228
vector228:
  pushl $0
80106517:	6a 00                	push   $0x0
  pushl $228
80106519:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010651e:	e9 f7 f1 ff ff       	jmp    8010571a <alltraps>

80106523 <vector229>:
.globl vector229
vector229:
  pushl $0
80106523:	6a 00                	push   $0x0
  pushl $229
80106525:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010652a:	e9 eb f1 ff ff       	jmp    8010571a <alltraps>

8010652f <vector230>:
.globl vector230
vector230:
  pushl $0
8010652f:	6a 00                	push   $0x0
  pushl $230
80106531:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106536:	e9 df f1 ff ff       	jmp    8010571a <alltraps>

8010653b <vector231>:
.globl vector231
vector231:
  pushl $0
8010653b:	6a 00                	push   $0x0
  pushl $231
8010653d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106542:	e9 d3 f1 ff ff       	jmp    8010571a <alltraps>

80106547 <vector232>:
.globl vector232
vector232:
  pushl $0
80106547:	6a 00                	push   $0x0
  pushl $232
80106549:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010654e:	e9 c7 f1 ff ff       	jmp    8010571a <alltraps>

80106553 <vector233>:
.globl vector233
vector233:
  pushl $0
80106553:	6a 00                	push   $0x0
  pushl $233
80106555:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010655a:	e9 bb f1 ff ff       	jmp    8010571a <alltraps>

8010655f <vector234>:
.globl vector234
vector234:
  pushl $0
8010655f:	6a 00                	push   $0x0
  pushl $234
80106561:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106566:	e9 af f1 ff ff       	jmp    8010571a <alltraps>

8010656b <vector235>:
.globl vector235
vector235:
  pushl $0
8010656b:	6a 00                	push   $0x0
  pushl $235
8010656d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106572:	e9 a3 f1 ff ff       	jmp    8010571a <alltraps>

80106577 <vector236>:
.globl vector236
vector236:
  pushl $0
80106577:	6a 00                	push   $0x0
  pushl $236
80106579:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
8010657e:	e9 97 f1 ff ff       	jmp    8010571a <alltraps>

80106583 <vector237>:
.globl vector237
vector237:
  pushl $0
80106583:	6a 00                	push   $0x0
  pushl $237
80106585:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
8010658a:	e9 8b f1 ff ff       	jmp    8010571a <alltraps>

8010658f <vector238>:
.globl vector238
vector238:
  pushl $0
8010658f:	6a 00                	push   $0x0
  pushl $238
80106591:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106596:	e9 7f f1 ff ff       	jmp    8010571a <alltraps>

8010659b <vector239>:
.globl vector239
vector239:
  pushl $0
8010659b:	6a 00                	push   $0x0
  pushl $239
8010659d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801065a2:	e9 73 f1 ff ff       	jmp    8010571a <alltraps>

801065a7 <vector240>:
.globl vector240
vector240:
  pushl $0
801065a7:	6a 00                	push   $0x0
  pushl $240
801065a9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801065ae:	e9 67 f1 ff ff       	jmp    8010571a <alltraps>

801065b3 <vector241>:
.globl vector241
vector241:
  pushl $0
801065b3:	6a 00                	push   $0x0
  pushl $241
801065b5:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
801065ba:	e9 5b f1 ff ff       	jmp    8010571a <alltraps>

801065bf <vector242>:
.globl vector242
vector242:
  pushl $0
801065bf:	6a 00                	push   $0x0
  pushl $242
801065c1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
801065c6:	e9 4f f1 ff ff       	jmp    8010571a <alltraps>

801065cb <vector243>:
.globl vector243
vector243:
  pushl $0
801065cb:	6a 00                	push   $0x0
  pushl $243
801065cd:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
801065d2:	e9 43 f1 ff ff       	jmp    8010571a <alltraps>

801065d7 <vector244>:
.globl vector244
vector244:
  pushl $0
801065d7:	6a 00                	push   $0x0
  pushl $244
801065d9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
801065de:	e9 37 f1 ff ff       	jmp    8010571a <alltraps>

801065e3 <vector245>:
.globl vector245
vector245:
  pushl $0
801065e3:	6a 00                	push   $0x0
  pushl $245
801065e5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
801065ea:	e9 2b f1 ff ff       	jmp    8010571a <alltraps>

801065ef <vector246>:
.globl vector246
vector246:
  pushl $0
801065ef:	6a 00                	push   $0x0
  pushl $246
801065f1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
801065f6:	e9 1f f1 ff ff       	jmp    8010571a <alltraps>

801065fb <vector247>:
.globl vector247
vector247:
  pushl $0
801065fb:	6a 00                	push   $0x0
  pushl $247
801065fd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106602:	e9 13 f1 ff ff       	jmp    8010571a <alltraps>

80106607 <vector248>:
.globl vector248
vector248:
  pushl $0
80106607:	6a 00                	push   $0x0
  pushl $248
80106609:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010660e:	e9 07 f1 ff ff       	jmp    8010571a <alltraps>

80106613 <vector249>:
.globl vector249
vector249:
  pushl $0
80106613:	6a 00                	push   $0x0
  pushl $249
80106615:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010661a:	e9 fb f0 ff ff       	jmp    8010571a <alltraps>

8010661f <vector250>:
.globl vector250
vector250:
  pushl $0
8010661f:	6a 00                	push   $0x0
  pushl $250
80106621:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106626:	e9 ef f0 ff ff       	jmp    8010571a <alltraps>

8010662b <vector251>:
.globl vector251
vector251:
  pushl $0
8010662b:	6a 00                	push   $0x0
  pushl $251
8010662d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106632:	e9 e3 f0 ff ff       	jmp    8010571a <alltraps>

80106637 <vector252>:
.globl vector252
vector252:
  pushl $0
80106637:	6a 00                	push   $0x0
  pushl $252
80106639:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010663e:	e9 d7 f0 ff ff       	jmp    8010571a <alltraps>

80106643 <vector253>:
.globl vector253
vector253:
  pushl $0
80106643:	6a 00                	push   $0x0
  pushl $253
80106645:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010664a:	e9 cb f0 ff ff       	jmp    8010571a <alltraps>

8010664f <vector254>:
.globl vector254
vector254:
  pushl $0
8010664f:	6a 00                	push   $0x0
  pushl $254
80106651:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106656:	e9 bf f0 ff ff       	jmp    8010571a <alltraps>

8010665b <vector255>:
.globl vector255
vector255:
  pushl $0
8010665b:	6a 00                	push   $0x0
  pushl $255
8010665d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106662:	e9 b3 f0 ff ff       	jmp    8010571a <alltraps>
80106667:	66 90                	xchg   %ax,%ax
80106669:	66 90                	xchg   %ax,%ax
8010666b:	66 90                	xchg   %ax,%ax
8010666d:	66 90                	xchg   %ax,%ax
8010666f:	90                   	nop

80106670 <walkpgdir>:

// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106670:	55                   	push   %ebp
80106671:	89 e5                	mov    %esp,%ebp
80106673:	57                   	push   %edi
80106674:	56                   	push   %esi
80106675:	89 d6                	mov    %edx,%esi
	pde_t *pde;
	pte_t *pgtab;

	pde = &pgdir[PDX(va)];
80106677:	c1 ea 16             	shr    $0x16,%edx
{
8010667a:	53                   	push   %ebx
	pde = &pgdir[PDX(va)];
8010667b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
{
8010667e:	83 ec 0c             	sub    $0xc,%esp
	if (*pde & PTE_P) {
80106681:	8b 07                	mov    (%edi),%eax
80106683:	a8 01                	test   $0x1,%al
80106685:	74 29                	je     801066b0 <walkpgdir+0x40>
		pgtab = (pte_t *)P2V(PTE_ADDR(*pde));
80106687:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010668c:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
		// The permissions here are overly generous, but they can
		// be further restricted by the permissions in the page table
		// entries, if necessary.
		*pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
	}
	return &pgtab[PTX(va)];
80106692:	c1 ee 0a             	shr    $0xa,%esi
}
80106695:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return &pgtab[PTX(va)];
80106698:	89 f2                	mov    %esi,%edx
8010669a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801066a0:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
801066a3:	5b                   	pop    %ebx
801066a4:	5e                   	pop    %esi
801066a5:	5f                   	pop    %edi
801066a6:	5d                   	pop    %ebp
801066a7:	c3                   	ret    
801066a8:	90                   	nop
801066a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (!alloc || (pgtab = (pte_t *)kalloc()) == 0)
801066b0:	85 c9                	test   %ecx,%ecx
801066b2:	74 2c                	je     801066e0 <walkpgdir+0x70>
801066b4:	e8 27 bf ff ff       	call   801025e0 <kalloc>
801066b9:	89 c3                	mov    %eax,%ebx
801066bb:	85 c0                	test   %eax,%eax
801066bd:	74 21                	je     801066e0 <walkpgdir+0x70>
		memset(pgtab, 0, PGSIZE);
801066bf:	83 ec 04             	sub    $0x4,%esp
801066c2:	68 00 10 00 00       	push   $0x1000
801066c7:	6a 00                	push   $0x0
801066c9:	50                   	push   %eax
801066ca:	e8 c1 de ff ff       	call   80104590 <memset>
		*pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
801066cf:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801066d5:	83 c4 10             	add    $0x10,%esp
801066d8:	83 c8 07             	or     $0x7,%eax
801066db:	89 07                	mov    %eax,(%edi)
801066dd:	eb b3                	jmp    80106692 <walkpgdir+0x22>
801066df:	90                   	nop
}
801066e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
			return 0;
801066e3:	31 c0                	xor    %eax,%eax
}
801066e5:	5b                   	pop    %ebx
801066e6:	5e                   	pop    %esi
801066e7:	5f                   	pop    %edi
801066e8:	5d                   	pop    %ebp
801066e9:	c3                   	ret    
801066ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801066f0 <mappages>:

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801066f0:	55                   	push   %ebp
801066f1:	89 e5                	mov    %esp,%ebp
801066f3:	57                   	push   %edi
801066f4:	56                   	push   %esi
	char *a, *last;
	pte_t *pte;

	a = (char *)PGROUNDDOWN((uint)va);
801066f5:	89 d6                	mov    %edx,%esi
{
801066f7:	53                   	push   %ebx
	a = (char *)PGROUNDDOWN((uint)va);
801066f8:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
{
801066fe:	83 ec 1c             	sub    $0x1c,%esp
80106701:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	last = (char *)PGROUNDDOWN(((uint)va) + size - 1);
80106704:	8b 7d 08             	mov    0x8(%ebp),%edi
80106707:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
8010670b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106710:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106713:	29 f7                	sub    %esi,%edi
80106715:	eb 21                	jmp    80106738 <mappages+0x48>
80106717:	89 f6                	mov    %esi,%esi
80106719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	for (;;) {
		if ((pte = walkpgdir(pgdir, a, 1)) == 0)
			return -1;
		if (*pte & PTE_P)
80106720:	f6 00 01             	testb  $0x1,(%eax)
80106723:	75 45                	jne    8010676a <mappages+0x7a>
			panic("remap");
		*pte = pa | perm | PTE_P;
80106725:	0b 5d 0c             	or     0xc(%ebp),%ebx
80106728:	83 cb 01             	or     $0x1,%ebx
8010672b:	89 18                	mov    %ebx,(%eax)
		if (a == last)
8010672d:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80106730:	74 2e                	je     80106760 <mappages+0x70>
			break;
		a += PGSIZE;
80106732:	81 c6 00 10 00 00    	add    $0x1000,%esi
		if ((pte = walkpgdir(pgdir, a, 1)) == 0)
80106738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010673b:	b9 01 00 00 00       	mov    $0x1,%ecx
80106740:	89 f2                	mov    %esi,%edx
80106742:	8d 1c 3e             	lea    (%esi,%edi,1),%ebx
80106745:	e8 26 ff ff ff       	call   80106670 <walkpgdir>
8010674a:	85 c0                	test   %eax,%eax
8010674c:	75 d2                	jne    80106720 <mappages+0x30>
		pa += PGSIZE;
	}
	return 0;
}
8010674e:	8d 65 f4             	lea    -0xc(%ebp),%esp
			return -1;
80106751:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106756:	5b                   	pop    %ebx
80106757:	5e                   	pop    %esi
80106758:	5f                   	pop    %edi
80106759:	5d                   	pop    %ebp
8010675a:	c3                   	ret    
8010675b:	90                   	nop
8010675c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106760:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return 0;
80106763:	31 c0                	xor    %eax,%eax
}
80106765:	5b                   	pop    %ebx
80106766:	5e                   	pop    %esi
80106767:	5f                   	pop    %edi
80106768:	5d                   	pop    %ebp
80106769:	c3                   	ret    
			panic("remap");
8010676a:	83 ec 0c             	sub    $0xc,%esp
8010676d:	68 54 78 10 80       	push   $0x80107854
80106772:	e8 19 9c ff ff       	call   80100390 <panic>
80106777:	89 f6                	mov    %esi,%esi
80106779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106780 <deallocuvm.part.0>:

// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106780:	55                   	push   %ebp
80106781:	89 e5                	mov    %esp,%ebp
80106783:	57                   	push   %edi
80106784:	89 c7                	mov    %eax,%edi
80106786:	56                   	push   %esi
80106787:	53                   	push   %ebx
	uint a, pa;

	if (newsz >= oldsz)
		return oldsz;

	a = PGROUNDUP(newsz);
80106788:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010678e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
int deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106794:	83 ec 1c             	sub    $0x1c,%esp
80106797:	89 4d e0             	mov    %ecx,-0x20(%ebp)
	for (; a < oldsz; a += PGSIZE) {
8010679a:	39 d3                	cmp    %edx,%ebx
8010679c:	73 5a                	jae    801067f8 <deallocuvm.part.0+0x78>
8010679e:	89 d6                	mov    %edx,%esi
801067a0:	eb 10                	jmp    801067b2 <deallocuvm.part.0+0x32>
801067a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801067a8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067ae:	39 de                	cmp    %ebx,%esi
801067b0:	76 46                	jbe    801067f8 <deallocuvm.part.0+0x78>
		pte = walkpgdir(pgdir, (char *)a, 0);
801067b2:	31 c9                	xor    %ecx,%ecx
801067b4:	89 da                	mov    %ebx,%edx
801067b6:	89 f8                	mov    %edi,%eax
801067b8:	e8 b3 fe ff ff       	call   80106670 <walkpgdir>
		if (!pte)
801067bd:	85 c0                	test   %eax,%eax
801067bf:	74 47                	je     80106808 <deallocuvm.part.0+0x88>
			a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
		else if ((*pte & PTE_P) != 0) {
801067c1:	8b 10                	mov    (%eax),%edx
801067c3:	f6 c2 01             	test   $0x1,%dl
801067c6:	74 e0                	je     801067a8 <deallocuvm.part.0+0x28>
			pa = PTE_ADDR(*pte);
			if (pa == 0)
801067c8:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801067ce:	74 46                	je     80106816 <deallocuvm.part.0+0x96>
				panic("kfree");
			char *v = P2V(pa);
			kfree(v);
801067d0:	83 ec 0c             	sub    $0xc,%esp
			char *v = P2V(pa);
801067d3:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801067d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
			kfree(v);
801067dc:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067e2:	52                   	push   %edx
801067e3:	e8 38 bc ff ff       	call   80102420 <kfree>
			*pte = 0;
801067e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067eb:	83 c4 10             	add    $0x10,%esp
801067ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	for (; a < oldsz; a += PGSIZE) {
801067f4:	39 de                	cmp    %ebx,%esi
801067f6:	77 ba                	ja     801067b2 <deallocuvm.part.0+0x32>
		}
	}
	return newsz;
}
801067f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801067fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801067fe:	5b                   	pop    %ebx
801067ff:	5e                   	pop    %esi
80106800:	5f                   	pop    %edi
80106801:	5d                   	pop    %ebp
80106802:	c3                   	ret    
80106803:	90                   	nop
80106804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106808:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
8010680e:	81 c3 00 00 40 00    	add    $0x400000,%ebx
80106814:	eb 98                	jmp    801067ae <deallocuvm.part.0+0x2e>
				panic("kfree");
80106816:	83 ec 0c             	sub    $0xc,%esp
80106819:	68 e6 71 10 80       	push   $0x801071e6
8010681e:	e8 6d 9b ff ff       	call   80100390 <panic>
80106823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106830 <seginit>:
{
80106830:	55                   	push   %ebp
80106831:	89 e5                	mov    %esp,%ebp
80106833:	83 ec 18             	sub    $0x18,%esp
	c = &cpus[cpuid()];
80106836:	e8 b5 d0 ff ff       	call   801038f0 <cpuid>
	pd[0] = size - 1;
8010683b:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106840:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106846:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
	c->gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0, 0xffffffff, 0);
8010684a:	c7 80 58 28 11 80 ff 	movl   $0xffff,-0x7feed7a8(%eax)
80106851:	ff 00 00 
80106854:	c7 80 5c 28 11 80 00 	movl   $0xcf9a00,-0x7feed7a4(%eax)
8010685b:	9a cf 00 
	c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010685e:	c7 80 60 28 11 80 ff 	movl   $0xffff,-0x7feed7a0(%eax)
80106865:	ff 00 00 
80106868:	c7 80 64 28 11 80 00 	movl   $0xcf9200,-0x7feed79c(%eax)
8010686f:	92 cf 00 
	c->gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0, 0xffffffff, DPL_USER);
80106872:	c7 80 68 28 11 80 ff 	movl   $0xffff,-0x7feed798(%eax)
80106879:	ff 00 00 
8010687c:	c7 80 6c 28 11 80 00 	movl   $0xcffa00,-0x7feed794(%eax)
80106883:	fa cf 00 
	c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106886:	c7 80 70 28 11 80 ff 	movl   $0xffff,-0x7feed790(%eax)
8010688d:	ff 00 00 
80106890:	c7 80 74 28 11 80 00 	movl   $0xcff200,-0x7feed78c(%eax)
80106897:	f2 cf 00 
	lgdt(c->gdt, sizeof(c->gdt));
8010689a:	05 50 28 11 80       	add    $0x80112850,%eax
	pd[1] = (uint)p;
8010689f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
	pd[2] = (uint)p >> 16;
801068a3:	c1 e8 10             	shr    $0x10,%eax
801068a6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
	asm volatile("lgdt (%0)" : : "r"(pd));
801068aa:	8d 45 f2             	lea    -0xe(%ebp),%eax
801068ad:	0f 01 10             	lgdtl  (%eax)
}
801068b0:	c9                   	leave  
801068b1:	c3                   	ret    
801068b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068c0 <switchkvm>:
	lcr3(V2P(kpgdir)); // switch to the kernel page table
801068c0:	a1 04 55 11 80       	mov    0x80115504,%eax
801068c5:	05 00 00 00 80       	add    $0x80000000,%eax
	return val;
}

static inline void lcr3(uint val)
{
	asm volatile("movl %0,%%cr3" : : "r"(val));
801068ca:	0f 22 d8             	mov    %eax,%cr3
}
801068cd:	c3                   	ret    
801068ce:	66 90                	xchg   %ax,%ax

801068d0 <switchuvm>:
{
801068d0:	55                   	push   %ebp
801068d1:	89 e5                	mov    %esp,%ebp
801068d3:	57                   	push   %edi
801068d4:	56                   	push   %esi
801068d5:	53                   	push   %ebx
801068d6:	83 ec 1c             	sub    $0x1c,%esp
801068d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
	if (p == 0)
801068dc:	85 db                	test   %ebx,%ebx
801068de:	0f 84 cb 00 00 00    	je     801069af <switchuvm+0xdf>
	if (p->kstack == 0)
801068e4:	8b 43 08             	mov    0x8(%ebx),%eax
801068e7:	85 c0                	test   %eax,%eax
801068e9:	0f 84 da 00 00 00    	je     801069c9 <switchuvm+0xf9>
	if (p->pgdir == 0)
801068ef:	8b 43 04             	mov    0x4(%ebx),%eax
801068f2:	85 c0                	test   %eax,%eax
801068f4:	0f 84 c2 00 00 00    	je     801069bc <switchuvm+0xec>
	pushcli();
801068fa:	e8 d1 da ff ff       	call   801043d0 <pushcli>
	mycpu()->gdt[SEG_TSS] =
801068ff:	e8 6c cf ff ff       	call   80103870 <mycpu>
80106904:	89 c6                	mov    %eax,%esi
		SEG16(STS_T32A, &mycpu()->ts, sizeof(mycpu()->ts) - 1, 0);
80106906:	e8 65 cf ff ff       	call   80103870 <mycpu>
8010690b:	89 c7                	mov    %eax,%edi
8010690d:	e8 5e cf ff ff       	call   80103870 <mycpu>
80106912:	83 c7 08             	add    $0x8,%edi
80106915:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106918:	e8 53 cf ff ff       	call   80103870 <mycpu>
8010691d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
	mycpu()->gdt[SEG_TSS] =
80106920:	ba 67 00 00 00       	mov    $0x67,%edx
80106925:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
		SEG16(STS_T32A, &mycpu()->ts, sizeof(mycpu()->ts) - 1, 0);
8010692c:	83 c0 08             	add    $0x8,%eax
	mycpu()->gdt[SEG_TSS] =
8010692f:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
	mycpu()->ts.iomb = (ushort)0xFFFF;
80106936:	bf ff ff ff ff       	mov    $0xffffffff,%edi
		SEG16(STS_T32A, &mycpu()->ts, sizeof(mycpu()->ts) - 1, 0);
8010693b:	83 c1 08             	add    $0x8,%ecx
8010693e:	c1 e8 18             	shr    $0x18,%eax
80106941:	c1 e9 10             	shr    $0x10,%ecx
	mycpu()->gdt[SEG_TSS] =
80106944:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
8010694a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106950:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106955:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
	mycpu()->ts.ss0 = SEG_KDATA << 3;
8010695c:	be 10 00 00 00       	mov    $0x10,%esi
	mycpu()->gdt[SEG_TSS].s = 0;
80106961:	e8 0a cf ff ff       	call   80103870 <mycpu>
80106966:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
	mycpu()->ts.ss0 = SEG_KDATA << 3;
8010696d:	e8 fe ce ff ff       	call   80103870 <mycpu>
80106972:	66 89 70 10          	mov    %si,0x10(%eax)
	mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106976:	8b 73 08             	mov    0x8(%ebx),%esi
80106979:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010697f:	e8 ec ce ff ff       	call   80103870 <mycpu>
80106984:	89 70 0c             	mov    %esi,0xc(%eax)
	mycpu()->ts.iomb = (ushort)0xFFFF;
80106987:	e8 e4 ce ff ff       	call   80103870 <mycpu>
8010698c:	66 89 78 6e          	mov    %di,0x6e(%eax)
	asm volatile("ltr %0" : : "r"(sel));
80106990:	b8 28 00 00 00       	mov    $0x28,%eax
80106995:	0f 00 d8             	ltr    %ax
	lcr3(V2P(p->pgdir)); // switch to process's address space
80106998:	8b 43 04             	mov    0x4(%ebx),%eax
8010699b:	05 00 00 00 80       	add    $0x80000000,%eax
	asm volatile("movl %0,%%cr3" : : "r"(val));
801069a0:	0f 22 d8             	mov    %eax,%cr3
}
801069a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069a6:	5b                   	pop    %ebx
801069a7:	5e                   	pop    %esi
801069a8:	5f                   	pop    %edi
801069a9:	5d                   	pop    %ebp
	popcli();
801069aa:	e9 31 db ff ff       	jmp    801044e0 <popcli>
		panic("switchuvm: no process");
801069af:	83 ec 0c             	sub    $0xc,%esp
801069b2:	68 5a 78 10 80       	push   $0x8010785a
801069b7:	e8 d4 99 ff ff       	call   80100390 <panic>
		panic("switchuvm: no pgdir");
801069bc:	83 ec 0c             	sub    $0xc,%esp
801069bf:	68 85 78 10 80       	push   $0x80107885
801069c4:	e8 c7 99 ff ff       	call   80100390 <panic>
		panic("switchuvm: no kstack");
801069c9:	83 ec 0c             	sub    $0xc,%esp
801069cc:	68 70 78 10 80       	push   $0x80107870
801069d1:	e8 ba 99 ff ff       	call   80100390 <panic>
801069d6:	8d 76 00             	lea    0x0(%esi),%esi
801069d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069e0 <inituvm>:
{
801069e0:	55                   	push   %ebp
801069e1:	89 e5                	mov    %esp,%ebp
801069e3:	57                   	push   %edi
801069e4:	56                   	push   %esi
801069e5:	53                   	push   %ebx
801069e6:	83 ec 1c             	sub    $0x1c,%esp
801069e9:	8b 45 08             	mov    0x8(%ebp),%eax
801069ec:	8b 75 10             	mov    0x10(%ebp),%esi
801069ef:	8b 7d 0c             	mov    0xc(%ebp),%edi
801069f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	if (sz >= PGSIZE)
801069f5:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801069fb:	77 49                	ja     80106a46 <inituvm+0x66>
	mem = kalloc();
801069fd:	e8 de bb ff ff       	call   801025e0 <kalloc>
	memset(mem, 0, PGSIZE);
80106a02:	83 ec 04             	sub    $0x4,%esp
80106a05:	68 00 10 00 00       	push   $0x1000
	mem = kalloc();
80106a0a:	89 c3                	mov    %eax,%ebx
	memset(mem, 0, PGSIZE);
80106a0c:	6a 00                	push   $0x0
80106a0e:	50                   	push   %eax
80106a0f:	e8 7c db ff ff       	call   80104590 <memset>
	mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W | PTE_U);
80106a14:	58                   	pop    %eax
80106a15:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106a1b:	5a                   	pop    %edx
80106a1c:	6a 06                	push   $0x6
80106a1e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a23:	31 d2                	xor    %edx,%edx
80106a25:	50                   	push   %eax
80106a26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a29:	e8 c2 fc ff ff       	call   801066f0 <mappages>
	memmove(mem, init, sz);
80106a2e:	89 75 10             	mov    %esi,0x10(%ebp)
80106a31:	83 c4 10             	add    $0x10,%esp
80106a34:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106a37:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106a3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a3d:	5b                   	pop    %ebx
80106a3e:	5e                   	pop    %esi
80106a3f:	5f                   	pop    %edi
80106a40:	5d                   	pop    %ebp
	memmove(mem, init, sz);
80106a41:	e9 ea db ff ff       	jmp    80104630 <memmove>
		panic("inituvm: more than a page");
80106a46:	83 ec 0c             	sub    $0xc,%esp
80106a49:	68 99 78 10 80       	push   $0x80107899
80106a4e:	e8 3d 99 ff ff       	call   80100390 <panic>
80106a53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a60 <loaduvm>:
{
80106a60:	55                   	push   %ebp
80106a61:	89 e5                	mov    %esp,%ebp
80106a63:	57                   	push   %edi
80106a64:	56                   	push   %esi
80106a65:	53                   	push   %ebx
80106a66:	83 ec 1c             	sub    $0x1c,%esp
80106a69:	8b 45 0c             	mov    0xc(%ebp),%eax
80106a6c:	8b 75 18             	mov    0x18(%ebp),%esi
	if ((uint)addr % PGSIZE != 0)
80106a6f:	a9 ff 0f 00 00       	test   $0xfff,%eax
80106a74:	0f 85 8d 00 00 00    	jne    80106b07 <loaduvm+0xa7>
80106a7a:	01 f0                	add    %esi,%eax
	for (i = 0; i < sz; i += PGSIZE) {
80106a7c:	89 f3                	mov    %esi,%ebx
80106a7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		if (readi(ip, P2V(pa), offset + i, n) != n)
80106a81:	8b 45 14             	mov    0x14(%ebp),%eax
80106a84:	01 f0                	add    %esi,%eax
80106a86:	89 45 e0             	mov    %eax,-0x20(%ebp)
	for (i = 0; i < sz; i += PGSIZE) {
80106a89:	85 f6                	test   %esi,%esi
80106a8b:	75 11                	jne    80106a9e <loaduvm+0x3e>
80106a8d:	eb 61                	jmp    80106af0 <loaduvm+0x90>
80106a8f:	90                   	nop
80106a90:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106a96:	89 f0                	mov    %esi,%eax
80106a98:	29 d8                	sub    %ebx,%eax
80106a9a:	39 c6                	cmp    %eax,%esi
80106a9c:	76 52                	jbe    80106af0 <loaduvm+0x90>
		if ((pte = walkpgdir(pgdir, addr + i, 0)) == 0)
80106a9e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106aa1:	8b 45 08             	mov    0x8(%ebp),%eax
80106aa4:	31 c9                	xor    %ecx,%ecx
80106aa6:	29 da                	sub    %ebx,%edx
80106aa8:	e8 c3 fb ff ff       	call   80106670 <walkpgdir>
80106aad:	85 c0                	test   %eax,%eax
80106aaf:	74 49                	je     80106afa <loaduvm+0x9a>
		pa = PTE_ADDR(*pte);
80106ab1:	8b 00                	mov    (%eax),%eax
		if (readi(ip, P2V(pa), offset + i, n) != n)
80106ab3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
		if (sz - i < PGSIZE)
80106ab6:	bf 00 10 00 00       	mov    $0x1000,%edi
		pa = PTE_ADDR(*pte);
80106abb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
		if (sz - i < PGSIZE)
80106ac0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106ac6:	0f 46 fb             	cmovbe %ebx,%edi
		if (readi(ip, P2V(pa), offset + i, n) != n)
80106ac9:	29 d9                	sub    %ebx,%ecx
80106acb:	05 00 00 00 80       	add    $0x80000000,%eax
80106ad0:	57                   	push   %edi
80106ad1:	51                   	push   %ecx
80106ad2:	50                   	push   %eax
80106ad3:	ff 75 10             	pushl  0x10(%ebp)
80106ad6:	e8 55 af ff ff       	call   80101a30 <readi>
80106adb:	83 c4 10             	add    $0x10,%esp
80106ade:	39 f8                	cmp    %edi,%eax
80106ae0:	74 ae                	je     80106a90 <loaduvm+0x30>
}
80106ae2:	8d 65 f4             	lea    -0xc(%ebp),%esp
			return -1;
80106ae5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106aea:	5b                   	pop    %ebx
80106aeb:	5e                   	pop    %esi
80106aec:	5f                   	pop    %edi
80106aed:	5d                   	pop    %ebp
80106aee:	c3                   	ret    
80106aef:	90                   	nop
80106af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return 0;
80106af3:	31 c0                	xor    %eax,%eax
}
80106af5:	5b                   	pop    %ebx
80106af6:	5e                   	pop    %esi
80106af7:	5f                   	pop    %edi
80106af8:	5d                   	pop    %ebp
80106af9:	c3                   	ret    
			panic("loaduvm: address should exist");
80106afa:	83 ec 0c             	sub    $0xc,%esp
80106afd:	68 b3 78 10 80       	push   $0x801078b3
80106b02:	e8 89 98 ff ff       	call   80100390 <panic>
		panic("loaduvm: addr must be page aligned");
80106b07:	83 ec 0c             	sub    $0xc,%esp
80106b0a:	68 54 79 10 80       	push   $0x80107954
80106b0f:	e8 7c 98 ff ff       	call   80100390 <panic>
80106b14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b20 <allocuvm>:
{
80106b20:	55                   	push   %ebp
80106b21:	89 e5                	mov    %esp,%ebp
80106b23:	57                   	push   %edi
80106b24:	56                   	push   %esi
80106b25:	53                   	push   %ebx
80106b26:	83 ec 1c             	sub    $0x1c,%esp
	if (newsz >= KERNBASE)
80106b29:	8b 7d 10             	mov    0x10(%ebp),%edi
80106b2c:	85 ff                	test   %edi,%edi
80106b2e:	0f 88 bc 00 00 00    	js     80106bf0 <allocuvm+0xd0>
	if (newsz < oldsz)
80106b34:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b37:	0f 82 a3 00 00 00    	jb     80106be0 <allocuvm+0xc0>
	a = PGROUNDUP(oldsz);
80106b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b40:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106b46:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
	for (; a < newsz; a += PGSIZE) {
80106b4c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106b4f:	0f 86 8e 00 00 00    	jbe    80106be3 <allocuvm+0xc3>
80106b55:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106b58:	8b 7d 08             	mov    0x8(%ebp),%edi
80106b5b:	eb 42                	jmp    80106b9f <allocuvm+0x7f>
80106b5d:	8d 76 00             	lea    0x0(%esi),%esi
		memset(mem, 0, PGSIZE);
80106b60:	83 ec 04             	sub    $0x4,%esp
80106b63:	68 00 10 00 00       	push   $0x1000
80106b68:	6a 00                	push   $0x0
80106b6a:	50                   	push   %eax
80106b6b:	e8 20 da ff ff       	call   80104590 <memset>
		if (mappages(pgdir, (char *)a, PGSIZE, V2P(mem), PTE_W | PTE_U)
80106b70:	58                   	pop    %eax
80106b71:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b77:	5a                   	pop    %edx
80106b78:	6a 06                	push   $0x6
80106b7a:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b7f:	89 da                	mov    %ebx,%edx
80106b81:	50                   	push   %eax
80106b82:	89 f8                	mov    %edi,%eax
80106b84:	e8 67 fb ff ff       	call   801066f0 <mappages>
80106b89:	83 c4 10             	add    $0x10,%esp
80106b8c:	85 c0                	test   %eax,%eax
80106b8e:	78 70                	js     80106c00 <allocuvm+0xe0>
	for (; a < newsz; a += PGSIZE) {
80106b90:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b96:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106b99:	0f 86 a1 00 00 00    	jbe    80106c40 <allocuvm+0x120>
		mem = kalloc();
80106b9f:	e8 3c ba ff ff       	call   801025e0 <kalloc>
80106ba4:	89 c6                	mov    %eax,%esi
		if (mem == 0) {
80106ba6:	85 c0                	test   %eax,%eax
80106ba8:	75 b6                	jne    80106b60 <allocuvm+0x40>
			cprintf("allocuvm out of memory\n");
80106baa:	83 ec 0c             	sub    $0xc,%esp
80106bad:	68 d1 78 10 80       	push   $0x801078d1
80106bb2:	e8 f9 9a ff ff       	call   801006b0 <cprintf>
	if (newsz >= oldsz)
80106bb7:	83 c4 10             	add    $0x10,%esp
80106bba:	8b 45 0c             	mov    0xc(%ebp),%eax
80106bbd:	39 45 10             	cmp    %eax,0x10(%ebp)
80106bc0:	74 2e                	je     80106bf0 <allocuvm+0xd0>
80106bc2:	89 c1                	mov    %eax,%ecx
80106bc4:	8b 55 10             	mov    0x10(%ebp),%edx
80106bc7:	8b 45 08             	mov    0x8(%ebp),%eax
			return 0;
80106bca:	31 ff                	xor    %edi,%edi
80106bcc:	e8 af fb ff ff       	call   80106780 <deallocuvm.part.0>
}
80106bd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bd4:	89 f8                	mov    %edi,%eax
80106bd6:	5b                   	pop    %ebx
80106bd7:	5e                   	pop    %esi
80106bd8:	5f                   	pop    %edi
80106bd9:	5d                   	pop    %ebp
80106bda:	c3                   	ret    
80106bdb:	90                   	nop
80106bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		return oldsz;
80106be0:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
80106be3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106be6:	89 f8                	mov    %edi,%eax
80106be8:	5b                   	pop    %ebx
80106be9:	5e                   	pop    %esi
80106bea:	5f                   	pop    %edi
80106beb:	5d                   	pop    %ebp
80106bec:	c3                   	ret    
80106bed:	8d 76 00             	lea    0x0(%esi),%esi
80106bf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
		return 0;
80106bf3:	31 ff                	xor    %edi,%edi
}
80106bf5:	5b                   	pop    %ebx
80106bf6:	89 f8                	mov    %edi,%eax
80106bf8:	5e                   	pop    %esi
80106bf9:	5f                   	pop    %edi
80106bfa:	5d                   	pop    %ebp
80106bfb:	c3                   	ret    
80106bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			cprintf("allocuvm out of memory (2)\n");
80106c00:	83 ec 0c             	sub    $0xc,%esp
80106c03:	68 e9 78 10 80       	push   $0x801078e9
80106c08:	e8 a3 9a ff ff       	call   801006b0 <cprintf>
	if (newsz >= oldsz)
80106c0d:	83 c4 10             	add    $0x10,%esp
80106c10:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c13:	39 45 10             	cmp    %eax,0x10(%ebp)
80106c16:	74 0d                	je     80106c25 <allocuvm+0x105>
80106c18:	89 c1                	mov    %eax,%ecx
80106c1a:	8b 55 10             	mov    0x10(%ebp),%edx
80106c1d:	8b 45 08             	mov    0x8(%ebp),%eax
80106c20:	e8 5b fb ff ff       	call   80106780 <deallocuvm.part.0>
			kfree(mem);
80106c25:	83 ec 0c             	sub    $0xc,%esp
			return 0;
80106c28:	31 ff                	xor    %edi,%edi
			kfree(mem);
80106c2a:	56                   	push   %esi
80106c2b:	e8 f0 b7 ff ff       	call   80102420 <kfree>
			return 0;
80106c30:	83 c4 10             	add    $0x10,%esp
}
80106c33:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c36:	89 f8                	mov    %edi,%eax
80106c38:	5b                   	pop    %ebx
80106c39:	5e                   	pop    %esi
80106c3a:	5f                   	pop    %edi
80106c3b:	5d                   	pop    %ebp
80106c3c:	c3                   	ret    
80106c3d:	8d 76 00             	lea    0x0(%esi),%esi
80106c40:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106c43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c46:	5b                   	pop    %ebx
80106c47:	5e                   	pop    %esi
80106c48:	89 f8                	mov    %edi,%eax
80106c4a:	5f                   	pop    %edi
80106c4b:	5d                   	pop    %ebp
80106c4c:	c3                   	ret    
80106c4d:	8d 76 00             	lea    0x0(%esi),%esi

80106c50 <deallocuvm>:
{
80106c50:	55                   	push   %ebp
80106c51:	89 e5                	mov    %esp,%ebp
80106c53:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c56:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106c59:	8b 45 08             	mov    0x8(%ebp),%eax
	if (newsz >= oldsz)
80106c5c:	39 d1                	cmp    %edx,%ecx
80106c5e:	73 10                	jae    80106c70 <deallocuvm+0x20>
}
80106c60:	5d                   	pop    %ebp
80106c61:	e9 1a fb ff ff       	jmp    80106780 <deallocuvm.part.0>
80106c66:	8d 76 00             	lea    0x0(%esi),%esi
80106c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106c70:	89 d0                	mov    %edx,%eax
80106c72:	5d                   	pop    %ebp
80106c73:	c3                   	ret    
80106c74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c80 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void freevm(pde_t *pgdir)
{
80106c80:	55                   	push   %ebp
80106c81:	89 e5                	mov    %esp,%ebp
80106c83:	57                   	push   %edi
80106c84:	56                   	push   %esi
80106c85:	53                   	push   %ebx
80106c86:	83 ec 0c             	sub    $0xc,%esp
80106c89:	8b 75 08             	mov    0x8(%ebp),%esi
	uint i;

	if (pgdir == 0)
80106c8c:	85 f6                	test   %esi,%esi
80106c8e:	74 59                	je     80106ce9 <freevm+0x69>
	if (newsz >= oldsz)
80106c90:	31 c9                	xor    %ecx,%ecx
80106c92:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106c97:	89 f0                	mov    %esi,%eax
80106c99:	89 f3                	mov    %esi,%ebx
80106c9b:	e8 e0 fa ff ff       	call   80106780 <deallocuvm.part.0>
		panic("freevm: no pgdir");
	deallocuvm(pgdir, KERNBASE, 0);
	for (i = 0; i < NPDENTRIES; i++) {
80106ca0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106ca6:	eb 0f                	jmp    80106cb7 <freevm+0x37>
80106ca8:	90                   	nop
80106ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cb0:	83 c3 04             	add    $0x4,%ebx
80106cb3:	39 df                	cmp    %ebx,%edi
80106cb5:	74 23                	je     80106cda <freevm+0x5a>
		if (pgdir[i] & PTE_P) {
80106cb7:	8b 03                	mov    (%ebx),%eax
80106cb9:	a8 01                	test   $0x1,%al
80106cbb:	74 f3                	je     80106cb0 <freevm+0x30>
			char *v = P2V(PTE_ADDR(pgdir[i]));
80106cbd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
			kfree(v);
80106cc2:	83 ec 0c             	sub    $0xc,%esp
80106cc5:	83 c3 04             	add    $0x4,%ebx
			char *v = P2V(PTE_ADDR(pgdir[i]));
80106cc8:	05 00 00 00 80       	add    $0x80000000,%eax
			kfree(v);
80106ccd:	50                   	push   %eax
80106cce:	e8 4d b7 ff ff       	call   80102420 <kfree>
80106cd3:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPDENTRIES; i++) {
80106cd6:	39 df                	cmp    %ebx,%edi
80106cd8:	75 dd                	jne    80106cb7 <freevm+0x37>
		}
	}
	kfree((char *)pgdir);
80106cda:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106cdd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ce0:	5b                   	pop    %ebx
80106ce1:	5e                   	pop    %esi
80106ce2:	5f                   	pop    %edi
80106ce3:	5d                   	pop    %ebp
	kfree((char *)pgdir);
80106ce4:	e9 37 b7 ff ff       	jmp    80102420 <kfree>
		panic("freevm: no pgdir");
80106ce9:	83 ec 0c             	sub    $0xc,%esp
80106cec:	68 05 79 10 80       	push   $0x80107905
80106cf1:	e8 9a 96 ff ff       	call   80100390 <panic>
80106cf6:	8d 76 00             	lea    0x0(%esi),%esi
80106cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d00 <setupkvm>:
{
80106d00:	55                   	push   %ebp
80106d01:	89 e5                	mov    %esp,%ebp
80106d03:	56                   	push   %esi
80106d04:	53                   	push   %ebx
	if ((pgdir = (pde_t *)kalloc()) == 0)
80106d05:	e8 d6 b8 ff ff       	call   801025e0 <kalloc>
80106d0a:	89 c6                	mov    %eax,%esi
80106d0c:	85 c0                	test   %eax,%eax
80106d0e:	74 42                	je     80106d52 <setupkvm+0x52>
	memset(pgdir, 0, PGSIZE);
80106d10:	83 ec 04             	sub    $0x4,%esp
	for (k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d13:	bb 60 a4 10 80       	mov    $0x8010a460,%ebx
	memset(pgdir, 0, PGSIZE);
80106d18:	68 00 10 00 00       	push   $0x1000
80106d1d:	6a 00                	push   $0x0
80106d1f:	50                   	push   %eax
80106d20:	e8 6b d8 ff ff       	call   80104590 <memset>
80106d25:	83 c4 10             	add    $0x10,%esp
			     (uint)k->phys_start, k->perm)
80106d28:	8b 43 04             	mov    0x4(%ebx),%eax
		if (mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106d2b:	83 ec 08             	sub    $0x8,%esp
80106d2e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106d31:	ff 73 0c             	pushl  0xc(%ebx)
80106d34:	8b 13                	mov    (%ebx),%edx
80106d36:	50                   	push   %eax
80106d37:	29 c1                	sub    %eax,%ecx
80106d39:	89 f0                	mov    %esi,%eax
80106d3b:	e8 b0 f9 ff ff       	call   801066f0 <mappages>
80106d40:	83 c4 10             	add    $0x10,%esp
80106d43:	85 c0                	test   %eax,%eax
80106d45:	78 19                	js     80106d60 <setupkvm+0x60>
	for (k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106d47:	83 c3 10             	add    $0x10,%ebx
80106d4a:	81 fb a0 a4 10 80    	cmp    $0x8010a4a0,%ebx
80106d50:	75 d6                	jne    80106d28 <setupkvm+0x28>
}
80106d52:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d55:	89 f0                	mov    %esi,%eax
80106d57:	5b                   	pop    %ebx
80106d58:	5e                   	pop    %esi
80106d59:	5d                   	pop    %ebp
80106d5a:	c3                   	ret    
80106d5b:	90                   	nop
80106d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			freevm(pgdir);
80106d60:	83 ec 0c             	sub    $0xc,%esp
80106d63:	56                   	push   %esi
			return 0;
80106d64:	31 f6                	xor    %esi,%esi
			freevm(pgdir);
80106d66:	e8 15 ff ff ff       	call   80106c80 <freevm>
			return 0;
80106d6b:	83 c4 10             	add    $0x10,%esp
}
80106d6e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d71:	89 f0                	mov    %esi,%eax
80106d73:	5b                   	pop    %ebx
80106d74:	5e                   	pop    %esi
80106d75:	5d                   	pop    %ebp
80106d76:	c3                   	ret    
80106d77:	89 f6                	mov    %esi,%esi
80106d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d80 <kvmalloc>:
{
80106d80:	55                   	push   %ebp
80106d81:	89 e5                	mov    %esp,%ebp
80106d83:	83 ec 08             	sub    $0x8,%esp
	kpgdir = setupkvm();
80106d86:	e8 75 ff ff ff       	call   80106d00 <setupkvm>
80106d8b:	a3 04 55 11 80       	mov    %eax,0x80115504
	lcr3(V2P(kpgdir)); // switch to the kernel page table
80106d90:	05 00 00 00 80       	add    $0x80000000,%eax
80106d95:	0f 22 d8             	mov    %eax,%cr3
}
80106d98:	c9                   	leave  
80106d99:	c3                   	ret    
80106d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106da0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void clearpteu(pde_t *pgdir, char *uva)
{
80106da0:	55                   	push   %ebp
	pte_t *pte;

	pte = walkpgdir(pgdir, uva, 0);
80106da1:	31 c9                	xor    %ecx,%ecx
{
80106da3:	89 e5                	mov    %esp,%ebp
80106da5:	83 ec 08             	sub    $0x8,%esp
	pte = walkpgdir(pgdir, uva, 0);
80106da8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dab:	8b 45 08             	mov    0x8(%ebp),%eax
80106dae:	e8 bd f8 ff ff       	call   80106670 <walkpgdir>
	if (pte == 0)
80106db3:	85 c0                	test   %eax,%eax
80106db5:	74 05                	je     80106dbc <clearpteu+0x1c>
		panic("clearpteu");
	*pte &= ~PTE_U;
80106db7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106dba:	c9                   	leave  
80106dbb:	c3                   	ret    
		panic("clearpteu");
80106dbc:	83 ec 0c             	sub    $0xc,%esp
80106dbf:	68 16 79 10 80       	push   $0x80107916
80106dc4:	e8 c7 95 ff ff       	call   80100390 <panic>
80106dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106dd0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t *copyuvm(pde_t *pgdir, uint sz)
{
80106dd0:	55                   	push   %ebp
80106dd1:	89 e5                	mov    %esp,%ebp
80106dd3:	57                   	push   %edi
80106dd4:	56                   	push   %esi
80106dd5:	53                   	push   %ebx
80106dd6:	83 ec 1c             	sub    $0x1c,%esp
	pde_t *d;
	pte_t *pte;
	uint pa, i, flags;
	char *mem;

	if ((d = setupkvm()) == 0)
80106dd9:	e8 22 ff ff ff       	call   80106d00 <setupkvm>
80106dde:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106de1:	85 c0                	test   %eax,%eax
80106de3:	0f 84 a0 00 00 00    	je     80106e89 <copyuvm+0xb9>
		return 0;
	for (i = 0; i < sz; i += PGSIZE) {
80106de9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106dec:	85 c9                	test   %ecx,%ecx
80106dee:	0f 84 95 00 00 00    	je     80106e89 <copyuvm+0xb9>
80106df4:	31 f6                	xor    %esi,%esi
80106df6:	eb 4e                	jmp    80106e46 <copyuvm+0x76>
80106df8:	90                   	nop
80106df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			panic("copyuvm: page not present");
		pa = PTE_ADDR(*pte);
		flags = PTE_FLAGS(*pte);
		if ((mem = kalloc()) == 0)
			goto bad;
		memmove(mem, (char *)P2V(pa), PGSIZE);
80106e00:	83 ec 04             	sub    $0x4,%esp
80106e03:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106e09:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106e0c:	68 00 10 00 00       	push   $0x1000
80106e11:	57                   	push   %edi
80106e12:	50                   	push   %eax
80106e13:	e8 18 d8 ff ff       	call   80104630 <memmove>
		if (mappages(d, (void *)i, PGSIZE, V2P(mem), flags) < 0)
80106e18:	58                   	pop    %eax
80106e19:	5a                   	pop    %edx
80106e1a:	53                   	push   %ebx
80106e1b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106e1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e21:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e26:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106e2c:	52                   	push   %edx
80106e2d:	89 f2                	mov    %esi,%edx
80106e2f:	e8 bc f8 ff ff       	call   801066f0 <mappages>
80106e34:	83 c4 10             	add    $0x10,%esp
80106e37:	85 c0                	test   %eax,%eax
80106e39:	78 39                	js     80106e74 <copyuvm+0xa4>
	for (i = 0; i < sz; i += PGSIZE) {
80106e3b:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106e41:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e44:	76 43                	jbe    80106e89 <copyuvm+0xb9>
		if ((pte = walkpgdir(pgdir, (void *)i, 0)) == 0)
80106e46:	8b 45 08             	mov    0x8(%ebp),%eax
80106e49:	31 c9                	xor    %ecx,%ecx
80106e4b:	89 f2                	mov    %esi,%edx
80106e4d:	e8 1e f8 ff ff       	call   80106670 <walkpgdir>
80106e52:	85 c0                	test   %eax,%eax
80106e54:	74 3e                	je     80106e94 <copyuvm+0xc4>
		if (!(*pte & PTE_P))
80106e56:	8b 18                	mov    (%eax),%ebx
80106e58:	f6 c3 01             	test   $0x1,%bl
80106e5b:	74 44                	je     80106ea1 <copyuvm+0xd1>
		pa = PTE_ADDR(*pte);
80106e5d:	89 df                	mov    %ebx,%edi
		flags = PTE_FLAGS(*pte);
80106e5f:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
		pa = PTE_ADDR(*pte);
80106e65:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
		if ((mem = kalloc()) == 0)
80106e6b:	e8 70 b7 ff ff       	call   801025e0 <kalloc>
80106e70:	85 c0                	test   %eax,%eax
80106e72:	75 8c                	jne    80106e00 <copyuvm+0x30>
			goto bad;
	}
	return d;

bad:
	freevm(d);
80106e74:	83 ec 0c             	sub    $0xc,%esp
80106e77:	ff 75 e0             	pushl  -0x20(%ebp)
80106e7a:	e8 01 fe ff ff       	call   80106c80 <freevm>
	return 0;
80106e7f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80106e86:	83 c4 10             	add    $0x10,%esp
}
80106e89:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e8f:	5b                   	pop    %ebx
80106e90:	5e                   	pop    %esi
80106e91:	5f                   	pop    %edi
80106e92:	5d                   	pop    %ebp
80106e93:	c3                   	ret    
			panic("copyuvm: pte should exist");
80106e94:	83 ec 0c             	sub    $0xc,%esp
80106e97:	68 20 79 10 80       	push   $0x80107920
80106e9c:	e8 ef 94 ff ff       	call   80100390 <panic>
			panic("copyuvm: page not present");
80106ea1:	83 ec 0c             	sub    $0xc,%esp
80106ea4:	68 3a 79 10 80       	push   $0x8010793a
80106ea9:	e8 e2 94 ff ff       	call   80100390 <panic>
80106eae:	66 90                	xchg   %ax,%ax

80106eb0 <uva2ka>:

// Map user virtual address to kernel address.
char *uva2ka(pde_t *pgdir, char *uva)
{
80106eb0:	55                   	push   %ebp
	pte_t *pte;

	pte = walkpgdir(pgdir, uva, 0);
80106eb1:	31 c9                	xor    %ecx,%ecx
{
80106eb3:	89 e5                	mov    %esp,%ebp
80106eb5:	83 ec 08             	sub    $0x8,%esp
	pte = walkpgdir(pgdir, uva, 0);
80106eb8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ebb:	8b 45 08             	mov    0x8(%ebp),%eax
80106ebe:	e8 ad f7 ff ff       	call   80106670 <walkpgdir>
	if ((*pte & PTE_P) == 0)
80106ec3:	8b 00                	mov    (%eax),%eax
		return 0;
	if ((*pte & PTE_U) == 0)
		return 0;
	return (char *)P2V(PTE_ADDR(*pte));
}
80106ec5:	c9                   	leave  
	if ((*pte & PTE_U) == 0)
80106ec6:	89 c2                	mov    %eax,%edx
	return (char *)P2V(PTE_ADDR(*pte));
80106ec8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
	if ((*pte & PTE_U) == 0)
80106ecd:	83 e2 05             	and    $0x5,%edx
	return (char *)P2V(PTE_ADDR(*pte));
80106ed0:	05 00 00 00 80       	add    $0x80000000,%eax
80106ed5:	83 fa 05             	cmp    $0x5,%edx
80106ed8:	ba 00 00 00 00       	mov    $0x0,%edx
80106edd:	0f 45 c2             	cmovne %edx,%eax
}
80106ee0:	c3                   	ret    
80106ee1:	eb 0d                	jmp    80106ef0 <copyout>
80106ee3:	90                   	nop
80106ee4:	90                   	nop
80106ee5:	90                   	nop
80106ee6:	90                   	nop
80106ee7:	90                   	nop
80106ee8:	90                   	nop
80106ee9:	90                   	nop
80106eea:	90                   	nop
80106eeb:	90                   	nop
80106eec:	90                   	nop
80106eed:	90                   	nop
80106eee:	90                   	nop
80106eef:	90                   	nop

80106ef0 <copyout>:

// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	57                   	push   %edi
80106ef4:	56                   	push   %esi
80106ef5:	53                   	push   %ebx
80106ef6:	83 ec 0c             	sub    $0xc,%esp
80106ef9:	8b 75 14             	mov    0x14(%ebp),%esi
80106efc:	8b 55 0c             	mov    0xc(%ebp),%edx
	char *buf, *pa0;
	uint n, va0;

	buf = (char *)p;
	while (len > 0) {
80106eff:	85 f6                	test   %esi,%esi
80106f01:	75 38                	jne    80106f3b <copyout+0x4b>
80106f03:	eb 6b                	jmp    80106f70 <copyout+0x80>
80106f05:	8d 76 00             	lea    0x0(%esi),%esi
		va0 = (uint)PGROUNDDOWN(va);
		pa0 = uva2ka(pgdir, (char *)va0);
		if (pa0 == 0)
			return -1;
		n = PGSIZE - (va - va0);
80106f08:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f0b:	89 fb                	mov    %edi,%ebx
80106f0d:	29 d3                	sub    %edx,%ebx
80106f0f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
		if (n > len)
80106f15:	39 f3                	cmp    %esi,%ebx
80106f17:	0f 47 de             	cmova  %esi,%ebx
			n = len;
		memmove(pa0 + (va - va0), buf, n);
80106f1a:	29 fa                	sub    %edi,%edx
80106f1c:	83 ec 04             	sub    $0x4,%esp
80106f1f:	01 c2                	add    %eax,%edx
80106f21:	53                   	push   %ebx
80106f22:	ff 75 10             	pushl  0x10(%ebp)
80106f25:	52                   	push   %edx
80106f26:	e8 05 d7 ff ff       	call   80104630 <memmove>
		len -= n;
		buf += n;
80106f2b:	01 5d 10             	add    %ebx,0x10(%ebp)
		va = va0 + PGSIZE;
80106f2e:	8d 97 00 10 00 00    	lea    0x1000(%edi),%edx
	while (len > 0) {
80106f34:	83 c4 10             	add    $0x10,%esp
80106f37:	29 de                	sub    %ebx,%esi
80106f39:	74 35                	je     80106f70 <copyout+0x80>
		va0 = (uint)PGROUNDDOWN(va);
80106f3b:	89 d7                	mov    %edx,%edi
		pa0 = uva2ka(pgdir, (char *)va0);
80106f3d:	83 ec 08             	sub    $0x8,%esp
		va0 = (uint)PGROUNDDOWN(va);
80106f40:	89 55 0c             	mov    %edx,0xc(%ebp)
80106f43:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
		pa0 = uva2ka(pgdir, (char *)va0);
80106f49:	57                   	push   %edi
80106f4a:	ff 75 08             	pushl  0x8(%ebp)
80106f4d:	e8 5e ff ff ff       	call   80106eb0 <uva2ka>
		if (pa0 == 0)
80106f52:	83 c4 10             	add    $0x10,%esp
80106f55:	85 c0                	test   %eax,%eax
80106f57:	75 af                	jne    80106f08 <copyout+0x18>
	}
	return 0;
}
80106f59:	8d 65 f4             	lea    -0xc(%ebp),%esp
			return -1;
80106f5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106f61:	5b                   	pop    %ebx
80106f62:	5e                   	pop    %esi
80106f63:	5f                   	pop    %edi
80106f64:	5d                   	pop    %ebp
80106f65:	c3                   	ret    
80106f66:	8d 76 00             	lea    0x0(%esi),%esi
80106f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106f70:	8d 65 f4             	lea    -0xc(%ebp),%esp
	return 0;
80106f73:	31 c0                	xor    %eax,%eax
}
80106f75:	5b                   	pop    %ebx
80106f76:	5e                   	pop    %esi
80106f77:	5f                   	pop    %edi
80106f78:	5d                   	pop    %ebp
80106f79:	c3                   	ret    
