
server:     file format elf32-vax

Disassembly of section .note.openbsd.ident:

00010154 <.note.openbsd.ident>:
   10154:	08 00 00 00 	cvtps $0x0,$0x0,$0x0,$0x4
   10158:	04 
   10159:	00          	halt
   1015a:	00          	halt
   1015b:	00          	halt
   1015c:	01          	nop
   1015d:	00          	halt
   1015e:	00          	halt
   1015f:	00          	halt
   10160:	4f 70 65 6e 	acbf -(r0),(r5),(sp),154a8 <__findenv+0x68>
   10164:	42 53 
   10166:	44 00 00    	mulf2 $0x0 [f-float],$0x0 [f-float]
   10169:	00          	halt
	...
Disassembly of section .init:

0001016c <__init>:
   1016c:	00 00       	.word 0x0000 # Entry mask: < >
   1016e:	fb 00 ef 79 	calls $0x0,102ee <pthread_atfork+0x78>
   10172:	01 00 00 
   10175:	04          	ret
Disassembly of section .text:

00010178 <_start>:
   10178:	01 01       	.word 0x0101 # Entry mask: < r8 ~r0~ >
   1017a:	dd 5e       	pushl sp
   1017c:	fb 01 af 02 	calls $0x1,10182 <_start+0xa>
   10180:	00          	halt
   10181:	01          	nop
   10182:	c0 03 c2 04 	addl2 $0x3,0x5e04(r2)
   10186:	5e 
   10187:	d0 ac 04 50 	movl 0x4(ap),r0
   1018b:	d0 80 59    	movl (r0)+,r9
   1018e:	d0 50 57    	movl r0,r7
   10191:	de 49 a0 04 	moval 0x4(r0)[r9],r8
   10195:	58 
   10196:	d0 58 ef 37 	movl r8,6f5d4 <environ>
   1019a:	f4 05 00 
   1019d:	d0 60 56    	movl (r0),r6
   101a0:	13 5e       	beql 10200 <_start+0x88>
   101a2:	dd 2f       	pushl $0x2f
   101a4:	dd 56       	pushl r6
   101a6:	fb 02 cf 8b 	calls $0x2,10236 <_start+0xbe>
   101aa:	00 
   101ab:	d0 50 ef 9a 	movl r0,5ee4c <__data_start>
   101af:	ec 04 00 
   101b2:	12 77       	bneq 1022b <_start+0xb3>
   101b4:	d0 56 ef 91 	movl r6,5ee4c <__data_start>
   101b8:	ec 04 00 
   101bb:	9e ef 17 f4 	movab 6f5d8 <__progname_storage>,r1
   101bf:	05 00 51 
   101c2:	d0 ef 84 ec 	movl 5ee4c <__data_start>,r0
   101c6:	04 00 50 
   101c9:	95 60       	tstb (r0)
   101cb:	13 26       	beql 101f3 <_start+0x7b>
   101cd:	d1 51 8f d7 	cmpl r1,$0x0006f6d7
   101d1:	f6 06 00 
   101d4:	1e 1d       	bcc 101f3 <_start+0x7b>
   101d6:	d6 ef 70 ec 	incl 5ee4c <__data_start>
   101da:	04 00 
   101dc:	90 60 81    	movb (r0),(r1)+
   101df:	d0 ef 67 ec 	movl 5ee4c <__data_start>,r0
   101e3:	04 00 50 
   101e6:	95 60       	tstb (r0)
   101e8:	13 09       	beql 101f3 <_start+0x7b>
   101ea:	d1 51 8f d7 	cmpl r1,$0x0006f6d7
   101ee:	f6 06 00 
   101f1:	1f e3       	blssu 101d6 <_start+0x5e>
   101f3:	94 61       	clrb (r1)
   101f5:	9e ef dd f3 	movab 6f5d8 <__progname_storage>,5ee4c <__data_start>
   101f9:	05 00 ef 4c 
   101fd:	ec 04 00 
   10200:	9e ef fa fd 	movab 0 <__init-0x1016c>,r0
   10204:	fe ff 50 
   10207:	13 05       	beql 1020e <_start+0x96>
   10209:	dd 58       	pushl r8
   1020b:	fb 01 60    	calls $0x1,(r0)
   1020e:	fb 00 ef 57 	calls $0x0,1016c <__init>
   10212:	ff ff ff 
   10215:	dd 58       	pushl r8
   10217:	dd 57       	pushl r7
   10219:	dd 59       	pushl r9
   1021b:	fb 03 ef 28 	calls $0x3,11f4a <main>
   1021f:	1d 00 00 
   10222:	dd 50       	pushl r0
   10224:	fb 01 ef 43 	calls $0x1,14b6e <exit>
   10228:	49 00 00 
   1022b:	c1 50 01 ef 	addl3 r0,$0x1,5ee4c <__data_start>
   1022f:	19 ec 04 00 
   10233:	11 86       	brb 101bb <_start+0x43>
   10235:	01          	nop
   10236:	00          	halt
   10237:	00          	halt
   10238:	c2 04 5e    	subl2 $0x4,sp
   1023b:	d0 ac 04 52 	movl 0x4(ap),r2
   1023f:	90 ac 08 53 	movb 0x8(ap),r3
   10243:	d4 50       	clrf r0
   10245:	90 62 51    	movb (r2),r1
   10248:	91 51 53    	cmpb r1,r3
   1024b:	13 09       	beql 10256 <_start+0xde>
   1024d:	95 51       	tstb r1
   1024f:	13 04       	beql 10255 <_start+0xdd>
   10251:	d6 52       	incl r2
   10253:	11 f0       	brb 10245 <_start+0xcd>
   10255:	04          	ret
   10256:	d0 52 50    	movl r2,r0
   10259:	11 f2       	brb 1024d <_start+0xd5>
   1025b:	01          	nop

0001025c <__register_frame_info>:
   1025c:	00 00       	.word 0x0000 # Entry mask: < >
   1025e:	c2 04 5e    	subl2 $0x4,sp
   10261:	04          	ret

00010262 <atexit>:
   10262:	00 00       	.word 0x0000 # Entry mask: < >
   10264:	c2 04 5e    	subl2 $0x4,sp
   10267:	d4 7e       	clrf -(sp)
   10269:	d4 7e       	clrf -(sp)
   1026b:	dd ac 04    	pushl 0x4(ap)
   1026e:	fb 03 ef 11 	calls $0x3,14b86 <__cxa_atexit>
   10272:	49 00 00 
   10275:	04          	ret

00010276 <pthread_atfork>:
   10276:	00 00       	.word 0x0000 # Entry mask: < >
   10278:	c2 04 5e    	subl2 $0x4,sp
   1027b:	d4 7e       	clrf -(sp)
   1027d:	dd ac 0c    	pushl 0xc(ap)
   10280:	dd ac 08    	pushl 0x8(ap)
   10283:	dd ac 04    	pushl 0x4(ap)
   10286:	fb 04 ef 73 	calls $0x4,0 <__init-0x1016c>
   1028a:	fd fe ff 
   1028d:	04          	ret
   1028e:	c0 00 c2 04 	addl2 $0x0,0x5e04(r2)
   10292:	5e 
   10293:	d0 01 57    	movl $0x1,r7
   10296:	9e ef a0 eb 	movab 4ee3c <__got_start>,r0
   1029a:	03 00 50 
   1029d:	d5 ef 9d eb 	tstl 4ee40 <__got_start+0x4>
   102a1:	03 00 
   102a3:	13 07       	beql 102ac <pthread_atfork+0x36>
   102a5:	d6 57       	incl r7
   102a7:	d5 47 60    	tstl (r0)[r7]
   102aa:	12 f9       	bneq 102a5 <pthread_atfork+0x2f>
   102ac:	d7 57       	decl r7
   102ae:	de 47 ef 87 	moval 4ee3c <__got_start>[r7],r6
   102b2:	eb 03 00 56 
   102b6:	d7 57       	decl r7
   102b8:	d1 57 8f ff 	cmpl r7,$0xffffffff
   102bc:	ff ff ff 
   102bf:	13 0d       	beql 102ce <pthread_atfork+0x58>
   102c1:	d0 66 50    	movl (r6),r0
   102c4:	c2 04 56    	subl2 $0x4,r6
   102c7:	fb 00 60    	calls $0x0,(r0)
   102ca:	d7 57       	decl r7
   102cc:	1e f3       	bcc 102c1 <pthread_atfork+0x4b>
   102ce:	04          	ret
   102cf:	01          	nop
   102d0:	40 00 c2 04 	addf2 $0x0 [f-float],0x5e04(r2)
   102d4:	5e 
   102d5:	9e ef 6d eb 	movab 4ee48 <__got_start+0xc>,r6
   102d9:	03 00 56 
   102dc:	d5 66       	tstl (r6)
   102de:	12 01       	bneq 102e1 <pthread_atfork+0x6b>
   102e0:	04          	ret
   102e1:	d0 86 50    	movl (r6)+,r0
   102e4:	fb 00 60    	calls $0x0,(r0)
   102e7:	d5 66       	tstl (r6)
   102e9:	12 f6       	bneq 102e1 <pthread_atfork+0x6b>
   102eb:	11 f3       	brb 102e0 <pthread_atfork+0x6a>
   102ed:	01          	nop
   102ee:	00          	halt
   102ef:	00          	halt
   102f0:	c2 04 5e    	subl2 $0x4,sp
   102f3:	d5 ef 5b eb 	tstl 5ee54 <__dso_handle+0x4>
   102f7:	04 00 
   102f9:	13 01       	beql 102fc <pthread_atfork+0x86>
   102fb:	04          	ret
   102fc:	d0 01 ef 51 	movl $0x1,5ee54 <__dso_handle+0x4>
   10300:	eb 04 00 
   10303:	9f ef f7 9c 	pushab 6a000 <__bss_start+0xac>
   10307:	05 00 
   10309:	9f ef 21 eb 	pushab 2ee30 <_sys_siglist+0x27c>
   1030d:	01 00 
   1030f:	fb 02 ef 46 	calls $0x2,1025c <__register_frame_info>
   10313:	ff ff ff 
   10316:	9e ef 1c eb 	movab 3ee38 <__guard_local+0x4>,r0
   1031a:	02 00 50 
   1031d:	d5 60       	tstl (r0)
   1031f:	13 0e       	beql 1032f <pthread_atfork+0xb9>
   10321:	9e ef d9 fc 	movab 0 <__init-0x1016c>,r1
   10325:	fe ff 51 
   10328:	13 05       	beql 1032f <pthread_atfork+0xb9>
   1032a:	dd 50       	pushl r0
   1032c:	fb 01 61    	calls $0x1,(r1)
   1032f:	fb 00 cf 5a 	calls $0x0,1028e <pthread_atfork+0x18>
   10333:	ff 
   10334:	9f ef 38 c8 	pushab 1cb72 <__fini>
   10338:	00 00 
   1033a:	fb 01 ef 21 	calls $0x1,10262 <atexit>
   1033e:	ff ff ff 
   10341:	11 b8       	brb 102fb <pthread_atfork+0x85>
   10343:	01          	nop
   10344:	00          	halt
   10345:	00          	halt
   10346:	c2 04 5e    	subl2 $0x4,sp
   10349:	d5 ef 09 eb 	tstl 5ee58 <__dso_handle+0x8>
   1034d:	04 00 
   1034f:	13 01       	beql 10352 <pthread_atfork+0xdc>
   10351:	04          	ret
   10352:	d0 01 ef ff 	movl $0x1,5ee58 <__dso_handle+0x8>
   10356:	ea 04 00 
   10359:	fb 00 cf 72 	calls $0x0,102d0 <pthread_atfork+0x5a>
   1035d:	ff 
   1035e:	11 f1       	brb 10351 <pthread_atfork+0xdb>

00010360 <testBadChar>:
   10360:	00 00       	.word 0x0000 # Entry mask: < >
   10362:	c2 0c 5e    	subl2 $0xc,sp
   10365:	d4 ad f8    	clrf 0xfffffff8(fp)
   10368:	d1 ad f8 ac 	cmpl 0xfffffff8(fp),0x8(ap)
   1036c:	08 
   1036d:	1f 02       	blssu 10371 <testBadChar+0x11>
   1036f:	11 5d       	brb 103ce <testBadChar+0x6e>
   10371:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   10375:	f8 50 
   10377:	91 60 2f    	cmpb (r0),$0x2f
   1037a:	15 25       	bleq 103a1 <testBadChar+0x41>
   1037c:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   10380:	f8 50 
   10382:	91 60 39    	cmpb (r0),$0x39
   10385:	15 0c       	bleq 10393 <testBadChar+0x33>
   10387:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   1038b:	f8 50 
   1038d:	91 60 8f 40 	cmpb (r0),$0x40
   10391:	15 0e       	bleq 103a1 <testBadChar+0x41>
   10393:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   10397:	f8 50 
   10399:	91 60 8f 5a 	cmpb (r0),$0x5a
   1039d:	14 02       	bgtr 103a1 <testBadChar+0x41>
   1039f:	11 28       	brb 103c9 <testBadChar+0x69>
   103a1:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   103a5:	f8 50 
   103a7:	91 60 0a    	cmpb (r0),$0xa
   103aa:	13 1d       	beql 103c9 <testBadChar+0x69>
   103ac:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   103b0:	f8 50 
   103b2:	91 60 20    	cmpb (r0),$0x20
   103b5:	13 12       	beql 103c9 <testBadChar+0x69>
   103b7:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   103bb:	f8 50 
   103bd:	91 60 8f 5f 	cmpb (r0),$0x5f
   103c1:	13 06       	beql 103c9 <testBadChar+0x69>
   103c3:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   103c7:	11 08       	brb 103d1 <testBadChar+0x71>
   103c9:	d6 ad f8    	incl 0xfffffff8(fp)
   103cc:	11 9a       	brb 10368 <testBadChar+0x8>
   103ce:	d4 ad f4    	clrf 0xfffffff4(fp)
   103d1:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   103d5:	04          	ret

000103d6 <testHex>:
   103d6:	00 00       	.word 0x0000 # Entry mask: < >
   103d8:	c2 0c 5e    	subl2 $0xc,sp
   103db:	d4 ad f8    	clrf 0xfffffff8(fp)
   103de:	d1 ad f8 ac 	cmpl 0xfffffff8(fp),0x8(ap)
   103e2:	08 
   103e3:	1f 02       	blssu 103e7 <testHex+0x11>
   103e5:	11 3b       	brb 10422 <testHex+0x4c>
   103e7:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   103eb:	f8 50 
   103ed:	91 60 2f    	cmpb (r0),$0x2f
   103f0:	15 25       	bleq 10417 <testHex+0x41>
   103f2:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   103f6:	f8 50 
   103f8:	91 60 39    	cmpb (r0),$0x39
   103fb:	15 0c       	bleq 10409 <testHex+0x33>
   103fd:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   10401:	f8 50 
   10403:	91 60 8f 40 	cmpb (r0),$0x40
   10407:	15 0e       	bleq 10417 <testHex+0x41>
   10409:	c1 ac 04 ad 	addl3 0x4(ap),0xfffffff8(fp),r0
   1040d:	f8 50 
   1040f:	91 60 8f 46 	cmpb (r0),$0x46
   10413:	14 02       	bgtr 10417 <testHex+0x41>
   10415:	11 06       	brb 1041d <testHex+0x47>
   10417:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   1041b:	11 08       	brb 10425 <testHex+0x4f>
   1041d:	d6 ad f8    	incl 0xfffffff8(fp)
   10420:	11 bc       	brb 103de <testHex+0x8>
   10422:	d4 ad f4    	clrf 0xfffffff4(fp)
   10425:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   10429:	04          	ret

0001042a <setargs>:
   1042a:	00 00       	.word 0x0000 # Entry mask: < >
   1042c:	c2 08 5e    	subl2 $0x8,sp
   1042f:	d4 ad f8    	clrf 0xfffffff8(fp)
   10432:	98 bc 04 50 	cvtbl *0x4(ap),r0
   10436:	dd 50       	pushl r0
   10438:	fb 01 ef cd 	calls $0x1,1290c <isspace>
   1043c:	24 00 00 
   1043f:	d5 50       	tstl r0
   10441:	12 02       	bneq 10445 <setargs+0x1b>
   10443:	11 05       	brb 1044a <setargs+0x20>
   10445:	d6 ac 04    	incl 0x4(ap)
   10448:	11 e8       	brb 10432 <setargs+0x8>
   1044a:	01          	nop
   1044b:	95 bc 04    	tstb *0x4(ap)
   1044e:	12 02       	bneq 10452 <setargs+0x28>
   10450:	11 5c       	brb 104ae <setargs+0x84>
   10452:	d5 ac 08    	tstl 0x8(ap)
   10455:	13 0a       	beql 10461 <setargs+0x37>
   10457:	d0 ad f8 50 	movl 0xfffffff8(fp),r0
   1045b:	d0 ac 04 40 	movl 0x4(ap),*0x8(ap)[r0]
   1045f:	bc 08 
   10461:	01          	nop
   10462:	95 bc 04    	tstb *0x4(ap)
   10465:	13 16       	beql 1047d <setargs+0x53>
   10467:	98 bc 04 50 	cvtbl *0x4(ap),r0
   1046b:	dd 50       	pushl r0
   1046d:	fb 01 ef 98 	calls $0x1,1290c <isspace>
   10471:	24 00 00 
   10474:	d5 50       	tstl r0
   10476:	12 05       	bneq 1047d <setargs+0x53>
   10478:	d6 ac 04    	incl 0x4(ap)
   1047b:	11 e5       	brb 10462 <setargs+0x38>
   1047d:	d5 ac 08    	tstl 0x8(ap)
   10480:	13 0e       	beql 10490 <setargs+0x66>
   10482:	95 bc 04    	tstb *0x4(ap)
   10485:	13 09       	beql 10490 <setargs+0x66>
   10487:	d0 ac 04 50 	movl 0x4(ap),r0
   1048b:	94 60       	clrb (r0)
   1048d:	d6 ac 04    	incl 0x4(ap)
   10490:	01          	nop
   10491:	98 bc 04 50 	cvtbl *0x4(ap),r0
   10495:	dd 50       	pushl r0
   10497:	fb 01 ef 6e 	calls $0x1,1290c <isspace>
   1049b:	24 00 00 
   1049e:	d5 50       	tstl r0
   104a0:	12 02       	bneq 104a4 <setargs+0x7a>
   104a2:	11 05       	brb 104a9 <setargs+0x7f>
   104a4:	d6 ac 04    	incl 0x4(ap)
   104a7:	11 e8       	brb 10491 <setargs+0x67>
   104a9:	d6 ad f8    	incl 0xfffffff8(fp)
   104ac:	11 9d       	brb 1044b <setargs+0x21>
   104ae:	d0 ad f8 50 	movl 0xfffffff8(fp),r0
   104b2:	04          	ret
   104b3:	01          	nop

000104b4 <parsedargs>:
   104b4:	00 00       	.word 0x0000 # Entry mask: < >
   104b6:	c2 14 5e    	subl2 $0x14,sp
   104b9:	d4 ad f8    	clrf 0xfffffff8(fp)
   104bc:	d4 ad f4    	clrf 0xfffffff4(fp)
   104bf:	d5 ac 04    	tstl 0x4(ap)
   104c2:	12 05       	bneq 104c9 <parsedargs+0x15>
   104c4:	d4 ad ec    	clrf 0xffffffec(fp)
   104c7:	11 79       	brb 10542 <parsedargs+0x8e>
   104c9:	dd ac 04    	pushl 0x4(ap)
   104cc:	fb 01 ef db 	calls $0x1,14fae <strdup>
   104d0:	4a 00 00 
   104d3:	d0 50 ad f0 	movl r0,0xfffffff0(fp)
   104d7:	d5 ad f0    	tstl 0xfffffff0(fp)
   104da:	12 05       	bneq 104e1 <parsedargs+0x2d>
   104dc:	d4 ad ec    	clrf 0xffffffec(fp)
   104df:	11 61       	brb 10542 <parsedargs+0x8e>
   104e1:	d4 7e       	clrf -(sp)
   104e3:	dd ad f0    	pushl 0xfffffff0(fp)
   104e6:	fb 02 cf 3f 	calls $0x2,1042a <setargs>
   104ea:	ff 
   104eb:	d0 50 ad f4 	movl r0,0xfffffff4(fp)
   104ef:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   104f3:	c4 04 50    	mull2 $0x4,r0
   104f6:	c0 04 50    	addl2 $0x4,r0
   104f9:	dd 50       	pushl r0
   104fb:	fb 01 ef 98 	calls $0x1,13e9a <malloc>
   104ff:	39 00 00 
   10502:	d0 50 ad f8 	movl r0,0xfffffff8(fp)
   10506:	d5 ad f8    	tstl 0xfffffff8(fp)
   10509:	12 0f       	bneq 1051a <parsedargs+0x66>
   1050b:	dd ad f0    	pushl 0xfffffff0(fp)
   1050e:	fb 01 ef 2b 	calls $0x1,14140 <free>
   10512:	3c 00 00 
   10515:	d4 ad ec    	clrf 0xffffffec(fp)
   10518:	11 28       	brb 10542 <parsedargs+0x8e>
   1051a:	d0 ad f8 50 	movl 0xfffffff8(fp),r0
   1051e:	d0 ad f0 60 	movl 0xfffffff0(fp),(r0)
   10522:	c0 04 ad f8 	addl2 $0x4,0xfffffff8(fp)
   10526:	dd ad f8    	pushl 0xfffffff8(fp)
   10529:	dd ad f0    	pushl 0xfffffff0(fp)
   1052c:	fb 02 cf f9 	calls $0x2,1042a <setargs>
   10530:	fe 
   10531:	d0 50 ad f4 	movl r0,0xfffffff4(fp)
   10535:	d0 ad f4 bc 	movl 0xfffffff4(fp),*0x8(ap)
   10539:	08 
   1053a:	d0 ad f8 50 	movl 0xfffffff8(fp),r0
   1053e:	d0 50 ad ec 	movl r0,0xffffffec(fp)
   10542:	d0 ad ec 50 	movl 0xffffffec(fp),r0
   10546:	04          	ret
   10547:	01          	nop

