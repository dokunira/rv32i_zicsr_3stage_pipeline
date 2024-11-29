
rv32ui-p-sh:     file format elf32-littleriscv


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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff7df>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xa8e9>
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
 190:	0aa00093          	li	ra,170
 194:	00000797          	auipc	a5,0x0
 198:	01478793          	addi	a5,a5,20 # 1a8 <test_2+0x24>
 19c:	00111023          	sh	ra,0(sp)
 1a0:	00011703          	lh	a4,0(sp)
 1a4:	0080006f          	j	1ac <test_2+0x28>
 1a8:	00008713          	mv	a4,ra
 1ac:	0aa00393          	li	t2,170
 1b0:	4c771663          	bne	a4,t2,67c <fail>

000001b4 <test_3>:
 1b4:	00300193          	li	gp,3
 1b8:	00000117          	auipc	sp,0x0
 1bc:	64810113          	addi	sp,sp,1608 # 800 <begin_signature>
 1c0:	ffffb0b7          	lui	ra,0xffffb
 1c4:	a0008093          	addi	ra,ra,-1536 # ffffaa00 <_end+0xffffa1e0>
 1c8:	00000797          	auipc	a5,0x0
 1cc:	01478793          	addi	a5,a5,20 # 1dc <test_3+0x28>
 1d0:	00111123          	sh	ra,2(sp)
 1d4:	00211703          	lh	a4,2(sp)
 1d8:	0080006f          	j	1e0 <test_3+0x2c>
 1dc:	00008713          	mv	a4,ra
 1e0:	ffffb3b7          	lui	t2,0xffffb
 1e4:	a0038393          	addi	t2,t2,-1536 # ffffaa00 <_end+0xffffa1e0>
 1e8:	48771a63          	bne	a4,t2,67c <fail>

000001ec <test_4>:
 1ec:	00400193          	li	gp,4
 1f0:	00000117          	auipc	sp,0x0
 1f4:	61010113          	addi	sp,sp,1552 # 800 <begin_signature>
 1f8:	beef10b7          	lui	ra,0xbeef1
 1fc:	aa008093          	addi	ra,ra,-1376 # beef0aa0 <_end+0xbeef0280>
 200:	00000797          	auipc	a5,0x0
 204:	01478793          	addi	a5,a5,20 # 214 <test_4+0x28>
 208:	00111223          	sh	ra,4(sp)
 20c:	00412703          	lw	a4,4(sp)
 210:	0080006f          	j	218 <test_4+0x2c>
 214:	00008713          	mv	a4,ra
 218:	beef13b7          	lui	t2,0xbeef1
 21c:	aa038393          	addi	t2,t2,-1376 # beef0aa0 <_end+0xbeef0280>
 220:	44771e63          	bne	a4,t2,67c <fail>

00000224 <test_5>:
 224:	00500193          	li	gp,5
 228:	00000117          	auipc	sp,0x0
 22c:	5d810113          	addi	sp,sp,1496 # 800 <begin_signature>
 230:	ffffa0b7          	lui	ra,0xffffa
 234:	00a08093          	addi	ra,ra,10 # ffffa00a <_end+0xffff97ea>
 238:	00000797          	auipc	a5,0x0
 23c:	01478793          	addi	a5,a5,20 # 24c <test_5+0x28>
 240:	00111323          	sh	ra,6(sp)
 244:	00611703          	lh	a4,6(sp)
 248:	0080006f          	j	250 <test_5+0x2c>
 24c:	00008713          	mv	a4,ra
 250:	ffffa3b7          	lui	t2,0xffffa
 254:	00a38393          	addi	t2,t2,10 # ffffa00a <_end+0xffff97ea>
 258:	42771263          	bne	a4,t2,67c <fail>

0000025c <test_6>:
 25c:	00600193          	li	gp,6
 260:	00000117          	auipc	sp,0x0
 264:	5ae10113          	addi	sp,sp,1454 # 80e <tdat8>
 268:	0aa00093          	li	ra,170
 26c:	00000797          	auipc	a5,0x0
 270:	01478793          	addi	a5,a5,20 # 280 <test_6+0x24>
 274:	fe111d23          	sh	ra,-6(sp)
 278:	ffa11703          	lh	a4,-6(sp)
 27c:	0080006f          	j	284 <test_6+0x28>
 280:	00008713          	mv	a4,ra
 284:	0aa00393          	li	t2,170
 288:	3e771a63          	bne	a4,t2,67c <fail>

