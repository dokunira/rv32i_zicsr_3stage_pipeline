
rv32ui-p-sb:     file format elf32-littleriscv


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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff7ef>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xa8f9>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	00000117          	auipc	sp,0x0
 18c:	67810113          	addi	sp,sp,1656 # 800 <begin_signature>
 190:	faa00093          	li	ra,-86
 194:	00000797          	auipc	a5,0x0
 198:	01478793          	addi	a5,a5,20 # 1a8 <test_2+0x24>
 19c:	00110023          	sb	ra,0(sp)
 1a0:	00010703          	lb	a4,0(sp)
 1a4:	0080006f          	j	1ac <test_2+0x28>
 1a8:	00008713          	mv	a4,ra
 1ac:	faa00393          	li	t2,-86
 1b0:	44771463          	bne	a4,t2,5f8 <fail>

000001b4 <test_3>:
 1b4:	00300193          	li	gp,3
 1b8:	00000117          	auipc	sp,0x0
 1bc:	64810113          	addi	sp,sp,1608 # 800 <begin_signature>
 1c0:	00000093          	li	ra,0
 1c4:	00000797          	auipc	a5,0x0
 1c8:	01478793          	addi	a5,a5,20 # 1d8 <test_3+0x24>
 1cc:	001100a3          	sb	ra,1(sp)
 1d0:	00110703          	lb	a4,1(sp)
 1d4:	0080006f          	j	1dc <test_3+0x28>
 1d8:	00008713          	mv	a4,ra
 1dc:	00000393          	li	t2,0
 1e0:	40771c63          	bne	a4,t2,5f8 <fail>

000001e4 <test_4>:
 1e4:	00400193          	li	gp,4
 1e8:	00000117          	auipc	sp,0x0
 1ec:	61810113          	addi	sp,sp,1560 # 800 <begin_signature>
 1f0:	fffff0b7          	lui	ra,0xfffff
 1f4:	fa008093          	addi	ra,ra,-96 # ffffefa0 <_end+0xffffe790>
 1f8:	00000797          	auipc	a5,0x0
 1fc:	01478793          	addi	a5,a5,20 # 20c <test_4+0x28>
 200:	00110123          	sb	ra,2(sp)
 204:	00211703          	lh	a4,2(sp)
 208:	0080006f          	j	210 <test_4+0x2c>
 20c:	00008713          	mv	a4,ra
 210:	fffff3b7          	lui	t2,0xfffff
 214:	fa038393          	addi	t2,t2,-96 # ffffefa0 <_end+0xffffe790>
 218:	3e771063          	bne	a4,t2,5f8 <fail>

0000021c <test_5>:
 21c:	00500193          	li	gp,5
 220:	00000117          	auipc	sp,0x0
 224:	5e010113          	addi	sp,sp,1504 # 800 <begin_signature>
 228:	00a00093          	li	ra,10
 22c:	00000797          	auipc	a5,0x0
 230:	01478793          	addi	a5,a5,20 # 240 <test_5+0x24>
 234:	001101a3          	sb	ra,3(sp)
 238:	00310703          	lb	a4,3(sp)
 23c:	0080006f          	j	244 <test_5+0x28>
 240:	00008713          	mv	a4,ra
 244:	00a00393          	li	t2,10
 248:	3a771863          	bne	a4,t2,5f8 <fail>

0000024c <test_6>:
 24c:	00600193          	li	gp,6
 250:	00000117          	auipc	sp,0x0
 254:	5b710113          	addi	sp,sp,1463 # 807 <tdat8>
 258:	faa00093          	li	ra,-86
 25c:	00000797          	auipc	a5,0x0
 260:	01478793          	addi	a5,a5,20 # 270 <test_6+0x24>
 264:	fe110ea3          	sb	ra,-3(sp)
 268:	ffd10703          	lb	a4,-3(sp)
 26c:	0080006f          	j	274 <test_6+0x28>
 270:	00008713          	mv	a4,ra
 274:	faa00393          	li	t2,-86
 278:	38771063          	bne	a4,t2,5f8 <fail>

0000027c <test_7>:
 27c:	00700193          	li	gp,7
 280:	00000117          	auipc	sp,0x0
 284:	58710113          	addi	sp,sp,1415 # 807 <tdat8>
 288:	00000093          	li	ra,0
 28c:	00000797          	auipc	a5,0x0
 290:	01478793          	addi	a5,a5,20 # 2a0 <test_7+0x24>
 294:	fe110f23          	sb	ra,-2(sp)
 298:	ffe10703          	lb	a4,-2(sp)
 29c:	0080006f          	j	2a4 <test_7+0x28>
 2a0:	00008713          	mv	a4,ra
 2a4:	00000393          	li	t2,0
 2a8:	34771863          	bne	a4,t2,5f8 <fail>