00010548 <freeparsedargs>:
   10548:	00 00       	.word 0x0000 # Entry mask: < >
   1054a:	c2 04 5e    	subl2 $0x4,sp
   1054d:	d5 ac 04    	tstl 0x4(ap)
   10550:	13 1c       	beql 1056e <freeparsedargs+0x26>
   10552:	d0 ac 04 50 	movl 0x4(ap),r0
   10556:	dd a0 fc    	pushl 0xfffffffc(r0)
   10559:	fb 01 ef e0 	calls $0x1,14140 <free>
   1055d:	3b 00 00 
   10560:	c3 04 ac 04 	subl3 $0x4,0x4(ap),r0
   10564:	50 
   10565:	dd 50       	pushl r0
   10567:	fb 01 ef d2 	calls $0x1,14140 <free>
   1056b:	3b 00 00 
   1056e:	04          	ret
   1056f:	01          	nop

00010570 <powerf>:
   10570:	00 00       	.word 0x0000 # Entry mask: < >
   10572:	c2 0c 5e    	subl2 $0xc,sp
   10575:	d5 ac 08    	tstl 0x8(ap)
   10578:	12 06       	bneq 10580 <powerf+0x10>
   1057a:	50 08 ad f4 	movf $0x8 [f-float],0xfffffff4(fp)
   1057e:	11 56       	brb 105d6 <powerf+0x66>
   10580:	d0 ac 08 50 	movl 0x8(ap),r0
   10584:	c6 02 50    	divl2 $0x2,r0
   10587:	dd 50       	pushl r0
   10589:	50 ac 04 7e 	movf 0x4(ap),-(sp)
   1058d:	fb 02 ef dc 	calls $0x2,10570 <powerf>
   10591:	ff ff ff 
   10594:	50 50 ad f8 	movf r0,0xfffffff8(fp)
   10598:	d0 ac 08 50 	movl 0x8(ap),r0
   1059c:	ca 8f fe ff 	bicl2 $0xfffffffe,r0
   105a0:	ff ff 50 
   105a3:	d5 50       	tstl r0
   105a5:	12 0c       	bneq 105b3 <powerf+0x43>
   105a7:	45 ad f8 ad 	mulf3 0xfffffff8(fp),0xfffffff8(fp),r0
   105ab:	f8 50 
   105ad:	50 50 ad f4 	movf r0,0xfffffff4(fp)
   105b1:	11 23       	brb 105d6 <powerf+0x66>
   105b3:	d5 ac 08    	tstl 0x8(ap)
   105b6:	15 10       	bleq 105c8 <powerf+0x58>
   105b8:	45 ac 04 ad 	mulf3 0x4(ap),0xfffffff8(fp),r0
   105bc:	f8 50 
   105be:	44 ad f8 50 	mulf2 0xfffffff8(fp),r0
   105c2:	50 50 ad f4 	movf r0,0xfffffff4(fp)
   105c6:	11 0e       	brb 105d6 <powerf+0x66>
   105c8:	45 ad f8 ad 	mulf3 0xfffffff8(fp),0xfffffff8(fp),r0
   105cc:	f8 50 
   105ce:	46 ac 04 50 	divf2 0x4(ap),r0
   105d2:	50 50 ad f4 	movf r0,0xfffffff4(fp)
   105d6:	50 ad f4 50 	movf 0xfffffff4(fp),r0
   105da:	04          	ret
   105db:	01          	nop

000105dc <uint2IEEE754>:
   105dc:	40 00       	.word 0x0040 # Entry mask: < r6 >
   105de:	c2 20 5e    	subl2 $0x20,sp
   105e1:	d0 ac 04 ad 	movl 0x4(ap),0xfffffff8(fp)
   105e5:	f8 
   105e6:	d4 ad f4    	clrf 0xfffffff4(fp)
   105e9:	d2 00 ad f0 	mcoml $0x0,0xfffffff0(fp)
   105ed:	d1 ad f0 16 	cmpl 0xfffffff0(fp),$0x16
   105f1:	15 02       	bleq 105f5 <uint2IEEE754+0x19>
   105f3:	11 68       	brb 1065d <uint2IEEE754+0x81>
   105f5:	ce ad f0 50 	mnegl 0xfffffff0(fp),r0
   105f9:	dd 50       	pushl r0
   105fb:	50 10 7e    	movf $0x10 [f-float],-(sp)
   105fe:	fb 02 ef 6b 	calls $0x2,10570 <powerf>
   10602:	ff ff ff 
   10605:	50 50 ad e8 	movf r0,0xffffffe8(fp)
   10609:	ef 00 17 ad 	extzv $0x0,$0x17,0xfffffff8(fp),r6
   1060d:	f8 56 
   1060f:	c3 ad f0 17 	subl3 0xfffffff0(fp),$0x17,r0
   10613:	50 
   10614:	dd 50       	pushl r0
   10616:	50 10 7e    	movf $0x10 [f-float],-(sp)
   10619:	fb 02 ef 50 	calls $0x2,10570 <powerf>
   1061d:	ff ff ff 
   10620:	4a 50 51    	cvtfl r0,r1
   10623:	d2 56 50    	mcoml r6,r0
   10626:	cb 50 51 52 	bicl3 r0,r1,r2
   1062a:	c3 ad f0 17 	subl3 0xfffffff0(fp),$0x17,r1
   1062e:	51 
   1062f:	83 51 20 50 	subb3 r1,$0x20,r0
   10633:	ef 51 50 52 	extzv r1,r0,r2,r0
   10637:	50 
   10638:	6e 50 ad e0 	cvtld r0,0xffffffe0(fp)
   1063c:	d5 50       	tstl r0
   1063e:	18 0c       	bgeq 1064c <uint2IEEE754+0x70>
   10640:	60 8f 80 50 	addd2 $0x0000000000005080 [d-float],0xffffffe0(fp)
   10644:	00 00 00 00 
   10648:	00 00 ad e0 
   1064c:	76 ad e0 50 	cvtdf 0xffffffe0(fp),r0
   10650:	44 ad e8 50 	mulf2 0xffffffe8(fp),r0
   10654:	40 50 ad f4 	addf2 r0,0xfffffff4(fp)
   10658:	d6 ad f0    	incl 0xfffffff0(fp)
   1065b:	11 90       	brb 105ed <uint2IEEE754+0x11>
   1065d:	ef 07 01 ad 	extzv $0x7,$0x1,0xfffffffb(fp),r0
   10661:	fb 50 
   10663:	dd 50       	pushl r0
   10665:	50 8f 80 c0 	movf $0x0000c080 [f-float],-(sp)
   10669:	00 00 7e 
   1066c:	fb 02 ef fd 	calls $0x2,10570 <powerf>
   10670:	fe ff ff 
   10673:	50 50 56    	movf r0,r6
   10676:	ef 07 08 ad 	extzv $0x7,$0x8,0xfffffffa(fp),r0
   1067a:	fa 50 
   1067c:	9e a0 81 50 	movab 0xffffff81(r0),r0
   10680:	dd 50       	pushl r0
   10682:	50 10 7e    	movf $0x10 [f-float],-(sp)
   10685:	fb 02 ef e4 	calls $0x2,10570 <powerf>
   10689:	fe ff ff 
   1068c:	45 56 50 51 	mulf3 r6,r0,r1
   10690:	41 ad f4 08 	addf3 0xfffffff4(fp),$0x8 [f-float],r0
   10694:	50 
   10695:	45 51 50 ad 	mulf3 r1,r0,0xffffffec(fp)
   10699:	ec 
   1069a:	50 ad ec 50 	movf 0xffffffec(fp),r0
   1069e:	04          	ret
   1069f:	01          	nop

000106a0 <initialize>:
   106a0:	00 00       	.word 0x0000 # Entry mask: < >
   106a2:	c2 04 5e    	subl2 $0x4,sp
   106a5:	d0 03 bc 04 	movl $0x3,*0x4(ap)
   106a9:	d0 ac 04 50 	movl 0x4(ap),r0
   106ad:	50 8f 1b 43 	movf $0x9756431b [f-float],0x4(r0)
   106b1:	56 97 a0 04 
   106b5:	d0 ac 04 50 	movl 0x4(ap),r0
   106b9:	50 8f 9a c3 	movf $0x1296c39a [f-float],0x8(r0)
   106bd:	96 12 a0 08 
   106c1:	d0 ac 04 50 	movl 0x4(ap),r0
   106c5:	d4 a0 0c    	clrf 0xc(r0)
   106c8:	d0 ac 04 50 	movl 0x4(ap),r0
   106cc:	d4 a0 10    	clrf 0x10(r0)
   106cf:	d0 ac 04 50 	movl 0x4(ap),r0
   106d3:	d4 a0 14    	clrf 0x14(r0)
   106d6:	d0 ac 04 50 	movl 0x4(ap),r0
   106da:	d4 a0 18    	clrf 0x18(r0)
   106dd:	d0 ac 04 50 	movl 0x4(ap),r0
   106e1:	d0 01 a0 1c 	movl $0x1,0x1c(r0)
   106e5:	d0 ac 04 50 	movl 0x4(ap),r0
   106e9:	d0 01 a0 20 	movl $0x1,0x20(r0)
   106ed:	d0 ac 04 50 	movl 0x4(ap),r0
   106f1:	d4 a0 24    	clrf 0x24(r0)
   106f4:	d0 ac 04 50 	movl 0x4(ap),r0
   106f8:	d0 01 a0 28 	movl $0x1,0x28(r0)
   106fc:	d0 ac 04 50 	movl 0x4(ap),r0
   10700:	d0 01 a0 2c 	movl $0x1,0x2c(r0)
   10704:	d0 ac 04 50 	movl 0x4(ap),r0
   10708:	d0 01 a0 30 	movl $0x1,0x30(r0)
   1070c:	d0 ac 04 50 	movl 0x4(ap),r0
   10710:	d4 a0 34    	clrf 0x34(r0)
   10713:	9f ef 63 c4 	pushab 2cb7c <__fini+0x1000a>
   10717:	01 00 
   10719:	c1 ac 04 38 	addl3 0x4(ap),$0x38,r0
   1071d:	50 
   1071e:	dd 50       	pushl r0
   10720:	fb 02 ef 29 	calls $0x2,12450 <strcpy>
   10724:	1d 00 00 
   10727:	d0 ac 04 50 	movl 0x4(ap),r0
   1072b:	d4 c0 9c 00 	clrf 0x9c(r0)
   1072f:	9f ef 47 c4 	pushab 2cb7c <__fini+0x1000a>
   10733:	01 00 
   10735:	c1 ac 04 8f 	addl3 0x4(ap),$0x000000a0,r0
   10739:	a0 00 00 00 
   1073d:	50 
   1073e:	dd 50       	pushl r0
   10740:	fb 02 ef 09 	calls $0x2,12450 <strcpy>
   10744:	1d 00 00 
   10747:	d0 ac 04 50 	movl 0x4(ap),r0
   1074b:	d4 c0 04 01 	clrf 0x104(r0)
   1074f:	9f ef 27 c4 	pushab 2cb7c <__fini+0x1000a>
   10753:	01 00 
   10755:	c1 ac 04 8f 	addl3 0x4(ap),$0x00000108,r0
   10759:	08 01 00 00 
   1075d:	50 
   1075e:	dd 50       	pushl r0
   10760:	fb 02 ef e9 	calls $0x2,12450 <strcpy>
   10764:	1c 00 00 
   10767:	04          	ret

