
rv32ui-p-srl:     file format elf32-littleriscv


Disassembly of section .text.init:

00000000 <_start>:
   0:	0500006f          	j	50 <reset_vector>

00000004 <trap_vector>:
   4:	34202f73          	csrr	t5,mcause
   8:	00800f93          	li	t6,8
   c:	03ff0863          	beq	t5,t6,3c <write_tohost>
  10:	00900f93          	li	t6,9
  14:	03ff0463          	beq	t5,t6,3c <write_tohost>
  18:	00b00f93          	li	t6,11
  1c:	03ff0063          	beq	t5,t6,3c <write_tohost>
  20:	00000f13          	li	t5,0
  24:	000f0463          	beqz	t5,2c <trap_vector+0x28>
  28:	000f0067          	jr	t5
  2c:	34202f73          	csrr	t5,mcause
  30:	000f5463          	bgez	t5,38 <handle_exception>
  34:	0040006f          	j	38 <handle_exception>

00000038 <handle_exception>:
  38:	5391e193          	ori	gp,gp,1337

0000003c <write_tohost>:
  3c:	00000f17          	auipc	t5,0x0
  40:	7c3f2223          	sw	gp,1988(t5) # 800 <tohost>
  44:	00000f17          	auipc	t5,0x0
  48:	7c0f2023          	sw	zero,1984(t5) # 804 <tohost+0x4>
  4c:	ff1ff06f          	j	3c <write_tohost>

00000050 <reset_vector>:
  50:	00000093          	li	ra,0
  54:	00000113          	li	sp,0
  58:	00000193          	li	gp,0
  5c:	00000213          	li	tp,0
  60:	00000293          	li	t0,0
  64:	00000313          	li	t1,0
  68:	00000393          	li	t2,0
  6c:	00000413          	li	s0,0
  70:	00000493          	li	s1,0
  74:	00000513          	li	a0,0
  78:	00000593          	li	a1,0
  7c:	00000613          	li	a2,0
  80:	00000693          	li	a3,0
  84:	00000713          	li	a4,0
  88:	00000793          	li	a5,0
  8c:	00000813          	li	a6,0
  90:	00000893          	li	a7,0
  94:	00000913          	li	s2,0
  98:	00000993          	li	s3,0
  9c:	00000a13          	li	s4,0
  a0:	00000a93          	li	s5,0
  a4:	00000b13          	li	s6,0
  a8:	00000b93          	li	s7,0
  ac:	00000c13          	li	s8,0
  b0:	00000c93          	li	s9,0
  b4:	00000d13          	li	s10,0
  b8:	00000d93          	li	s11,0
  bc:	00000e13          	li	t3,0
  c0:	00000e93          	li	t4,0
  c4:	00000f13          	li	t5,0
  c8:	00000f93          	li	t6,0
  cc:	f1402573          	csrr	a0,mhartid
  d0:	00051063          	bnez	a0,d0 <reset_vector+0x80>
  d4:	00000297          	auipc	t0,0x0
  d8:	01028293          	addi	t0,t0,16 # e4 <reset_vector+0x94>
  dc:	30529073          	csrw	mtvec,t0
  e0:	74445073          	csrwi	0x744,8
  e4:	00000297          	auipc	t0,0x0
  e8:	01028293          	addi	t0,t0,16 # f4 <reset_vector+0xa4>
  ec:	30529073          	csrw	mtvec,t0
  f0:	18005073          	csrwi	satp,0
  f4:	00000297          	auipc	t0,0x0
  f8:	02028293          	addi	t0,t0,32 # 114 <reset_vector+0xc4>
  fc:	30529073          	csrw	mtvec,t0
 100:	800002b7          	lui	t0,0x80000
 104:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff6ff>
 108:	3b029073          	csrw	pmpaddr0,t0
 10c:	01f00293          	li	t0,31
 110:	3a029073          	csrw	pmpcfg0,t0
 114:	30405073          	csrwi	mie,0
 118:	00000297          	auipc	t0,0x0
 11c:	01428293          	addi	t0,t0,20 # 12c <reset_vector+0xdc>
 120:	30529073          	csrw	mtvec,t0
 124:	30205073          	csrwi	medeleg,0
 128:	30305073          	csrwi	mideleg,0
 12c:	00000193          	li	gp,0
 130:	00000297          	auipc	t0,0x0
 134:	ed428293          	addi	t0,t0,-300 # 4 <trap_vector>
 138:	30529073          	csrw	mtvec,t0
 13c:	00100513          	li	a0,1
 140:	01f51513          	slli	a0,a0,0x1f
 144:	00054c63          	bltz	a0,15c <reset_vector+0x10c>
 148:	0ff0000f          	fence
 14c:	00100193          	li	gp,1
 150:	05d00893          	li	a7,93
 154:	00000513          	li	a0,0
 158:	00000073          	ecall
 15c:	00000293          	li	t0,0
 160:	00028a63          	beqz	t0,174 <reset_vector+0x124>
 164:	10529073          	csrw	stvec,t0
 168:	0000b2b7          	lui	t0,0xb
 16c:	10928293          	addi	t0,t0,265 # b109 <_end+0xa809>
 170:	30229073          	csrw	medeleg,t0
 174:	30005073          	csrwi	mstatus,0
 178:	00000297          	auipc	t0,0x0
 17c:	01428293          	addi	t0,t0,20 # 18c <test_2>
 180:	34129073          	csrw	mepc,t0
 184:	f1402573          	csrr	a0,mhartid
 188:	30200073          	mret

