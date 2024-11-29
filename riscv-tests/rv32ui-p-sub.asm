
rv32ui-p-sub:     file format elf32-littleriscv


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
 190:	40c58733          	sub	a4,a1,a2
 194:	00000393          	li	t2,0
 198:	4a771663          	bne	a4,t2,644 <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	00100593          	li	a1,1
 1a4:	00100613          	li	a2,1
 1a8:	40c58733          	sub	a4,a1,a2
 1ac:	00000393          	li	t2,0
 1b0:	48771a63          	bne	a4,t2,644 <fail>

000001b4 <test_4>:
 1b4:	00400193          	li	gp,4
 1b8:	00300593          	li	a1,3
 1bc:	00700613          	li	a2,7
 1c0:	40c58733          	sub	a4,a1,a2
 1c4:	ffc00393          	li	t2,-4
 1c8:	46771e63          	bne	a4,t2,644 <fail>

000001cc <test_5>:
 1cc:	00500193          	li	gp,5
 1d0:	00000593          	li	a1,0
 1d4:	ffff8637          	lui	a2,0xffff8
 1d8:	40c58733          	sub	a4,a1,a2
 1dc:	000083b7          	lui	t2,0x8
 1e0:	46771263          	bne	a4,t2,644 <fail>

000001e4 <test_6>:
 1e4:	00600193          	li	gp,6
 1e8:	800005b7          	lui	a1,0x80000
 1ec:	00000613          	li	a2,0
 1f0:	40c58733          	sub	a4,a1,a2
 1f4:	800003b7          	lui	t2,0x80000
 1f8:	44771663          	bne	a4,t2,644 <fail>

000001fc <test_7>:
 1fc:	00700193          	li	gp,7
 200:	800005b7          	lui	a1,0x80000
 204:	ffff8637          	lui	a2,0xffff8
 208:	40c58733          	sub	a4,a1,a2
 20c:	800083b7          	lui	t2,0x80008
 210:	42771a63          	bne	a4,t2,644 <fail>

00000214 <test_8>:
 214:	00800193          	li	gp,8
 218:	00000593          	li	a1,0
 21c:	00008637          	lui	a2,0x8
 220:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 224:	40c58733          	sub	a4,a1,a2
 228:	ffff83b7          	lui	t2,0xffff8
 22c:	00138393          	addi	t2,t2,1 # ffff8001 <_end+0xffff7801>
 230:	40771a63          	bne	a4,t2,644 <fail>

00000234 <test_9>:
 234:	00900193          	li	gp,9
 238:	800005b7          	lui	a1,0x80000
 23c:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 240:	00000613          	li	a2,0
 244:	40c58733          	sub	a4,a1,a2
 248:	800003b7          	lui	t2,0x80000
 24c:	fff38393          	addi	t2,t2,-1 # 7fffffff <_end+0x7ffff7ff>
 250:	3e771a63          	bne	a4,t2,644 <fail>

00000254 <test_10>:
 254:	00a00193          	li	gp,10
 258:	800005b7          	lui	a1,0x80000
 25c:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 260:	00008637          	lui	a2,0x8
 264:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 268:	40c58733          	sub	a4,a1,a2
 26c:	7fff83b7          	lui	t2,0x7fff8
 270:	3c771a63          	bne	a4,t2,644 <fail>

00000274 <test_11>:
 274:	00b00193          	li	gp,11
 278:	800005b7          	lui	a1,0x80000
 27c:	00008637          	lui	a2,0x8
 280:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 284:	40c58733          	sub	a4,a1,a2
 288:	7fff83b7          	lui	t2,0x7fff8
 28c:	00138393          	addi	t2,t2,1 # 7fff8001 <_end+0x7fff7801>
 290:	3a771a63          	bne	a4,t2,644 <fail>

00000294 <test_12>:
 294:	00c00193          	li	gp,12
 298:	800005b7          	lui	a1,0x80000
 29c:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 2a0:	ffff8637          	lui	a2,0xffff8
 2a4:	40c58733          	sub	a4,a1,a2
 2a8:	800083b7          	lui	t2,0x80008
 2ac:	fff38393          	addi	t2,t2,-1 # 80007fff <_end+0x800077ff>
 2b0:	38771a63          	bne	a4,t2,644 <fail>

