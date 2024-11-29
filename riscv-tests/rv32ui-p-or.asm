
rv32ui-p-or:     file format elf32-littleriscv


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
 188:	ff0105b7          	lui	a1,0xff010
 18c:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00f700>
 190:	0f0f1637          	lui	a2,0xf0f1
 194:	f0f60613          	addi	a2,a2,-241 # f0f0f0f <_end+0xf0f070f>
 198:	00c5e733          	or	a4,a1,a2
 19c:	ff1003b7          	lui	t2,0xff100
 1a0:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 1a4:	4a771263          	bne	a4,t2,648 <fail>

000001a8 <test_3>:
 1a8:	00300193          	li	gp,3
 1ac:	0ff015b7          	lui	a1,0xff01
 1b0:	ff058593          	addi	a1,a1,-16 # ff00ff0 <_end+0xff007f0>
 1b4:	f0f0f637          	lui	a2,0xf0f0f
 1b8:	0f060613          	addi	a2,a2,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 1bc:	00c5e733          	or	a4,a1,a2
 1c0:	fff103b7          	lui	t2,0xfff10
 1c4:	ff038393          	addi	t2,t2,-16 # fff0fff0 <_end+0xfff0f7f0>
 1c8:	48771063          	bne	a4,t2,648 <fail>

000001cc <test_4>:
 1cc:	00400193          	li	gp,4
 1d0:	00ff05b7          	lui	a1,0xff0
 1d4:	0ff58593          	addi	a1,a1,255 # ff00ff <_end+0xfef8ff>
 1d8:	0f0f1637          	lui	a2,0xf0f1
 1dc:	f0f60613          	addi	a2,a2,-241 # f0f0f0f <_end+0xf0f070f>
 1e0:	00c5e733          	or	a4,a1,a2
 1e4:	0fff13b7          	lui	t2,0xfff1
 1e8:	fff38393          	addi	t2,t2,-1 # fff0fff <_end+0xfff07ff>
 1ec:	44771e63          	bne	a4,t2,648 <fail>

000001f0 <test_5>:
 1f0:	00500193          	li	gp,5
 1f4:	f00ff5b7          	lui	a1,0xf00ff
 1f8:	00f58593          	addi	a1,a1,15 # f00ff00f <_end+0xf00fe80f>
 1fc:	f0f0f637          	lui	a2,0xf0f0f
 200:	0f060613          	addi	a2,a2,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 204:	00c5e733          	or	a4,a1,a2
 208:	f0fff3b7          	lui	t2,0xf0fff
 20c:	0ff38393          	addi	t2,t2,255 # f0fff0ff <_end+0xf0ffe8ff>
 210:	42771c63          	bne	a4,t2,648 <fail>

00000214 <test_6>:
 214:	00600193          	li	gp,6
 218:	ff0105b7          	lui	a1,0xff010
 21c:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00f700>
 220:	0f0f1637          	lui	a2,0xf0f1
 224:	f0f60613          	addi	a2,a2,-241 # f0f0f0f <_end+0xf0f070f>
 228:	00c5e5b3          	or	a1,a1,a2
 22c:	ff1003b7          	lui	t2,0xff100
 230:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 234:	40759a63          	bne	a1,t2,648 <fail>

00000238 <test_7>:
 238:	00700193          	li	gp,7
 23c:	ff0105b7          	lui	a1,0xff010
 240:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00f700>
 244:	0f0f1637          	lui	a2,0xf0f1
 248:	f0f60613          	addi	a2,a2,-241 # f0f0f0f <_end+0xf0f070f>
 24c:	00c5e633          	or	a2,a1,a2
 250:	ff1003b7          	lui	t2,0xff100
 254:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 258:	3e761863          	bne	a2,t2,648 <fail>

0000025c <test_8>:
 25c:	00800193          	li	gp,8
 260:	ff0105b7          	lui	a1,0xff010
 264:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00f700>
 268:	00b5e5b3          	or	a1,a1,a1
 26c:	ff0103b7          	lui	t2,0xff010
 270:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f700>
 274:	3c759a63          	bne	a1,t2,648 <fail>