00010768 <draw>:
   10768:	00 00       	.word 0x0000 # Entry mask: < >
   1076a:	9e ae 80 5e 	movab 0xffffff80(sp),sp
   1076e:	d0 ef c0 e6 	movl 3ee34 <__guard_local>,0xfffffff8(fp)
   10772:	02 00 ad f8 
   10776:	d0 ac 04 ad 	movl 0x4(ap),0xffffff84(fp)
   1077a:	84 
   1077b:	d0 ac 08 ad 	movl 0x8(ap),0xffffff80(fp)
   1077f:	80 
   10780:	d0 ad 84 ad 	movl 0xffffff84(fp),0xffffff8c(fp)
   10784:	8c 
   10785:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10789:	9f ef ee c3 	pushab 2cb7d <__fini+0x1000b>
   1078d:	01 00 
   1078f:	dd ad 8c    	pushl 0xffffff8c(fp)
   10792:	fb 03 ef 39 	calls $0x3,124d2 <strncpy>
   10796:	1d 00 00 
   10799:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   1079d:	9f ef 2a c4 	pushab 2cbcd <__fini+0x1005b>
   107a1:	01 00 
   107a3:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   107a7:	00 00 ad 8c 
   107ab:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   107af:	dd 50       	pushl r0
   107b1:	fb 03 ef 1a 	calls $0x3,124d2 <strncpy>
   107b5:	1d 00 00 
   107b8:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   107bc:	9f ef 66 c4 	pushab 2cc28 <__fini+0x100b6>
   107c0:	01 00 
   107c2:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   107c6:	00 00 ad 8c 
   107ca:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   107ce:	dd 50       	pushl r0
   107d0:	fb 03 ef fb 	calls $0x3,124d2 <strncpy>
   107d4:	1c 00 00 
   107d7:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   107db:	9f ef a2 c4 	pushab 2cc83 <__fini+0x10111>
   107df:	01 00 
   107e1:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   107e5:	00 00 ad 8c 
   107e9:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   107ed:	dd 50       	pushl r0
   107ef:	fb 03 ef dc 	calls $0x3,124d2 <strncpy>
   107f3:	1c 00 00 
   107f6:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   107fa:	9f ef de c4 	pushab 2ccde <__fini+0x1016c>
   107fe:	01 00 
   10800:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   10804:	00 00 ad 8c 
   10808:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   1080c:	dd 50       	pushl r0
   1080e:	fb 03 ef bd 	calls $0x3,124d2 <strncpy>
   10812:	1c 00 00 
   10815:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   10819:	9f ef 1a c5 	pushab 2cd39 <__fini+0x101c7>
   1081d:	01 00 
   1081f:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   10823:	00 00 ad 8c 
   10827:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   1082b:	dd 50       	pushl r0
   1082d:	fb 03 ef 9e 	calls $0x3,124d2 <strncpy>
   10831:	1c 00 00 
   10834:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   10838:	9f ef 56 c5 	pushab 2cd94 <__fini+0x10222>
   1083c:	01 00 
   1083e:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   10842:	00 00 ad 8c 
   10846:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   1084a:	dd 50       	pushl r0
   1084c:	fb 03 ef 7f 	calls $0x3,124d2 <strncpy>
   10850:	1c 00 00 
   10853:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10857:	9f ef 92 c5 	pushab 2cdef <__fini+0x1027d>
   1085b:	01 00 
   1085d:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   10861:	00 00 ad 8c 
   10865:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10869:	dd 50       	pushl r0
   1086b:	fb 03 ef 60 	calls $0x3,124d2 <strncpy>
   1086f:	1c 00 00 
   10872:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10876:	9f ef c3 c5 	pushab 2ce3f <__fini+0x102cd>
   1087a:	01 00 
   1087c:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   10880:	00 00 ad 8c 
   10884:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10888:	dd 50       	pushl r0
   1088a:	fb 03 ef 41 	calls $0x3,124d2 <strncpy>
   1088e:	1c 00 00 
   10891:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   10895:	9f ef f4 c5 	pushab 2ce8f <__fini+0x1031d>
   10899:	01 00 
   1089b:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   1089f:	00 00 ad 8c 
   108a3:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   108a7:	dd 50       	pushl r0
   108a9:	fb 03 ef 22 	calls $0x3,124d2 <strncpy>
   108ad:	1c 00 00 
   108b0:	9a 8f 5a 7e 	movzbl $0x5a,-(sp)
   108b4:	9f ef 30 c6 	pushab 2ceea <__fini+0x10378>
   108b8:	01 00 
   108ba:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   108be:	00 00 ad 8c 
   108c2:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   108c6:	dd 50       	pushl r0
   108c8:	fb 03 ef 03 	calls $0x3,124d2 <strncpy>
   108cc:	1c 00 00 
   108cf:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   108d3:	9f ef 6c c6 	pushab 2cf45 <__fini+0x103d3>
   108d7:	01 00 
   108d9:	c0 8f 5a 00 	addl2 $0x0000005a,0xffffff8c(fp)
   108dd:	00 00 ad 8c 
   108e1:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   108e5:	dd 50       	pushl r0
   108e7:	fb 03 ef e4 	calls $0x3,124d2 <strncpy>
   108eb:	1b 00 00 
   108ee:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   108f2:	9f ef 9d c6 	pushab 2cf95 <__fini+0x10423>
   108f6:	01 00 
   108f8:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   108fc:	00 00 ad 8c 
   10900:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10904:	dd 50       	pushl r0
   10906:	fb 03 ef c5 	calls $0x3,124d2 <strncpy>
   1090a:	1b 00 00 
   1090d:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10911:	9f ef ce c6 	pushab 2cfe5 <__fini+0x10473>
   10915:	01 00 
   10917:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   1091b:	00 00 ad 8c 
   1091f:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10923:	dd 50       	pushl r0
   10925:	fb 03 ef a6 	calls $0x3,124d2 <strncpy>
   10929:	1b 00 00 
   1092c:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10930:	9f ef ff c6 	pushab 2d035 <__fini+0x104c3>
   10934:	01 00 
   10936:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   1093a:	00 00 ad 8c 
   1093e:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10942:	dd 50       	pushl r0
   10944:	fb 03 ef 87 	calls $0x3,124d2 <strncpy>
   10948:	1b 00 00 
   1094b:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   1094f:	9f ef 30 c7 	pushab 2d085 <__fini+0x10513>
   10953:	01 00 
   10955:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   10959:	00 00 ad 8c 
   1095d:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10961:	dd 50       	pushl r0
   10963:	fb 03 ef 68 	calls $0x3,124d2 <strncpy>
   10967:	1b 00 00 
   1096a:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   1096e:	9f ef 61 c7 	pushab 2d0d5 <__fini+0x10563>
   10972:	01 00 
   10974:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   10978:	00 00 ad 8c 
   1097c:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10980:	dd 50       	pushl r0
   10982:	fb 03 ef 49 	calls $0x3,124d2 <strncpy>
   10986:	1b 00 00 
   10989:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   1098d:	9f ef ea c1 	pushab 2cb7d <__fini+0x1000b>
   10991:	01 00 
   10993:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   10997:	00 00 ad 8c 
   1099b:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   1099f:	dd 50       	pushl r0
   109a1:	fb 03 ef 2a 	calls $0x3,124d2 <strncpy>
   109a5:	1b 00 00 
   109a8:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   109ac:	9f ef 73 c7 	pushab 2d125 <__fini+0x105b3>
   109b0:	01 00 
   109b2:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   109b6:	00 00 ad 8c 
   109ba:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   109be:	dd 50       	pushl r0
   109c0:	fb 03 ef 0b 	calls $0x3,124d2 <strncpy>
   109c4:	1b 00 00 
   109c7:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   109cb:	9f ef a4 c7 	pushab 2d175 <__fini+0x10603>
   109cf:	01 00 
   109d1:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   109d5:	00 00 ad 8c 
   109d9:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   109dd:	dd 50       	pushl r0
   109df:	fb 03 ef ec 	calls $0x3,124d2 <strncpy>
   109e3:	1a 00 00 
   109e6:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   109ea:	9f ef d5 c7 	pushab 2d1c5 <__fini+0x10653>
   109ee:	01 00 
   109f0:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   109f4:	00 00 ad 8c 
   109f8:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   109fc:	dd 50       	pushl r0
   109fe:	fb 03 ef cd 	calls $0x3,124d2 <strncpy>
   10a02:	1a 00 00 
   10a05:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10a09:	9f ef 06 c8 	pushab 2d215 <__fini+0x106a3>
   10a0d:	01 00 
   10a0f:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   10a13:	00 00 ad 8c 
   10a17:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10a1b:	dd 50       	pushl r0
   10a1d:	fb 03 ef ae 	calls $0x3,124d2 <strncpy>
   10a21:	1a 00 00 
   10a24:	9a 8f 4f 7e 	movzbl $0x4f,-(sp)
   10a28:	9f ef 4f c1 	pushab 2cb7d <__fini+0x1000b>
   10a2c:	01 00 
   10a2e:	c0 8f 4f 00 	addl2 $0x0000004f,0xffffff8c(fp)
   10a32:	00 00 ad 8c 
   10a36:	d0 ad 8c 50 	movl 0xffffff8c(fp),r0
   10a3a:	dd 50       	pushl r0
   10a3c:	fb 03 ef 8f 	calls $0x3,124d2 <strncpy>
   10a40:	1a 00 00 
   10a43:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10a47:	d5 c0 9c 00 	tstl 0x9c(r0)
   10a4b:	13 35       	beql 10a82 <draw+0x31a>
   10a4d:	9a 8f 63 7e 	movzbl $0x63,-(sp)
   10a51:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x000000a0,r0
   10a55:	a0 00 00 00 
   10a59:	50 
   10a5a:	dd 50       	pushl r0
   10a5c:	fb 02 ef 4b 	calls $0x2,1b1ae <strnlen>
   10a60:	a7 00 00 
   10a63:	dd 50       	pushl r0
   10a65:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x000000a0,r0
   10a69:	a0 00 00 00 
   10a6d:	50 
   10a6e:	dd 50       	pushl r0
   10a70:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x0000068c,r0
   10a74:	8c 06 00 00 
   10a78:	50 
   10a79:	dd 50       	pushl r0
   10a7b:	fb 03 ef b0 	calls $0x3,1b732 <memcpy>
   10a7f:	ac 00 00 
   10a82:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10a86:	d5 a0 34    	tstl 0x34(r0)
   10a89:	13 2d       	beql 10ab8 <draw+0x350>
   10a8b:	9a 8f 63 7e 	movzbl $0x63,-(sp)
   10a8f:	c1 ad 80 38 	addl3 0xffffff80(fp),$0x38,r0
   10a93:	50 
   10a94:	dd 50       	pushl r0
   10a96:	fb 02 ef 11 	calls $0x2,1b1ae <strnlen>
   10a9a:	a7 00 00 
   10a9d:	dd 50       	pushl r0
   10a9f:	c1 ad 80 38 	addl3 0xffffff80(fp),$0x38,r0
   10aa3:	50 
   10aa4:	dd 50       	pushl r0
   10aa6:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x000006dc,r0
   10aaa:	dc 06 00 00 
   10aae:	50 
   10aaf:	dd 50       	pushl r0
   10ab1:	fb 03 ef 7a 	calls $0x3,1b732 <memcpy>
   10ab5:	ac 00 00 
   10ab8:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10abc:	d5 c0 04 01 	tstl 0x104(r0)
   10ac0:	12 03       	bneq 10ac5 <draw+0x35d>
   10ac2:	31 cf 00    	brw 10b94 <draw+0x42c>
   10ac5:	9a 8f 8b 7e 	movzbl $0x8b,-(sp)
   10ac9:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000108,r0
   10acd:	08 01 00 00 
   10ad1:	50 
   10ad2:	dd 50       	pushl r0
   10ad4:	fb 02 ef d3 	calls $0x2,1b1ae <strnlen>
   10ad8:	a6 00 00 
   10adb:	d1 50 8f 4a 	cmpl r0,$0x0000004a
   10adf:	00 00 00 
   10ae2:	1a 37       	bgtru 10b1b <draw+0x3b3>
   10ae4:	9a 8f 8b 7e 	movzbl $0x8b,-(sp)
   10ae8:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000108,r0
   10aec:	08 01 00 00 
   10af0:	50 
   10af1:	dd 50       	pushl r0
   10af3:	fb 02 ef b4 	calls $0x2,1b1ae <strnlen>
   10af7:	a6 00 00 
   10afa:	dd 50       	pushl r0
   10afc:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000108,r0
   10b00:	08 01 00 00 
   10b04:	50 
   10b05:	dd 50       	pushl r0
   10b07:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x00000686,r0
   10b0b:	86 06 00 00 
   10b0f:	50 
   10b10:	dd 50       	pushl r0
   10b12:	fb 03 ef 19 	calls $0x3,1b732 <memcpy>
   10b16:	ac 00 00 
   10b19:	11 79       	brb 10b94 <draw+0x42c>
   10b1b:	9a 8f 4a 7e 	movzbl $0x4a,-(sp)
   10b1f:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000108,r0
   10b23:	08 01 00 00 
   10b27:	50 
   10b28:	dd 50       	pushl r0
   10b2a:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x00000686,r0
   10b2e:	86 06 00 00 
   10b32:	50 
   10b33:	dd 50       	pushl r0
   10b35:	fb 03 ef f6 	calls $0x3,1b732 <memcpy>
   10b39:	ab 00 00 
   10b3c:	9a 8f 8b 7e 	movzbl $0x8b,-(sp)
   10b40:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000108,r0
   10b44:	08 01 00 00 
   10b48:	50 
   10b49:	dd 50       	pushl r0
   10b4b:	fb 02 ef 5c 	calls $0x2,1b1ae <strnlen>
   10b4f:	a6 00 00 
   10b52:	d1 50 8f 4a 	cmpl r0,$0x0000004a
   10b56:	00 00 00 
   10b59:	13 39       	beql 10b94 <draw+0x42c>
   10b5b:	9a 8f 8b 7e 	movzbl $0x8b,-(sp)
   10b5f:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000108,r0
   10b63:	08 01 00 00 
   10b67:	50 
   10b68:	dd 50       	pushl r0
   10b6a:	fb 02 ef 3d 	calls $0x2,1b1ae <strnlen>
   10b6e:	a6 00 00 
   10b71:	9e a0 b6 50 	movab 0xffffffb6(r0),r0
   10b75:	dd 50       	pushl r0
   10b77:	c1 ad 80 8f 	addl3 0xffffff80(fp),$0x00000152,r0
   10b7b:	52 01 00 00 
   10b7f:	50 
   10b80:	dd 50       	pushl r0
   10b82:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x000006d5,r0
   10b86:	d5 06 00 00 
   10b8a:	50 
   10b8b:	dd 50       	pushl r0
   10b8d:	fb 03 ef 9e 	calls $0x3,1b732 <memcpy>
   10b91:	ab 00 00 
   10b94:	d0 ad 84 51 	movl 0xffffff84(fp),r1
   10b98:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10b9c:	81 a0 20 30 	addb3 0x20(r0),$0x30,0xb7(r1)
   10ba0:	c1 b7 00 
   10ba3:	d0 ad 84 51 	movl 0xffffff84(fp),r1
   10ba7:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10bab:	81 a0 1c 30 	addb3 0x1c(r0),$0x30,0x317(r1)
   10baf:	c1 17 03 
   10bb2:	d0 ad 84 51 	movl 0xffffff84(fp),r1
   10bb6:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10bba:	81 a0 30 30 	addb3 0x30(r0),$0x30,0xfd(r1)
   10bbe:	c1 fd 00 
   10bc1:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10bc5:	81 bd 80 30 	addb3 *0xffffff80(fp),$0x30,0x35d(r0)
   10bc9:	c0 5d 03 
   10bcc:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10bd0:	d1 a0 24 01 	cmpl 0x24(r0),$0x1
   10bd4:	12 0b       	bneq 10be1 <draw+0x479>
   10bd6:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10bda:	90 2a c0 c5 	movb $0x2a,0x1c5(r0)
   10bde:	01 
   10bdf:	11 09       	brb 10bea <draw+0x482>
   10be1:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10be5:	90 20 c0 c5 	movb $0x20,0x1c5(r0)
   10be9:	01 
   10bea:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10bee:	d1 a0 2c 01 	cmpl 0x2c(r0),$0x1
   10bf2:	12 0b       	bneq 10bff <draw+0x497>
   10bf4:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10bf8:	90 2a c0 11 	movb $0x2a,0x111(r0)
   10bfc:	01 
   10bfd:	11 09       	brb 10c08 <draw+0x4a0>
   10bff:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10c03:	90 20 c0 11 	movb $0x20,0x111(r0)
   10c07:	01 
   10c08:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10c0c:	d1 a0 28 01 	cmpl 0x28(r0),$0x1
   10c10:	12 0b       	bneq 10c1d <draw+0x4b5>
   10c12:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10c16:	90 2a c0 6b 	movb $0x2a,0x16b(r0)
   10c1a:	01 
   10c1b:	11 09       	brb 10c26 <draw+0x4be>
   10c1d:	d0 ad 84 50 	movl 0xffffff84(fp),r0
   10c21:	90 20 c0 6b 	movb $0x20,0x16b(r0)
   10c25:	01 
   10c26:	d4 ad 88    	clrf 0xffffff88(fp)
   10c29:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10c2d:	56 a0 04 50 	cvtfd 0x4(r0),r0
   10c31:	70 50 7e    	movd r0,-(sp)
   10c34:	9f ef 2b c6 	pushab 2d265 <__fini+0x106f3>
   10c38:	01 00 
   10c3a:	c3 3c 5d 50 	subl3 $0x3c,fp,r0
   10c3e:	dd 50       	pushl r0
   10c40:	fb 04 ef dd 	calls $0x4,12524 <sprintf>
   10c44:	18 00 00 
   10c47:	d0 50 ad 88 	movl r0,0xffffff88(fp)
   10c4b:	d5 ad 88    	tstl 0xffffff88(fp)
   10c4e:	18 03       	bgeq 10c53 <draw+0x4eb>
   10c50:	31 81 00    	brw 10cd4 <draw+0x56c>
   10c53:	d1 ad 88 31 	cmpl 0xffffff88(fp),$0x31
   10c57:	14 7b       	bgtr 10cd4 <draw+0x56c>
   10c59:	d0 ad 80 50 	movl 0xffffff80(fp),r0
   10c5d:	56 a0 08 50 	cvtfd 0x8(r0),r0
   10c61:	70 50 7e    	movd r0,-(sp)
   10c64:	9f ef fb c5 	pushab 2d265 <__fini+0x106f3>
   10c68:	01 00 
   10c6a:	9e ad 90 50 	movab 0xffffff90(fp),r0
   10c6e:	dd 50       	pushl r0
   10c70:	fb 04 ef ad 	calls $0x4,12524 <sprintf>
   10c74:	18 00 00 
   10c77:	d0 50 ad 88 	movl r0,0xffffff88(fp)
   10c7b:	d5 ad 88    	tstl 0xffffff88(fp)
   10c7e:	19 54       	blss 10cd4 <draw+0x56c>
   10c80:	d1 ad 88 31 	cmpl 0xffffff88(fp),$0x31
   10c84:	14 4e       	bgtr 10cd4 <draw+0x56c>
   10c86:	c3 3c 5d 50 	subl3 $0x3c,fp,r0
   10c8a:	dd 50       	pushl r0
   10c8c:	fb 01 ef d3 	calls $0x1,1b966 <strlen>
   10c90:	ac 00 00 
   10c93:	dd 50       	pushl r0
   10c95:	c3 3c 5d 50 	subl3 $0x3c,fp,r0
   10c99:	dd 50       	pushl r0
   10c9b:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x00000560,r0
   10c9f:	60 05 00 00 
   10ca3:	50 
   10ca4:	dd 50       	pushl r0
   10ca6:	fb 03 ef 85 	calls $0x3,1b732 <memcpy>
   10caa:	aa 00 00 
   10cad:	9e ad 90 50 	movab 0xffffff90(fp),r0
   10cb1:	dd 50       	pushl r0
   10cb3:	fb 01 ef ac 	calls $0x1,1b966 <strlen>
   10cb7:	ac 00 00 
   10cba:	dd 50       	pushl r0
   10cbc:	9e ad 90 50 	movab 0xffffff90(fp),r0
   10cc0:	dd 50       	pushl r0
   10cc2:	c1 ad 84 8f 	addl3 0xffffff84(fp),$0x00000575,r0
   10cc6:	75 05 00 00 
   10cca:	50 
   10ccb:	dd 50       	pushl r0
   10ccd:	fb 03 ef 5e 	calls $0x3,1b732 <memcpy>
   10cd1:	aa 00 00 
   10cd4:	d1 ad f8 ef 	cmpl 0xfffffff8(fp),3ee34 <__guard_local>
   10cd8:	58 e1 02 00 
   10cdc:	13 10       	beql 10cee <draw+0x586>
   10cde:	dd ad f8    	pushl 0xfffffff8(fp)
   10ce1:	9f ef 81 c5 	pushab 2d268 <__fini+0x106f6>
   10ce5:	01 00 
   10ce7:	fb 02 ef c2 	calls $0x2,1b6b0 <__stack_smash_handler>
   10ceb:	a9 00 00 
   10cee:	04          	ret
   10cef:	01          	nop

00010cf0 <error>:
   10cf0:	00 00       	.word 0x0000 # Entry mask: < >
   10cf2:	c2 04 5e    	subl2 $0x4,sp
   10cf5:	d0 ac 04 50 	movl 0x4(ap),r0
   10cf9:	d0 01 a0 34 	movl $0x1,0x34(r0)
   10cfd:	9a 8f 63 7e 	movzbl $0x63,-(sp)
   10d01:	dd ac 08    	pushl 0x8(ap)
   10d04:	c1 ac 04 38 	addl3 0x4(ap),$0x38,r0
   10d08:	50 
   10d09:	dd 50       	pushl r0
   10d0b:	fb 03 ef c0 	calls $0x3,124d2 <strncpy>
   10d0f:	17 00 00 
   10d12:	d0 ac 04 50 	movl 0x4(ap),r0
   10d16:	94 c0 9b 00 	clrb 0x9b(r0)
   10d1a:	04          	ret
   10d1b:	01          	nop

00010d1c <info>:
   10d1c:	00 00       	.word 0x0000 # Entry mask: < >
   10d1e:	c2 04 5e    	subl2 $0x4,sp
   10d21:	d0 ac 04 50 	movl 0x4(ap),r0
   10d25:	d0 01 c0 9c 	movl $0x1,0x9c(r0)
   10d29:	00 
   10d2a:	9a 8f 63 7e 	movzbl $0x63,-(sp)
   10d2e:	dd ac 08    	pushl 0x8(ap)
   10d31:	c1 ac 04 8f 	addl3 0x4(ap),$0x000000a0,r0
   10d35:	a0 00 00 00 
   10d39:	50 
   10d3a:	dd 50       	pushl r0
   10d3c:	fb 03 ef 8f 	calls $0x3,124d2 <strncpy>
   10d40:	17 00 00 
   10d43:	d0 ac 04 50 	movl 0x4(ap),r0
   10d47:	94 c0 9b 00 	clrb 0x9b(r0)
   10d4b:	04          	ret

00010d4c <flag>:
   10d4c:	00 00       	.word 0x0000 # Entry mask: < >
   10d4e:	c2 04 5e    	subl2 $0x4,sp
   10d51:	d0 ac 04 50 	movl 0x4(ap),r0
   10d55:	d0 01 c0 04 	movl $0x1,0x104(r0)
   10d59:	01 
   10d5a:	9a 8f 8c 7e 	movzbl $0x8c,-(sp)
   10d5e:	dd ac 08    	pushl 0x8(ap)
   10d61:	c1 ac 04 8f 	addl3 0x4(ap),$0x00000108,r0
   10d65:	08 01 00 00 
   10d69:	50 
   10d6a:	dd 50       	pushl r0
   10d6c:	fb 03 ef 5f 	calls $0x3,124d2 <strncpy>
   10d70:	17 00 00 
   10d73:	04          	ret