000002b4 <test_13>:
 2b4:	00d00193          	li	gp,13
 2b8:	00000593          	li	a1,0
 2bc:	fff00613          	li	a2,-1
 2c0:	40c58733          	sub	a4,a1,a2
 2c4:	00100393          	li	t2,1
 2c8:	36771e63          	bne	a4,t2,644 <fail>

000002cc <test_14>:
 2cc:	00e00193          	li	gp,14
 2d0:	fff00593          	li	a1,-1
 2d4:	00100613          	li	a2,1
 2d8:	40c58733          	sub	a4,a1,a2
 2dc:	ffe00393          	li	t2,-2
 2e0:	36771263          	bne	a4,t2,644 <fail>

000002e4 <test_15>:
 2e4:	00f00193          	li	gp,15
 2e8:	fff00593          	li	a1,-1
 2ec:	fff00613          	li	a2,-1
 2f0:	40c58733          	sub	a4,a1,a2
 2f4:	00000393          	li	t2,0
 2f8:	34771663          	bne	a4,t2,644 <fail>

000002fc <test_16>:
 2fc:	01000193          	li	gp,16
 300:	00d00593          	li	a1,13
 304:	00b00613          	li	a2,11
 308:	40c585b3          	sub	a1,a1,a2
 30c:	00200393          	li	t2,2
 310:	32759a63          	bne	a1,t2,644 <fail>

00000314 <test_17>:
 314:	01100193          	li	gp,17
 318:	00e00593          	li	a1,14
 31c:	00b00613          	li	a2,11
 320:	40c58633          	sub	a2,a1,a2
 324:	00300393          	li	t2,3
 328:	30761e63          	bne	a2,t2,644 <fail>

0000032c <test_18>:
 32c:	01200193          	li	gp,18
 330:	00d00593          	li	a1,13
 334:	40b585b3          	sub	a1,a1,a1
 338:	00000393          	li	t2,0
 33c:	30759463          	bne	a1,t2,644 <fail>

00000340 <test_19>:
 340:	01300193          	li	gp,19
 344:	00000213          	li	tp,0
 348:	00d00093          	li	ra,13
 34c:	00b00113          	li	sp,11
 350:	40208733          	sub	a4,ra,sp
 354:	00070313          	mv	t1,a4
 358:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 35c:	00200293          	li	t0,2
 360:	fe5214e3          	bne	tp,t0,348 <test_19+0x8>
 364:	00200393          	li	t2,2
 368:	2c731e63          	bne	t1,t2,644 <fail>

0000036c <test_20>:
 36c:	01400193          	li	gp,20
 370:	00000213          	li	tp,0
 374:	00e00093          	li	ra,14
 378:	00b00113          	li	sp,11
 37c:	40208733          	sub	a4,ra,sp
 380:	00000013          	nop
 384:	00070313          	mv	t1,a4
 388:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 38c:	00200293          	li	t0,2
 390:	fe5212e3          	bne	tp,t0,374 <test_20+0x8>
 394:	00300393          	li	t2,3
 398:	2a731663          	bne	t1,t2,644 <fail>

0000039c <test_21>:
 39c:	01500193          	li	gp,21
 3a0:	00000213          	li	tp,0
 3a4:	00f00093          	li	ra,15
 3a8:	00b00113          	li	sp,11
 3ac:	40208733          	sub	a4,ra,sp
 3b0:	00000013          	nop
 3b4:	00000013          	nop
 3b8:	00070313          	mv	t1,a4
 3bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c0:	00200293          	li	t0,2
 3c4:	fe5210e3          	bne	tp,t0,3a4 <test_21+0x8>
 3c8:	00400393          	li	t2,4
 3cc:	26731c63          	bne	t1,t2,644 <fail>

000003d0 <test_22>:
 3d0:	01600193          	li	gp,22
 3d4:	00000213          	li	tp,0
 3d8:	00d00093          	li	ra,13
 3dc:	00b00113          	li	sp,11
 3e0:	40208733          	sub	a4,ra,sp
 3e4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3e8:	00200293          	li	t0,2
 3ec:	fe5216e3          	bne	tp,t0,3d8 <test_22+0x8>
 3f0:	00200393          	li	t2,2
 3f4:	24771863          	bne	a4,t2,644 <fail>