00000278 <test_9>:
 278:	00900193          	li	gp,9
 27c:	00000213          	li	tp,0
 280:	ff0100b7          	lui	ra,0xff010
 284:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 288:	0f0f1137          	lui	sp,0xf0f1
 28c:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 290:	0020e733          	or	a4,ra,sp
 294:	00070313          	mv	t1,a4
 298:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 29c:	00200293          	li	t0,2
 2a0:	fe5210e3          	bne	tp,t0,280 <test_9+0x8>
 2a4:	ff1003b7          	lui	t2,0xff100
 2a8:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 2ac:	38731e63          	bne	t1,t2,648 <fail>

000002b0 <test_10>:
 2b0:	00a00193          	li	gp,10
 2b4:	00000213          	li	tp,0
 2b8:	0ff010b7          	lui	ra,0xff01
 2bc:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 2c0:	f0f0f137          	lui	sp,0xf0f0f
 2c4:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 2c8:	0020e733          	or	a4,ra,sp
 2cc:	00000013          	nop
 2d0:	00070313          	mv	t1,a4
 2d4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2d8:	00200293          	li	t0,2
 2dc:	fc521ee3          	bne	tp,t0,2b8 <test_10+0x8>
 2e0:	fff103b7          	lui	t2,0xfff10
 2e4:	ff038393          	addi	t2,t2,-16 # fff0fff0 <_end+0xfff0f7f0>
 2e8:	36731063          	bne	t1,t2,648 <fail>

000002ec <test_11>:
 2ec:	00b00193          	li	gp,11
 2f0:	00000213          	li	tp,0
 2f4:	00ff00b7          	lui	ra,0xff0
 2f8:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 2fc:	0f0f1137          	lui	sp,0xf0f1
 300:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 304:	0020e733          	or	a4,ra,sp
 308:	00000013          	nop
 30c:	00000013          	nop
 310:	00070313          	mv	t1,a4
 314:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 318:	00200293          	li	t0,2
 31c:	fc521ce3          	bne	tp,t0,2f4 <test_11+0x8>
 320:	0fff13b7          	lui	t2,0xfff1
 324:	fff38393          	addi	t2,t2,-1 # fff0fff <_end+0xfff07ff>
 328:	32731063          	bne	t1,t2,648 <fail>

0000032c <test_12>:
 32c:	00c00193          	li	gp,12
 330:	00000213          	li	tp,0
 334:	ff0100b7          	lui	ra,0xff010
 338:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 33c:	0f0f1137          	lui	sp,0xf0f1
 340:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 344:	0020e733          	or	a4,ra,sp
 348:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 34c:	00200293          	li	t0,2
 350:	fe5212e3          	bne	tp,t0,334 <test_12+0x8>
 354:	ff1003b7          	lui	t2,0xff100
 358:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 35c:	2e771663          	bne	a4,t2,648 <fail>

00000360 <test_13>:
 360:	00d00193          	li	gp,13
 364:	00000213          	li	tp,0
 368:	0ff010b7          	lui	ra,0xff01
 36c:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 370:	f0f0f137          	lui	sp,0xf0f0f
 374:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 378:	00000013          	nop
 37c:	0020e733          	or	a4,ra,sp
 380:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 384:	00200293          	li	t0,2
 388:	fe5210e3          	bne	tp,t0,368 <test_13+0x8>
 38c:	fff103b7          	lui	t2,0xfff10
 390:	ff038393          	addi	t2,t2,-16 # fff0fff0 <_end+0xfff0f7f0>
 394:	2a771a63          	bne	a4,t2,648 <fail>

00000398 <test_14>:
 398:	00e00193          	li	gp,14
 39c:	00000213          	li	tp,0
 3a0:	00ff00b7          	lui	ra,0xff0
 3a4:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 3a8:	0f0f1137          	lui	sp,0xf0f1
 3ac:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 3b0:	00000013          	nop
 3b4:	00000013          	nop
 3b8:	0020e733          	or	a4,ra,sp
 3bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c0:	00200293          	li	t0,2
 3c4:	fc521ee3          	bne	tp,t0,3a0 <test_14+0x8>
 3c8:	0fff13b7          	lui	t2,0xfff1
 3cc:	fff38393          	addi	t2,t2,-1 # fff0fff <_end+0xfff07ff>
 3d0:	26771c63          	bne	a4,t2,648 <fail>

