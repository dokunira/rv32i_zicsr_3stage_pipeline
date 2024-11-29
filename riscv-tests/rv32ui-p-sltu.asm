
rv32ui-p-sltu:     file format elf32-littleriscv


Disassembly of section .text.init:

00000000 <_start>:
   0:	0480006f          	j	48 <reset_vector>

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
  3c:	70302023          	sw	gp,1792(zero) # 700 <tohost>
  40:	70002223          	sw	zero,1796(zero) # 704 <tohost+0x4>
  44:	ff9ff06f          	j	3c <write_tohost>

00000048 <reset_vector>:
  48:	00000093          	li	ra,0
  4c:	00000113          	li	sp,0
  50:	00000193          	li	gp,0
  54:	00000213          	li	tp,0
  58:	00000293          	li	t0,0
  5c:	00000313          	li	t1,0
  60:	00000393          	li	t2,0
  64:	00000413          	li	s0,0
  68:	00000493          	li	s1,0
  6c:	00000513          	li	a0,0
  70:	00000593          	li	a1,0
  74:	00000613          	li	a2,0
  78:	00000693          	li	a3,0
  7c:	00000713          	li	a4,0
  80:	00000793          	li	a5,0
  84:	00000813          	li	a6,0
  88:	00000893          	li	a7,0
  8c:	00000913          	li	s2,0
  90:	00000993          	li	s3,0
  94:	00000a13          	li	s4,0
  98:	00000a93          	li	s5,0
  9c:	00000b13          	li	s6,0
  a0:	00000b93          	li	s7,0
  a4:	00000c13          	li	s8,0
  a8:	00000c93          	li	s9,0
  ac:	00000d13          	li	s10,0
  b0:	00000d93          	li	s11,0
  b4:	00000e13          	li	t3,0
  b8:	00000e93          	li	t4,0
  bc:	00000f13          	li	t5,0
  c0:	00000f93          	li	t6,0
  c4:	f1402573          	csrr	a0,mhartid
  c8:	00051063          	bnez	a0,c8 <reset_vector+0x80>
  cc:	00000297          	auipc	t0,0x0
  d0:	01028293          	addi	t0,t0,16 # dc <reset_vector+0x94>
  d4:	30529073          	csrw	mtvec,t0
  d8:	74445073          	csrwi	0x744,8
  dc:	00000297          	auipc	t0,0x0
  e0:	01028293          	addi	t0,t0,16 # ec <reset_vector+0xa4>
  e4:	30529073          	csrw	mtvec,t0
  e8:	18005073          	csrwi	satp,0
  ec:	00000297          	auipc	t0,0x0
  f0:	02028293          	addi	t0,t0,32 # 10c <reset_vector+0xc4>
  f4:	30529073          	csrw	mtvec,t0
  f8:	800002b7          	lui	t0,0x80000
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff7ff>
 100:	3b029073          	csrw	pmpaddr0,t0
 104:	01f00293          	li	t0,31
 108:	3a029073          	csrw	pmpcfg0,t0
 10c:	30405073          	csrwi	mie,0
 110:	00000297          	auipc	t0,0x0
 114:	01428293          	addi	t0,t0,20 # 124 <reset_vector+0xdc>
 118:	30529073          	csrw	mtvec,t0
 11c:	30205073          	csrwi	medeleg,0
 120:	30305073          	csrwi	mideleg,0
 124:	00000193          	li	gp,0
 128:	00000297          	auipc	t0,0x0
 12c:	edc28293          	addi	t0,t0,-292 # 4 <trap_vector>
 130:	30529073          	csrw	mtvec,t0
 134:	00100513          	li	a0,1
 138:	01f51513          	slli	a0,a0,0x1f
 13c:	00054c63          	bltz	a0,154 <reset_vector+0x10c>
 140:	0ff0000f          	fence
 144:	00100193          	li	gp,1
 148:	05d00893          	li	a7,93
 14c:	00000513          	li	a0,0
 150:	00000073          	ecall
 154:	00000293          	li	t0,0
 158:	00028a63          	beqz	t0,16c <reset_vector+0x124>
 15c:	10529073          	csrw	stvec,t0
 160:	0000b2b7          	lui	t0,0xb
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xa909>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	00000593          	li	a1,0
 18c:	00000613          	li	a2,0
 190:	00c5b733          	sltu	a4,a1,a2
 194:	00000393          	li	t2,0
 198:	4a771a63          	bne	a4,t2,64c <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	00100593          	li	a1,1
 1a4:	00100613          	li	a2,1
 1a8:	00c5b733          	sltu	a4,a1,a2
 1ac:	00000393          	li	t2,0
 1b0:	48771e63          	bne	a4,t2,64c <fail>