000002ac <test_8>:
 2ac:	00800193          	li	gp,8
 2b0:	00000117          	auipc	sp,0x0
 2b4:	55710113          	addi	sp,sp,1367 # 807 <tdat8>
 2b8:	fa000093          	li	ra,-96
 2bc:	00000797          	auipc	a5,0x0
 2c0:	01478793          	addi	a5,a5,20 # 2d0 <test_8+0x24>
 2c4:	fe110fa3          	sb	ra,-1(sp)
 2c8:	fff10703          	lb	a4,-1(sp)
 2cc:	0080006f          	j	2d4 <test_8+0x28>
 2d0:	00008713          	mv	a4,ra
 2d4:	fa000393          	li	t2,-96
 2d8:	32771063          	bne	a4,t2,5f8 <fail>

000002dc <test_9>:
 2dc:	00900193          	li	gp,9
 2e0:	00000117          	auipc	sp,0x0
 2e4:	52710113          	addi	sp,sp,1319 # 807 <tdat8>
 2e8:	00a00093          	li	ra,10
 2ec:	00000797          	auipc	a5,0x0
 2f0:	01478793          	addi	a5,a5,20 # 300 <test_9+0x24>
 2f4:	00110023          	sb	ra,0(sp)
 2f8:	00010703          	lb	a4,0(sp)
 2fc:	0080006f          	j	304 <test_9+0x28>
 300:	00008713          	mv	a4,ra
 304:	00a00393          	li	t2,10
 308:	2e771863          	bne	a4,t2,5f8 <fail>

0000030c <test_10>:
 30c:	00a00193          	li	gp,10
 310:	00000097          	auipc	ra,0x0
 314:	4f808093          	addi	ra,ra,1272 # 808 <tdat9>
 318:	12345137          	lui	sp,0x12345
 31c:	67810113          	addi	sp,sp,1656 # 12345678 <_end+0x12344e68>
 320:	fe008213          	addi	tp,ra,-32
 324:	02220023          	sb	sp,32(tp) # 20 <trap_vector+0x1c>
 328:	00008283          	lb	t0,0(ra)
 32c:	07800393          	li	t2,120
 330:	2c729463          	bne	t0,t2,5f8 <fail>

00000334 <test_11>:
 334:	00b00193          	li	gp,11
 338:	00000097          	auipc	ra,0x0
 33c:	4d008093          	addi	ra,ra,1232 # 808 <tdat9>
 340:	00003137          	lui	sp,0x3
 344:	09810113          	addi	sp,sp,152 # 3098 <_end+0x2888>
 348:	ffa08093          	addi	ra,ra,-6
 34c:	002083a3          	sb	sp,7(ra)
 350:	00000217          	auipc	tp,0x0
 354:	4b920213          	addi	tp,tp,1209 # 809 <tdat10>
 358:	00020283          	lb	t0,0(tp) # 0 <_start>
 35c:	f9800393          	li	t2,-104
 360:	28729c63          	bne	t0,t2,5f8 <fail>

00000364 <test_12>:
 364:	00c00193          	li	gp,12
 368:	00000213          	li	tp,0
 36c:	fdd00693          	li	a3,-35
 370:	00000617          	auipc	a2,0x0
 374:	49060613          	addi	a2,a2,1168 # 800 <begin_signature>
 378:	00d60023          	sb	a3,0(a2)
 37c:	00060703          	lb	a4,0(a2)
 380:	fdd00393          	li	t2,-35
 384:	26771a63          	bne	a4,t2,5f8 <fail>
 388:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 38c:	00200293          	li	t0,2
 390:	fc521ee3          	bne	tp,t0,36c <test_12+0x8>

00000394 <test_13>:
 394:	00d00193          	li	gp,13
 398:	00000213          	li	tp,0
 39c:	fcd00693          	li	a3,-51
 3a0:	00000617          	auipc	a2,0x0
 3a4:	46060613          	addi	a2,a2,1120 # 800 <begin_signature>
 3a8:	00000013          	nop
 3ac:	00d600a3          	sb	a3,1(a2)
 3b0:	00160703          	lb	a4,1(a2)
 3b4:	fcd00393          	li	t2,-51
 3b8:	24771063          	bne	a4,t2,5f8 <fail>
 3bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c0:	00200293          	li	t0,2
 3c4:	fc521ce3          	bne	tp,t0,39c <test_13+0x8>