000003d4 <test_15>:
 3d4:	00f00193          	li	gp,15
 3d8:	00000213          	li	tp,0
 3dc:	ff0100b7          	lui	ra,0xff010
 3e0:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 3e4:	00000013          	nop
 3e8:	0f0f1137          	lui	sp,0xf0f1
 3ec:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 3f0:	0020e733          	or	a4,ra,sp
 3f4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3f8:	00200293          	li	t0,2
 3fc:	fe5210e3          	bne	tp,t0,3dc <test_15+0x8>
 400:	ff1003b7          	lui	t2,0xff100
 404:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 408:	24771063          	bne	a4,t2,648 <fail>

0000040c <test_16>:
 40c:	01000193          	li	gp,16
 410:	00000213          	li	tp,0
 414:	0ff010b7          	lui	ra,0xff01
 418:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 41c:	00000013          	nop
 420:	f0f0f137          	lui	sp,0xf0f0f
 424:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 428:	00000013          	nop
 42c:	0020e733          	or	a4,ra,sp
 430:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 434:	00200293          	li	t0,2
 438:	fc521ee3          	bne	tp,t0,414 <test_16+0x8>
 43c:	fff103b7          	lui	t2,0xfff10
 440:	ff038393          	addi	t2,t2,-16 # fff0fff0 <_end+0xfff0f7f0>
 444:	20771263          	bne	a4,t2,648 <fail>

00000448 <test_17>:
 448:	01100193          	li	gp,17
 44c:	00000213          	li	tp,0
 450:	00ff00b7          	lui	ra,0xff0
 454:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 458:	00000013          	nop
 45c:	00000013          	nop
 460:	0f0f1137          	lui	sp,0xf0f1
 464:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 468:	0020e733          	or	a4,ra,sp
 46c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 470:	00200293          	li	t0,2
 474:	fc521ee3          	bne	tp,t0,450 <test_17+0x8>
 478:	0fff13b7          	lui	t2,0xfff1
 47c:	fff38393          	addi	t2,t2,-1 # fff0fff <_end+0xfff07ff>
 480:	1c771463          	bne	a4,t2,648 <fail>

00000484 <test_18>:
 484:	01200193          	li	gp,18
 488:	00000213          	li	tp,0
 48c:	0f0f1137          	lui	sp,0xf0f1
 490:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 494:	ff0100b7          	lui	ra,0xff010
 498:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 49c:	0020e733          	or	a4,ra,sp
 4a0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4a4:	00200293          	li	t0,2
 4a8:	fe5212e3          	bne	tp,t0,48c <test_18+0x8>
 4ac:	ff1003b7          	lui	t2,0xff100
 4b0:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 4b4:	18771a63          	bne	a4,t2,648 <fail>

000004b8 <test_19>:
 4b8:	01300193          	li	gp,19
 4bc:	00000213          	li	tp,0
 4c0:	f0f0f137          	lui	sp,0xf0f0f
 4c4:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 4c8:	0ff010b7          	lui	ra,0xff01
 4cc:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 4d0:	00000013          	nop
 4d4:	0020e733          	or	a4,ra,sp
 4d8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4dc:	00200293          	li	t0,2
 4e0:	fe5210e3          	bne	tp,t0,4c0 <test_19+0x8>
 4e4:	fff103b7          	lui	t2,0xfff10
 4e8:	ff038393          	addi	t2,t2,-16 # fff0fff0 <_end+0xfff0f7f0>
 4ec:	14771e63          	bne	a4,t2,648 <fail>

000004f0 <test_20>:
 4f0:	01400193          	li	gp,20
 4f4:	00000213          	li	tp,0
 4f8:	0f0f1137          	lui	sp,0xf0f1
 4fc:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 500:	00ff00b7          	lui	ra,0xff0
 504:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 508:	00000013          	nop
 50c:	00000013          	nop
 510:	0020e733          	or	a4,ra,sp
 514:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 518:	00200293          	li	t0,2
 51c:	fc521ee3          	bne	tp,t0,4f8 <test_20+0x8>
 520:	0fff13b7          	lui	t2,0xfff1
 524:	fff38393          	addi	t2,t2,-1 # fff0fff <_end+0xfff07ff>
 528:	12771063          	bne	a4,t2,648 <fail>