000001b4 <test_4>:
 1b4:	00400193          	li	gp,4
 1b8:	00300593          	li	a1,3
 1bc:	00700613          	li	a2,7
 1c0:	00c5b733          	sltu	a4,a1,a2
 1c4:	00100393          	li	t2,1
 1c8:	48771263          	bne	a4,t2,64c <fail>

000001cc <test_5>:
 1cc:	00500193          	li	gp,5
 1d0:	00700593          	li	a1,7
 1d4:	00300613          	li	a2,3
 1d8:	00c5b733          	sltu	a4,a1,a2
 1dc:	00000393          	li	t2,0
 1e0:	46771663          	bne	a4,t2,64c <fail>

000001e4 <test_6>:
 1e4:	00600193          	li	gp,6
 1e8:	00000593          	li	a1,0
 1ec:	ffff8637          	lui	a2,0xffff8
 1f0:	00c5b733          	sltu	a4,a1,a2
 1f4:	00100393          	li	t2,1
 1f8:	44771a63          	bne	a4,t2,64c <fail>

000001fc <test_7>:
 1fc:	00700193          	li	gp,7
 200:	800005b7          	lui	a1,0x80000
 204:	00000613          	li	a2,0
 208:	00c5b733          	sltu	a4,a1,a2
 20c:	00000393          	li	t2,0
 210:	42771e63          	bne	a4,t2,64c <fail>

00000214 <test_8>:
 214:	00800193          	li	gp,8
 218:	800005b7          	lui	a1,0x80000
 21c:	ffff8637          	lui	a2,0xffff8
 220:	00c5b733          	sltu	a4,a1,a2
 224:	00100393          	li	t2,1
 228:	42771263          	bne	a4,t2,64c <fail>

0000022c <test_9>:
 22c:	00900193          	li	gp,9
 230:	00000593          	li	a1,0
 234:	00008637          	lui	a2,0x8
 238:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 23c:	00c5b733          	sltu	a4,a1,a2
 240:	00100393          	li	t2,1
 244:	40771463          	bne	a4,t2,64c <fail>

00000248 <test_10>:
 248:	00a00193          	li	gp,10
 24c:	800005b7          	lui	a1,0x80000
 250:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 254:	00000613          	li	a2,0
 258:	00c5b733          	sltu	a4,a1,a2
 25c:	00000393          	li	t2,0
 260:	3e771663          	bne	a4,t2,64c <fail>

00000264 <test_11>:
 264:	00b00193          	li	gp,11
 268:	800005b7          	lui	a1,0x80000
 26c:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 270:	00008637          	lui	a2,0x8
 274:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 278:	00c5b733          	sltu	a4,a1,a2
 27c:	00000393          	li	t2,0
 280:	3c771663          	bne	a4,t2,64c <fail>

00000284 <test_12>:
 284:	00c00193          	li	gp,12
 288:	800005b7          	lui	a1,0x80000
 28c:	00008637          	lui	a2,0x8
 290:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 294:	00c5b733          	sltu	a4,a1,a2
 298:	00000393          	li	t2,0
 29c:	3a771863          	bne	a4,t2,64c <fail>

000002a0 <test_13>:
 2a0:	00d00193          	li	gp,13
 2a4:	800005b7          	lui	a1,0x80000
 2a8:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 2ac:	ffff8637          	lui	a2,0xffff8
 2b0:	00c5b733          	sltu	a4,a1,a2
 2b4:	00100393          	li	t2,1
 2b8:	38771a63          	bne	a4,t2,64c <fail>

000002bc <test_14>:
 2bc:	00e00193          	li	gp,14
 2c0:	00000593          	li	a1,0
 2c4:	fff00613          	li	a2,-1
 2c8:	00c5b733          	sltu	a4,a1,a2
 2cc:	00100393          	li	t2,1
 2d0:	36771e63          	bne	a4,t2,64c <fail>