0000018c <test_2>:
 18c:	00200193          	li	gp,2
 190:	800005b7          	lui	a1,0x80000
 194:	00000613          	li	a2,0
 198:	00c5d733          	srl	a4,a1,a2
 19c:	800003b7          	lui	t2,0x80000
 1a0:	56771863          	bne	a4,t2,710 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	800005b7          	lui	a1,0x80000
 1ac:	00100613          	li	a2,1
 1b0:	00c5d733          	srl	a4,a1,a2
 1b4:	400003b7          	lui	t2,0x40000
 1b8:	54771c63          	bne	a4,t2,710 <fail>

000001bc <test_4>:
 1bc:	00400193          	li	gp,4
 1c0:	800005b7          	lui	a1,0x80000
 1c4:	00700613          	li	a2,7
 1c8:	00c5d733          	srl	a4,a1,a2
 1cc:	010003b7          	lui	t2,0x1000
 1d0:	54771063          	bne	a4,t2,710 <fail>

000001d4 <test_5>:
 1d4:	00500193          	li	gp,5
 1d8:	800005b7          	lui	a1,0x80000
 1dc:	00e00613          	li	a2,14
 1e0:	00c5d733          	srl	a4,a1,a2
 1e4:	000203b7          	lui	t2,0x20
 1e8:	52771463          	bne	a4,t2,710 <fail>

000001ec <test_6>:
 1ec:	00600193          	li	gp,6
 1f0:	800005b7          	lui	a1,0x80000
 1f4:	00158593          	addi	a1,a1,1 # 80000001 <_end+0x7ffff701>
 1f8:	01f00613          	li	a2,31
 1fc:	00c5d733          	srl	a4,a1,a2
 200:	00100393          	li	t2,1
 204:	50771663          	bne	a4,t2,710 <fail>

00000208 <test_7>:
 208:	00700193          	li	gp,7
 20c:	fff00593          	li	a1,-1
 210:	00000613          	li	a2,0
 214:	00c5d733          	srl	a4,a1,a2
 218:	fff00393          	li	t2,-1
 21c:	4e771a63          	bne	a4,t2,710 <fail>

00000220 <test_8>:
 220:	00800193          	li	gp,8
 224:	fff00593          	li	a1,-1
 228:	00100613          	li	a2,1
 22c:	00c5d733          	srl	a4,a1,a2
 230:	800003b7          	lui	t2,0x80000
 234:	fff38393          	addi	t2,t2,-1 # 7fffffff <_end+0x7ffff6ff>
 238:	4c771c63          	bne	a4,t2,710 <fail>

0000023c <test_9>:
 23c:	00900193          	li	gp,9
 240:	fff00593          	li	a1,-1
 244:	00700613          	li	a2,7
 248:	00c5d733          	srl	a4,a1,a2
 24c:	020003b7          	lui	t2,0x2000
 250:	fff38393          	addi	t2,t2,-1 # 1ffffff <_end+0x1fff6ff>
 254:	4a771e63          	bne	a4,t2,710 <fail>

00000258 <test_10>:
 258:	00a00193          	li	gp,10
 25c:	fff00593          	li	a1,-1
 260:	00e00613          	li	a2,14
 264:	00c5d733          	srl	a4,a1,a2
 268:	000403b7          	lui	t2,0x40
 26c:	fff38393          	addi	t2,t2,-1 # 3ffff <_end+0x3f6ff>
 270:	4a771063          	bne	a4,t2,710 <fail>