000003c8 <test_14>:
 3c8:	00e00193          	li	gp,14
 3cc:	00000213          	li	tp,0
 3d0:	fcc00693          	li	a3,-52
 3d4:	00000617          	auipc	a2,0x0
 3d8:	42c60613          	addi	a2,a2,1068 # 800 <begin_signature>
 3dc:	00000013          	nop
 3e0:	00000013          	nop
 3e4:	00d60123          	sb	a3,2(a2)
 3e8:	00260703          	lb	a4,2(a2)
 3ec:	fcc00393          	li	t2,-52
 3f0:	20771463          	bne	a4,t2,5f8 <fail>
 3f4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3f8:	00200293          	li	t0,2
 3fc:	fc521ae3          	bne	tp,t0,3d0 <test_14+0x8>

00000400 <test_15>:
 400:	00f00193          	li	gp,15
 404:	00000213          	li	tp,0
 408:	fbc00693          	li	a3,-68
 40c:	00000013          	nop
 410:	00000617          	auipc	a2,0x0
 414:	3f060613          	addi	a2,a2,1008 # 800 <begin_signature>
 418:	00d601a3          	sb	a3,3(a2)
 41c:	00360703          	lb	a4,3(a2)
 420:	fbc00393          	li	t2,-68
 424:	1c771a63          	bne	a4,t2,5f8 <fail>
 428:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 42c:	00200293          	li	t0,2
 430:	fc521ce3          	bne	tp,t0,408 <test_15+0x8>

00000434 <test_16>:
 434:	01000193          	li	gp,16
 438:	00000213          	li	tp,0
 43c:	fbb00693          	li	a3,-69
 440:	00000013          	nop
 444:	00000617          	auipc	a2,0x0
 448:	3bc60613          	addi	a2,a2,956 # 800 <begin_signature>
 44c:	00000013          	nop
 450:	00d60223          	sb	a3,4(a2)
 454:	00460703          	lb	a4,4(a2)
 458:	fbb00393          	li	t2,-69
 45c:	18771e63          	bne	a4,t2,5f8 <fail>
 460:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 464:	00200293          	li	t0,2
 468:	fc521ae3          	bne	tp,t0,43c <test_16+0x8>

0000046c <test_17>:
 46c:	01100193          	li	gp,17
 470:	00000213          	li	tp,0
 474:	fab00693          	li	a3,-85
 478:	00000013          	nop
 47c:	00000013          	nop
 480:	00000617          	auipc	a2,0x0
 484:	38060613          	addi	a2,a2,896 # 800 <begin_signature>
 488:	00d602a3          	sb	a3,5(a2)
 48c:	00560703          	lb	a4,5(a2)
 490:	fab00393          	li	t2,-85
 494:	16771263          	bne	a4,t2,5f8 <fail>
 498:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 49c:	00200293          	li	t0,2
 4a0:	fc521ae3          	bne	tp,t0,474 <test_17+0x8>

000004a4 <test_18>:
 4a4:	01200193          	li	gp,18
 4a8:	00000213          	li	tp,0
 4ac:	00000117          	auipc	sp,0x0
 4b0:	35410113          	addi	sp,sp,852 # 800 <begin_signature>
 4b4:	03300093          	li	ra,51
 4b8:	00110023          	sb	ra,0(sp)
 4bc:	00010703          	lb	a4,0(sp)
 4c0:	03300393          	li	t2,51
 4c4:	12771a63          	bne	a4,t2,5f8 <fail>
 4c8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4cc:	00200293          	li	t0,2
 4d0:	fc521ee3          	bne	tp,t0,4ac <test_18+0x8>

000004d4 <test_19>:
 4d4:	01300193          	li	gp,19
 4d8:	00000213          	li	tp,0
 4dc:	00000117          	auipc	sp,0x0
 4e0:	32410113          	addi	sp,sp,804 # 800 <begin_signature>
 4e4:	02300093          	li	ra,35
 4e8:	00000013          	nop
 4ec:	001100a3          	sb	ra,1(sp)
 4f0:	00110703          	lb	a4,1(sp)
 4f4:	02300393          	li	t2,35
 4f8:	10771063          	bne	a4,t2,5f8 <fail>
 4fc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 500:	00200293          	li	t0,2
 504:	fc521ce3          	bne	tp,t0,4dc <test_19+0x8>

00000508 <test_20>:
 508:	01400193          	li	gp,20
 50c:	00000213          	li	tp,0
 510:	00000117          	auipc	sp,0x0
 514:	2f010113          	addi	sp,sp,752 # 800 <begin_signature>
 518:	02200093          	li	ra,34
 51c:	00000013          	nop
 520:	00000013          	nop
 524:	00110123          	sb	ra,2(sp)
 528:	00210703          	lb	a4,2(sp)
 52c:	02200393          	li	t2,34
 530:	0c771463          	bne	a4,t2,5f8 <fail>
 534:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 538:	00200293          	li	t0,2
 53c:	fc521ae3          	bne	tp,t0,510 <test_20+0x8>