0000028c <test_7>:
 28c:	00700193          	li	gp,7
 290:	00000117          	auipc	sp,0x0
 294:	57e10113          	addi	sp,sp,1406 # 80e <tdat8>
 298:	ffffb0b7          	lui	ra,0xffffb
 29c:	a0008093          	addi	ra,ra,-1536 # ffffaa00 <_end+0xffffa1e0>
 2a0:	00000797          	auipc	a5,0x0
 2a4:	01478793          	addi	a5,a5,20 # 2b4 <test_7+0x28>
 2a8:	fe111e23          	sh	ra,-4(sp)
 2ac:	ffc11703          	lh	a4,-4(sp)
 2b0:	0080006f          	j	2b8 <test_7+0x2c>
 2b4:	00008713          	mv	a4,ra
 2b8:	ffffb3b7          	lui	t2,0xffffb
 2bc:	a0038393          	addi	t2,t2,-1536 # ffffaa00 <_end+0xffffa1e0>
 2c0:	3a771e63          	bne	a4,t2,67c <fail>

000002c4 <test_8>:
 2c4:	00800193          	li	gp,8
 2c8:	00000117          	auipc	sp,0x0
 2cc:	54610113          	addi	sp,sp,1350 # 80e <tdat8>
 2d0:	000010b7          	lui	ra,0x1
 2d4:	aa008093          	addi	ra,ra,-1376 # aa0 <_end+0x280>
 2d8:	00000797          	auipc	a5,0x0
 2dc:	01478793          	addi	a5,a5,20 # 2ec <test_8+0x28>
 2e0:	fe111f23          	sh	ra,-2(sp)
 2e4:	ffe11703          	lh	a4,-2(sp)
 2e8:	0080006f          	j	2f0 <test_8+0x2c>
 2ec:	00008713          	mv	a4,ra
 2f0:	000013b7          	lui	t2,0x1
 2f4:	aa038393          	addi	t2,t2,-1376 # aa0 <_end+0x280>
 2f8:	38771263          	bne	a4,t2,67c <fail>

000002fc <test_9>:
 2fc:	00900193          	li	gp,9
 300:	00000117          	auipc	sp,0x0
 304:	50e10113          	addi	sp,sp,1294 # 80e <tdat8>
 308:	ffffa0b7          	lui	ra,0xffffa
 30c:	00a08093          	addi	ra,ra,10 # ffffa00a <_end+0xffff97ea>
 310:	00000797          	auipc	a5,0x0
 314:	01478793          	addi	a5,a5,20 # 324 <test_9+0x28>
 318:	00111023          	sh	ra,0(sp)
 31c:	00011703          	lh	a4,0(sp)
 320:	0080006f          	j	328 <test_9+0x2c>
 324:	00008713          	mv	a4,ra
 328:	ffffa3b7          	lui	t2,0xffffa
 32c:	00a38393          	addi	t2,t2,10 # ffffa00a <_end+0xffff97ea>
 330:	34771663          	bne	a4,t2,67c <fail>

00000334 <test_10>:
 334:	00a00193          	li	gp,10
 338:	00000097          	auipc	ra,0x0
 33c:	4d808093          	addi	ra,ra,1240 # 810 <tdat9>
 340:	12345137          	lui	sp,0x12345
 344:	67810113          	addi	sp,sp,1656 # 12345678 <_end+0x12344e58>
 348:	fe008213          	addi	tp,ra,-32
 34c:	02221023          	sh	sp,32(tp) # 20 <trap_vector+0x1c>
 350:	00009283          	lh	t0,0(ra)
 354:	000053b7          	lui	t2,0x5
 358:	67838393          	addi	t2,t2,1656 # 5678 <_end+0x4e58>
 35c:	32729063          	bne	t0,t2,67c <fail>

00000360 <test_11>:
 360:	00b00193          	li	gp,11
 364:	00000097          	auipc	ra,0x0
 368:	4ac08093          	addi	ra,ra,1196 # 810 <tdat9>
 36c:	00003137          	lui	sp,0x3
 370:	09810113          	addi	sp,sp,152 # 3098 <_end+0x2878>
 374:	ffb08093          	addi	ra,ra,-5
 378:	002093a3          	sh	sp,7(ra)
 37c:	00000217          	auipc	tp,0x0
 380:	49620213          	addi	tp,tp,1174 # 812 <tdat10>
 384:	00021283          	lh	t0,0(tp) # 0 <_start>
 388:	000033b7          	lui	t2,0x3
 38c:	09838393          	addi	t2,t2,152 # 3098 <_end+0x2878>
 390:	2e729663          	bne	t0,t2,67c <fail>