00000274 <test_11>:
 274:	00b00193          	li	gp,11
 278:	fff00593          	li	a1,-1
 27c:	01f00613          	li	a2,31
 280:	00c5d733          	srl	a4,a1,a2
 284:	00100393          	li	t2,1
 288:	48771463          	bne	a4,t2,710 <fail>

0000028c <test_12>:
 28c:	00c00193          	li	gp,12
 290:	212125b7          	lui	a1,0x21212
 294:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 298:	00000613          	li	a2,0
 29c:	00c5d733          	srl	a4,a1,a2
 2a0:	212123b7          	lui	t2,0x21212
 2a4:	12138393          	addi	t2,t2,289 # 21212121 <_end+0x21211821>
 2a8:	46771463          	bne	a4,t2,710 <fail>

000002ac <test_13>:
 2ac:	00d00193          	li	gp,13
 2b0:	212125b7          	lui	a1,0x21212
 2b4:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 2b8:	00100613          	li	a2,1
 2bc:	00c5d733          	srl	a4,a1,a2
 2c0:	109093b7          	lui	t2,0x10909
 2c4:	09038393          	addi	t2,t2,144 # 10909090 <_end+0x10908790>
 2c8:	44771463          	bne	a4,t2,710 <fail>

000002cc <test_14>:
 2cc:	00e00193          	li	gp,14
 2d0:	212125b7          	lui	a1,0x21212
 2d4:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 2d8:	00700613          	li	a2,7
 2dc:	00c5d733          	srl	a4,a1,a2
 2e0:	004243b7          	lui	t2,0x424
 2e4:	24238393          	addi	t2,t2,578 # 424242 <_end+0x423942>
 2e8:	42771463          	bne	a4,t2,710 <fail>

000002ec <test_15>:
 2ec:	00f00193          	li	gp,15
 2f0:	212125b7          	lui	a1,0x21212
 2f4:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 2f8:	00e00613          	li	a2,14
 2fc:	00c5d733          	srl	a4,a1,a2
 300:	000083b7          	lui	t2,0x8
 304:	48438393          	addi	t2,t2,1156 # 8484 <_end+0x7b84>
 308:	40771463          	bne	a4,t2,710 <fail>

0000030c <test_16>:
 30c:	01000193          	li	gp,16
 310:	212125b7          	lui	a1,0x21212
 314:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 318:	01f00613          	li	a2,31
 31c:	00c5d733          	srl	a4,a1,a2
 320:	00000393          	li	t2,0
 324:	3e771663          	bne	a4,t2,710 <fail>

00000328 <test_17>:
 328:	01100193          	li	gp,17
 32c:	212125b7          	lui	a1,0x21212
 330:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 334:	fc000613          	li	a2,-64
 338:	00c5d733          	srl	a4,a1,a2
 33c:	212123b7          	lui	t2,0x21212
 340:	12138393          	addi	t2,t2,289 # 21212121 <_end+0x21211821>
 344:	3c771663          	bne	a4,t2,710 <fail>

00000348 <test_18>:
 348:	01200193          	li	gp,18
 34c:	212125b7          	lui	a1,0x21212
 350:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 354:	fc100613          	li	a2,-63
 358:	00c5d733          	srl	a4,a1,a2
 35c:	109093b7          	lui	t2,0x10909
 360:	09038393          	addi	t2,t2,144 # 10909090 <_end+0x10908790>
 364:	3a771663          	bne	a4,t2,710 <fail>

00000368 <test_19>:
 368:	01300193          	li	gp,19
 36c:	212125b7          	lui	a1,0x21212
 370:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 374:	fc700613          	li	a2,-57
 378:	00c5d733          	srl	a4,a1,a2
 37c:	004243b7          	lui	t2,0x424
 380:	24238393          	addi	t2,t2,578 # 424242 <_end+0x423942>
 384:	38771663          	bne	a4,t2,710 <fail>

00000388 <test_20>:
 388:	01400193          	li	gp,20
 38c:	212125b7          	lui	a1,0x21212
 390:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 394:	fce00613          	li	a2,-50
 398:	00c5d733          	srl	a4,a1,a2
 39c:	000083b7          	lui	t2,0x8
 3a0:	48438393          	addi	t2,t2,1156 # 8484 <_end+0x7b84>
 3a4:	36771663          	bne	a4,t2,710 <fail>

