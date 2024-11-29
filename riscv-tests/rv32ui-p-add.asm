
rv32ui-p-add:     file format elf32-littleriscv


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
 190:	00c58733          	add	a4,a1,a2
 194:	00000393          	li	t2,0
 198:	4c771663          	bne	a4,t2,664 <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	00100593          	li	a1,1
 1a4:	00100613          	li	a2,1
 1a8:	00c58733          	add	a4,a1,a2
 1ac:	00200393          	li	t2,2
 1b0:	4a771a63          	bne	a4,t2,664 <fail>

000001b4 <test_4>:
 1b4:	00400193          	li	gp,4
 1b8:	00300593          	li	a1,3
 1bc:	00700613          	li	a2,7
 1c0:	00c58733          	add	a4,a1,a2
 1c4:	00a00393          	li	t2,10
 1c8:	48771e63          	bne	a4,t2,664 <fail>

000001cc <test_5>:
 1cc:	00500193          	li	gp,5
 1d0:	00000593          	li	a1,0
 1d4:	ffff8637          	lui	a2,0xffff8
 1d8:	00c58733          	add	a4,a1,a2
 1dc:	ffff83b7          	lui	t2,0xffff8
 1e0:	48771263          	bne	a4,t2,664 <fail>

000001e4 <test_6>:
 1e4:	00600193          	li	gp,6
 1e8:	800005b7          	lui	a1,0x80000
 1ec:	00000613          	li	a2,0
 1f0:	00c58733          	add	a4,a1,a2
 1f4:	800003b7          	lui	t2,0x80000
 1f8:	46771663          	bne	a4,t2,664 <fail>

000001fc <test_7>:
 1fc:	00700193          	li	gp,7
 200:	800005b7          	lui	a1,0x80000
 204:	ffff8637          	lui	a2,0xffff8
 208:	00c58733          	add	a4,a1,a2
 20c:	7fff83b7          	lui	t2,0x7fff8
 210:	44771a63          	bne	a4,t2,664 <fail>

00000214 <test_8>:
 214:	00800193          	li	gp,8
 218:	00000593          	li	a1,0
 21c:	00008637          	lui	a2,0x8
 220:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 224:	00c58733          	add	a4,a1,a2
 228:	000083b7          	lui	t2,0x8
 22c:	fff38393          	addi	t2,t2,-1 # 7fff <_end+0x77ff>
 230:	42771a63          	bne	a4,t2,664 <fail>

00000234 <test_9>:
 234:	00900193          	li	gp,9
 238:	800005b7          	lui	a1,0x80000
 23c:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 240:	00000613          	li	a2,0
 244:	00c58733          	add	a4,a1,a2
 248:	800003b7          	lui	t2,0x80000
 24c:	fff38393          	addi	t2,t2,-1 # 7fffffff <_end+0x7ffff7ff>
 250:	40771a63          	bne	a4,t2,664 <fail>

00000254 <test_10>:
 254:	00a00193          	li	gp,10
 258:	800005b7          	lui	a1,0x80000
 25c:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 260:	00008637          	lui	a2,0x8
 264:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 268:	00c58733          	add	a4,a1,a2
 26c:	800083b7          	lui	t2,0x80008
 270:	ffe38393          	addi	t2,t2,-2 # 80007ffe <_end+0x800077fe>
 274:	3e771863          	bne	a4,t2,664 <fail>

00000278 <test_11>:
 278:	00b00193          	li	gp,11
 27c:	800005b7          	lui	a1,0x80000
 280:	00008637          	lui	a2,0x8
 284:	fff60613          	addi	a2,a2,-1 # 7fff <_end+0x77ff>
 288:	00c58733          	add	a4,a1,a2
 28c:	800083b7          	lui	t2,0x80008
 290:	fff38393          	addi	t2,t2,-1 # 80007fff <_end+0x800077ff>
 294:	3c771863          	bne	a4,t2,664 <fail>

00000298 <test_12>:
 298:	00c00193          	li	gp,12
 29c:	800005b7          	lui	a1,0x80000
 2a0:	fff58593          	addi	a1,a1,-1 # 7fffffff <_end+0x7ffff7ff>
 2a4:	ffff8637          	lui	a2,0xffff8
 2a8:	00c58733          	add	a4,a1,a2
 2ac:	7fff83b7          	lui	t2,0x7fff8
 2b0:	fff38393          	addi	t2,t2,-1 # 7fff7fff <_end+0x7fff77ff>
 2b4:	3a771863          	bne	a4,t2,664 <fail>