0000052c <test_21>:
 52c:	01500193          	li	gp,21
 530:	00000213          	li	tp,0
 534:	0f0f1137          	lui	sp,0xf0f1
 538:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 53c:	00000013          	nop
 540:	ff0100b7          	lui	ra,0xff010
 544:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 548:	0020e733          	or	a4,ra,sp
 54c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 550:	00200293          	li	t0,2
 554:	fe5210e3          	bne	tp,t0,534 <test_21+0x8>
 558:	ff1003b7          	lui	t2,0xff100
 55c:	f0f38393          	addi	t2,t2,-241 # ff0fff0f <_end+0xff0ff70f>
 560:	0e771463          	bne	a4,t2,648 <fail>

00000564 <test_22>:
 564:	01600193          	li	gp,22
 568:	00000213          	li	tp,0
 56c:	f0f0f137          	lui	sp,0xf0f0f
 570:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 574:	00000013          	nop
 578:	0ff010b7          	lui	ra,0xff01
 57c:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 580:	00000013          	nop
 584:	0020e733          	or	a4,ra,sp
 588:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 58c:	00200293          	li	t0,2
 590:	fc521ee3          	bne	tp,t0,56c <test_22+0x8>
 594:	fff103b7          	lui	t2,0xfff10
 598:	ff038393          	addi	t2,t2,-16 # fff0fff0 <_end+0xfff0f7f0>
 59c:	0a771663          	bne	a4,t2,648 <fail>

000005a0 <test_23>:
 5a0:	01700193          	li	gp,23
 5a4:	00000213          	li	tp,0
 5a8:	0f0f1137          	lui	sp,0xf0f1
 5ac:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 5b0:	00000013          	nop
 5b4:	00000013          	nop
 5b8:	00ff00b7          	lui	ra,0xff0
 5bc:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 5c0:	0020e733          	or	a4,ra,sp
 5c4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5c8:	00200293          	li	t0,2
 5cc:	fc521ee3          	bne	tp,t0,5a8 <test_23+0x8>
 5d0:	0fff13b7          	lui	t2,0xfff1
 5d4:	fff38393          	addi	t2,t2,-1 # fff0fff <_end+0xfff07ff>
 5d8:	06771863          	bne	a4,t2,648 <fail>

000005dc <test_24>:
 5dc:	01800193          	li	gp,24
 5e0:	ff0100b7          	lui	ra,0xff010
 5e4:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 5e8:	00106133          	or	sp,zero,ra
 5ec:	ff0103b7          	lui	t2,0xff010
 5f0:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f700>
 5f4:	04711a63          	bne	sp,t2,648 <fail>

000005f8 <test_25>:
 5f8:	01900193          	li	gp,25
 5fc:	00ff00b7          	lui	ra,0xff0
 600:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 604:	0000e133          	or	sp,ra,zero
 608:	00ff03b7          	lui	t2,0xff0
 60c:	0ff38393          	addi	t2,t2,255 # ff00ff <_end+0xfef8ff>
 610:	02711c63          	bne	sp,t2,648 <fail>

00000614 <test_26>:
 614:	01a00193          	li	gp,26
 618:	000060b3          	or	ra,zero,zero
 61c:	00000393          	li	t2,0
 620:	02709463          	bne	ra,t2,648 <fail>

00000624 <test_27>:
 624:	01b00193          	li	gp,27
 628:	111110b7          	lui	ra,0x11111
 62c:	11108093          	addi	ra,ra,273 # 11111111 <_end+0x11110911>
 630:	22222137          	lui	sp,0x22222
 634:	22210113          	addi	sp,sp,546 # 22222222 <_end+0x22221a22>
 638:	0020e033          	or	zero,ra,sp
 63c:	00000393          	li	t2,0
 640:	00701463          	bne	zero,t2,648 <fail>
 644:	02301063          	bne	zero,gp,664 <pass>

00000648 <fail>:
 648:	0ff0000f          	fence
 64c:	00018063          	beqz	gp,64c <fail+0x4>
 650:	00119193          	slli	gp,gp,0x1
 654:	0011e193          	ori	gp,gp,1
 658:	05d00893          	li	a7,93
 65c:	00018513          	mv	a0,gp
 660:	00000073          	ecall

00000664 <pass>:
 664:	0ff0000f          	fence
 668:	00100193          	li	gp,1
 66c:	05d00893          	li	a7,93
 670:	00000513          	li	a0,0
 674:	00000073          	ecall
 678:	c0001073          	unimp
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