000003a8 <test_21>:
 3a8:	01500193          	li	gp,21
 3ac:	212125b7          	lui	a1,0x21212
 3b0:	12158593          	addi	a1,a1,289 # 21212121 <_end+0x21211821>
 3b4:	fff00613          	li	a2,-1
 3b8:	00c5d733          	srl	a4,a1,a2
 3bc:	00000393          	li	t2,0
 3c0:	34771863          	bne	a4,t2,710 <fail>

000003c4 <test_22>:
 3c4:	01600193          	li	gp,22
 3c8:	800005b7          	lui	a1,0x80000
 3cc:	00700613          	li	a2,7
 3d0:	00c5d5b3          	srl	a1,a1,a2
 3d4:	010003b7          	lui	t2,0x1000
 3d8:	32759c63          	bne	a1,t2,710 <fail>

000003dc <test_23>:
 3dc:	01700193          	li	gp,23
 3e0:	800005b7          	lui	a1,0x80000
 3e4:	00e00613          	li	a2,14
 3e8:	00c5d633          	srl	a2,a1,a2
 3ec:	000203b7          	lui	t2,0x20
 3f0:	32761063          	bne	a2,t2,710 <fail>

000003f4 <test_24>:
 3f4:	01800193          	li	gp,24
 3f8:	00700593          	li	a1,7
 3fc:	00b5d5b3          	srl	a1,a1,a1
 400:	00000393          	li	t2,0
 404:	30759663          	bne	a1,t2,710 <fail>

00000408 <test_25>:
 408:	01900193          	li	gp,25
 40c:	00000213          	li	tp,0
 410:	800000b7          	lui	ra,0x80000
 414:	00700113          	li	sp,7
 418:	0020d733          	srl	a4,ra,sp
 41c:	00070313          	mv	t1,a4
 420:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 424:	00200293          	li	t0,2
 428:	fe5214e3          	bne	tp,t0,410 <test_25+0x8>
 42c:	010003b7          	lui	t2,0x1000
 430:	2e731063          	bne	t1,t2,710 <fail>

00000434 <test_26>:
 434:	01a00193          	li	gp,26
 438:	00000213          	li	tp,0
 43c:	800000b7          	lui	ra,0x80000
 440:	00e00113          	li	sp,14
 444:	0020d733          	srl	a4,ra,sp
 448:	00000013          	nop
 44c:	00070313          	mv	t1,a4
 450:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 454:	00200293          	li	t0,2
 458:	fe5212e3          	bne	tp,t0,43c <test_26+0x8>
 45c:	000203b7          	lui	t2,0x20
 460:	2a731863          	bne	t1,t2,710 <fail>

00000464 <test_27>:
 464:	01b00193          	li	gp,27
 468:	00000213          	li	tp,0
 46c:	800000b7          	lui	ra,0x80000
 470:	01f00113          	li	sp,31
 474:	0020d733          	srl	a4,ra,sp
 478:	00000013          	nop
 47c:	00000013          	nop
 480:	00070313          	mv	t1,a4
 484:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 488:	00200293          	li	t0,2
 48c:	fe5210e3          	bne	tp,t0,46c <test_27+0x8>
 490:	00100393          	li	t2,1
 494:	26731e63          	bne	t1,t2,710 <fail>

00000498 <test_28>:
 498:	01c00193          	li	gp,28
 49c:	00000213          	li	tp,0
 4a0:	800000b7          	lui	ra,0x80000
 4a4:	00700113          	li	sp,7
 4a8:	0020d733          	srl	a4,ra,sp
 4ac:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4b0:	00200293          	li	t0,2
 4b4:	fe5216e3          	bne	tp,t0,4a0 <test_28+0x8>
 4b8:	010003b7          	lui	t2,0x1000
 4bc:	24771a63          	bne	a4,t2,710 <fail>

000004c0 <test_29>:
 4c0:	01d00193          	li	gp,29
 4c4:	00000213          	li	tp,0
 4c8:	800000b7          	lui	ra,0x80000
 4cc:	00e00113          	li	sp,14
 4d0:	00000013          	nop
 4d4:	0020d733          	srl	a4,ra,sp
 4d8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4dc:	00200293          	li	t0,2
 4e0:	fe5214e3          	bne	tp,t0,4c8 <test_29+0x8>
 4e4:	000203b7          	lui	t2,0x20
 4e8:	22771463          	bne	a4,t2,710 <fail>