00000394 <test_12>:
 394:	00c00193          	li	gp,12
 398:	00000213          	li	tp,0
 39c:	ffffd6b7          	lui	a3,0xffffd
 3a0:	cdd68693          	addi	a3,a3,-803 # ffffccdd <_end+0xffffc4bd>
 3a4:	00000617          	auipc	a2,0x0
 3a8:	45c60613          	addi	a2,a2,1116 # 800 <begin_signature>
 3ac:	00d61023          	sh	a3,0(a2)
 3b0:	00061703          	lh	a4,0(a2)
 3b4:	ffffd3b7          	lui	t2,0xffffd
 3b8:	cdd38393          	addi	t2,t2,-803 # ffffccdd <_end+0xffffc4bd>
 3bc:	2c771063          	bne	a4,t2,67c <fail>
 3c0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c4:	00200293          	li	t0,2
 3c8:	fc521ae3          	bne	tp,t0,39c <test_12+0x8>

000003cc <test_13>:
 3cc:	00d00193          	li	gp,13
 3d0:	00000213          	li	tp,0
 3d4:	ffffc6b7          	lui	a3,0xffffc
 3d8:	ccd68693          	addi	a3,a3,-819 # ffffbccd <_end+0xffffb4ad>
 3dc:	00000617          	auipc	a2,0x0
 3e0:	42460613          	addi	a2,a2,1060 # 800 <begin_signature>
 3e4:	00000013          	nop
 3e8:	00d61123          	sh	a3,2(a2)
 3ec:	00261703          	lh	a4,2(a2)
 3f0:	ffffc3b7          	lui	t2,0xffffc
 3f4:	ccd38393          	addi	t2,t2,-819 # ffffbccd <_end+0xffffb4ad>
 3f8:	28771263          	bne	a4,t2,67c <fail>
 3fc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 400:	00200293          	li	t0,2
 404:	fc5218e3          	bne	tp,t0,3d4 <test_13+0x8>

00000408 <test_14>:
 408:	00e00193          	li	gp,14
 40c:	00000213          	li	tp,0
 410:	ffffc6b7          	lui	a3,0xffffc
 414:	bcc68693          	addi	a3,a3,-1076 # ffffbbcc <_end+0xffffb3ac>
 418:	00000617          	auipc	a2,0x0
 41c:	3e860613          	addi	a2,a2,1000 # 800 <begin_signature>
 420:	00000013          	nop
 424:	00000013          	nop
 428:	00d61223          	sh	a3,4(a2)
 42c:	00461703          	lh	a4,4(a2)
 430:	ffffc3b7          	lui	t2,0xffffc
 434:	bcc38393          	addi	t2,t2,-1076 # ffffbbcc <_end+0xffffb3ac>
 438:	24771263          	bne	a4,t2,67c <fail>
 43c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 440:	00200293          	li	t0,2
 444:	fc5216e3          	bne	tp,t0,410 <test_14+0x8>

00000448 <test_15>:
 448:	00f00193          	li	gp,15
 44c:	00000213          	li	tp,0
 450:	ffffb6b7          	lui	a3,0xffffb
 454:	bbc68693          	addi	a3,a3,-1092 # ffffabbc <_end+0xffffa39c>
 458:	00000013          	nop
 45c:	00000617          	auipc	a2,0x0
 460:	3a460613          	addi	a2,a2,932 # 800 <begin_signature>
 464:	00d61323          	sh	a3,6(a2)
 468:	00661703          	lh	a4,6(a2)
 46c:	ffffb3b7          	lui	t2,0xffffb
 470:	bbc38393          	addi	t2,t2,-1092 # ffffabbc <_end+0xffffa39c>
 474:	20771463          	bne	a4,t2,67c <fail>
 478:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 47c:	00200293          	li	t0,2
 480:	fc5218e3          	bne	tp,t0,450 <test_15+0x8>

00000484 <test_16>:
 484:	01000193          	li	gp,16
 488:	00000213          	li	tp,0
 48c:	ffffb6b7          	lui	a3,0xffffb
 490:	abb68693          	addi	a3,a3,-1349 # ffffaabb <_end+0xffffa29b>
 494:	00000013          	nop
 498:	00000617          	auipc	a2,0x0
 49c:	36860613          	addi	a2,a2,872 # 800 <begin_signature>
 4a0:	00000013          	nop
 4a4:	00d61423          	sh	a3,8(a2)
 4a8:	00861703          	lh	a4,8(a2)
 4ac:	ffffb3b7          	lui	t2,0xffffb
 4b0:	abb38393          	addi	t2,t2,-1349 # ffffaabb <_end+0xffffa29b>
 4b4:	1c771463          	bne	a4,t2,67c <fail>
 4b8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4bc:	00200293          	li	t0,2
 4c0:	fc5216e3          	bne	tp,t0,48c <test_16+0x8>