000002b8 <test_13>:
 2b8:	00d00193          	li	gp,13
 2bc:	00000593          	li	a1,0
 2c0:	fff00613          	li	a2,-1
 2c4:	00c58733          	add	a4,a1,a2
 2c8:	fff00393          	li	t2,-1
 2cc:	38771c63          	bne	a4,t2,664 <fail>

000002d0 <test_14>:
 2d0:	00e00193          	li	gp,14
 2d4:	fff00593          	li	a1,-1
 2d8:	00100613          	li	a2,1
 2dc:	00c58733          	add	a4,a1,a2
 2e0:	00000393          	li	t2,0
 2e4:	38771063          	bne	a4,t2,664 <fail>

000002e8 <test_15>:
 2e8:	00f00193          	li	gp,15
 2ec:	fff00593          	li	a1,-1
 2f0:	fff00613          	li	a2,-1
 2f4:	00c58733          	add	a4,a1,a2
 2f8:	ffe00393          	li	t2,-2
 2fc:	36771463          	bne	a4,t2,664 <fail>

00000300 <test_16>:
 300:	01000193          	li	gp,16
 304:	00100593          	li	a1,1
 308:	80000637          	lui	a2,0x80000
 30c:	fff60613          	addi	a2,a2,-1 # 7fffffff <_end+0x7ffff7ff>
 310:	00c58733          	add	a4,a1,a2
 314:	800003b7          	lui	t2,0x80000
 318:	34771663          	bne	a4,t2,664 <fail>

0000031c <test_17>:
 31c:	01100193          	li	gp,17
 320:	00d00593          	li	a1,13
 324:	00b00613          	li	a2,11
 328:	00c585b3          	add	a1,a1,a2
 32c:	01800393          	li	t2,24
 330:	32759a63          	bne	a1,t2,664 <fail>

00000334 <test_18>:
 334:	01200193          	li	gp,18
 338:	00e00593          	li	a1,14
 33c:	00b00613          	li	a2,11
 340:	00c58633          	add	a2,a1,a2
 344:	01900393          	li	t2,25
 348:	30761e63          	bne	a2,t2,664 <fail>

0000034c <test_19>:
 34c:	01300193          	li	gp,19
 350:	00d00593          	li	a1,13
 354:	00b585b3          	add	a1,a1,a1
 358:	01a00393          	li	t2,26
 35c:	30759463          	bne	a1,t2,664 <fail>

00000360 <test_20>:
 360:	01400193          	li	gp,20
 364:	00000213          	li	tp,0
 368:	00d00093          	li	ra,13
 36c:	00b00113          	li	sp,11
 370:	00208733          	add	a4,ra,sp
 374:	00070313          	mv	t1,a4
 378:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 37c:	00200293          	li	t0,2
 380:	fe5214e3          	bne	tp,t0,368 <test_20+0x8>
 384:	01800393          	li	t2,24
 388:	2c731e63          	bne	t1,t2,664 <fail>

0000038c <test_21>:
 38c:	01500193          	li	gp,21
 390:	00000213          	li	tp,0
 394:	00e00093          	li	ra,14
 398:	00b00113          	li	sp,11
 39c:	00208733          	add	a4,ra,sp
 3a0:	00000013          	nop
 3a4:	00070313          	mv	t1,a4
 3a8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3ac:	00200293          	li	t0,2
 3b0:	fe5212e3          	bne	tp,t0,394 <test_21+0x8>
 3b4:	01900393          	li	t2,25
 3b8:	2a731663          	bne	t1,t2,664 <fail>

000003bc <test_22>:
 3bc:	01600193          	li	gp,22
 3c0:	00000213          	li	tp,0
 3c4:	00f00093          	li	ra,15
 3c8:	00b00113          	li	sp,11
 3cc:	00208733          	add	a4,ra,sp
 3d0:	00000013          	nop
 3d4:	00000013          	nop
 3d8:	00070313          	mv	t1,a4
 3dc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3e0:	00200293          	li	t0,2
 3e4:	fe5210e3          	bne	tp,t0,3c4 <test_22+0x8>
 3e8:	01a00393          	li	t2,26
 3ec:	26731c63          	bne	t1,t2,664 <fail>