000004ec <test_30>:
 4ec:	01e00193          	li	gp,30
 4f0:	00000213          	li	tp,0
 4f4:	800000b7          	lui	ra,0x80000
 4f8:	01f00113          	li	sp,31
 4fc:	00000013          	nop
 500:	00000013          	nop
 504:	0020d733          	srl	a4,ra,sp
 508:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 50c:	00200293          	li	t0,2
 510:	fe5212e3          	bne	tp,t0,4f4 <test_30+0x8>
 514:	00100393          	li	t2,1
 518:	1e771c63          	bne	a4,t2,710 <fail>

0000051c <test_31>:
 51c:	01f00193          	li	gp,31
 520:	00000213          	li	tp,0
 524:	800000b7          	lui	ra,0x80000
 528:	00000013          	nop
 52c:	00700113          	li	sp,7
 530:	0020d733          	srl	a4,ra,sp
 534:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 538:	00200293          	li	t0,2
 53c:	fe5214e3          	bne	tp,t0,524 <test_31+0x8>
 540:	010003b7          	lui	t2,0x1000
 544:	1c771663          	bne	a4,t2,710 <fail>

00000548 <test_32>:
 548:	02000193          	li	gp,32
 54c:	00000213          	li	tp,0
 550:	800000b7          	lui	ra,0x80000
 554:	00000013          	nop
 558:	00e00113          	li	sp,14
 55c:	00000013          	nop
 560:	0020d733          	srl	a4,ra,sp
 564:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 568:	00200293          	li	t0,2
 56c:	fe5212e3          	bne	tp,t0,550 <test_32+0x8>
 570:	000203b7          	lui	t2,0x20
 574:	18771e63          	bne	a4,t2,710 <fail>

00000578 <test_33>:
 578:	02100193          	li	gp,33
 57c:	00000213          	li	tp,0
 580:	800000b7          	lui	ra,0x80000
 584:	00000013          	nop
 588:	00000013          	nop
 58c:	01f00113          	li	sp,31
 590:	0020d733          	srl	a4,ra,sp
 594:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 598:	00200293          	li	t0,2
 59c:	fe5212e3          	bne	tp,t0,580 <test_33+0x8>
 5a0:	00100393          	li	t2,1
 5a4:	16771663          	bne	a4,t2,710 <fail>

000005a8 <test_34>:
 5a8:	02200193          	li	gp,34
 5ac:	00000213          	li	tp,0
 5b0:	00700113          	li	sp,7
 5b4:	800000b7          	lui	ra,0x80000
 5b8:	0020d733          	srl	a4,ra,sp
 5bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5c0:	00200293          	li	t0,2
 5c4:	fe5216e3          	bne	tp,t0,5b0 <test_34+0x8>
 5c8:	010003b7          	lui	t2,0x1000
 5cc:	14771263          	bne	a4,t2,710 <fail>

000005d0 <test_35>:
 5d0:	02300193          	li	gp,35
 5d4:	00000213          	li	tp,0
 5d8:	00e00113          	li	sp,14
 5dc:	800000b7          	lui	ra,0x80000
 5e0:	00000013          	nop
 5e4:	0020d733          	srl	a4,ra,sp
 5e8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5ec:	00200293          	li	t0,2
 5f0:	fe5214e3          	bne	tp,t0,5d8 <test_35+0x8>
 5f4:	000203b7          	lui	t2,0x20
 5f8:	10771c63          	bne	a4,t2,710 <fail>

000005fc <test_36>:
 5fc:	02400193          	li	gp,36
 600:	00000213          	li	tp,0
 604:	01f00113          	li	sp,31
 608:	800000b7          	lui	ra,0x80000
 60c:	00000013          	nop
 610:	00000013          	nop
 614:	0020d733          	srl	a4,ra,sp
 618:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 61c:	00200293          	li	t0,2
 620:	fe5212e3          	bne	tp,t0,604 <test_36+0x8>
 624:	00100393          	li	t2,1
 628:	0e771463          	bne	a4,t2,710 <fail>

0000062c <test_37>:
 62c:	02500193          	li	gp,37
 630:	00000213          	li	tp,0
 634:	00700113          	li	sp,7
 638:	00000013          	nop
 63c:	800000b7          	lui	ra,0x80000
 640:	0020d733          	srl	a4,ra,sp
 644:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 648:	00200293          	li	t0,2
 64c:	fe5214e3          	bne	tp,t0,634 <test_37+0x8>
 650:	010003b7          	lui	t2,0x1000
 654:	0a771e63          	bne	a4,t2,710 <fail>