00010d74 <ADCS_module>:
   10d74:	40 00       	.word 0x0040 # Entry mask: < r6 >
   10d76:	9e ce 84 fd 	movab 0xfffffd84(sp),sp
   10d7a:	5e 
   10d7b:	d0 ef b3 e0 	movl 3ee34 <__guard_local>,0xfffffff8(fp)
   10d7f:	02 00 ad f8 
   10d83:	d0 ac 08 cd 	movl 0x8(ap),0xfffffd8c(fp)
   10d87:	8c fd 
   10d89:	d0 ac 0c cd 	movl 0xc(ap),0xfffffd88(fp)
   10d8d:	88 fd 
   10d8f:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   10d93:	50 
   10d94:	d1 a0 24 01 	cmpl 0x24(r0),$0x1
   10d98:	13 19       	beql 10db3 <ADCS_module+0x3f>
   10d9a:	9f ef cd c4 	pushab 2d26d <__fini+0x106fb>
   10d9e:	01 00 
   10da0:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10da4:	fb 02 ef 45 	calls $0x2,10cf0 <error>
   10da8:	ff ff ff 
   10dab:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10daf:	fd 
   10db0:	31 3f 07    	brw 114f2 <ADCS_module+0x77e>
   10db3:	d1 ac 04 01 	cmpl 0x4(ap),$0x1
   10db7:	14 19       	bgtr 10dd2 <ADCS_module+0x5e>
   10db9:	9f ef ae c4 	pushab 2d26d <__fini+0x106fb>
   10dbd:	01 00 
   10dbf:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10dc3:	fb 02 ef 26 	calls $0x2,10cf0 <error>
   10dc7:	ff ff ff 
   10dca:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10dce:	fd 
   10dcf:	31 20 07    	brw 114f2 <ADCS_module+0x77e>
   10dd2:	dd 08       	pushl $0x8
   10dd4:	9f ef 9e c4 	pushab 2d278 <__fini+0x10706>
   10dd8:	01 00 
   10dda:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10dde:	50 
   10ddf:	dd a0 04    	pushl 0x4(r0)
   10de2:	fb 03 ef 1f 	calls $0x3,15408 <strncmp>
   10de6:	46 00 00 
   10de9:	d5 50       	tstl r0
   10deb:	13 03       	beql 10df0 <ADCS_module+0x7c>
   10ded:	31 97 05    	brw 11387 <ADCS_module+0x613>
   10df0:	d1 dd 88 fd 	cmpl *0xfffffd88(fp),$0x2
   10df4:	02 
   10df5:	13 19       	beql 10e10 <ADCS_module+0x9c>
   10df7:	9f ef 70 c4 	pushab 2d26d <__fini+0x106fb>
   10dfb:	01 00 
   10dfd:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10e01:	fb 02 ef e8 	calls $0x2,10cf0 <error>
   10e05:	fe ff ff 
   10e08:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10e0c:	fd 
   10e0d:	31 e2 06    	brw 114f2 <ADCS_module+0x77e>
   10e10:	d1 ac 04 04 	cmpl 0x4(ap),$0x4
   10e14:	14 19       	bgtr 10e2f <ADCS_module+0xbb>
   10e16:	9f ef 51 c4 	pushab 2d26d <__fini+0x106fb>
   10e1a:	01 00 
   10e1c:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10e20:	fb 02 ef c9 	calls $0x2,10cf0 <error>
   10e24:	fe ff ff 
   10e27:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10e2b:	fd 
   10e2c:	31 c3 06    	brw 114f2 <ADCS_module+0x77e>
   10e2f:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10e33:	50 
   10e34:	dd a0 08    	pushl 0x8(r0)
   10e37:	fb 01 ef 28 	calls $0x1,1b966 <strlen>
   10e3b:	ab 00 00 
   10e3e:	d1 50 08    	cmpl r0,$0x8
   10e41:	13 19       	beql 10e5c <ADCS_module+0xe8>
   10e43:	9f ef 37 c4 	pushab 2d280 <__fini+0x1070e>
   10e47:	01 00 
   10e49:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10e4d:	fb 02 ef 9c 	calls $0x2,10cf0 <error>
   10e51:	fe ff ff 
   10e54:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10e58:	fd 
   10e59:	31 96 06    	brw 114f2 <ADCS_module+0x77e>
   10e5c:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10e60:	50 
   10e61:	dd a0 0c    	pushl 0xc(r0)
   10e64:	fb 01 ef fb 	calls $0x1,1b966 <strlen>
   10e68:	aa 00 00 
   10e6b:	d1 50 08    	cmpl r0,$0x8
   10e6e:	13 19       	beql 10e89 <ADCS_module+0x115>
   10e70:	9f ef 33 c4 	pushab 2d2a9 <__fini+0x10737>
   10e74:	01 00 
   10e76:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10e7a:	fb 02 ef 6f 	calls $0x2,10cf0 <error>
   10e7e:	fe ff ff 
   10e81:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10e85:	fd 
   10e86:	31 69 06    	brw 114f2 <ADCS_module+0x77e>
   10e89:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10e8d:	50 
   10e8e:	dd a0 10    	pushl 0x10(r0)
   10e91:	fb 01 ef ce 	calls $0x1,1b966 <strlen>
   10e95:	aa 00 00 
   10e98:	d1 50 20    	cmpl r0,$0x20
   10e9b:	13 19       	beql 10eb6 <ADCS_module+0x142>
   10e9d:	9f ef 30 c4 	pushab 2d2d3 <__fini+0x10761>
   10ea1:	01 00 
   10ea3:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10ea7:	fb 02 ef 42 	calls $0x2,10cf0 <error>
   10eab:	fe ff ff 
   10eae:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10eb2:	fd 
   10eb3:	31 3c 06    	brw 114f2 <ADCS_module+0x77e>
   10eb6:	dd 08       	pushl $0x8
   10eb8:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10ebc:	50 
   10ebd:	dd a0 08    	pushl 0x8(r0)
   10ec0:	fb 02 ef 0f 	calls $0x2,103d6 <testHex>
   10ec4:	f5 ff ff 
   10ec7:	d5 50       	tstl r0
   10ec9:	13 19       	beql 10ee4 <ADCS_module+0x170>
   10ecb:	9f ef 2b c4 	pushab 2d2fc <__fini+0x1078a>
   10ecf:	01 00 
   10ed1:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10ed5:	fb 02 ef 14 	calls $0x2,10cf0 <error>
   10ed9:	fe ff ff 
   10edc:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10ee0:	fd 
   10ee1:	31 0e 06    	brw 114f2 <ADCS_module+0x77e>
   10ee4:	dd 08       	pushl $0x8
   10ee6:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10eea:	50 
   10eeb:	dd a0 0c    	pushl 0xc(r0)
   10eee:	fb 02 ef e1 	calls $0x2,103d6 <testHex>
   10ef2:	f4 ff ff 
   10ef5:	d5 50       	tstl r0
   10ef7:	13 19       	beql 10f12 <ADCS_module+0x19e>
   10ef9:	9f ef 28 c4 	pushab 2d327 <__fini+0x107b5>
   10efd:	01 00 
   10eff:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10f03:	fb 02 ef e6 	calls $0x2,10cf0 <error>
   10f07:	fd ff ff 
   10f0a:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10f0e:	fd 
   10f0f:	31 e0 05    	brw 114f2 <ADCS_module+0x77e>
   10f12:	dd 20       	pushl $0x20
   10f14:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10f18:	50 
   10f19:	dd a0 10    	pushl 0x10(r0)
   10f1c:	fb 02 ef b3 	calls $0x2,103d6 <testHex>
   10f20:	f4 ff ff 
   10f23:	d5 50       	tstl r0
   10f25:	13 19       	beql 10f40 <ADCS_module+0x1cc>
   10f27:	9f ef 26 c4 	pushab 2d353 <__fini+0x107e1>
   10f2b:	01 00 
   10f2d:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   10f31:	fb 02 ef b8 	calls $0x2,10cf0 <error>
   10f35:	fd ff ff 
   10f38:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   10f3c:	fd 
   10f3d:	31 b2 05    	brw 114f2 <ADCS_module+0x77e>
   10f40:	dd 10       	pushl $0x10
   10f42:	d4 7e       	clrf -(sp)
   10f44:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10f48:	50 
   10f49:	dd a0 08    	pushl 0x8(r0)
   10f4c:	fb 03 ef 57 	calls $0x3,125aa <strtoul>
   10f50:	16 00 00 
   10f53:	d0 50 cd b4 	movl r0,0xfffffdb4(fp)
   10f57:	fd 
   10f58:	dd 10       	pushl $0x10
   10f5a:	d4 7e       	clrf -(sp)
   10f5c:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10f60:	50 
   10f61:	dd a0 0c    	pushl 0xc(r0)
   10f64:	fb 03 ef 3f 	calls $0x3,125aa <strtoul>
   10f68:	16 00 00 
   10f6b:	d0 50 cd b0 	movl r0,0xfffffdb0(fp)
   10f6f:	fd 
   10f70:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   10f74:	50 
   10f75:	7c 60       	clrd (r0)
   10f77:	c0 08 50    	addl2 $0x8,r0
   10f7a:	7c 60       	clrd (r0)
   10f7c:	c0 08 50    	addl2 $0x8,r0
   10f7f:	7c 60       	clrd (r0)
   10f81:	c0 08 50    	addl2 $0x8,r0
   10f84:	7c 60       	clrd (r0)
   10f86:	c0 08 50    	addl2 $0x8,r0
   10f89:	d4 60       	clrf (r0)
   10f8b:	dd 08       	pushl $0x8
   10f8d:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10f91:	50 
   10f92:	dd a0 10    	pushl 0x10(r0)
   10f95:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   10f99:	50 
   10f9a:	dd 50       	pushl r0
   10f9c:	fb 03 ef 2f 	calls $0x3,124d2 <strncpy>
   10fa0:	15 00 00 
   10fa3:	dd 08       	pushl $0x8
   10fa5:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10fa9:	50 
   10faa:	c1 a0 10 08 	addl3 0x10(r0),$0x8,r0
   10fae:	50 
   10faf:	dd 50       	pushl r0
   10fb1:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   10fb5:	50 
   10fb6:	c0 09 50    	addl2 $0x9,r0
   10fb9:	dd 50       	pushl r0
   10fbb:	fb 03 ef 10 	calls $0x3,124d2 <strncpy>
   10fbf:	15 00 00 
   10fc2:	dd 08       	pushl $0x8
   10fc4:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10fc8:	50 
   10fc9:	c1 a0 10 10 	addl3 0x10(r0),$0x10,r0
   10fcd:	50 
   10fce:	dd 50       	pushl r0
   10fd0:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   10fd4:	50 
   10fd5:	c0 12 50    	addl2 $0x12,r0
   10fd8:	dd 50       	pushl r0
   10fda:	fb 03 ef f1 	calls $0x3,124d2 <strncpy>
   10fde:	14 00 00 
   10fe1:	dd 08       	pushl $0x8
   10fe3:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   10fe7:	50 
   10fe8:	c1 a0 10 18 	addl3 0x10(r0),$0x18,r0
   10fec:	50 
   10fed:	dd 50       	pushl r0
   10fef:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   10ff3:	50 
   10ff4:	c0 1b 50    	addl2 $0x1b,r0
   10ff7:	dd 50       	pushl r0
   10ff9:	fb 03 ef d2 	calls $0x3,124d2 <strncpy>
   10ffd:	14 00 00 
   11000:	7c cd 50 fe 	clrd 0xfffffe50(fp)
   11004:	7c cd 58 fe 	clrd 0xfffffe58(fp)
   11008:	dd 10       	pushl $0x10
   1100a:	d4 7e       	clrf -(sp)
   1100c:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   11010:	50 
   11011:	dd 50       	pushl r0
   11013:	fb 03 ef 90 	calls $0x3,125aa <strtoul>
   11017:	15 00 00 
   1101a:	d0 50 cd 50 	movl r0,0xfffffe50(fp)
   1101e:	fe 
   1101f:	dd 10       	pushl $0x10
   11021:	d4 7e       	clrf -(sp)
   11023:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   11027:	50 
   11028:	c0 09 50    	addl2 $0x9,r0
   1102b:	dd 50       	pushl r0
   1102d:	fb 03 ef 76 	calls $0x3,125aa <strtoul>
   11031:	15 00 00 
   11034:	d0 50 cd 54 	movl r0,0xfffffe54(fp)
   11038:	fe 
   11039:	dd 10       	pushl $0x10
   1103b:	d4 7e       	clrf -(sp)
   1103d:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   11041:	50 
   11042:	c0 12 50    	addl2 $0x12,r0
   11045:	dd 50       	pushl r0
   11047:	fb 03 ef 5c 	calls $0x3,125aa <strtoul>
   1104b:	15 00 00 
   1104e:	d0 50 cd 58 	movl r0,0xfffffe58(fp)
   11052:	fe 
   11053:	dd 10       	pushl $0x10
   11055:	d4 7e       	clrf -(sp)
   11057:	9e cd 60 fe 	movab 0xfffffe60(fp),r0
   1105b:	50 
   1105c:	c0 1b 50    	addl2 $0x1b,r0
   1105f:	dd 50       	pushl r0
   11061:	fb 03 ef 42 	calls $0x3,125aa <strtoul>
   11065:	15 00 00 
   11068:	d0 50 cd 5c 	movl r0,0xfffffe5c(fp)
   1106c:	fe 
   1106d:	9e cd 50 fe 	movab 0xfffffe50(fp),r0
   11071:	50 
   11072:	dd 50       	pushl r0
   11074:	dd cd b4 fd 	pushl 0xfffffdb4(fp)
   11078:	dd cd b0 fd 	pushl 0xfffffdb0(fp)
   1107c:	9e cd e4 fd 	movab 0xfffffde4(fp),r0
   11080:	50 
   11081:	dd 50       	pushl r0
   11083:	fb 04 ef 18 	calls $0x4,123a2 <breakdown_coordinates>
   11087:	13 00 00 
   1108a:	d0 2c cd ac 	movl $0x2c,0xfffffdac(fp)
   1108e:	fd 
   1108f:	9a 8f 40 cd 	movzbl $0x40,0xfffffda8(fp)
   11093:	a8 fd 
   11095:	3c 8f 64 a2 	movzwl $0xa264,0xfffffda4(fp)
   11099:	cd a4 fd 
   1109c:	dd cd a4 fd 	pushl 0xfffffda4(fp)
   110a0:	dd cd a8 fd 	pushl 0xfffffda8(fp)
   110a4:	dd cd ac fd 	pushl 0xfffffdac(fp)
   110a8:	9e cd e4 fd 	movab 0xfffffde4(fp),r0
   110ac:	50 
   110ad:	dd 50       	pushl r0
   110af:	9e cd 24 fe 	movab 0xfffffe24(fp),r0
   110b3:	50 
   110b4:	dd 50       	pushl r0
   110b6:	9f ef a0 dd 	pushab 5ee5c <op>
   110ba:	04 00 
   110bc:	fb 06 ef 3b 	calls $0x6,121fe <execute_operation>
   110c0:	11 00 00 
   110c3:	9f ef b5 c2 	pushab 2d37e <__fini+0x1080c>
   110c7:	01 00 
   110c9:	9f ef b1 c2 	pushab 2d380 <__fini+0x1080e>
   110cd:	01 00 
   110cf:	fb 02 ef 10 	calls $0x2,14fe6 <fopen>
   110d3:	3f 00 00 
   110d6:	d0 50 cd a0 	movl r0,0xfffffda0(fp)
   110da:	fd 
   110db:	d5 cd a0 fd 	tstl 0xfffffda0(fp)
   110df:	12 19       	bneq 110fa <ADCS_module+0x386>
   110e1:	9f ef a8 c2 	pushab 2d38f <__fini+0x1081d>
   110e5:	01 00 
   110e7:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   110eb:	fb 02 ef fe 	calls $0x2,10cf0 <error>
   110ef:	fb ff ff 
   110f2:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   110f6:	fd 
   110f7:	31 f8 03    	brw 114f2 <ADCS_module+0x77e>
   110fa:	dd cd a0 fd 	pushl 0xfffffda0(fp)
   110fe:	dd 2c       	pushl $0x2c
   11100:	dd 01       	pushl $0x1
   11102:	9e cd b8 fd 	movab 0xfffffdb8(fp),r0
   11106:	50 
   11107:	dd 50       	pushl r0
   11109:	fb 04 ef 7e 	calls $0x4,1508e <fread>
   1110d:	3f 00 00 
   11110:	d0 50 cd 98 	movl r0,0xfffffd98(fp)
   11114:	fd 
   11115:	d5 cd 98 fd 	tstl 0xfffffd98(fp)
   11119:	13 09       	beql 11124 <ADCS_module+0x3b0>
   1111b:	d1 cd 98 fd 	cmpl 0xfffffd98(fp),$0x2c
   1111f:	2c 
   11120:	1a 02       	bgtru 11124 <ADCS_module+0x3b0>
   11122:	11 15       	brb 11139 <ADCS_module+0x3c5>
   11124:	9f ef 75 c2 	pushab 2d39f <__fini+0x1082d>
   11128:	01 00 
   1112a:	fb 01 ef ad 	calls $0x1,129de <printf>
   1112e:	18 00 00 
   11131:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   11135:	fd 
   11136:	31 b9 03    	brw 114f2 <ADCS_module+0x77e>
   11139:	dd 2c       	pushl $0x2c
   1113b:	9e cd 24 fe 	movab 0xfffffe24(fp),r0
   1113f:	50 
   11140:	dd 50       	pushl r0
   11142:	fb 02 ef 65 	calls $0x2,1b1ae <strnlen>
   11146:	a0 00 00 
   11149:	dd 50       	pushl r0
   1114b:	9e cd 24 fe 	movab 0xfffffe24(fp),r0
   1114f:	50 
   11150:	dd 50       	pushl r0
   11152:	9e cd b8 fd 	movab 0xfffffdb8(fp),r0
   11156:	50 
   11157:	dd 50       	pushl r0
   11159:	fb 03 ef a8 	calls $0x3,15408 <strncmp>
   1115d:	42 00 00 
   11160:	d5 50       	tstl r0
   11162:	13 03       	beql 11167 <ADCS_module+0x3f3>
   11164:	31 3b 01    	brw 112a2 <ADCS_module+0x52e>
   11167:	9f ef 11 c2 	pushab 2d37e <__fini+0x1080c>
   1116b:	01 00 
   1116d:	9f ef 57 c2 	pushab 2d3ca <__fini+0x10858>
   11171:	01 00 
   11173:	fb 02 ef 6c 	calls $0x2,14fe6 <fopen>
   11177:	3e 00 00 
   1117a:	d0 50 cd 9c 	movl r0,0xfffffd9c(fp)
   1117e:	fd 
   1117f:	d5 cd 9c fd 	tstl 0xfffffd9c(fp)
   11183:	12 19       	bneq 1119e <ADCS_module+0x42a>
   11185:	9f ef 04 c2 	pushab 2d38f <__fini+0x1081d>
   11189:	01 00 
   1118b:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   1118f:	fb 02 ef 5a 	calls $0x2,10cf0 <error>
   11193:	fb ff ff 
   11196:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   1119a:	fd 
   1119b:	31 54 03    	brw 114f2 <ADCS_module+0x77e>
   1119e:	d4 cd 94 fd 	clrf 0xfffffd94(fp)
   111a2:	dd cd 9c fd 	pushl 0xfffffd9c(fp)
   111a6:	9a 8f 82 7e 	movzbl $0x82,-(sp)
   111aa:	dd 01       	pushl $0x1
   111ac:	9e cd 74 ff 	movab 0xffffff74(fp),r0
   111b0:	50 
   111b1:	dd 50       	pushl r0
   111b3:	fb 04 ef d4 	calls $0x4,1508e <fread>
   111b7:	3e 00 00 
   111ba:	d0 50 cd 94 	movl r0,0xfffffd94(fp)
   111be:	fd 
   111bf:	d5 cd 94 fd 	tstl 0xfffffd94(fp)
   111c3:	13 0d       	beql 111d2 <ADCS_module+0x45e>
   111c5:	d1 cd 94 fd 	cmpl 0xfffffd94(fp),$0x00000082
   111c9:	8f 82 00 00 
   111cd:	00 
   111ce:	14 02       	bgtr 111d2 <ADCS_module+0x45e>
   111d0:	11 15       	brb 111e7 <ADCS_module+0x473>
   111d2:	9f ef fb c1 	pushab 2d3d3 <__fini+0x10861>
   111d6:	01 00 
   111d8:	fb 01 ef ff 	calls $0x1,129de <printf>
   111dc:	17 00 00 
   111df:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   111e3:	fd 
   111e4:	31 0b 03    	brw 114f2 <ADCS_module+0x77e>
   111e7:	28 06 ef 0a 	movc3 $0x6,2d3f8 <__fini+0x10886>,0xfffffee8(fp)
   111eb:	c2 01 00 cd 
   111ef:	e8 fe 
   111f1:	9e cd ee fe 	movab 0xfffffeee(fp),r1
   111f5:	51 
   111f6:	9a 8f 86 50 	movzbl $0x86,r0
   111fa:	dd 50       	pushl r0
   111fc:	d4 7e       	clrf -(sp)
   111fe:	dd 51       	pushl r1
   11200:	fb 03 ef 35 	calls $0x3,1b93c <memset>
   11204:	a7 00 00 
   11207:	dd cd 94 fd 	pushl 0xfffffd94(fp)
   1120b:	9e cd 74 ff 	movab 0xffffff74(fp),r0
   1120f:	50 
   11210:	dd 50       	pushl r0
   11212:	9e cd e8 fe 	movab 0xfffffee8(fp),r0
   11216:	50 
   11217:	c0 05 50    	addl2 $0x5,r0
   1121a:	dd 50       	pushl r0
   1121c:	fb 03 ef 0f 	calls $0x3,1b732 <memcpy>
   11220:	a5 00 00 
   11223:	9e cd e8 fe 	movab 0xfffffee8(fp),r0
   11227:	50 
   11228:	dd 50       	pushl r0
   1122a:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   1122e:	fb 02 ef 17 	calls $0x2,10d4c <flag>
   11232:	fb ff ff 
   11235:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   11239:	50 
   1123a:	d0 cd b4 fd 	movl 0xfffffdb4(fp),0x4(r0)
   1123e:	a0 04 
   11240:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   11244:	50 
   11245:	d0 cd b0 fd 	movl 0xfffffdb0(fp),0x8(r0)
   11249:	a0 08 
   1124b:	d0 cd 88 fd 	movl 0xfffffd88(fp),r6
   1124f:	56 
   11250:	dd cd b4 fd 	pushl 0xfffffdb4(fp)
   11254:	fb 01 ef 81 	calls $0x1,105dc <uint2IEEE754>
   11258:	f3 ff ff 
   1125b:	50 50 a6 04 	movf r0,0x4(r6)
   1125f:	d0 cd 88 fd 	movl 0xfffffd88(fp),r6
   11263:	56 
   11264:	dd cd b0 fd 	pushl 0xfffffdb0(fp)
   11268:	fb 01 ef 6d 	calls $0x1,105dc <uint2IEEE754>
   1126c:	f3 ff ff 
   1126f:	50 50 a6 08 	movf r0,0x8(r6)
   11273:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   11277:	50 
   11278:	d0 cd 50 fe 	movl 0xfffffe50(fp),0xc(r0)
   1127c:	a0 0c 
   1127e:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   11282:	50 
   11283:	d0 cd 54 fe 	movl 0xfffffe54(fp),0x10(r0)
   11287:	a0 10 
   11289:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   1128d:	50 
   1128e:	d0 cd 58 fe 	movl 0xfffffe58(fp),0x14(r0)
   11292:	a0 14 
   11294:	d0 cd 88 fd 	movl 0xfffffd88(fp),r0
   11298:	50 
   11299:	d0 cd 5c fe 	movl 0xfffffe5c(fp),0x18(r0)
   1129d:	a0 18 
   1129f:	31 4c 02    	brw 114ee <ADCS_module+0x77a>
   112a2:	28 16 ef db 	movc3 $0x16,2d484 <__fini+0x10912>,0xfffffe84(fp)
   112a6:	c1 01 00 cd 
   112aa:	84 fe 
   112ac:	9e cd 9a fe 	movab 0xfffffe9a(fp),r0
   112b0:	50 
   112b1:	7c 60       	clrd (r0)
   112b3:	c0 08 50    	addl2 $0x8,r0
   112b6:	7c 60       	clrd (r0)
   112b8:	c0 08 50    	addl2 $0x8,r0
   112bb:	7c 60       	clrd (r0)
   112bd:	c0 08 50    	addl2 $0x8,r0
   112c0:	7c 60       	clrd (r0)
   112c2:	c0 08 50    	addl2 $0x8,r0
   112c5:	7c 60       	clrd (r0)
   112c7:	c0 08 50    	addl2 $0x8,r0
   112ca:	7c 60       	clrd (r0)
   112cc:	c0 08 50    	addl2 $0x8,r0
   112cf:	7c 60       	clrd (r0)
   112d1:	c0 08 50    	addl2 $0x8,r0
   112d4:	7c 60       	clrd (r0)
   112d6:	c0 08 50    	addl2 $0x8,r0
   112d9:	7c 60       	clrd (r0)
   112db:	c0 08 50    	addl2 $0x8,r0
   112de:	d4 60       	clrf (r0)
   112e0:	c0 04 50    	addl2 $0x4,r0
   112e3:	b4 60       	clrw (r0)
   112e5:	d4 cd 94 fd 	clrf 0xfffffd94(fp)
   112e9:	d1 cd 94 fd 	cmpl 0xfffffd94(fp),0xfffffdac(fp)
   112ed:	cd ac fd 
   112f0:	19 02       	blss 112f4 <ADCS_module+0x580>
   112f2:	11 7e       	brb 11372 <ADCS_module+0x5fe>
   112f4:	9e cd 24 fe 	movab 0xfffffe24(fp),r0
   112f8:	50 
   112f9:	c0 cd 94 fd 	addl2 0xfffffd94(fp),r0
   112fd:	50 
   112fe:	91 60 1f    	cmpb (r0),$0x1f
   11301:	15 68       	bleq 1136b <ADCS_module+0x5f7>
   11303:	9e cd 24 fe 	movab 0xfffffe24(fp),r0
   11307:	50 
   11308:	c0 cd 94 fd 	addl2 0xfffffd94(fp),r0
   1130c:	50 
   1130d:	91 60 8f 7f 	cmpb (r0),$0x7f
   11311:	13 58       	beql 1136b <ADCS_module+0x5f7>
   11313:	d4 cd 90 fd 	clrf 0xfffffd90(fp)
   11317:	9e cd 24 fe 	movab 0xfffffe24(fp),r0
   1131b:	50 
   1131c:	c0 cd 94 fd 	addl2 0xfffffd94(fp),r0
   11320:	50 
   11321:	98 60 50    	cvtbl (r0),r0
   11324:	dd 50       	pushl r0
   11326:	9f ef bc c1 	pushab 2d4e8 <__fini+0x10976>
   1132a:	01 00 
   1132c:	9e cd 84 fe 	movab 0xfffffe84(fp),r6
   11330:	56 
   11331:	9a 8f 63 7e 	movzbl $0x63,-(sp)
   11335:	9e cd 84 fe 	movab 0xfffffe84(fp),r0
   11339:	50 
   1133a:	dd 50       	pushl r0
   1133c:	fb 02 ef 6b 	calls $0x2,1b1ae <strnlen>
   11340:	9e 00 00 
   11343:	c0 56 50    	addl2 r6,r0
   11346:	dd 50       	pushl r0
   11348:	fb 03 ef d5 	calls $0x3,12524 <sprintf>
   1134c:	11 00 00 
   1134f:	d0 50 cd 90 	movl r0,0xfffffd90(fp)
   11353:	fd 
   11354:	d5 cd 90 fd 	tstl 0xfffffd90(fp)
   11358:	19 09       	blss 11363 <ADCS_module+0x5ef>
   1135a:	d1 cd 90 fd 	cmpl 0xfffffd90(fp),$0x31
   1135e:	31 
   1135f:	14 02       	bgtr 11363 <ADCS_module+0x5ef>
   11361:	11 08       	brb 1136b <ADCS_module+0x5f7>
   11363:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   11367:	fd 
   11368:	31 87 01    	brw 114f2 <ADCS_module+0x77e>
   1136b:	d6 cd 94 fd 	incl 0xfffffd94(fp)
   1136f:	31 77 ff    	brw 112e9 <ADCS_module+0x575>
   11372:	9e cd 84 fe 	movab 0xfffffe84(fp),r0
   11376:	50 
   11377:	dd 50       	pushl r0
   11379:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   1137d:	fb 02 ef 6c 	calls $0x2,10cf0 <error>
   11381:	f9 ff ff 
   11384:	31 67 01    	brw 114ee <ADCS_module+0x77a>
   11387:	dd 04       	pushl $0x4
   11389:	9f ef 5c c1 	pushab 2d4eb <__fini+0x10979>
   1138d:	01 00 
   1138f:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   11393:	50 
   11394:	dd a0 04    	pushl 0x4(r0)
   11397:	fb 03 ef 6a 	calls $0x3,15408 <strncmp>
   1139b:	40 00 00 
   1139e:	d5 50       	tstl r0
   113a0:	12 14       	bneq 113b6 <ADCS_module+0x642>
   113a2:	9f ef c5 be 	pushab 2d26d <__fini+0x106fb>
   113a6:	01 00 
   113a8:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   113ac:	fb 02 ef 3d 	calls $0x2,10cf0 <error>
   113b0:	f9 ff ff 
   113b3:	31 38 01    	brw 114ee <ADCS_module+0x77a>
   113b6:	dd 06       	pushl $0x6
   113b8:	9f ef 31 c1 	pushab 2d4ef <__fini+0x1097d>
   113bc:	01 00 
   113be:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   113c2:	50 
   113c3:	dd a0 04    	pushl 0x4(r0)
   113c6:	fb 03 ef 3b 	calls $0x3,15408 <strncmp>
   113ca:	40 00 00 
   113cd:	d5 50       	tstl r0
   113cf:	13 03       	beql 113d4 <ADCS_module+0x660>
   113d1:	31 b1 00    	brw 11485 <ADCS_module+0x711>
   113d4:	d1 ac 04 02 	cmpl 0x4(ap),$0x2
   113d8:	14 19       	bgtr 113f3 <ADCS_module+0x67f>
   113da:	9f ef 8d be 	pushab 2d26d <__fini+0x106fb>
   113de:	01 00 
   113e0:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   113e4:	fb 02 ef 05 	calls $0x2,10cf0 <error>
   113e8:	f9 ff ff 
   113eb:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   113ef:	fd 
   113f0:	31 ff 00    	brw 114f2 <ADCS_module+0x77e>
   113f3:	dd 07       	pushl $0x7
   113f5:	9f ef fa c0 	pushab 2d4f5 <__fini+0x10983>
   113f9:	01 00 
   113fb:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   113ff:	50 
   11400:	dd a0 08    	pushl 0x8(r0)
   11403:	fb 03 ef fe 	calls $0x3,15408 <strncmp>
   11407:	3f 00 00 
   1140a:	d5 50       	tstl r0
   1140c:	12 07       	bneq 11415 <ADCS_module+0x6a1>
   1140e:	d0 01 dd 88 	movl $0x1,*0xfffffd88(fp)
   11412:	fd 
   11413:	11 5d       	brb 11472 <ADCS_module+0x6fe>
   11415:	dd 07       	pushl $0x7
   11417:	9f ef df c0 	pushab 2d4fc <__fini+0x1098a>
   1141b:	01 00 
   1141d:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   11421:	50 
   11422:	dd a0 08    	pushl 0x8(r0)
   11425:	fb 03 ef dc 	calls $0x3,15408 <strncmp>
   11429:	3f 00 00 
   1142c:	d5 50       	tstl r0
   1142e:	12 07       	bneq 11437 <ADCS_module+0x6c3>
   11430:	d0 02 dd 88 	movl $0x2,*0xfffffd88(fp)
   11434:	fd 
   11435:	11 3b       	brb 11472 <ADCS_module+0x6fe>
   11437:	dd 09       	pushl $0x9
   11439:	9f ef c4 c0 	pushab 2d503 <__fini+0x10991>
   1143d:	01 00 
   1143f:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   11443:	50 
   11444:	dd a0 08    	pushl 0x8(r0)
   11447:	fb 03 ef ba 	calls $0x3,15408 <strncmp>
   1144b:	3f 00 00 
   1144e:	d5 50       	tstl r0
   11450:	12 07       	bneq 11459 <ADCS_module+0x6e5>
   11452:	d0 03 dd 88 	movl $0x3,*0xfffffd88(fp)
   11456:	fd 
   11457:	11 19       	brb 11472 <ADCS_module+0x6fe>
   11459:	9f ef 0e be 	pushab 2d26d <__fini+0x106fb>
   1145d:	01 00 
   1145f:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   11463:	fb 02 ef 86 	calls $0x2,10cf0 <error>
   11467:	f8 ff ff 
   1146a:	d2 00 cd 84 	mcoml $0x0,0xfffffd84(fp)
   1146e:	fd 
   1146f:	31 80 00    	brw 114f2 <ADCS_module+0x77e>
   11472:	9f ef 94 c0 	pushab 2d50c <__fini+0x1099a>
   11476:	01 00 
   11478:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   1147c:	fb 02 ef 99 	calls $0x2,10d1c <info>
   11480:	f8 ff ff 
   11483:	11 69       	brb 114ee <ADCS_module+0x77a>
   11485:	dd 04       	pushl $0x4
   11487:	9f ef 8d c0 	pushab 2d51a <__fini+0x109a8>
   1148b:	01 00 
   1148d:	dd dd 8c fd 	pushl *0xfffffd8c(fp)
   11491:	fb 03 ef 70 	calls $0x3,15408 <strncmp>
   11495:	3f 00 00 
   11498:	d5 50       	tstl r0
   1149a:	12 13       	bneq 114af <ADCS_module+0x73b>
   1149c:	9f ef cb bd 	pushab 2d26d <__fini+0x106fb>
   114a0:	01 00 
   114a2:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   114a6:	fb 02 ef 43 	calls $0x2,10cf0 <error>
   114aa:	f8 ff ff 
   114ad:	11 3f       	brb 114ee <ADCS_module+0x77a>
   114af:	dd 05       	pushl $0x5
   114b1:	9f ef 67 c0 	pushab 2d51e <__fini+0x109ac>
   114b5:	01 00 
   114b7:	d0 cd 8c fd 	movl 0xfffffd8c(fp),r0
   114bb:	50 
   114bc:	dd a0 04    	pushl 0x4(r0)
   114bf:	fb 03 ef 42 	calls $0x3,15408 <strncmp>
   114c3:	3f 00 00 
   114c6:	d5 50       	tstl r0
   114c8:	12 13       	bneq 114dd <ADCS_module+0x769>
   114ca:	9f ef 9d bd 	pushab 2d26d <__fini+0x106fb>
   114ce:	01 00 
   114d0:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   114d4:	fb 02 ef 15 	calls $0x2,10cf0 <error>
   114d8:	f8 ff ff 
   114db:	11 11       	brb 114ee <ADCS_module+0x77a>
   114dd:	9f ef 8a bd 	pushab 2d26d <__fini+0x106fb>
   114e1:	01 00 
   114e3:	dd cd 88 fd 	pushl 0xfffffd88(fp)
   114e7:	fb 02 ef 02 	calls $0x2,10cf0 <error>
   114eb:	f8 ff ff 
   114ee:	d4 cd 84 fd 	clrf 0xfffffd84(fp)
   114f2:	d0 cd 84 fd 	movl 0xfffffd84(fp),r0
   114f6:	50 
   114f7:	d1 ad f8 ef 	cmpl 0xfffffff8(fp),3ee34 <__guard_local>
   114fb:	35 d9 02 00 
   114ff:	13 10       	beql 11511 <ADCS_module+0x79d>
   11501:	dd ad f8    	pushl 0xfffffff8(fp)
   11504:	9f ef 19 c0 	pushab 2d523 <__fini+0x109b1>
   11508:	01 00 
   1150a:	fb 02 ef 9f 	calls $0x2,1b6b0 <__stack_smash_handler>
   1150e:	a1 00 00 
   11511:	04          	ret