000002d4 <test_15>:
 2d4:	00f00193          	li	gp,15
 2d8:	fff00593          	li	a1,-1
 2dc:	00100613          	li	a2,1
 2e0:	00c5b733          	sltu	a4,a1,a2
 2e4:	00000393          	li	t2,0
 2e8:	36771263          	bne	a4,t2,64c <fail>

000002ec <test_16>:
 2ec:	01000193          	li	gp,16
 2f0:	fff00593          	li	a1,-1
 2f4:	fff00613          	li	a2,-1
 2f8:	00c5b733          	sltu	a4,a1,a2
 2fc:	00000393          	li	t2,0
 300:	34771663          	bne	a4,t2,64c <fail>

00000304 <test_17>:
 304:	01100193          	li	gp,17
 308:	00e00593          	li	a1,14
 30c:	00d00613          	li	a2,13
 310:	00c5b5b3          	sltu	a1,a1,a2
 314:	00000393          	li	t2,0
 318:	32759a63          	bne	a1,t2,64c <fail>

0000031c <test_18>:
 31c:	01200193          	li	gp,18
 320:	00b00593          	li	a1,11
 324:	00d00613          	li	a2,13
 328:	00c5b633          	sltu	a2,a1,a2
 32c:	00100393          	li	t2,1
 330:	30761e63          	bne	a2,t2,64c <fail>

00000334 <test_19>:
 334:	01300193          	li	gp,19
 338:	00d00593          	li	a1,13
 33c:	00b5b5b3          	sltu	a1,a1,a1
 340:	00000393          	li	t2,0
 344:	30759463          	bne	a1,t2,64c <fail>

00000348 <test_20>:
 348:	01400193          	li	gp,20
 34c:	00000213          	li	tp,0
 350:	00b00093          	li	ra,11
 354:	00d00113          	li	sp,13
 358:	0020b733          	sltu	a4,ra,sp
 35c:	00070313          	mv	t1,a4
 360:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 364:	00200293          	li	t0,2
 368:	fe5214e3          	bne	tp,t0,350 <test_20+0x8>
 36c:	00100393          	li	t2,1
 370:	2c731e63          	bne	t1,t2,64c <fail>

00000374 <test_21>:
 374:	01500193          	li	gp,21
 378:	00000213          	li	tp,0
 37c:	00e00093          	li	ra,14
 380:	00d00113          	li	sp,13
 384:	0020b733          	sltu	a4,ra,sp
 388:	00000013          	nop
 38c:	00070313          	mv	t1,a4
 390:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 394:	00200293          	li	t0,2
 398:	fe5212e3          	bne	tp,t0,37c <test_21+0x8>
 39c:	00000393          	li	t2,0
 3a0:	2a731663          	bne	t1,t2,64c <fail>

000003a4 <test_22>:
 3a4:	01600193          	li	gp,22
 3a8:	00000213          	li	tp,0
 3ac:	00c00093          	li	ra,12
 3b0:	00d00113          	li	sp,13
 3b4:	0020b733          	sltu	a4,ra,sp
 3b8:	00000013          	nop
 3bc:	00000013          	nop
 3c0:	00070313          	mv	t1,a4
 3c4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c8:	00200293          	li	t0,2
 3cc:	fe5210e3          	bne	tp,t0,3ac <test_22+0x8>
 3d0:	00100393          	li	t2,1
 3d4:	26731c63          	bne	t1,t2,64c <fail>

000003d8 <test_23>:
 3d8:	01700193          	li	gp,23
 3dc:	00000213          	li	tp,0
 3e0:	00e00093          	li	ra,14
 3e4:	00d00113          	li	sp,13
 3e8:	0020b733          	sltu	a4,ra,sp
 3ec:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3f0:	00200293          	li	t0,2
 3f4:	fe5216e3          	bne	tp,t0,3e0 <test_23+0x8>
 3f8:	00000393          	li	t2,0
 3fc:	24771863          	bne	a4,t2,64c <fail>

00000400 <test_24>:
 400:	01800193          	li	gp,24
 404:	00000213          	li	tp,0
 408:	00b00093          	li	ra,11
 40c:	00d00113          	li	sp,13
 410:	00000013          	nop
 414:	0020b733          	sltu	a4,ra,sp
 418:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 41c:	00200293          	li	t0,2
 420:	fe5214e3          	bne	tp,t0,408 <test_24+0x8>
 424:	00100393          	li	t2,1
 428:	22771263          	bne	a4,t2,64c <fail>