000003f8 <test_23>:
 3f8:	01700193          	li	gp,23
 3fc:	00000213          	li	tp,0
 400:	00e00093          	li	ra,14
 404:	00b00113          	li	sp,11
 408:	00000013          	nop
 40c:	40208733          	sub	a4,ra,sp
 410:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 414:	00200293          	li	t0,2
 418:	fe5214e3          	bne	tp,t0,400 <test_23+0x8>
 41c:	00300393          	li	t2,3
 420:	22771263          	bne	a4,t2,644 <fail>

00000424 <test_24>:
 424:	01800193          	li	gp,24
 428:	00000213          	li	tp,0
 42c:	00f00093          	li	ra,15
 430:	00b00113          	li	sp,11
 434:	00000013          	nop
 438:	00000013          	nop
 43c:	40208733          	sub	a4,ra,sp
 440:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 444:	00200293          	li	t0,2
 448:	fe5212e3          	bne	tp,t0,42c <test_24+0x8>
 44c:	00400393          	li	t2,4
 450:	1e771a63          	bne	a4,t2,644 <fail>

00000454 <test_25>:
 454:	01900193          	li	gp,25
 458:	00000213          	li	tp,0
 45c:	00d00093          	li	ra,13
 460:	00000013          	nop
 464:	00b00113          	li	sp,11
 468:	40208733          	sub	a4,ra,sp
 46c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 470:	00200293          	li	t0,2
 474:	fe5214e3          	bne	tp,t0,45c <test_25+0x8>
 478:	00200393          	li	t2,2
 47c:	1c771463          	bne	a4,t2,644 <fail>

00000480 <test_26>:
 480:	01a00193          	li	gp,26
 484:	00000213          	li	tp,0
 488:	00e00093          	li	ra,14
 48c:	00000013          	nop
 490:	00b00113          	li	sp,11
 494:	00000013          	nop
 498:	40208733          	sub	a4,ra,sp
 49c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4a0:	00200293          	li	t0,2
 4a4:	fe5212e3          	bne	tp,t0,488 <test_26+0x8>
 4a8:	00300393          	li	t2,3
 4ac:	18771c63          	bne	a4,t2,644 <fail>

000004b0 <test_27>:
 4b0:	01b00193          	li	gp,27
 4b4:	00000213          	li	tp,0
 4b8:	00f00093          	li	ra,15
 4bc:	00000013          	nop
 4c0:	00000013          	nop
 4c4:	00b00113          	li	sp,11
 4c8:	40208733          	sub	a4,ra,sp
 4cc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4d0:	00200293          	li	t0,2
 4d4:	fe5212e3          	bne	tp,t0,4b8 <test_27+0x8>
 4d8:	00400393          	li	t2,4
 4dc:	16771463          	bne	a4,t2,644 <fail>

000004e0 <test_28>:
 4e0:	01c00193          	li	gp,28
 4e4:	00000213          	li	tp,0
 4e8:	00b00113          	li	sp,11
 4ec:	00d00093          	li	ra,13
 4f0:	40208733          	sub	a4,ra,sp
 4f4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4f8:	00200293          	li	t0,2
 4fc:	fe5216e3          	bne	tp,t0,4e8 <test_28+0x8>
 500:	00200393          	li	t2,2
 504:	14771063          	bne	a4,t2,644 <fail>

00000508 <test_29>:
 508:	01d00193          	li	gp,29
 50c:	00000213          	li	tp,0
 510:	00b00113          	li	sp,11
 514:	00e00093          	li	ra,14
 518:	00000013          	nop
 51c:	40208733          	sub	a4,ra,sp
 520:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 524:	00200293          	li	t0,2
 528:	fe5214e3          	bne	tp,t0,510 <test_29+0x8>
 52c:	00300393          	li	t2,3
 530:	10771a63          	bne	a4,t2,644 <fail>