00011512 <COM_module>:
   11512:	00 00       	.word 0x0000 # Entry mask: < >
   11514:	c2 04 5e    	subl2 $0x4,sp
   11517:	9f ef 12 c0 	pushab 2d52f <__fini+0x109bd>
   1151b:	01 00 
   1151d:	dd ac 0c    	pushl 0xc(ap)
   11520:	fb 02 ef c9 	calls $0x2,10cf0 <error>
   11524:	f7 ff ff 
   11527:	d2 00 50    	mcoml $0x0,r0
   1152a:	04          	ret
   1152b:	01          	nop

0001152c <EPS_module>:
   1152c:	00 00       	.word 0x0000 # Entry mask: < >
   1152e:	c2 0c 5e    	subl2 $0xc,sp
   11531:	d1 ac 04 01 	cmpl 0x4(ap),$0x1
   11535:	14 17       	bgtr 1154e <EPS_module+0x22>
   11537:	9f ef fc bf 	pushab 2d539 <__fini+0x109c7>
   1153b:	01 00 
   1153d:	dd ac 0c    	pushl 0xc(ap)
   11540:	fb 02 ef a9 	calls $0x2,10cf0 <error>
   11544:	f7 ff ff 
   11547:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   1154b:	31 76 02    	brw 117c4 <EPS_module+0x298>
   1154e:	dd 06       	pushl $0x6
   11550:	9f ef 99 bf 	pushab 2d4ef <__fini+0x1097d>
   11554:	01 00 
   11556:	d0 ac 08 50 	movl 0x8(ap),r0
   1155a:	dd a0 04    	pushl 0x4(r0)
   1155d:	fb 03 ef a4 	calls $0x3,15408 <strncmp>
   11561:	3e 00 00 
   11564:	d5 50       	tstl r0
   11566:	13 03       	beql 1156b <EPS_module+0x3f>
   11568:	31 b3 00    	brw 1161e <EPS_module+0xf2>
   1156b:	d1 ac 04 02 	cmpl 0x4(ap),$0x2
   1156f:	14 17       	bgtr 11588 <EPS_module+0x5c>
   11571:	9f ef c2 bf 	pushab 2d539 <__fini+0x109c7>
   11575:	01 00 
   11577:	dd ac 0c    	pushl 0xc(ap)
   1157a:	fb 02 ef 6f 	calls $0x2,10cf0 <error>
   1157e:	f7 ff ff 
   11581:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   11585:	31 3c 02    	brw 117c4 <EPS_module+0x298>
   11588:	dd 07       	pushl $0x7
   1158a:	9f ef 65 bf 	pushab 2d4f5 <__fini+0x10983>
   1158e:	01 00 
   11590:	d0 ac 08 50 	movl 0x8(ap),r0
   11594:	dd a0 08    	pushl 0x8(r0)
   11597:	fb 03 ef 6a 	calls $0x3,15408 <strncmp>
   1159b:	3e 00 00 
   1159e:	d5 50       	tstl r0
   115a0:	12 0a       	bneq 115ac <EPS_module+0x80>
   115a2:	d0 ac 0c 50 	movl 0xc(ap),r0
   115a6:	d0 01 a0 20 	movl $0x1,0x20(r0)
   115aa:	11 5f       	brb 1160b <EPS_module+0xdf>
   115ac:	dd 07       	pushl $0x7
   115ae:	9f ef 48 bf 	pushab 2d4fc <__fini+0x1098a>
   115b2:	01 00 
   115b4:	d0 ac 08 50 	movl 0x8(ap),r0
   115b8:	dd a0 08    	pushl 0x8(r0)
   115bb:	fb 03 ef 46 	calls $0x3,15408 <strncmp>
   115bf:	3e 00 00 
   115c2:	d5 50       	tstl r0
   115c4:	12 0a       	bneq 115d0 <EPS_module+0xa4>
   115c6:	d0 ac 0c 50 	movl 0xc(ap),r0
   115ca:	d0 02 a0 20 	movl $0x2,0x20(r0)
   115ce:	11 3b       	brb 1160b <EPS_module+0xdf>
   115d0:	dd 09       	pushl $0x9
   115d2:	9f ef 2b bf 	pushab 2d503 <__fini+0x10991>
   115d6:	01 00 
   115d8:	d0 ac 08 50 	movl 0x8(ap),r0
   115dc:	dd a0 08    	pushl 0x8(r0)
   115df:	fb 03 ef 22 	calls $0x3,15408 <strncmp>
   115e3:	3e 00 00 
   115e6:	d5 50       	tstl r0
   115e8:	12 0a       	bneq 115f4 <EPS_module+0xc8>
   115ea:	d0 ac 0c 50 	movl 0xc(ap),r0
   115ee:	d0 03 a0 20 	movl $0x3,0x20(r0)
   115f2:	11 17       	brb 1160b <EPS_module+0xdf>
   115f4:	9f ef 3f bf 	pushab 2d539 <__fini+0x109c7>
   115f8:	01 00 
   115fa:	dd ac 0c    	pushl 0xc(ap)
   115fd:	fb 02 ef ec 	calls $0x2,10cf0 <error>
   11601:	f6 ff ff 
   11604:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   11608:	31 b9 01    	brw 117c4 <EPS_module+0x298>
   1160b:	9f ef 32 bf 	pushab 2d543 <__fini+0x109d1>
   1160f:	01 00 
   11611:	dd ac 0c    	pushl 0xc(ap)
   11614:	fb 02 ef 01 	calls $0x2,10d1c <info>
   11618:	f7 ff ff 
   1161b:	31 a3 01    	brw 117c1 <EPS_module+0x295>
   1161e:	dd 04       	pushl $0x4
   11620:	9f ef c5 be 	pushab 2d4eb <__fini+0x10979>
   11624:	01 00 
   11626:	d0 ac 08 50 	movl 0x8(ap),r0
   1162a:	dd a0 04    	pushl 0x4(r0)
   1162d:	fb 03 ef d4 	calls $0x3,15408 <strncmp>
   11631:	3d 00 00 
   11634:	d5 50       	tstl r0
   11636:	13 03       	beql 1163b <EPS_module+0x10f>
   11638:	31 22 01    	brw 1175d <EPS_module+0x231>
   1163b:	d0 ac 0c 50 	movl 0xc(ap),r0
   1163f:	d1 a0 20 02 	cmpl 0x20(r0),$0x2
   11643:	13 17       	beql 1165c <EPS_module+0x130>
   11645:	9f ef ee be 	pushab 2d539 <__fini+0x109c7>
   11649:	01 00 
   1164b:	dd ac 0c    	pushl 0xc(ap)
   1164e:	fb 02 ef 9b 	calls $0x2,10cf0 <error>
   11652:	f6 ff ff 
   11655:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   11659:	31 68 01    	brw 117c4 <EPS_module+0x298>
   1165c:	d1 ac 04 03 	cmpl 0x4(ap),$0x3
   11660:	14 17       	bgtr 11679 <EPS_module+0x14d>
   11662:	9f ef d1 be 	pushab 2d539 <__fini+0x109c7>
   11666:	01 00 
   11668:	dd ac 0c    	pushl 0xc(ap)
   1166b:	fb 02 ef 7e 	calls $0x2,10cf0 <error>
   1166f:	f6 ff ff 
   11672:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   11676:	31 4b 01    	brw 117c4 <EPS_module+0x298>
   11679:	dd 05       	pushl $0x5
   1167b:	9f ef cf be 	pushab 2d550 <__fini+0x109de>
   1167f:	01 00 
   11681:	d0 ac 08 50 	movl 0x8(ap),r0
   11685:	dd a0 08    	pushl 0x8(r0)
   11688:	fb 03 ef 79 	calls $0x3,15408 <strncmp>
   1168c:	3d 00 00 
   1168f:	d5 50       	tstl r0
   11691:	12 08       	bneq 1169b <EPS_module+0x16f>
   11693:	c1 ac 0c 24 	addl3 0xc(ap),$0x24,0xfffffff8(fp)
   11697:	ad f8 
   11699:	11 5b       	brb 116f6 <EPS_module+0x1ca>
   1169b:	dd 04       	pushl $0x4
   1169d:	9f ef b2 be 	pushab 2d555 <__fini+0x109e3>
   116a1:	01 00 
   116a3:	d0 ac 08 50 	movl 0x8(ap),r0
   116a7:	dd a0 08    	pushl 0x8(r0)
   116aa:	fb 03 ef 57 	calls $0x3,15408 <strncmp>
   116ae:	3d 00 00 
   116b1:	d5 50       	tstl r0
   116b3:	12 08       	bneq 116bd <EPS_module+0x191>
   116b5:	c1 ac 0c 28 	addl3 0xc(ap),$0x28,0xfffffff8(fp)
   116b9:	ad f8 
   116bb:	11 39       	brb 116f6 <EPS_module+0x1ca>
   116bd:	dd 04       	pushl $0x4
   116bf:	9f ef 94 be 	pushab 2d559 <__fini+0x109e7>
   116c3:	01 00 
   116c5:	d0 ac 08 50 	movl 0x8(ap),r0
   116c9:	dd a0 08    	pushl 0x8(r0)
   116cc:	fb 03 ef 35 	calls $0x3,15408 <strncmp>
   116d0:	3d 00 00 
   116d3:	d5 50       	tstl r0
   116d5:	12 08       	bneq 116df <EPS_module+0x1b3>
   116d7:	c1 ac 0c 2c 	addl3 0xc(ap),$0x2c,0xfffffff8(fp)
   116db:	ad f8 
   116dd:	11 17       	brb 116f6 <EPS_module+0x1ca>
   116df:	9f ef 54 be 	pushab 2d539 <__fini+0x109c7>
   116e3:	01 00 
   116e5:	dd ac 0c    	pushl 0xc(ap)
   116e8:	fb 02 ef 01 	calls $0x2,10cf0 <error>
   116ec:	f6 ff ff 
   116ef:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   116f3:	31 ce 00    	brw 117c4 <EPS_module+0x298>
   116f6:	dd 03       	pushl $0x3
   116f8:	9f ef 5f be 	pushab 2d55d <__fini+0x109eb>
   116fc:	01 00 
   116fe:	d0 ac 08 50 	movl 0x8(ap),r0
   11702:	dd a0 0c    	pushl 0xc(r0)
   11705:	fb 03 ef fc 	calls $0x3,15408 <strncmp>
   11709:	3c 00 00 
   1170c:	d5 50       	tstl r0
   1170e:	12 06       	bneq 11716 <EPS_module+0x1ea>
   11710:	d0 01 bd f8 	movl $0x1,*0xfffffff8(fp)
   11714:	11 35       	brb 1174b <EPS_module+0x21f>
   11716:	dd 04       	pushl $0x4
   11718:	9f ef 42 be 	pushab 2d560 <__fini+0x109ee>
   1171c:	01 00 
   1171e:	d0 ac 08 50 	movl 0x8(ap),r0
   11722:	dd a0 0c    	pushl 0xc(r0)
   11725:	fb 03 ef dc 	calls $0x3,15408 <strncmp>
   11729:	3c 00 00 
   1172c:	d5 50       	tstl r0
   1172e:	12 05       	bneq 11735 <EPS_module+0x209>
   11730:	d4 bd f8    	clrf *0xfffffff8(fp)
   11733:	11 16       	brb 1174b <EPS_module+0x21f>
   11735:	9f ef fe bd 	pushab 2d539 <__fini+0x109c7>
   11739:	01 00 
   1173b:	dd ac 0c    	pushl 0xc(ap)
   1173e:	fb 02 ef ab 	calls $0x2,10cf0 <error>
   11742:	f5 ff ff 
   11745:	d2 00 ad f4 	mcoml $0x0,0xfffffff4(fp)
   11749:	11 79       	brb 117c4 <EPS_module+0x298>
   1174b:	9f ef 13 be 	pushab 2d564 <__fini+0x109f2>
   1174f:	01 00 
   11751:	dd ac 0c    	pushl 0xc(ap)
   11754:	fb 02 ef c1 	calls $0x2,10d1c <info>
   11758:	f5 ff ff 
   1175b:	11 64       	brb 117c1 <EPS_module+0x295>
   1175d:	dd 04       	pushl $0x4
   1175f:	9f ef b5 bd 	pushab 2d51a <__fini+0x109a8>
   11763:	01 00 
   11765:	dd bc 08    	pushl *0x8(ap)
   11768:	fb 03 ef 99 	calls $0x3,15408 <strncmp>
   1176c:	3c 00 00 
   1176f:	d5 50       	tstl r0
   11771:	12 12       	bneq 11785 <EPS_module+0x259>
   11773:	9f ef c0 bd 	pushab 2d539 <__fini+0x109c7>
   11777:	01 00 
   11779:	dd ac 0c    	pushl 0xc(ap)
   1177c:	fb 02 ef 6d 	calls $0x2,10cf0 <error>
   11780:	f5 ff ff 
   11783:	11 3c       	brb 117c1 <EPS_module+0x295>
   11785:	dd 05       	pushl $0x5
   11787:	9f ef 91 bd 	pushab 2d51e <__fini+0x109ac>
   1178b:	01 00 
   1178d:	d0 ac 08 50 	movl 0x8(ap),r0
   11791:	dd a0 04    	pushl 0x4(r0)
   11794:	fb 03 ef 6d 	calls $0x3,15408 <strncmp>
   11798:	3c 00 00 
   1179b:	d5 50       	tstl r0
   1179d:	12 12       	bneq 117b1 <EPS_module+0x285>
   1179f:	9f ef 94 bd 	pushab 2d539 <__fini+0x109c7>
   117a3:	01 00 
   117a5:	dd ac 0c    	pushl 0xc(ap)
   117a8:	fb 02 ef 41 	calls $0x2,10cf0 <error>
   117ac:	f5 ff ff 
   117af:	11 10       	brb 117c1 <EPS_module+0x295>
   117b1:	9f ef 82 bd 	pushab 2d539 <__fini+0x109c7>
   117b5:	01 00 
   117b7:	dd ac 0c    	pushl 0xc(ap)
   117ba:	fb 02 ef 2f 	calls $0x2,10cf0 <error>
   117be:	f5 ff ff 
   117c1:	d4 ad f4    	clrf 0xfffffff4(fp)
   117c4:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   117c8:	04          	ret
   117c9:	01          	nop

000117ca <OBC_module>:
   117ca:	00 00       	.word 0x0000 # Entry mask: < >
   117cc:	c2 04 5e    	subl2 $0x4,sp
   117cf:	9f ef 9a bd 	pushab 2d56f <__fini+0x109fd>
   117d3:	01 00 
   117d5:	dd ac 0c    	pushl 0xc(ap)
   117d8:	fb 02 ef 11 	calls $0x2,10cf0 <error>
   117dc:	f5 ff ff 
   117df:	d2 00 50    	mcoml $0x0,r0
   117e2:	04          	ret
   117e3:	01          	nop