00000540 <test_21>:
 540:	01500193          	li	gp,21
 544:	00000213          	li	tp,0
 548:	00000117          	auipc	sp,0x0
 54c:	2b810113          	addi	sp,sp,696 # 800 <begin_signature>
 550:	00000013          	nop
 554:	01200093          	li	ra,18
 558:	001101a3          	sb	ra,3(sp)
 55c:	00310703          	lb	a4,3(sp)
 560:	01200393          	li	t2,18
 564:	08771a63          	bne	a4,t2,5f8 <fail>
 568:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 56c:	00200293          	li	t0,2
 570:	fc521ce3          	bne	tp,t0,548 <test_21+0x8>

00000574 <test_22>:
 574:	01600193          	li	gp,22
 578:	00000213          	li	tp,0
 57c:	00000117          	auipc	sp,0x0
 580:	28410113          	addi	sp,sp,644 # 800 <begin_signature>
 584:	00000013          	nop
 588:	01100093          	li	ra,17
 58c:	00000013          	nop
 590:	00110223          	sb	ra,4(sp)
 594:	00410703          	lb	a4,4(sp)
 598:	01100393          	li	t2,17
 59c:	04771e63          	bne	a4,t2,5f8 <fail>
 5a0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5a4:	00200293          	li	t0,2
 5a8:	fc521ae3          	bne	tp,t0,57c <test_22+0x8>

000005ac <test_23>:
 5ac:	01700193          	li	gp,23
 5b0:	00000213          	li	tp,0
 5b4:	00000117          	auipc	sp,0x0
 5b8:	24c10113          	addi	sp,sp,588 # 800 <begin_signature>
 5bc:	00000013          	nop
 5c0:	00000013          	nop
 5c4:	00100093          	li	ra,1
 5c8:	001102a3          	sb	ra,5(sp)
 5cc:	00510703          	lb	a4,5(sp)
 5d0:	00100393          	li	t2,1
 5d4:	02771263          	bne	a4,t2,5f8 <fail>
 5d8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5dc:	00200293          	li	t0,2
 5e0:	fc521ae3          	bne	tp,t0,5b4 <test_23+0x8>
 5e4:	0ef00513          	li	a0,239
 5e8:	00000597          	auipc	a1,0x0
 5ec:	21858593          	addi	a1,a1,536 # 800 <begin_signature>
 5f0:	00a581a3          	sb	a0,3(a1)
 5f4:	02301063          	bne	zero,gp,614 <pass>

000005f8 <fail>:
 5f8:	0ff0000f          	fence
 5fc:	00018063          	beqz	gp,5fc <fail+0x4>
 600:	00119193          	slli	gp,gp,0x1
 604:	0011e193          	ori	gp,gp,1
 608:	05d00893          	li	a7,93
 60c:	00018513          	mv	a0,gp
 610:	00000073          	ecall

00000614 <pass>:
 614:	0ff0000f          	fence
 618:	00100193          	li	gp,1
 61c:	05d00893          	li	a7,93
 620:	00000513          	li	a0,0
 624:	00000073          	ecall
 628:	c0001073          	unimp
 62c:	0000                	.insn	2, 0x
 62e:	0000                	.insn	2, 0x
 630:	0000                	.insn	2, 0x
 632:	0000                	.insn	2, 0x

Disassembly of section .data:

00000800 <begin_signature>:
 800:	          	jal	t6,ffffeefe <_end+0xffffe6ee>

00000801 <tdat2>:
 801:	          	jal	t6,ffffeeff <_end+0xffffe6ef>

00000802 <tdat3>:
 802:	          	jal	t6,ffffef00 <_end+0xffffe6f0>

00000803 <tdat4>:
 803:	          	jal	t6,ffffef01 <_end+0xffffe6f1>

00000804 <tdat5>:
 804:	          	jal	t6,ffffef02 <_end+0xffffe6f2>

00000805 <tdat6>:
 805:	          	jal	t6,ffffef03 <_end+0xffffe6f3>

00000806 <tdat7>:
 806:	          	jal	t6,ffffef04 <_end+0xffffe6f4>

00000807 <tdat8>:
 807:	          	jal	t6,fe815 <_end+0xfe005>

00000808 <tdat9>:
 808:	          	jal	t6,e808 <_end+0xdff8>

00000809 <tdat10>:
 809:	000000ef          	jal	809 <tdat10>
 80d:	0000                	.insn	2, 0x
 80f:	Address 0x80f is out of bounds.