00000534 <test_30>:
 534:	01e00193          	li	gp,30
 538:	00000213          	li	tp,0
 53c:	00b00113          	li	sp,11
 540:	00f00093          	li	ra,15
 544:	00000013          	nop
 548:	00000013          	nop
 54c:	40208733          	sub	a4,ra,sp
 550:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 554:	00200293          	li	t0,2
 558:	fe5212e3          	bne	tp,t0,53c <test_30+0x8>
 55c:	00400393          	li	t2,4
 560:	0e771263          	bne	a4,t2,644 <fail>

00000564 <test_31>:
 564:	01f00193          	li	gp,31
 568:	00000213          	li	tp,0
 56c:	00b00113          	li	sp,11
 570:	00000013          	nop
 574:	00d00093          	li	ra,13
 578:	40208733          	sub	a4,ra,sp
 57c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 580:	00200293          	li	t0,2
 584:	fe5214e3          	bne	tp,t0,56c <test_31+0x8>
 588:	00200393          	li	t2,2
 58c:	0a771c63          	bne	a4,t2,644 <fail>

00000590 <test_32>:
 590:	02000193          	li	gp,32
 594:	00000213          	li	tp,0
 598:	00b00113          	li	sp,11
 59c:	00000013          	nop
 5a0:	00e00093          	li	ra,14
 5a4:	00000013          	nop
 5a8:	40208733          	sub	a4,ra,sp
 5ac:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5b0:	00200293          	li	t0,2
 5b4:	fe5212e3          	bne	tp,t0,598 <test_32+0x8>
 5b8:	00300393          	li	t2,3
 5bc:	08771463          	bne	a4,t2,644 <fail>

000005c0 <test_33>:
 5c0:	02100193          	li	gp,33
 5c4:	00000213          	li	tp,0
 5c8:	00b00113          	li	sp,11
 5cc:	00000013          	nop
 5d0:	00000013          	nop
 5d4:	00f00093          	li	ra,15
 5d8:	40208733          	sub	a4,ra,sp
 5dc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5e0:	00200293          	li	t0,2
 5e4:	fe5212e3          	bne	tp,t0,5c8 <test_33+0x8>
 5e8:	00400393          	li	t2,4
 5ec:	04771c63          	bne	a4,t2,644 <fail>

000005f0 <test_34>:
 5f0:	02200193          	li	gp,34
 5f4:	ff100093          	li	ra,-15
 5f8:	40100133          	neg	sp,ra
 5fc:	00f00393          	li	t2,15
 600:	04711263          	bne	sp,t2,644 <fail>

00000604 <test_35>:
 604:	02300193          	li	gp,35
 608:	02000093          	li	ra,32
 60c:	40008133          	sub	sp,ra,zero
 610:	02000393          	li	t2,32
 614:	02711863          	bne	sp,t2,644 <fail>

00000618 <test_36>:
 618:	02400193          	li	gp,36
 61c:	400000b3          	neg	ra,zero
 620:	00000393          	li	t2,0
 624:	02709063          	bne	ra,t2,644 <fail>

00000628 <test_37>:
 628:	02500193          	li	gp,37
 62c:	01000093          	li	ra,16
 630:	01e00113          	li	sp,30
 634:	40208033          	sub	zero,ra,sp
 638:	00000393          	li	t2,0
 63c:	00701463          	bne	zero,t2,644 <fail>
 640:	02301063          	bne	zero,gp,660 <pass>

00000644 <fail>:
 644:	0ff0000f          	fence
 648:	00018063          	beqz	gp,648 <fail+0x4>
 64c:	00119193          	slli	gp,gp,0x1
 650:	0011e193          	ori	gp,gp,1
 654:	05d00893          	li	a7,93
 658:	00018513          	mv	a0,gp
 65c:	00000073          	ecall

00000660 <pass>:
 660:	0ff0000f          	fence
 664:	00100193          	li	gp,1
 668:	05d00893          	li	a7,93
 66c:	00000513          	li	a0,0
 670:	00000073          	ecall
 674:	c0001073          	unimp
 678:	0000                	.insn	2, 0x
 67a:	0000                	.insn	2, 0x
 67c:	0000                	.insn	2, 0x
 67e:	0000                	.insn	2, 0x
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