000117e4 <help>:
   117e4:	00 00       	.word 0x0000 # Entry mask: < >
   117e6:	c2 08 5e    	subl2 $0x8,sp
   117e9:	d1 ac 04 01 	cmpl 0x4(ap),$0x1
   117ed:	14 16       	bgtr 11805 <help+0x21>
   117ef:	9f ef 84 bd 	pushab 2d579 <__fini+0x10a07>
   117f3:	01 00 
   117f5:	dd ac 0c    	pushl 0xc(ap)
   117f8:	fb 02 ef 1d 	calls $0x2,10d1c <info>
   117fc:	f5 ff ff 
   117ff:	d4 ad f8    	clrf 0xfffffff8(fp)
   11802:	31 f6 03    	brw 11bfb <help+0x417>
   11805:	dd 05       	pushl $0x5
   11807:	9f ef 43 bd 	pushab 2d550 <__fini+0x109de>
   1180b:	01 00 
   1180d:	d0 ac 08 50 	movl 0x8(ap),r0
   11811:	dd a0 04    	pushl 0x4(r0)
   11814:	fb 03 ef ed 	calls $0x3,15408 <strncmp>
   11818:	3b 00 00 
   1181b:	d5 50       	tstl r0
   1181d:	13 03       	beql 11822 <help+0x3e>
   1181f:	31 15 01    	brw 11937 <help+0x153>
   11822:	d1 ac 04 02 	cmpl 0x4(ap),$0x2
   11826:	14 17       	bgtr 1183f <help+0x5b>
   11828:	9f ef 5f bd 	pushab 2d58d <__fini+0x10a1b>
   1182c:	01 00 
   1182e:	dd ac 0c    	pushl 0xc(ap)
   11831:	fb 02 ef b8 	calls $0x2,10cf0 <error>
   11835:	f4 ff ff 
   11838:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   1183c:	31 bc 03    	brw 11bfb <help+0x417>
   1183f:	dd 04       	pushl $0x4
   11841:	9f ef d3 bc 	pushab 2d51a <__fini+0x109a8>
   11845:	01 00 
   11847:	d0 ac 08 50 	movl 0x8(ap),r0
   1184b:	dd a0 08    	pushl 0x8(r0)
   1184e:	fb 03 ef b3 	calls $0x3,15408 <strncmp>
   11852:	3b 00 00 
   11855:	d5 50       	tstl r0
   11857:	12 13       	bneq 1186c <help+0x88>
   11859:	9f ef 3e bd 	pushab 2d59d <__fini+0x10a2b>
   1185d:	01 00 
   1185f:	dd ac 0c    	pushl 0xc(ap)
   11862:	fb 02 ef b3 	calls $0x2,10d1c <info>
   11866:	f4 ff ff 
   11869:	31 8c 03    	brw 11bf8 <help+0x414>
   1186c:	dd 05       	pushl $0x5
   1186e:	9f ef aa bc 	pushab 2d51e <__fini+0x109ac>
   11872:	01 00 
   11874:	d0 ac 08 50 	movl 0x8(ap),r0
   11878:	dd a0 08    	pushl 0x8(r0)
   1187b:	fb 03 ef 86 	calls $0x3,15408 <strncmp>
   1187f:	3b 00 00 
   11882:	d5 50       	tstl r0
   11884:	12 13       	bneq 11899 <help+0xb5>
   11886:	9f ef 21 bd 	pushab 2d5ad <__fini+0x10a3b>
   1188a:	01 00 
   1188c:	dd ac 0c    	pushl 0xc(ap)
   1188f:	fb 02 ef 86 	calls $0x2,10d1c <info>
   11893:	f4 ff ff 
   11896:	31 5f 03    	brw 11bf8 <help+0x414>
   11899:	dd 06       	pushl $0x6
   1189b:	9f ef 4e bc 	pushab 2d4ef <__fini+0x1097d>
   1189f:	01 00 
   118a1:	d0 ac 08 50 	movl 0x8(ap),r0
   118a5:	dd a0 08    	pushl 0x8(r0)
   118a8:	fb 03 ef 59 	calls $0x3,15408 <strncmp>
   118ac:	3b 00 00 
   118af:	d5 50       	tstl r0
   118b1:	12 13       	bneq 118c6 <help+0xe2>
   118b3:	9f ef 05 bd 	pushab 2d5be <__fini+0x10a4c>
   118b7:	01 00 
   118b9:	dd ac 0c    	pushl 0xc(ap)
   118bc:	fb 02 ef 59 	calls $0x2,10d1c <info>
   118c0:	f4 ff ff 
   118c3:	31 32 03    	brw 11bf8 <help+0x414>
   118c6:	dd 04       	pushl $0x4
   118c8:	9f ef 1d bc 	pushab 2d4eb <__fini+0x10979>
   118cc:	01 00 
   118ce:	d0 ac 08 50 	movl 0x8(ap),r0
   118d2:	dd a0 08    	pushl 0x8(r0)
   118d5:	fb 03 ef 2c 	calls $0x3,15408 <strncmp>
   118d9:	3b 00 00 
   118dc:	d5 50       	tstl r0
   118de:	12 13       	bneq 118f3 <help+0x10f>
   118e0:	9f ef 03 bd 	pushab 2d5e9 <__fini+0x10a77>
   118e4:	01 00 
   118e6:	dd ac 0c    	pushl 0xc(ap)
   118e9:	fb 02 ef 2c 	calls $0x2,10d1c <info>
   118ed:	f4 ff ff 
   118f0:	31 05 03    	brw 11bf8 <help+0x414>
   118f3:	dd 08       	pushl $0x8
   118f5:	9f ef 7d b9 	pushab 2d278 <__fini+0x10706>
   118f9:	01 00 
   118fb:	d0 ac 08 50 	movl 0x8(ap),r0
   118ff:	dd a0 08    	pushl 0x8(r0)
   11902:	fb 03 ef ff 	calls $0x3,15408 <strncmp>
   11906:	3a 00 00 
   11909:	d5 50       	tstl r0
   1190b:	12 13       	bneq 11920 <help+0x13c>
   1190d:	9f ef e6 bc 	pushab 2d5f9 <__fini+0x10a87>
   11911:	01 00 
   11913:	dd ac 0c    	pushl 0xc(ap)
   11916:	fb 02 ef ff 	calls $0x2,10d1c <info>
   1191a:	f3 ff ff 
   1191d:	31 d8 02    	brw 11bf8 <help+0x414>
   11920:	9f ef 67 bc 	pushab 2d58d <__fini+0x10a1b>
   11924:	01 00 
   11926:	dd ac 0c    	pushl 0xc(ap)
   11929:	fb 02 ef c0 	calls $0x2,10cf0 <error>
   1192d:	f3 ff ff 
   11930:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   11934:	31 c4 02    	brw 11bfb <help+0x417>
   11937:	dd 04       	pushl $0x4
   11939:	9f ef fe bc 	pushab 2d63d <__fini+0x10acb>
   1193d:	01 00 
   1193f:	d0 ac 08 50 	movl 0x8(ap),r0
   11943:	dd a0 04    	pushl 0x4(r0)
   11946:	fb 03 ef bb 	calls $0x3,15408 <strncmp>
   1194a:	3a 00 00 
   1194d:	d5 50       	tstl r0
   1194f:	13 03       	beql 11954 <help+0x170>
   11951:	31 e8 00    	brw 11a3c <help+0x258>
   11954:	d1 ac 04 02 	cmpl 0x4(ap),$0x2
   11958:	14 17       	bgtr 11971 <help+0x18d>
   1195a:	9f ef e1 bc 	pushab 2d641 <__fini+0x10acf>
   1195e:	01 00 
   11960:	dd ac 0c    	pushl 0xc(ap)
   11963:	fb 02 ef 86 	calls $0x2,10cf0 <error>
   11967:	f3 ff ff 
   1196a:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   1196e:	31 8a 02    	brw 11bfb <help+0x417>
   11971:	dd 04       	pushl $0x4
   11973:	9f ef a1 bb 	pushab 2d51a <__fini+0x109a8>
   11977:	01 00 
   11979:	d0 ac 08 50 	movl 0x8(ap),r0
   1197d:	dd a0 08    	pushl 0x8(r0)
   11980:	fb 03 ef 81 	calls $0x3,15408 <strncmp>
   11984:	3a 00 00 
   11987:	d5 50       	tstl r0
   11989:	12 13       	bneq 1199e <help+0x1ba>
   1198b:	9f ef bf bc 	pushab 2d650 <__fini+0x10ade>
   1198f:	01 00 
   11991:	dd ac 0c    	pushl 0xc(ap)
   11994:	fb 02 ef 81 	calls $0x2,10d1c <info>
   11998:	f3 ff ff 
   1199b:	31 5a 02    	brw 11bf8 <help+0x414>
   1199e:	dd 05       	pushl $0x5
   119a0:	9f ef 78 bb 	pushab 2d51e <__fini+0x109ac>
   119a4:	01 00 
   119a6:	d0 ac 08 50 	movl 0x8(ap),r0
   119aa:	dd a0 08    	pushl 0x8(r0)
   119ad:	fb 03 ef 54 	calls $0x3,15408 <strncmp>
   119b1:	3a 00 00 
   119b4:	d5 50       	tstl r0
   119b6:	12 13       	bneq 119cb <help+0x1e7>
   119b8:	9f ef a1 bc 	pushab 2d65f <__fini+0x10aed>
   119bc:	01 00 
   119be:	dd ac 0c    	pushl 0xc(ap)
   119c1:	fb 02 ef 54 	calls $0x2,10d1c <info>
   119c5:	f3 ff ff 
   119c8:	31 2d 02    	brw 11bf8 <help+0x414>
   119cb:	dd 06       	pushl $0x6
   119cd:	9f ef 1c bb 	pushab 2d4ef <__fini+0x1097d>
   119d1:	01 00 
   119d3:	d0 ac 08 50 	movl 0x8(ap),r0
   119d7:	dd a0 08    	pushl 0x8(r0)
   119da:	fb 03 ef 27 	calls $0x3,15408 <strncmp>
   119de:	3a 00 00 
   119e1:	d5 50       	tstl r0
   119e3:	12 13       	bneq 119f8 <help+0x214>
   119e5:	9f ef 84 bc 	pushab 2d66f <__fini+0x10afd>
   119e9:	01 00 
   119eb:	dd ac 0c    	pushl 0xc(ap)
   119ee:	fb 02 ef 27 	calls $0x2,10d1c <info>
   119f2:	f3 ff ff 
   119f5:	31 00 02    	brw 11bf8 <help+0x414>
   119f8:	dd 04       	pushl $0x4
   119fa:	9f ef eb ba 	pushab 2d4eb <__fini+0x10979>
   119fe:	01 00 
   11a00:	d0 ac 08 50 	movl 0x8(ap),r0
   11a04:	dd a0 08    	pushl 0x8(r0)
   11a07:	fb 03 ef fa 	calls $0x3,15408 <strncmp>
   11a0b:	39 00 00 
   11a0e:	d5 50       	tstl r0
   11a10:	12 13       	bneq 11a25 <help+0x241>
   11a12:	9f ef 81 bc 	pushab 2d699 <__fini+0x10b27>
   11a16:	01 00 
   11a18:	dd ac 0c    	pushl 0xc(ap)
   11a1b:	fb 02 ef fa 	calls $0x2,10d1c <info>
   11a1f:	f2 ff ff 
   11a22:	31 d3 01    	brw 11bf8 <help+0x414>
   11a25:	9f ef 16 bc 	pushab 2d641 <__fini+0x10acf>
   11a29:	01 00 
   11a2b:	dd ac 0c    	pushl 0xc(ap)
   11a2e:	fb 02 ef bb 	calls $0x2,10cf0 <error>
   11a32:	f2 ff ff 
   11a35:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   11a39:	31 bf 01    	brw 11bfb <help+0x417>
   11a3c:	dd 04       	pushl $0x4
   11a3e:	9f ef 15 bb 	pushab 2d559 <__fini+0x109e7>
   11a42:	01 00 
   11a44:	d0 ac 08 50 	movl 0x8(ap),r0
   11a48:	dd a0 04    	pushl 0x4(r0)
   11a4b:	fb 03 ef b6 	calls $0x3,15408 <strncmp>
   11a4f:	39 00 00 
   11a52:	d5 50       	tstl r0
   11a54:	13 03       	beql 11a59 <help+0x275>
   11a56:	31 bb 00    	brw 11b14 <help+0x330>
   11a59:	d1 ac 04 02 	cmpl 0x4(ap),$0x2
   11a5d:	14 17       	bgtr 11a76 <help+0x292>
   11a5f:	9f ef 5b bc 	pushab 2d6c0 <__fini+0x10b4e>
   11a63:	01 00 
   11a65:	dd ac 0c    	pushl 0xc(ap)
   11a68:	fb 02 ef 81 	calls $0x2,10cf0 <error>
   11a6c:	f2 ff ff 
   11a6f:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   11a73:	31 85 01    	brw 11bfb <help+0x417>
   11a76:	dd 04       	pushl $0x4
   11a78:	9f ef 9c ba 	pushab 2d51a <__fini+0x109a8>
   11a7c:	01 00 
   11a7e:	d0 ac 08 50 	movl 0x8(ap),r0
   11a82:	dd a0 08    	pushl 0x8(r0)
   11a85:	fb 03 ef 7c 	calls $0x3,15408 <strncmp>
   11a89:	39 00 00 
   11a8c:	d5 50       	tstl r0
   11a8e:	12 13       	bneq 11aa3 <help+0x2bf>
   11a90:	9f ef 39 bc 	pushab 2d6cf <__fini+0x10b5d>
   11a94:	01 00 
   11a96:	dd ac 0c    	pushl 0xc(ap)
   11a99:	fb 02 ef 7c 	calls $0x2,10d1c <info>
   11a9d:	f2 ff ff 
   11aa0:	31 55 01    	brw 11bf8 <help+0x414>
   11aa3:	dd 05       	pushl $0x5
   11aa5:	9f ef 73 ba 	pushab 2d51e <__fini+0x109ac>
   11aa9:	01 00 
   11aab:	d0 ac 08 50 	movl 0x8(ap),r0
   11aaf:	dd a0 08    	pushl 0x8(r0)
   11ab2:	fb 03 ef 4f 	calls $0x3,15408 <strncmp>
   11ab6:	39 00 00 
   11ab9:	d5 50       	tstl r0
   11abb:	12 13       	bneq 11ad0 <help+0x2ec>
   11abd:	9f ef 1b bc 	pushab 2d6de <__fini+0x10b6c>
   11ac1:	01 00 
   11ac3:	dd ac 0c    	pushl 0xc(ap)
   11ac6:	fb 02 ef 4f 	calls $0x2,10d1c <info>
   11aca:	f2 ff ff 
   11acd:	31 28 01    	brw 11bf8 <help+0x414>
   11ad0:	dd 06       	pushl $0x6
   11ad2:	9f ef 17 ba 	pushab 2d4ef <__fini+0x1097d>
   11ad6:	01 00 
   11ad8:	d0 ac 08 50 	movl 0x8(ap),r0
   11adc:	dd a0 08    	pushl 0x8(r0)
   11adf:	fb 03 ef 22 	calls $0x3,15408 <strncmp>
   11ae3:	39 00 00 
   11ae6:	d5 50       	tstl r0
   11ae8:	12 13       	bneq 11afd <help+0x319>
   11aea:	9f ef fe bb 	pushab 2d6ee <__fini+0x10b7c>
   11aee:	01 00 
   11af0:	dd ac 0c    	pushl 0xc(ap)
   11af3:	fb 02 ef 22 	calls $0x2,10d1c <info>
   11af7:	f2 ff ff 
   11afa:	31 fb 00    	brw 11bf8 <help+0x414>
   11afd:	9f ef bd bb 	pushab 2d6c0 <__fini+0x10b4e>
   11b01:	01 00 
   11b03:	dd ac 0c    	pushl 0xc(ap)
   11b06:	fb 02 ef e3 	calls $0x2,10cf0 <error>
   11b0a:	f1 ff ff 
   11b0d:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   11b11:	31 e7 00    	brw 11bfb <help+0x417>
   11b14:	dd 04       	pushl $0x4
   11b16:	9f ef 39 ba 	pushab 2d555 <__fini+0x109e3>
   11b1a:	01 00 
   11b1c:	d0 ac 08 50 	movl 0x8(ap),r0
   11b20:	dd a0 04    	pushl 0x4(r0)
   11b23:	fb 03 ef de 	calls $0x3,15408 <strncmp>
   11b27:	38 00 00 
   11b2a:	d5 50       	tstl r0
   11b2c:	13 03       	beql 11b31 <help+0x34d>
   11b2e:	31 b7 00    	brw 11be8 <help+0x404>
   11b31:	d1 ac 04 02 	cmpl 0x4(ap),$0x2
   11b35:	14 17       	bgtr 11b4e <help+0x36a>
   11b37:	9f ef db bb 	pushab 2d718 <__fini+0x10ba6>
   11b3b:	01 00 
   11b3d:	dd ac 0c    	pushl 0xc(ap)
   11b40:	fb 02 ef a9 	calls $0x2,10cf0 <error>
   11b44:	f1 ff ff 
   11b47:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   11b4b:	31 ad 00    	brw 11bfb <help+0x417>
   11b4e:	dd 04       	pushl $0x4
   11b50:	9f ef c4 b9 	pushab 2d51a <__fini+0x109a8>
   11b54:	01 00 
   11b56:	d0 ac 08 50 	movl 0x8(ap),r0
   11b5a:	dd a0 08    	pushl 0x8(r0)
   11b5d:	fb 03 ef a4 	calls $0x3,15408 <strncmp>
   11b61:	38 00 00 
   11b64:	d5 50       	tstl r0
   11b66:	12 12       	bneq 11b7a <help+0x396>
   11b68:	9f ef b9 bb 	pushab 2d727 <__fini+0x10bb5>
   11b6c:	01 00 
   11b6e:	dd ac 0c    	pushl 0xc(ap)
   11b71:	fb 02 ef a4 	calls $0x2,10d1c <info>
   11b75:	f1 ff ff 
   11b78:	11 7e       	brb 11bf8 <help+0x414>
   11b7a:	dd 05       	pushl $0x5
   11b7c:	9f ef 9c b9 	pushab 2d51e <__fini+0x109ac>
   11b80:	01 00 
   11b82:	d0 ac 08 50 	movl 0x8(ap),r0
   11b86:	dd a0 08    	pushl 0x8(r0)
   11b89:	fb 03 ef 78 	calls $0x3,15408 <strncmp>
   11b8d:	38 00 00 
   11b90:	d5 50       	tstl r0
   11b92:	12 12       	bneq 11ba6 <help+0x3c2>
   11b94:	9f ef 9c bb 	pushab 2d736 <__fini+0x10bc4>
   11b98:	01 00 
   11b9a:	dd ac 0c    	pushl 0xc(ap)
   11b9d:	fb 02 ef 78 	calls $0x2,10d1c <info>
   11ba1:	f1 ff ff 
   11ba4:	11 52       	brb 11bf8 <help+0x414>
   11ba6:	dd 06       	pushl $0x6
   11ba8:	9f ef 41 b9 	pushab 2d4ef <__fini+0x1097d>
   11bac:	01 00 
   11bae:	d0 ac 08 50 	movl 0x8(ap),r0
   11bb2:	dd a0 08    	pushl 0x8(r0)
   11bb5:	fb 03 ef 4c 	calls $0x3,15408 <strncmp>
   11bb9:	38 00 00 
   11bbc:	d5 50       	tstl r0
   11bbe:	12 12       	bneq 11bd2 <help+0x3ee>
   11bc0:	9f ef 80 bb 	pushab 2d746 <__fini+0x10bd4>
   11bc4:	01 00 
   11bc6:	dd ac 0c    	pushl 0xc(ap)
   11bc9:	fb 02 ef 4c 	calls $0x2,10d1c <info>
   11bcd:	f1 ff ff 
   11bd0:	11 26       	brb 11bf8 <help+0x414>
   11bd2:	9f ef 40 bb 	pushab 2d718 <__fini+0x10ba6>
   11bd6:	01 00 
   11bd8:	dd ac 0c    	pushl 0xc(ap)
   11bdb:	fb 02 ef 0e 	calls $0x2,10cf0 <error>
   11bdf:	f1 ff ff 
   11be2:	d2 00 ad f8 	mcoml $0x0,0xfffffff8(fp)
   11be6:	11 13       	brb 11bfb <help+0x417>
   11be8:	9f ef 82 bb 	pushab 2d770 <__fini+0x10bfe>
   11bec:	01 00 
   11bee:	dd ac 0c    	pushl 0xc(ap)
   11bf1:	fb 02 ef f8 	calls $0x2,10cf0 <error>
   11bf5:	f0 ff ff 
   11bf8:	d4 ad f8    	clrf 0xfffffff8(fp)
   11bfb:	d0 ad f8 50 	movl 0xfffffff8(fp),r0
   11bff:	04          	ret