00000658 <test_38>:
 658:	02600193          	li	gp,38
 65c:	00000213          	li	tp,0
 660:	00e00113          	li	sp,14
 664:	00000013          	nop
 668:	800000b7          	lui	ra,0x80000
 66c:	00000013          	nop
 670:	0020d733          	srl	a4,ra,sp
 674:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 678:	00200293          	li	t0,2
 67c:	fe5212e3          	bne	tp,t0,660 <test_38+0x8>
 680:	000203b7          	lui	t2,0x20
 684:	08771663          	bne	a4,t2,710 <fail>

00000688 <test_39>:
 688:	02700193          	li	gp,39
 68c:	00000213          	li	tp,0
 690:	01f00113          	li	sp,31
 694:	00000013          	nop
 698:	00000013          	nop
 69c:	800000b7          	lui	ra,0x80000
 6a0:	0020d733          	srl	a4,ra,sp
 6a4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 6a8:	00200293          	li	t0,2
 6ac:	fe5212e3          	bne	tp,t0,690 <test_39+0x8>
 6b0:	00100393          	li	t2,1
 6b4:	04771e63          	bne	a4,t2,710 <fail>

000006b8 <test_40>:
 6b8:	02800193          	li	gp,40
 6bc:	00f00093          	li	ra,15
 6c0:	00105133          	srl	sp,zero,ra
 6c4:	00000393          	li	t2,0
 6c8:	04711463          	bne	sp,t2,710 <fail>

000006cc <test_41>:
 6cc:	02900193          	li	gp,41
 6d0:	02000093          	li	ra,32
 6d4:	0000d133          	srl	sp,ra,zero
 6d8:	02000393          	li	t2,32
 6dc:	02711a63          	bne	sp,t2,710 <fail>

000006e0 <test_42>:
 6e0:	02a00193          	li	gp,42
 6e4:	000050b3          	srl	ra,zero,zero
 6e8:	00000393          	li	t2,0
 6ec:	02709263          	bne	ra,t2,710 <fail>

000006f0 <test_43>:
 6f0:	02b00193          	li	gp,43
 6f4:	40000093          	li	ra,1024
 6f8:	00001137          	lui	sp,0x1
 6fc:	80010113          	addi	sp,sp,-2048 # 800 <tohost>
 700:	0020d033          	srl	zero,ra,sp
 704:	00000393          	li	t2,0
 708:	00701463          	bne	zero,t2,710 <fail>
 70c:	02301063          	bne	zero,gp,72c <pass>

00000710 <fail>:
 710:	0ff0000f          	fence
 714:	00018063          	beqz	gp,714 <fail+0x4>
 718:	00119193          	slli	gp,gp,0x1
 71c:	0011e193          	ori	gp,gp,1
 720:	05d00893          	li	a7,93
 724:	00018513          	mv	a0,gp
 728:	00000073          	ecall

0000072c <pass>:
 72c:	0ff0000f          	fence
 730:	00100193          	li	gp,1
 734:	05d00893          	li	a7,93
 738:	00000513          	li	a0,0
 73c:	00000073          	ecall
 740:	c0001073          	unimp
 744:	0000                	.insn	2, 0x
 746:	0000                	.insn	2, 0x
 748:	0000                	.insn	2, 0x
 74a:	0000                	.insn	2, 0x
 74c:	0000                	.insn	2, 0x
 74e:	0000                	.insn	2, 0x
 750:	0000                	.insn	2, 0x
 752:	0000                	.insn	2, 0x
 754:	0000                	.insn	2, 0x
 756:	0000                	.insn	2, 0x
 758:	0000                	.insn	2, 0x
 75a:	0000                	.insn	2, 0x
 75c:	0000                	.insn	2, 0x
 75e:	0000                	.insn	2, 0x
 760:	0000                	.insn	2, 0x
 762:	0000                	.insn	2, 0x
 764:	0000                	.insn	2, 0x
 766:	0000                	.insn	2, 0x
 768:	0000                	.insn	2, 0x
 76a:	0000                	.insn	2, 0x
 76c:	0000                	.insn	2, 0x
 76e:	0000                	.insn	2, 0x
 770:	0000                	.insn	2, 0x
 772:	0000                	.insn	2, 0x
 774:	0000                	.insn	2, 0x
 776:	0000                	.insn	2, 0x
 778:	0000                	.insn	2, 0x
 77a:	0000                	.insn	2, 0x