0000042c <test_25>:
 42c:	01900193          	li	gp,25
 430:	00000213          	li	tp,0
 434:	00f00093          	li	ra,15
 438:	00d00113          	li	sp,13
 43c:	00000013          	nop
 440:	00000013          	nop
 444:	0020b733          	sltu	a4,ra,sp
 448:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 44c:	00200293          	li	t0,2
 450:	fe5212e3          	bne	tp,t0,434 <test_25+0x8>
 454:	00000393          	li	t2,0
 458:	1e771a63          	bne	a4,t2,64c <fail>

0000045c <test_26>:
 45c:	01a00193          	li	gp,26
 460:	00000213          	li	tp,0
 464:	00a00093          	li	ra,10
 468:	00000013          	nop
 46c:	00d00113          	li	sp,13
 470:	0020b733          	sltu	a4,ra,sp
 474:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 478:	00200293          	li	t0,2
 47c:	fe5214e3          	bne	tp,t0,464 <test_26+0x8>
 480:	00100393          	li	t2,1
 484:	1c771463          	bne	a4,t2,64c <fail>

00000488 <test_27>:
 488:	01b00193          	li	gp,27
 48c:	00000213          	li	tp,0
 490:	01000093          	li	ra,16
 494:	00000013          	nop
 498:	00d00113          	li	sp,13
 49c:	00000013          	nop
 4a0:	0020b733          	sltu	a4,ra,sp
 4a4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4a8:	00200293          	li	t0,2
 4ac:	fe5212e3          	bne	tp,t0,490 <test_27+0x8>
 4b0:	00000393          	li	t2,0
 4b4:	18771c63          	bne	a4,t2,64c <fail>

000004b8 <test_28>:
 4b8:	01c00193          	li	gp,28
 4bc:	00000213          	li	tp,0
 4c0:	00900093          	li	ra,9
 4c4:	00000013          	nop
 4c8:	00000013          	nop
 4cc:	00d00113          	li	sp,13
 4d0:	0020b733          	sltu	a4,ra,sp
 4d4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4d8:	00200293          	li	t0,2
 4dc:	fe5212e3          	bne	tp,t0,4c0 <test_28+0x8>
 4e0:	00100393          	li	t2,1
 4e4:	16771463          	bne	a4,t2,64c <fail>

000004e8 <test_29>:
 4e8:	01d00193          	li	gp,29
 4ec:	00000213          	li	tp,0
 4f0:	00d00113          	li	sp,13
 4f4:	01100093          	li	ra,17
 4f8:	0020b733          	sltu	a4,ra,sp
 4fc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 500:	00200293          	li	t0,2
 504:	fe5216e3          	bne	tp,t0,4f0 <test_29+0x8>
 508:	00000393          	li	t2,0
 50c:	14771063          	bne	a4,t2,64c <fail>

00000510 <test_30>:
 510:	01e00193          	li	gp,30
 514:	00000213          	li	tp,0
 518:	00d00113          	li	sp,13
 51c:	00800093          	li	ra,8
 520:	00000013          	nop
 524:	0020b733          	sltu	a4,ra,sp
 528:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 52c:	00200293          	li	t0,2
 530:	fe5214e3          	bne	tp,t0,518 <test_30+0x8>
 534:	00100393          	li	t2,1
 538:	10771a63          	bne	a4,t2,64c <fail>

0000053c <test_31>:
 53c:	01f00193          	li	gp,31
 540:	00000213          	li	tp,0
 544:	00d00113          	li	sp,13
 548:	01200093          	li	ra,18
 54c:	00000013          	nop
 550:	00000013          	nop
 554:	0020b733          	sltu	a4,ra,sp
 558:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 55c:	00200293          	li	t0,2
 560:	fe5212e3          	bne	tp,t0,544 <test_31+0x8>
 564:	00000393          	li	t2,0
 568:	0e771263          	bne	a4,t2,64c <fail>

0000056c <test_32>:
 56c:	02000193          	li	gp,32
 570:	00000213          	li	tp,0
 574:	00d00113          	li	sp,13
 578:	00000013          	nop
 57c:	00700093          	li	ra,7
 580:	0020b733          	sltu	a4,ra,sp
 584:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 588:	00200293          	li	t0,2
 58c:	fe5214e3          	bne	tp,t0,574 <test_32+0x8>
 590:	00100393          	li	t2,1
 594:	0a771c63          	bne	a4,t2,64c <fail>