00011c00 <state>:
   11c00:	00 00       	.word 0x0000 # Entry mask: < >
   11c02:	c2 18 5e    	subl2 $0x18,sp
   11c05:	d4 ad f4    	clrf 0xfffffff4(fp)
   11c08:	d5 ac 04    	tstl 0x4(ap)
   11c0b:	12 0b       	bneq 11c18 <state+0x18>
   11c0d:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   11c11:	d0 50 ad e8 	movl r0,0xffffffe8(fp)
   11c15:	31 dd 01    	brw 11df5 <state+0x1f5>
   11c18:	d5 ac 0c    	tstl 0xc(ap)
   11c1b:	13 0d       	beql 11c2a <state+0x2a>
   11c1d:	9f ef fd 83 	pushab 6a020 <mainstate.0>
   11c21:	05 00 
   11c23:	fb 01 ef 76 	calls $0x1,106a0 <initialize>
   11c27:	ea ff ff 
   11c2a:	d4 ef 24 84 	clrf 6a054 <mainstate.0+0x34>
   11c2e:	05 00 
   11c30:	d4 ef 86 84 	clrf 6a0bc <mainstate.0+0x9c>
   11c34:	05 00 
   11c36:	d4 ef e8 84 	clrf 6a124 <mainstate.0+0x104>
   11c3a:	05 00 
   11c3c:	d5 ac 08    	tstl 0x8(ap)
   11c3f:	12 1b       	bneq 11c5c <state+0x5c>
   11c41:	9f ef d9 83 	pushab 6a020 <mainstate.0>
   11c45:	05 00 
   11c47:	dd ac 04    	pushl 0x4(ap)
   11c4a:	fb 02 ef 17 	calls $0x2,10768 <draw>
   11c4e:	eb ff ff 
   11c51:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   11c55:	d0 50 ad e8 	movl r0,0xffffffe8(fp)
   11c59:	31 99 01    	brw 11df5 <state+0x1f5>
   11c5c:	dd ac 08    	pushl 0x8(ap)
   11c5f:	dd ac 04    	pushl 0x4(ap)
   11c62:	fb 02 ef f7 	calls $0x2,10360 <testBadChar>
   11c66:	e6 ff ff 
   11c69:	d5 50       	tstl r0
   11c6b:	13 2e       	beql 11c9b <state+0x9b>
   11c6d:	9f ef 08 bb 	pushab 2d77b <__fini+0x10c09>
   11c71:	01 00 
   11c73:	9f ef a7 83 	pushab 6a020 <mainstate.0>
   11c77:	05 00 
   11c79:	fb 02 ef 70 	calls $0x2,10cf0 <error>
   11c7d:	f0 ff ff 
   11c80:	9f ef 9a 83 	pushab 6a020 <mainstate.0>
   11c84:	05 00 
   11c86:	dd ac 04    	pushl 0x4(ap)
   11c89:	fb 02 ef d8 	calls $0x2,10768 <draw>
   11c8d:	ea ff ff 
   11c90:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   11c94:	d0 50 ad e8 	movl r0,0xffffffe8(fp)
   11c98:	31 5a 01    	brw 11df5 <state+0x1f5>
   11c9b:	c3 14 5d 50 	subl3 $0x14,fp,r0
   11c9f:	dd 50       	pushl r0
   11ca1:	dd ac 04    	pushl 0x4(ap)
   11ca4:	fb 02 ef 09 	calls $0x2,104b4 <parsedargs>
   11ca8:	e8 ff ff 
   11cab:	d0 50 ad f0 	movl r0,0xfffffff0(fp)
   11caf:	d5 ad f0    	tstl 0xfffffff0(fp)
   11cb2:	12 0b       	bneq 11cbf <state+0xbf>
   11cb4:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   11cb8:	d0 50 ad e8 	movl r0,0xffffffe8(fp)
   11cbc:	31 36 01    	brw 11df5 <state+0x1f5>
   11cbf:	d5 ad ec    	tstl 0xffffffec(fp)
   11cc2:	12 1b       	bneq 11cdf <state+0xdf>
   11cc4:	9f ef 56 83 	pushab 6a020 <mainstate.0>
   11cc8:	05 00 
   11cca:	dd ac 04    	pushl 0x4(ap)
   11ccd:	fb 02 ef 94 	calls $0x2,10768 <draw>
   11cd1:	ea ff ff 
   11cd4:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   11cd8:	d0 50 ad e8 	movl r0,0xffffffe8(fp)
   11cdc:	31 16 01    	brw 11df5 <state+0x1f5>
   11cdf:	dd 05       	pushl $0x5
   11ce1:	9f ef 69 b8 	pushab 2d550 <__fini+0x109de>
   11ce5:	01 00 
   11ce7:	dd bd f0    	pushl *0xfffffff0(fp)
   11cea:	fb 03 ef 17 	calls $0x3,15408 <strncmp>
   11cee:	37 00 00 
   11cf1:	d5 50       	tstl r0
   11cf3:	12 16       	bneq 11d0b <state+0x10b>
   11cf5:	9f ef 25 83 	pushab 6a020 <mainstate.0>
   11cf9:	05 00 
   11cfb:	dd ad f0    	pushl 0xfffffff0(fp)
   11cfe:	dd ad ec    	pushl 0xffffffec(fp)
   11d01:	fb 03 ef 6c 	calls $0x3,10d74 <ADCS_module>
   11d05:	f0 ff ff 
   11d08:	31 c0 00    	brw 11dcb <state+0x1cb>
   11d0b:	dd 04       	pushl $0x4
   11d0d:	9f ef 46 b8 	pushab 2d559 <__fini+0x109e7>
   11d11:	01 00 
   11d13:	dd bd f0    	pushl *0xfffffff0(fp)
   11d16:	fb 03 ef eb 	calls $0x3,15408 <strncmp>
   11d1a:	36 00 00 
   11d1d:	d5 50       	tstl r0
   11d1f:	12 16       	bneq 11d37 <state+0x137>
   11d21:	9f ef f9 82 	pushab 6a020 <mainstate.0>
   11d25:	05 00 
   11d27:	dd ad f0    	pushl 0xfffffff0(fp)
   11d2a:	dd ad ec    	pushl 0xffffffec(fp)
   11d2d:	fb 03 ef de 	calls $0x3,11512 <COM_module>
   11d31:	f7 ff ff 
   11d34:	31 94 00    	brw 11dcb <state+0x1cb>
   11d37:	dd 04       	pushl $0x4
   11d39:	9f ef fe b8 	pushab 2d63d <__fini+0x10acb>
   11d3d:	01 00 
   11d3f:	dd bd f0    	pushl *0xfffffff0(fp)
   11d42:	fb 03 ef bf 	calls $0x3,15408 <strncmp>
   11d46:	36 00 00 
   11d49:	d5 50       	tstl r0
   11d4b:	12 15       	bneq 11d62 <state+0x162>
   11d4d:	9f ef cd 82 	pushab 6a020 <mainstate.0>
   11d51:	05 00 
   11d53:	dd ad f0    	pushl 0xfffffff0(fp)
   11d56:	dd ad ec    	pushl 0xffffffec(fp)
   11d59:	fb 03 ef cc 	calls $0x3,1152c <EPS_module>
   11d5d:	f7 ff ff 
   11d60:	11 69       	brb 11dcb <state+0x1cb>
   11d62:	dd 04       	pushl $0x4
   11d64:	9f ef eb b7 	pushab 2d555 <__fini+0x109e3>
   11d68:	01 00 
   11d6a:	dd bd f0    	pushl *0xfffffff0(fp)
   11d6d:	fb 03 ef 94 	calls $0x3,15408 <strncmp>
   11d71:	36 00 00 
   11d74:	d5 50       	tstl r0
   11d76:	12 15       	bneq 11d8d <state+0x18d>
   11d78:	9f ef a2 82 	pushab 6a020 <mainstate.0>
   11d7c:	05 00 
   11d7e:	dd ad f0    	pushl 0xfffffff0(fp)
   11d81:	dd ad ec    	pushl 0xffffffec(fp)
   11d84:	fb 03 ef 3f 	calls $0x3,117ca <OBC_module>
   11d88:	fa ff ff 
   11d8b:	11 3e       	brb 11dcb <state+0x1cb>
   11d8d:	dd 05       	pushl $0x5
   11d8f:	9f ef f4 b9 	pushab 2d789 <__fini+0x10c17>
   11d93:	01 00 
   11d95:	dd bd f0    	pushl *0xfffffff0(fp)
   11d98:	fb 03 ef 69 	calls $0x3,15408 <strncmp>
   11d9c:	36 00 00 
   11d9f:	d5 50       	tstl r0
   11da1:	12 15       	bneq 11db8 <state+0x1b8>
   11da3:	9f ef 77 82 	pushab 6a020 <mainstate.0>
   11da7:	05 00 
   11da9:	dd ad f0    	pushl 0xfffffff0(fp)
   11dac:	dd ad ec    	pushl 0xffffffec(fp)
   11daf:	fb 03 ef 2e 	calls $0x3,117e4 <help>
   11db3:	fa ff ff 
   11db6:	11 13       	brb 11dcb <state+0x1cb>
   11db8:	9f ef d0 b9 	pushab 2d78e <__fini+0x10c1c>
   11dbc:	01 00 
   11dbe:	9f ef 5c 82 	pushab 6a020 <mainstate.0>
   11dc2:	05 00 
   11dc4:	fb 02 ef 25 	calls $0x2,10cf0 <error>
   11dc8:	ef ff ff 
   11dcb:	d5 ad f0    	tstl 0xfffffff0(fp)
   11dce:	13 0a       	beql 11dda <state+0x1da>
   11dd0:	dd ad f0    	pushl 0xfffffff0(fp)
   11dd3:	fb 01 ef 6e 	calls $0x1,10548 <freeparsedargs>
   11dd7:	e7 ff ff 
   11dda:	9f ef 40 82 	pushab 6a020 <mainstate.0>
   11dde:	05 00 
   11de0:	dd ac 04    	pushl 0x4(ap)
   11de3:	fb 02 ef 7e 	calls $0x2,10768 <draw>
   11de7:	e9 ff ff 
   11dea:	d4 ad f4    	clrf 0xfffffff4(fp)
   11ded:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   11df1:	d0 50 ad e8 	movl r0,0xffffffe8(fp)
   11df5:	d0 ad e8 50 	movl 0xffffffe8(fp),r0
   11df9:	04          	ret

00011dfa <func>:
   11dfa:	00 00       	.word 0x0000 # Entry mask: < >
   11dfc:	9e ce f4 f7 	movab 0xfffff7f4(sp),sp
   11e00:	5e 
   11e01:	d0 ef 2d d0 	movl 3ee34 <__guard_local>,0xfffffff8(fp)
   11e05:	02 00 ad f8 
   11e09:	3c 8f 00 08 	movzwl $0x0800,-(sp)
   11e0d:	7e 
   11e0e:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11e12:	50 
   11e13:	dd 50       	pushl r0
   11e15:	fb 02 ef 90 	calls $0x2,124ac <bzero>
   11e19:	06 00 00 
   11e1c:	dd 01       	pushl $0x1
   11e1e:	3c 8f ff 07 	movzwl $0x07ff,-(sp)
   11e22:	7e 
   11e23:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11e27:	50 
   11e28:	dd 50       	pushl r0
   11e2a:	fb 02 ef 7d 	calls $0x2,1b1ae <strnlen>
   11e2e:	93 00 00 
   11e31:	dd 50       	pushl r0
   11e33:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11e37:	50 
   11e38:	dd 50       	pushl r0
   11e3a:	fb 03 ef bf 	calls $0x3,11c00 <state>
   11e3e:	fd ff ff 
   11e41:	d4 7e       	clrf -(sp)
   11e43:	3c 8f 00 08 	movzwl $0x0800,-(sp)
   11e47:	7e 
   11e48:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11e4c:	50 
   11e4d:	dd 50       	pushl r0
   11e4f:	fb 02 ef 58 	calls $0x2,1b1ae <strnlen>
   11e53:	93 00 00 
   11e56:	dd 50       	pushl r0
   11e58:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11e5c:	50 
   11e5d:	dd 50       	pushl r0
   11e5f:	dd ac 04    	pushl 0x4(ap)
   11e62:	fb 04 ef 8b 	calls $0x4,151f4 <send>
   11e66:	33 00 00 
   11e69:	d1 50 8f ff 	cmpl r0,$0xffffffff
   11e6d:	ff ff ff 
   11e70:	12 26       	bneq 11e98 <func+0x9e>
   11e72:	fb 00 ef 09 	calls $0x0,12782 <___errno>
   11e76:	09 00 00 
   11e79:	dd 60       	pushl (r0)
   11e7b:	9f ef 1b b9 	pushab 2d79c <__fini+0x10c2a>
   11e7f:	01 00 
   11e81:	fb 02 ef 56 	calls $0x2,129de <printf>
   11e85:	0b 00 00 
   11e88:	9f ef 2a b9 	pushab 2d7b8 <__fini+0x10c46>
   11e8c:	01 00 
   11e8e:	fb 01 ef 49 	calls $0x1,129de <printf>
   11e92:	0b 00 00 
   11e95:	31 97 00    	brw 11f2f <func+0x135>
   11e98:	d4 7e       	clrf -(sp)
   11e9a:	3c 8f 00 08 	movzwl $0x0800,-(sp)
   11e9e:	7e 
   11e9f:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11ea3:	50 
   11ea4:	dd 50       	pushl r0
   11ea6:	dd ac 04    	pushl 0x4(ap)
   11ea9:	fb 04 ef 26 	calls $0x4,151d6 <recv>
   11ead:	33 00 00 
   11eb0:	d1 50 8f ff 	cmpl r0,$0xffffffff
   11eb4:	ff ff ff 
   11eb7:	12 25       	bneq 11ede <func+0xe4>
   11eb9:	fb 00 ef c2 	calls $0x0,12782 <___errno>
   11ebd:	08 00 00 
   11ec0:	dd 60       	pushl (r0)
   11ec2:	9f ef 12 b9 	pushab 2d7da <__fini+0x10c68>
   11ec6:	01 00 
   11ec8:	fb 02 ef 0f 	calls $0x2,129de <printf>
   11ecc:	0b 00 00 
   11ecf:	9f ef e3 b8 	pushab 2d7b8 <__fini+0x10c46>
   11ed3:	01 00 
   11ed5:	fb 01 ef 02 	calls $0x1,129de <printf>
   11ed9:	0b 00 00 
   11edc:	11 51       	brb 11f2f <func+0x135>
   11ede:	dd 04       	pushl $0x4
   11ee0:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11ee4:	50 
   11ee5:	dd 50       	pushl r0
   11ee7:	9f ef 09 b9 	pushab 2d7f6 <__fini+0x10c84>
   11eeb:	01 00 
   11eed:	fb 03 ef 14 	calls $0x3,15408 <strncmp>
   11ef1:	35 00 00 
   11ef4:	d5 50       	tstl r0
   11ef6:	12 0f       	bneq 11f07 <func+0x10d>
   11ef8:	9f ef ba b8 	pushab 2d7b8 <__fini+0x10c46>
   11efc:	01 00 
   11efe:	fb 01 ef d9 	calls $0x1,129de <printf>
   11f02:	0a 00 00 
   11f05:	11 28       	brb 11f2f <func+0x135>
   11f07:	d4 7e       	clrf -(sp)
   11f09:	3c 8f ff 07 	movzwl $0x07ff,-(sp)
   11f0d:	7e 
   11f0e:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11f12:	50 
   11f13:	dd 50       	pushl r0
   11f15:	fb 02 ef 92 	calls $0x2,1b1ae <strnlen>
   11f19:	92 00 00 
   11f1c:	dd 50       	pushl r0
   11f1e:	9e cd f8 f7 	movab 0xfffff7f8(fp),r0
   11f22:	50 
   11f23:	dd 50       	pushl r0
   11f25:	fb 03 ef d4 	calls $0x3,11c00 <state>
   11f29:	fc ff ff 
   11f2c:	31 12 ff    	brw 11e41 <func+0x47>
   11f2f:	d1 ad f8 ef 	cmpl 0xfffffff8(fp),3ee34 <__guard_local>
   11f33:	fd ce 02 00 
   11f37:	13 10       	beql 11f49 <func+0x14f>
   11f39:	dd ad f8    	pushl 0xfffffff8(fp)
   11f3c:	9f ef b9 b8 	pushab 2d7fb <__fini+0x10c89>
   11f40:	01 00 
   11f42:	fb 02 ef 67 	calls $0x2,1b6b0 <__stack_smash_handler>
   11f46:	97 00 00 
   11f49:	04          	ret

00011f4a <main>:
   11f4a:	00 00       	.word 0x0000 # Entry mask: < >
   11f4c:	c2 3c 5e    	subl2 $0x3c,sp
   11f4f:	d0 ef df ce 	movl 3ee34 <__guard_local>,0xfffffff8(fp)
   11f53:	02 00 ad f8 
   11f57:	9f ef a3 b8 	pushab 2d800 <__fini+0x10c8e>
   11f5b:	01 00 
   11f5d:	fb 01 ef 7a 	calls $0x1,129de <printf>
   11f61:	0a 00 00 
   11f64:	d4 7e       	clrf -(sp)
   11f66:	dd 01       	pushl $0x1
   11f68:	dd 02       	pushl $0x2
   11f6a:	fb 03 ef 9b 	calls $0x3,1250c <_thread_sys_socket>
   11f6e:	05 00 00 
   11f71:	d0 50 ad d4 	movl r0,0xffffffd4(fp)
   11f75:	d1 ad d4 8f 	cmpl 0xffffffd4(fp),$0xffffffff
   11f79:	ff ff ff ff 
   11f7d:	12 16       	bneq 11f95 <main+0x4b>
   11f7f:	9f ef 85 b8 	pushab 2d80a <__fini+0x10c98>
   11f83:	01 00 
   11f85:	fb 01 ef 52 	calls $0x1,129de <printf>
   11f89:	0a 00 00 
   11f8c:	d4 7e       	clrf -(sp)
   11f8e:	fb 01 ef d9 	calls $0x1,14b6e <exit>
   11f92:	2b 00 00 
   11f95:	9f ef 8a b8 	pushab 2d825 <__fini+0x10cb3>
   11f99:	01 00 
   11f9b:	fb 01 ef 3c 	calls $0x1,129de <printf>
   11f9f:	0a 00 00 
   11fa2:	90 02 ad e9 	movb $0x2,0xffffffe9(fp)
   11fa6:	d4 ad c8    	clrf 0xffffffc8(fp)
   11fa9:	cb 8f 00 ff 	bicl3 $0xffffff00,0xffffffc8(fp),r0
   11fad:	ff ff ad c8 
   11fb1:	50 
   11fb2:	78 18 50 51 	ashl $0x18,r0,r1
   11fb6:	cb 8f ff 00 	bicl3 $0xffff00ff,0xffffffc8(fp),r0
   11fba:	ff ff ad c8 
   11fbe:	50 
   11fbf:	78 08 50 50 	ashl $0x8,r0,r0
   11fc3:	c9 50 51 53 	bisl3 r0,r1,r3
   11fc7:	cb 8f ff ff 	bicl3 $0xff00ffff,0xffffffc8(fp),r2
   11fcb:	00 ff ad c8 
   11fcf:	52 
   11fd0:	d0 08 51    	movl $0x8,r1
   11fd3:	83 51 20 50 	subb3 r1,$0x20,r0
   11fd7:	ef 51 50 52 	extzv r1,r0,r2,r0
   11fdb:	50 
   11fdc:	c8 50 53    	bisl2 r0,r3
   11fdf:	cb 8f ff ff 	bicl3 $0x00ffffff,0xffffffc8(fp),r2
   11fe3:	ff 00 ad c8 
   11fe7:	52 
   11fe8:	d0 18 51    	movl $0x18,r1
   11feb:	83 51 20 50 	subb3 r1,$0x20,r0
   11fef:	ef 51 50 52 	extzv r1,r0,r2,r0
   11ff3:	50 
   11ff4:	c8 53 50    	bisl2 r3,r0
   11ff7:	d0 50 ad ec 	movl r0,0xffffffec(fp)
   11ffb:	b0 8f 90 1f 	movw $0x1f90,0xffffffc6(fp)
   11fff:	ad c6 
   12001:	3c ad c6 50 	movzwl 0xffffffc6(fp),r0
   12005:	ca 8f 00 ff 	bicl2 $0xffffff00,r0
   12009:	ff ff 50 
   1200c:	78 08 50 51 	ashl $0x8,r0,r1
   12010:	3c ad c6 50 	movzwl 0xffffffc6(fp),r0
   12014:	ca 8f ff 00 	bicl2 $0xffff00ff,r0
   12018:	ff ff 50 
   1201b:	78 8f f8 50 	ashl $0xf8,r0,r0
   1201f:	50 
   12020:	a8 51 50    	bisw2 r1,r0
   12023:	b0 50 ad ea 	movw r0,0xffffffea(fp)
   12027:	dd 10       	pushl $0x10
   12029:	c3 18 5d 50 	subl3 $0x18,fp,r0
   1202d:	dd 50       	pushl r0
   1202f:	dd ad d4    	pushl 0xffffffd4(fp)
   12032:	fb 03 ef 9b 	calls $0x3,129d4 <_thread_sys_bind>
   12036:	09 00 00 
   12039:	d5 50       	tstl r0
   1203b:	13 20       	beql 1205d <main+0x113>
   1203d:	dd ad d4    	pushl 0xffffffd4(fp)
   12040:	fb 01 ef 5d 	calls $0x1,124a4 <_thread_sys_close>
   12044:	04 00 00 
   12047:	9f ef f6 b7 	pushab 2d843 <__fini+0x10cd1>
   1204b:	01 00 
   1204d:	fb 01 ef 8a 	calls $0x1,129de <printf>
   12051:	09 00 00 
   12054:	d4 7e       	clrf -(sp)
   12056:	fb 01 ef 11 	calls $0x1,14b6e <exit>
   1205a:	2b 00 00 
   1205d:	9f ef f7 b7 	pushab 2d85a <__fini+0x10ce8>
   12061:	01 00 
   12063:	fb 01 ef 74 	calls $0x1,129de <printf>
   12067:	09 00 00 
   1206a:	dd 05       	pushl $0x5
   1206c:	dd ad d4    	pushl 0xffffffd4(fp)
   1206f:	fb 02 ef 0a 	calls $0x2,12480 <_thread_sys_listen>
   12073:	04 00 00 
   12076:	d5 50       	tstl r0
   12078:	13 20       	beql 1209a <main+0x150>
   1207a:	dd ad d4    	pushl 0xffffffd4(fp)
   1207d:	fb 01 ef 20 	calls $0x1,124a4 <_thread_sys_close>
   12081:	04 00 00 
   12084:	9f ef ee b7 	pushab 2d878 <__fini+0x10d06>
   12088:	01 00 
   1208a:	fb 01 ef 4d 	calls $0x1,129de <printf>
   1208e:	09 00 00 
   12091:	d4 7e       	clrf -(sp)
   12093:	fb 01 ef d4 	calls $0x1,14b6e <exit>
   12097:	2a 00 00 
   1209a:	9f ef ea b7 	pushab 2d88a <__fini+0x10d18>
   1209e:	01 00 
   120a0:	fb 01 ef 37 	calls $0x1,129de <printf>
   120a4:	09 00 00 
   120a7:	d0 10 ad cc 	movl $0x10,0xffffffcc(fp)
   120ab:	c3 34 5d 50 	subl3 $0x34,fp,r0
   120af:	dd 50       	pushl r0
   120b1:	c3 28 5d 50 	subl3 $0x28,fp,r0
   120b5:	dd 50       	pushl r0
   120b7:	dd ad d4    	pushl 0xffffffd4(fp)
   120ba:	fb 03 ef d3 	calls $0x3,12494 <_thread_sys_accept>
   120be:	03 00 00 
   120c1:	d0 50 ad d0 	movl r0,0xffffffd0(fp)
   120c5:	d5 ad d0    	tstl 0xffffffd0(fp)
   120c8:	18 0f       	bgeq 120d9 <main+0x18f>
   120ca:	9f ef ce b7 	pushab 2d89e <__fini+0x10d2c>
   120ce:	01 00 
   120d0:	fb 01 ef 07 	calls $0x1,129de <printf>
   120d4:	09 00 00 
   120d7:	11 0d       	brb 120e6 <main+0x19c>
   120d9:	9f ef d8 b7 	pushab 2d8b7 <__fini+0x10d45>
   120dd:	01 00 
   120df:	fb 01 ef f8 	calls $0x1,129de <printf>
   120e3:	08 00 00 
   120e6:	dd ad d0    	pushl 0xffffffd0(fp)
   120e9:	fb 01 ef 0a 	calls $0x1,11dfa <func>
   120ed:	fd ff ff 
   120f0:	11 b9       	brb 120ab <main+0x161>