000003f0 <test_23>:
 3f0:	01700193          	li	gp,23
 3f4:	00000213          	li	tp,0
 3f8:	00d00093          	li	ra,13
 3fc:	00b00113          	li	sp,11
 400:	00208733          	add	a4,ra,sp
 404:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 408:	00200293          	li	t0,2
 40c:	fe5216e3          	bne	tp,t0,3f8 <test_23+0x8>
 410:	01800393          	li	t2,24
 414:	24771863          	bne	a4,t2,664 <fail>

00000418 <test_24>:
 418:	01800193          	li	gp,24
 41c:	00000213          	li	tp,0
 420:	00e00093          	li	ra,14
 424:	00b00113          	li	sp,11
 428:	00000013          	nop
 42c:	00208733          	add	a4,ra,sp
 430:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 434:	00200293          	li	t0,2
 438:	fe5214e3          	bne	tp,t0,420 <test_24+0x8>
 43c:	01900393          	li	t2,25
 440:	22771263          	bne	a4,t2,664 <fail>

00000444 <test_25>:
 444:	01900193          	li	gp,25
 448:	00000213          	li	tp,0
 44c:	00f00093          	li	ra,15
 450:	00b00113          	li	sp,11
 454:	00000013          	nop
 458:	00000013          	nop
 45c:	00208733          	add	a4,ra,sp
 460:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 464:	00200293          	li	t0,2
 468:	fe5212e3          	bne	tp,t0,44c <test_25+0x8>
 46c:	01a00393          	li	t2,26
 470:	1e771a63          	bne	a4,t2,664 <fail>

00000474 <test_26>:
 474:	01a00193          	li	gp,26
 478:	00000213          	li	tp,0
 47c:	00d00093          	li	ra,13
 480:	00000013          	nop
 484:	00b00113          	li	sp,11
 488:	00208733          	add	a4,ra,sp
 48c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 490:	00200293          	li	t0,2
 494:	fe5214e3          	bne	tp,t0,47c <test_26+0x8>
 498:	01800393          	li	t2,24
 49c:	1c771463          	bne	a4,t2,664 <fail>

000004a0 <test_27>:
 4a0:	01b00193          	li	gp,27
 4a4:	00000213          	li	tp,0
 4a8:	00e00093          	li	ra,14
 4ac:	00000013          	nop
 4b0:	00b00113          	li	sp,11
 4b4:	00000013          	nop
 4b8:	00208733          	add	a4,ra,sp
 4bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4c0:	00200293          	li	t0,2
 4c4:	fe5212e3          	bne	tp,t0,4a8 <test_27+0x8>
 4c8:	01900393          	li	t2,25
 4cc:	18771c63          	bne	a4,t2,664 <fail>

000004d0 <test_28>:
 4d0:	01c00193          	li	gp,28
 4d4:	00000213          	li	tp,0
 4d8:	00f00093          	li	ra,15
 4dc:	00000013          	nop
 4e0:	00000013          	nop
 4e4:	00b00113          	li	sp,11
 4e8:	00208733          	add	a4,ra,sp
 4ec:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4f0:	00200293          	li	t0,2
 4f4:	fe5212e3          	bne	tp,t0,4d8 <test_28+0x8>
 4f8:	01a00393          	li	t2,26
 4fc:	16771463          	bne	a4,t2,664 <fail>

00000500 <test_29>:
 500:	01d00193          	li	gp,29
 504:	00000213          	li	tp,0
 508:	00b00113          	li	sp,11
 50c:	00d00093          	li	ra,13
 510:	00208733          	add	a4,ra,sp
 514:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 518:	00200293          	li	t0,2
 51c:	fe5216e3          	bne	tp,t0,508 <test_29+0x8>
 520:	01800393          	li	t2,24
 524:	14771063          	bne	a4,t2,664 <fail>

00000528 <test_30>:
 528:	01e00193          	li	gp,30
 52c:	00000213          	li	tp,0
 530:	00b00113          	li	sp,11
 534:	00e00093          	li	ra,14
 538:	00000013          	nop
 53c:	00208733          	add	a4,ra,sp
 540:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 544:	00200293          	li	t0,2
 548:	fe5214e3          	bne	tp,t0,530 <test_30+0x8>
 54c:	01900393          	li	t2,25
 550:	10771a63          	bne	a4,t2,664 <fail>