000004c4 <test_17>:
 4c4:	01100193          	li	gp,17
 4c8:	00000213          	li	tp,0
 4cc:	ffffe6b7          	lui	a3,0xffffe
 4d0:	aab68693          	addi	a3,a3,-1365 # ffffdaab <_end+0xffffd28b>
 4d4:	00000013          	nop
 4d8:	00000013          	nop
 4dc:	00000617          	auipc	a2,0x0
 4e0:	32460613          	addi	a2,a2,804 # 800 <begin_signature>
 4e4:	00d61523          	sh	a3,10(a2)
 4e8:	00a61703          	lh	a4,10(a2)
 4ec:	ffffe3b7          	lui	t2,0xffffe
 4f0:	aab38393          	addi	t2,t2,-1365 # ffffdaab <_end+0xffffd28b>
 4f4:	18771463          	bne	a4,t2,67c <fail>
 4f8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4fc:	00200293          	li	t0,2
 500:	fc5216e3          	bne	tp,t0,4cc <test_17+0x8>

00000504 <test_18>:
 504:	01200193          	li	gp,18
 508:	00000213          	li	tp,0
 50c:	00000117          	auipc	sp,0x0
 510:	2f410113          	addi	sp,sp,756 # 800 <begin_signature>
 514:	000020b7          	lui	ra,0x2
 518:	23308093          	addi	ra,ra,563 # 2233 <_end+0x1a13>
 51c:	00111023          	sh	ra,0(sp)
 520:	00011703          	lh	a4,0(sp)
 524:	000023b7          	lui	t2,0x2
 528:	23338393          	addi	t2,t2,563 # 2233 <_end+0x1a13>
 52c:	14771863          	bne	a4,t2,67c <fail>
 530:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 534:	00200293          	li	t0,2
 538:	fc521ae3          	bne	tp,t0,50c <test_18+0x8>

0000053c <test_19>:
 53c:	01300193          	li	gp,19
 540:	00000213          	li	tp,0
 544:	00000117          	auipc	sp,0x0
 548:	2bc10113          	addi	sp,sp,700 # 800 <begin_signature>
 54c:	000010b7          	lui	ra,0x1
 550:	22308093          	addi	ra,ra,547 # 1223 <_end+0xa03>
 554:	00000013          	nop
 558:	00111123          	sh	ra,2(sp)
 55c:	00211703          	lh	a4,2(sp)
 560:	000013b7          	lui	t2,0x1
 564:	22338393          	addi	t2,t2,547 # 1223 <_end+0xa03>
 568:	10771a63          	bne	a4,t2,67c <fail>
 56c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 570:	00200293          	li	t0,2
 574:	fc5218e3          	bne	tp,t0,544 <test_19+0x8>

00000578 <test_20>:
 578:	01400193          	li	gp,20
 57c:	00000213          	li	tp,0
 580:	00000117          	auipc	sp,0x0
 584:	28010113          	addi	sp,sp,640 # 800 <begin_signature>
 588:	000010b7          	lui	ra,0x1
 58c:	12208093          	addi	ra,ra,290 # 1122 <_end+0x902>
 590:	00000013          	nop
 594:	00000013          	nop
 598:	00111223          	sh	ra,4(sp)
 59c:	00411703          	lh	a4,4(sp)
 5a0:	000013b7          	lui	t2,0x1
 5a4:	12238393          	addi	t2,t2,290 # 1122 <_end+0x902>
 5a8:	0c771a63          	bne	a4,t2,67c <fail>
 5ac:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5b0:	00200293          	li	t0,2
 5b4:	fc5216e3          	bne	tp,t0,580 <test_20+0x8>

000005b8 <test_21>:
 5b8:	01500193          	li	gp,21
 5bc:	00000213          	li	tp,0
 5c0:	00000117          	auipc	sp,0x0
 5c4:	24010113          	addi	sp,sp,576 # 800 <begin_signature>
 5c8:	00000013          	nop
 5cc:	11200093          	li	ra,274
 5d0:	00111323          	sh	ra,6(sp)
 5d4:	00611703          	lh	a4,6(sp)
 5d8:	11200393          	li	t2,274
 5dc:	0a771063          	bne	a4,t2,67c <fail>
 5e0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5e4:	00200293          	li	t0,2
 5e8:	fc521ce3          	bne	tp,t0,5c0 <test_21+0x8>