000120f2 <executor>:
   120f2:	00 00       	.word 0x0000 # Entry mask: < >
   120f4:	c2 1c 5e    	subl2 $0x1c,sp
   120f7:	c1 ac 04 ac 	addl3 0x4(ap),0x8(ap),r0
   120fb:	08 50 
   120fd:	c2 04 50    	subl2 $0x4,r0
   12100:	d0 60 ad e8 	movl (r0),0xffffffe8(fp)
   12104:	dd ad e8    	pushl 0xffffffe8(fp)
   12107:	dd ac 08    	pushl 0x8(ap)
   1210a:	9f ef c4 b7 	pushab 2d8d4 <__fini+0x10d62>
   1210e:	01 00 
   12110:	fb 03 ef c7 	calls $0x3,129de <printf>
   12114:	08 00 00 
   12117:	d4 ad e4    	clrf 0xffffffe4(fp)
   1211a:	d0 ac 08 52 	movl 0x8(ap),r2
   1211e:	d0 02 51    	movl $0x2,r1
   12121:	83 51 20 50 	subb3 r1,$0x20,r0
   12125:	ef 51 50 52 	extzv r1,r0,r2,r0
   12129:	50 
   1212a:	d1 ad e8 50 	cmpl 0xffffffe8(fp),r0
   1212e:	1f 03       	blssu 12133 <executor+0x41>
   12130:	31 ba 00    	brw 121ed <executor+0xfb>
   12133:	d6 ad e4    	incl 0xffffffe4(fp)
   12136:	d0 ad e8 50 	movl 0xffffffe8(fp),r0
   1213a:	d0 40 bc 04 	movl *0x4(ap)[r0],0xfffffff4(fp)
   1213e:	ad f4 
   12140:	d0 ad e8 50 	movl 0xffffffe8(fp),r0
   12144:	c4 04 50    	mull2 $0x4,r0
   12147:	c0 ac 04 50 	addl2 0x4(ap),r0
   1214b:	d0 a0 04 ad 	movl 0x4(r0),0xfffffff0(fp)
   1214f:	f0 
   12150:	d0 ad e8 50 	movl 0xffffffe8(fp),r0
   12154:	c4 04 50    	mull2 $0x4,r0
   12157:	c0 ac 04 50 	addl2 0x4(ap),r0
   1215b:	d0 a0 08 ad 	movl 0x8(r0),0xfffffff8(fp)
   1215f:	f8 
   12160:	d0 ad e8 50 	movl 0xffffffe8(fp),r0
   12164:	c4 04 50    	mull2 $0x4,r0
   12167:	c0 ac 04 50 	addl2 0x4(ap),r0
   1216b:	d0 a0 0c ad 	movl 0xc(r0),0xffffffec(fp)
   1216f:	ec 
   12170:	d1 ad f8 8f 	cmpl 0xfffffff8(fp),$0xffffffff
   12174:	ff ff ff ff 
   12178:	12 16       	bneq 12190 <executor+0x9e>
   1217a:	d1 ad f0 8f 	cmpl 0xfffffff0(fp),$0xffffffff
   1217e:	ff ff ff ff 
   12182:	12 0c       	bneq 12190 <executor+0x9e>
   12184:	d1 ad f4 8f 	cmpl 0xfffffff4(fp),$0xffffffff
   12188:	ff ff ff ff 
   1218c:	12 02       	bneq 12190 <executor+0x9e>
   1218e:	11 5d       	brb 121ed <executor+0xfb>
   12190:	d0 ad f8 52 	movl 0xfffffff8(fp),r2
   12194:	d0 ad f8 51 	movl 0xfffffff8(fp),r1
   12198:	d0 ad f0 50 	movl 0xfffffff0(fp),r0
   1219c:	c1 41 bc 04 	addl3 *0x4(ap)[r1],*0x4(ap)[r0],*0x4(ap)[r2]
   121a0:	40 bc 04 42 
   121a4:	bc 04 
   121a6:	d0 ad f0 50 	movl 0xfffffff0(fp),r0
   121aa:	d5 40 bc 04 	tstl *0x4(ap)[r0]
   121ae:	19 11       	blss 121c1 <executor+0xcf>
   121b0:	d0 ad f8 51 	movl 0xfffffff8(fp),r1
   121b4:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   121b8:	d1 41 bc 04 	cmpl *0x4(ap)[r1],*0x4(ap)[r0]
   121bc:	40 bc 04 
   121bf:	15 1d       	bleq 121de <executor+0xec>
   121c1:	d0 ad f0 50 	movl 0xfffffff0(fp),r0
   121c5:	d5 40 bc 04 	tstl *0x4(ap)[r0]
   121c9:	18 1b       	bgeq 121e6 <executor+0xf4>
   121cb:	d0 ad f8 51 	movl 0xfffffff8(fp),r1
   121cf:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   121d3:	d1 41 bc 04 	cmpl *0x4(ap)[r1],*0x4(ap)[r0]
   121d7:	40 bc 04 
   121da:	18 02       	bgeq 121de <executor+0xec>
   121dc:	11 08       	brb 121e6 <executor+0xf4>
   121de:	c0 ad ec ad 	addl2 0xffffffec(fp),0xffffffe8(fp)
   121e2:	e8 
   121e3:	31 34 ff    	brw 1211a <executor+0x28>
   121e6:	c0 04 ad e8 	addl2 $0x4,0xffffffe8(fp)
   121ea:	31 2d ff    	brw 1211a <executor+0x28>
   121ed:	dd ad e4    	pushl 0xffffffe4(fp)
   121f0:	9f ef f6 b6 	pushab 2d8ec <__fini+0x10d7a>
   121f4:	01 00 
   121f6:	fb 02 ef e1 	calls $0x2,129de <printf>
   121fa:	07 00 00 
   121fd:	04          	ret

000121fe <execute_operation>:
   121fe:	00 00       	.word 0x0000 # Entry mask: < >
   12200:	c2 3c 5e    	subl2 $0x3c,sp
   12203:	d5 ac 04    	tstl 0x4(ap)
   12206:	12 03       	bneq 1220b <execute_operation+0xd>
   12208:	31 95 01    	brw 123a0 <execute_operation+0x1a2>
   1220b:	d5 ac 08    	tstl 0x8(ap)
   1220e:	12 03       	bneq 12213 <execute_operation+0x15>
   12210:	31 8d 01    	brw 123a0 <execute_operation+0x1a2>
   12213:	d5 ac 0c    	tstl 0xc(ap)
   12216:	12 03       	bneq 1221b <execute_operation+0x1d>
   12218:	31 85 01    	brw 123a0 <execute_operation+0x1a2>
   1221b:	dd ac 18    	pushl 0x18(ap)
   1221e:	fb 01 ef 75 	calls $0x1,13e9a <malloc>
   12222:	1c 00 00 
   12225:	d0 50 ad f8 	movl r0,0xfffffff8(fp)
   12229:	dd ac 18    	pushl 0x18(ap)
   1222c:	dd ac 04    	pushl 0x4(ap)
   1222f:	dd ad f8    	pushl 0xfffffff8(fp)
   12232:	fb 03 ef f9 	calls $0x3,1b732 <memcpy>
   12236:	94 00 00 
   12239:	d0 ad f8 ac 	movl 0xfffffff8(fp),0x4(ap)
   1223d:	04 
   1223e:	3c 8f f0 03 	movzwl $0x03f0,0xffffffec(fp)
   12242:	ad ec 
   12244:	3c 8f 44 02 	movzwl $0x0244,0xffffffe8(fp)
   12248:	ad e8 
   1224a:	d4 ad e4    	clrf 0xffffffe4(fp)
   1224d:	d0 ad ec ad 	movl 0xffffffec(fp),0xffffffe4(fp)
   12251:	e4 
   12252:	c1 ad ec ac 	addl3 0xffffffec(fp),0x14(ap),r0
   12256:	14 50 
   12258:	d1 ad e4 50 	cmpl 0xffffffe4(fp),r0
   1225c:	19 02       	blss 12260 <execute_operation+0x62>
   1225e:	11 16       	brb 12276 <execute_operation+0x78>
   12260:	c1 ac 04 ad 	addl3 0x4(ap),0xffffffe4(fp),r1
   12264:	e4 51 
   12266:	c3 ad ec ad 	subl3 0xffffffec(fp),0xffffffe4(fp),r0
   1226a:	e4 50 
   1226c:	90 40 bc 0c 	movb *0xc(ap)[r0],(r1)
   12270:	61 
   12271:	d6 ad e4    	incl 0xffffffe4(fp)
   12274:	11 dc       	brb 12252 <execute_operation+0x54>
   12276:	01          	nop
   12277:	d0 ac 14 ad 	movl 0x14(ap),0xffffffd4(fp)
   1227b:	d4 
   1227c:	d0 ad d4 ad 	movl 0xffffffd4(fp),0xffffffd0(fp)
   12280:	d0 
   12281:	d5 ad d0    	tstl 0xffffffd0(fp)
   12284:	18 04       	bgeq 1228a <execute_operation+0x8c>
   12286:	c0 03 ad d0 	addl2 $0x3,0xffffffd0(fp)
   1228a:	78 8f fe ad 	ashl $0xfe,0xffffffd0(fp),r0
   1228e:	d0 50 
   12290:	c4 04 50    	mull2 $0x4,r0
   12293:	c3 50 ad d4 	subl3 r0,0xffffffd4(fp),r0
   12297:	50 
   12298:	c3 50 ac 14 	subl3 r0,0x14(ap),r0
   1229c:	50 
   1229d:	c0 04 50    	addl2 $0x4,r0
   122a0:	d1 ad e4 50 	cmpl 0xffffffe4(fp),r0
   122a4:	19 02       	blss 122a8 <execute_operation+0xaa>
   122a6:	11 0d       	brb 122b5 <execute_operation+0xb7>
   122a8:	c1 ac 04 ad 	addl3 0x4(ap),0xffffffe4(fp),r0
   122ac:	e4 50 
   122ae:	94 60       	clrb (r0)
   122b0:	d6 ad e4    	incl 0xffffffe4(fp)
   122b3:	11 c2       	brb 12277 <execute_operation+0x79>
   122b5:	d0 ad e8 ad 	movl 0xffffffe8(fp),0xffffffe4(fp)
   122b9:	e4 
   122ba:	c1 ad e8 ac 	addl3 0xffffffe8(fp),0x10(ap),0xffffffcc(fp)
   122be:	10 ad cc 
   122c1:	d0 ac 14 ad 	movl 0x14(ap),0xffffffc8(fp)
   122c5:	c8 
   122c6:	d0 ad c8 ad 	movl 0xffffffc8(fp),0xffffffc4(fp)
   122ca:	c4 
   122cb:	d5 ad c4    	tstl 0xffffffc4(fp)
   122ce:	18 04       	bgeq 122d4 <execute_operation+0xd6>
   122d0:	c0 03 ad c4 	addl2 $0x3,0xffffffc4(fp)
   122d4:	78 8f fe ad 	ashl $0xfe,0xffffffc4(fp),r0
   122d8:	c4 50 
   122da:	c4 04 50    	mull2 $0x4,r0
   122dd:	c3 50 ad c8 	subl3 r0,0xffffffc8(fp),r0
   122e1:	50 
   122e2:	c3 50 ad cc 	subl3 r0,0xffffffcc(fp),r0
   122e6:	50 
   122e7:	c0 04 50    	addl2 $0x4,r0
   122ea:	d1 ad e4 50 	cmpl 0xffffffe4(fp),r0
   122ee:	19 02       	blss 122f2 <execute_operation+0xf4>
   122f0:	11 0d       	brb 122ff <execute_operation+0x101>
   122f2:	c1 ac 04 ad 	addl3 0x4(ap),0xffffffe4(fp),r0
   122f6:	e4 50 
   122f8:	94 60       	clrb (r0)
   122fa:	d6 ad e4    	incl 0xffffffe4(fp)
   122fd:	11 bb       	brb 122ba <execute_operation+0xbc>
   122ff:	9a 8f c8 ad 	movzbl $0xc8,0xffffffe0(fp)
   12303:	e0 
   12304:	9a 8f c9 ad 	movzbl $0xc9,0xffffffdc(fp)
   12308:	dc 
   12309:	d0 ad e0 51 	movl 0xffffffe0(fp),r1
   1230d:	d0 ac 10 50 	movl 0x10(ap),r0
   12311:	c6 04 50    	divl2 $0x4,r0
   12314:	d0 50 41 bc 	movl r0,*0x4(ap)[r1]
   12318:	04 
   12319:	d0 ad dc 51 	movl 0xffffffdc(fp),r1
   1231d:	d0 ac 14 50 	movl 0x14(ap),r0
   12321:	c6 04 50    	divl2 $0x4,r0
   12324:	d0 50 41 bc 	movl r0,*0x4(ap)[r1]
   12328:	04 
   12329:	d0 ac 04 51 	movl 0x4(ap),r1
   1232d:	d0 ad e8 50 	movl 0xffffffe8(fp),r0
   12331:	c6 04 50    	divl2 $0x4,r0
   12334:	d0 50 a1 04 	movl r0,0x4(r1)
   12338:	d0 ac 04 51 	movl 0x4(ap),r1
   1233c:	d0 ad ec 50 	movl 0xffffffec(fp),r0
   12340:	c6 04 50    	divl2 $0x4,r0
   12343:	d0 50 a1 08 	movl r0,0x8(r1)
   12347:	d0 ac 04 51 	movl 0x4(ap),r1
   1234b:	d0 ad e0 50 	movl 0xffffffe0(fp),r0
   1234f:	c6 04 50    	divl2 $0x4,r0
   12352:	d0 50 a1 0c 	movl r0,0xc(r1)
   12356:	d0 ac 04 51 	movl 0x4(ap),r1
   1235a:	d0 ad dc 50 	movl 0xffffffdc(fp),r0
   1235e:	c6 04 50    	divl2 $0x4,r0
   12361:	d0 50 a1 10 	movl r0,0x10(r1)
   12365:	dd ac 18    	pushl 0x18(ap)
   12368:	dd ac 04    	pushl 0x4(ap)
   1236b:	fb 02 ef 80 	calls $0x2,120f2 <executor>
   1236f:	fd ff ff 
   12372:	c1 ac 04 ad 	addl3 0x4(ap),0xffffffe8(fp),0xfffffff4(fp)
   12376:	e8 ad f4 
   12379:	d4 ad d8    	clrf 0xffffffd8(fp)
   1237c:	d4 ad e4    	clrf 0xffffffe4(fp)
   1237f:	d1 ad e4 ac 	cmpl 0xffffffe4(fp),0x10(ap)
   12383:	10 
   12384:	19 02       	blss 12388 <execute_operation+0x18a>
   12386:	11 18       	brb 123a0 <execute_operation+0x1a2>
   12388:	c1 ac 08 ad 	addl3 0x8(ap),0xffffffe4(fp),r1
   1238c:	e4 51 
   1238e:	c1 ad f4 ad 	addl3 0xfffffff4(fp),0xffffffd8(fp),r0
   12392:	d8 50 
   12394:	90 60 61    	movb (r0),(r1)
   12397:	c0 04 ad d8 	addl2 $0x4,0xffffffd8(fp)
   1239b:	d6 ad e4    	incl 0xffffffe4(fp)
   1239e:	11 df       	brb 1237f <execute_operation+0x181>
   123a0:	04          	ret
   123a1:	01          	nop

000123a2 <breakdown_coordinates>:
   123a2:	40 00       	.word 0x0040 # Entry mask: < r6 >
   123a4:	c2 10 5e    	subl2 $0x10,sp
   123a7:	3c 8f 00 01 	movzwl $0x0100,0xfffffff0(fp)
   123ab:	ad f0 
   123ad:	d4 ad f8    	clrf 0xfffffff8(fp)
   123b0:	d1 ad f8 03 	cmpl 0xfffffff8(fp),$0x3
   123b4:	15 02       	bleq 123b8 <breakdown_coordinates+0x16>
   123b6:	11 2f       	brb 123e7 <breakdown_coordinates+0x45>
   123b8:	d0 ad f8 56 	movl 0xfffffff8(fp),r6
   123bc:	d0 ac 08 50 	movl 0x8(ap),r0
   123c0:	dd ad f0    	pushl 0xfffffff0(fp)
   123c3:	dd 50       	pushl r0
   123c5:	fb 02 ef b8 	calls $0x2,1ad84 <__urem>
   123c9:	89 00 00 
   123cc:	d0 50 46 bc 	movl r0,*0x4(ap)[r6]
   123d0:	04 
   123d1:	dd ad f0    	pushl 0xfffffff0(fp)
   123d4:	dd ac 08    	pushl 0x8(ap)
   123d7:	fb 02 ef 4a 	calls $0x2,1ad28 <__udiv>
   123db:	89 00 00 
   123de:	d0 50 ac 08 	movl r0,0x8(ap)
   123e2:	d6 ad f8    	incl 0xfffffff8(fp)
   123e5:	11 c9       	brb 123b0 <breakdown_coordinates+0xe>
   123e7:	d4 ad f8    	clrf 0xfffffff8(fp)
   123ea:	d1 ad f8 03 	cmpl 0xfffffff8(fp),$0x3
   123ee:	15 02       	bleq 123f2 <breakdown_coordinates+0x50>
   123f0:	11 36       	brb 12428 <breakdown_coordinates+0x86>
   123f2:	d0 ad f8 50 	movl 0xfffffff8(fp),r0
   123f6:	c4 04 50    	mull2 $0x4,r0
   123f9:	c1 50 ac 04 	addl3 r0,0x4(ap),r6
   123fd:	56 
   123fe:	d0 ac 0c 50 	movl 0xc(ap),r0
   12402:	dd ad f0    	pushl 0xfffffff0(fp)
   12405:	dd 50       	pushl r0
   12407:	fb 02 ef 76 	calls $0x2,1ad84 <__urem>
   1240b:	89 00 00 
   1240e:	d0 50 a6 10 	movl r0,0x10(r6)
   12412:	dd ad f0    	pushl 0xfffffff0(fp)
   12415:	dd ac 0c    	pushl 0xc(ap)
   12418:	fb 02 ef 09 	calls $0x2,1ad28 <__udiv>
   1241c:	89 00 00 
   1241f:	d0 50 ac 0c 	movl r0,0xc(ap)
   12423:	d6 ad f8    	incl 0xfffffff8(fp)
   12426:	11 c2       	brb 123ea <breakdown_coordinates+0x48>
   12428:	d4 ad f4    	clrf 0xfffffff4(fp)
   1242b:	d1 ad f4 03 	cmpl 0xfffffff4(fp),$0x3
   1242f:	15 02       	bleq 12433 <breakdown_coordinates+0x91>
   12431:	11 1b       	brb 1244e <breakdown_coordinates+0xac>
   12433:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   12437:	c4 04 50    	mull2 $0x4,r0
   1243a:	c1 50 ac 04 	addl3 r0,0x4(ap),r1
   1243e:	51 
   1243f:	d0 ad f4 50 	movl 0xfffffff4(fp),r0
   12443:	d0 40 bc 10 	movl *0x10(ap)[r0],0x20(r1)
   12447:	a1 20 
   12449:	d6 ad f4    	incl 0xfffffff4(fp)
   1244c:	11 dd       	brb 1242b <breakdown_coordinates+0x89>
   1244e:	04          	ret
   1244f:	01          	nop