00000598 <test_33>:
 598:	02100193          	li	gp,33
 59c:	00000213          	li	tp,0
 5a0:	00d00113          	li	sp,13
 5a4:	00000013          	nop
 5a8:	01300093          	li	ra,19
 5ac:	00000013          	nop
 5b0:	0020b733          	sltu	a4,ra,sp
 5b4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5b8:	00200293          	li	t0,2
 5bc:	fe5212e3          	bne	tp,t0,5a0 <test_33+0x8>
 5c0:	00000393          	li	t2,0
 5c4:	08771463          	bne	a4,t2,64c <fail>

000005c8 <test_34>:
 5c8:	02200193          	li	gp,34
 5cc:	00000213          	li	tp,0
 5d0:	00d00113          	li	sp,13
 5d4:	00000013          	nop
 5d8:	00000013          	nop
 5dc:	00600093          	li	ra,6
 5e0:	0020b733          	sltu	a4,ra,sp
 5e4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5e8:	00200293          	li	t0,2
 5ec:	fe5212e3          	bne	tp,t0,5d0 <test_34+0x8>
 5f0:	00100393          	li	t2,1
 5f4:	04771c63          	bne	a4,t2,64c <fail>

000005f8 <test_35>:
 5f8:	02300193          	li	gp,35
 5fc:	fff00093          	li	ra,-1
 600:	00103133          	snez	sp,ra
 604:	00100393          	li	t2,1
 608:	04711263          	bne	sp,t2,64c <fail>

0000060c <test_36>:
 60c:	02400193          	li	gp,36
 610:	fff00093          	li	ra,-1
 614:	0000b133          	sltu	sp,ra,zero
 618:	00000393          	li	t2,0
 61c:	02711863          	bne	sp,t2,64c <fail>

00000620 <test_37>:
 620:	02500193          	li	gp,37
 624:	000030b3          	snez	ra,zero
 628:	00000393          	li	t2,0
 62c:	02709063          	bne	ra,t2,64c <fail>

00000630 <test_38>:
 630:	02600193          	li	gp,38
 634:	01000093          	li	ra,16
 638:	01e00113          	li	sp,30
 63c:	0020b033          	sltu	zero,ra,sp
 640:	00000393          	li	t2,0
 644:	00701463          	bne	zero,t2,64c <fail>
 648:	02301063          	bne	zero,gp,668 <pass>

0000064c <fail>:
 64c:	0ff0000f          	fence
 650:	00018063          	beqz	gp,650 <fail+0x4>
 654:	00119193          	slli	gp,gp,0x1
 658:	0011e193          	ori	gp,gp,1
 65c:	05d00893          	li	a7,93
 660:	00018513          	mv	a0,gp
 664:	00000073          	ecall

00000668 <pass>:
 668:	0ff0000f          	fence
 66c:	00100193          	li	gp,1
 670:	05d00893          	li	a7,93
 674:	00000513          	li	a0,0
 678:	00000073          	ecall
 67c:	c0001073          	unimp
 680:	0000                	.insn	2, 0x
 682:	0000                	.insn	2, 0x
 684:	0000                	.insn	2, 0x
 686:	0000                	.insn	2, 0x
 688:	0000                	.insn	2, 0x
 68a:	0000                	.insn	2, 0x
 68c:	0000                	.insn	2, 0x
 68e:	0000                	.insn	2, 0x
 690:	0000                	.insn	2, 0x
 692:	0000                	.insn	2, 0x
 694:	0000                	.insn	2, 0x
 696:	0000                	.insn	2, 0x
 698:	0000                	.insn	2, 0x
 69a:	0000                	.insn	2, 0x
 69c:	0000                	.insn	2, 0x
 69e:	0000                	.insn	2, 0x
 6a0:	0000                	.insn	2, 0x
 6a2:	0000                	.insn	2, 0x
 6a4:	0000                	.insn	2, 0x
 6a6:	0000                	.insn	2, 0x
 6a8:	0000                	.insn	2, 0x
 6aa:	0000                	.insn	2, 0x
 6ac:	0000                	.insn	2, 0x
 6ae:	0000                	.insn	2, 0x
 6b0:	0000                	.insn	2, 0x
 6b2:	0000                	.insn	2, 0x