00000554 <test_31>:
 554:	01f00193          	li	gp,31
 558:	00000213          	li	tp,0
 55c:	00b00113          	li	sp,11
 560:	00f00093          	li	ra,15
 564:	00000013          	nop
 568:	00000013          	nop
 56c:	00208733          	add	a4,ra,sp
 570:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 574:	00200293          	li	t0,2
 578:	fe5212e3          	bne	tp,t0,55c <test_31+0x8>
 57c:	01a00393          	li	t2,26
 580:	0e771263          	bne	a4,t2,664 <fail>

00000584 <test_32>:
 584:	02000193          	li	gp,32
 588:	00000213          	li	tp,0
 58c:	00b00113          	li	sp,11
 590:	00000013          	nop
 594:	00d00093          	li	ra,13
 598:	00208733          	add	a4,ra,sp
 59c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5a0:	00200293          	li	t0,2
 5a4:	fe5214e3          	bne	tp,t0,58c <test_32+0x8>
 5a8:	01800393          	li	t2,24
 5ac:	0a771c63          	bne	a4,t2,664 <fail>

000005b0 <test_33>:
 5b0:	02100193          	li	gp,33
 5b4:	00000213          	li	tp,0
 5b8:	00b00113          	li	sp,11
 5bc:	00000013          	nop
 5c0:	00e00093          	li	ra,14
 5c4:	00000013          	nop
 5c8:	00208733          	add	a4,ra,sp
 5cc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5d0:	00200293          	li	t0,2
 5d4:	fe5212e3          	bne	tp,t0,5b8 <test_33+0x8>
 5d8:	01900393          	li	t2,25
 5dc:	08771463          	bne	a4,t2,664 <fail>

000005e0 <test_34>:
 5e0:	02200193          	li	gp,34
 5e4:	00000213          	li	tp,0
 5e8:	00b00113          	li	sp,11
 5ec:	00000013          	nop
 5f0:	00000013          	nop
 5f4:	00f00093          	li	ra,15
 5f8:	00208733          	add	a4,ra,sp
 5fc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 600:	00200293          	li	t0,2
 604:	fe5212e3          	bne	tp,t0,5e8 <test_34+0x8>
 608:	01a00393          	li	t2,26
 60c:	04771c63          	bne	a4,t2,664 <fail>

00000610 <test_35>:
 610:	02300193          	li	gp,35
 614:	00f00093          	li	ra,15
 618:	00100133          	add	sp,zero,ra
 61c:	00f00393          	li	t2,15
 620:	04711263          	bne	sp,t2,664 <fail>

00000624 <test_36>:
 624:	02400193          	li	gp,36
 628:	02000093          	li	ra,32
 62c:	00008133          	add	sp,ra,zero
 630:	02000393          	li	t2,32
 634:	02711863          	bne	sp,t2,664 <fail>

00000638 <test_37>:
 638:	02500193          	li	gp,37
 63c:	000000b3          	add	ra,zero,zero
 640:	00000393          	li	t2,0
 644:	02709063          	bne	ra,t2,664 <fail>

00000648 <test_38>:
 648:	02600193          	li	gp,38
 64c:	01000093          	li	ra,16
 650:	01e00113          	li	sp,30
 654:	00208033          	add	zero,ra,sp
 658:	00000393          	li	t2,0
 65c:	00701463          	bne	zero,t2,664 <fail>
 660:	02301063          	bne	zero,gp,680 <pass>

00000664 <fail>:
 664:	0ff0000f          	fence
 668:	00018063          	beqz	gp,668 <fail+0x4>
 66c:	00119193          	slli	gp,gp,0x1
 670:	0011e193          	ori	gp,gp,1
 674:	05d00893          	li	a7,93
 678:	00018513          	mv	a0,gp
 67c:	00000073          	ecall

00000680 <pass>:
 680:	0ff0000f          	fence
 684:	00100193          	li	gp,1
 688:	05d00893          	li	a7,93
 68c:	00000513          	li	a0,0
 690:	00000073          	ecall
 694:	c0001073          	unimp
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