000005ec <test_22>:
 5ec:	01600193          	li	gp,22
 5f0:	00000213          	li	tp,0
 5f4:	00000117          	auipc	sp,0x0
 5f8:	20c10113          	addi	sp,sp,524 # 800 <begin_signature>
 5fc:	00000013          	nop
 600:	01100093          	li	ra,17
 604:	00000013          	nop
 608:	00111423          	sh	ra,8(sp)
 60c:	00811703          	lh	a4,8(sp)
 610:	01100393          	li	t2,17
 614:	06771463          	bne	a4,t2,67c <fail>
 618:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 61c:	00200293          	li	t0,2
 620:	fc521ae3          	bne	tp,t0,5f4 <test_22+0x8>

00000624 <test_23>:
 624:	01700193          	li	gp,23
 628:	00000213          	li	tp,0
 62c:	00000117          	auipc	sp,0x0
 630:	1d410113          	addi	sp,sp,468 # 800 <begin_signature>
 634:	00000013          	nop
 638:	00000013          	nop
 63c:	000030b7          	lui	ra,0x3
 640:	00108093          	addi	ra,ra,1 # 3001 <_end+0x27e1>
 644:	00111523          	sh	ra,10(sp)
 648:	00a11703          	lh	a4,10(sp)
 64c:	000033b7          	lui	t2,0x3
 650:	00138393          	addi	t2,t2,1 # 3001 <_end+0x27e1>
 654:	02771463          	bne	a4,t2,67c <fail>
 658:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 65c:	00200293          	li	t0,2
 660:	fc5216e3          	bne	tp,t0,62c <test_23+0x8>
 664:	0000c537          	lui	a0,0xc
 668:	eef50513          	addi	a0,a0,-273 # beef <_end+0xb6cf>
 66c:	00000597          	auipc	a1,0x0
 670:	19458593          	addi	a1,a1,404 # 800 <begin_signature>
 674:	00a59323          	sh	a0,6(a1)
 678:	02301063          	bne	zero,gp,698 <pass>

0000067c <fail>:
 67c:	0ff0000f          	fence
 680:	00018063          	beqz	gp,680 <fail+0x4>
 684:	00119193          	slli	gp,gp,0x1
 688:	0011e193          	ori	gp,gp,1
 68c:	05d00893          	li	a7,93
 690:	00018513          	mv	a0,gp
 694:	00000073          	ecall

00000698 <pass>:
 698:	0ff0000f          	fence
 69c:	00100193          	li	gp,1
 6a0:	05d00893          	li	a7,93
 6a4:	00000513          	li	a0,0
 6a8:	00000073          	ecall
 6ac:	c0001073          	unimp
 6b0:	0000                	.insn	2, 0x
 6b2:	0000                	.insn	2, 0x

Disassembly of section .data:

00000800 <begin_signature>:
 800:	          	jal	t4,ffffbbee <_end+0xffffb3ce>

00000802 <tdat2>:
 802:	          	jal	t4,ffffbbf0 <_end+0xffffb3d0>

00000804 <tdat3>:
 804:	          	jal	t4,ffffbbf2 <_end+0xffffb3d2>

00000806 <tdat4>:
 806:	          	jal	t4,ffffbbf4 <_end+0xffffb3d4>

00000808 <tdat5>:
 808:	          	jal	t4,ffffbbf6 <_end+0xffffb3d6>

0000080a <tdat6>:
 80a:	          	jal	t4,ffffbbf8 <_end+0xffffb3d8>

0000080c <tdat7>:
 80c:	          	jal	t4,ffffbbfa <_end+0xffffb3da>

0000080e <tdat8>:
 80e:	          	jal	t4,ffffbbfc <_end+0xffffb3dc>

00000810 <tdat9>:
 810:	          	jal	t4,ffffbbfe <_end+0xffffb3de>

00000812 <tdat10>:
 812:	0000beef          	jal	t4,b812 <_end+0xaff2>
 816:	0000                	.insn	2, 0x
 818:	0000                	.insn	2, 0x
 81a:	0000                	.insn	2, 0x
 81c:	0000                	.insn	2, 0x
 81e:	0000                	.insn	2, 0x
