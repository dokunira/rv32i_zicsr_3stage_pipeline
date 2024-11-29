
rv32ui-p-and:     file format elf32-littleriscv


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
 198:	00c5f733          	and	a4,a1,a2
 19c:	0f0013b7          	lui	t2,0xf001
 1a0:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 1a4:	48771c63          	bne	a4,t2,63c <fail>

000001a8 <test_3>:
 1a8:	00300193          	li	gp,3
 1ac:	0ff015b7          	lui	a1,0xff01
 1b0:	ff058593          	addi	a1,a1,-16 # ff00ff0 <_end+0xff007f0>
 1b4:	f0f0f637          	lui	a2,0xf0f0f
 1b8:	0f060613          	addi	a2,a2,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 1bc:	00c5f733          	and	a4,a1,a2
 1c0:	00f003b7          	lui	t2,0xf00
 1c4:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 1c8:	46771a63          	bne	a4,t2,63c <fail>

000001cc <test_4>:
 1cc:	00400193          	li	gp,4
 1d0:	00ff05b7          	lui	a1,0xff0
 1d4:	0ff58593          	addi	a1,a1,255 # ff00ff <_end+0xfef8ff>
 1d8:	0f0f1637          	lui	a2,0xf0f1
 1dc:	f0f60613          	addi	a2,a2,-241 # f0f0f0f <_end+0xf0f070f>
 1e0:	00c5f733          	and	a4,a1,a2
 1e4:	000f03b7          	lui	t2,0xf0
 1e8:	00f38393          	addi	t2,t2,15 # f000f <_end+0xef80f>
 1ec:	44771863          	bne	a4,t2,63c <fail>

000001f0 <test_5>:
 1f0:	00500193          	li	gp,5
 1f4:	f00ff5b7          	lui	a1,0xf00ff
 1f8:	00f58593          	addi	a1,a1,15 # f00ff00f <_end+0xf00fe80f>
 1fc:	f0f0f637          	lui	a2,0xf0f0f
 200:	0f060613          	addi	a2,a2,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 204:	00c5f733          	and	a4,a1,a2
 208:	f000f3b7          	lui	t2,0xf000f
 20c:	42771863          	bne	a4,t2,63c <fail>

00000210 <test_6>:
 210:	00600193          	li	gp,6
 214:	ff0105b7          	lui	a1,0xff010
 218:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00f700>
 21c:	0f0f1637          	lui	a2,0xf0f1
 220:	f0f60613          	addi	a2,a2,-241 # f0f0f0f <_end+0xf0f070f>
 224:	00c5f5b3          	and	a1,a1,a2
 228:	0f0013b7          	lui	t2,0xf001
 22c:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 230:	40759663          	bne	a1,t2,63c <fail>

00000234 <test_7>:
 234:	00700193          	li	gp,7
 238:	0ff015b7          	lui	a1,0xff01
 23c:	ff058593          	addi	a1,a1,-16 # ff00ff0 <_end+0xff007f0>
 240:	f0f0f637          	lui	a2,0xf0f0f
 244:	0f060613          	addi	a2,a2,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 248:	00c5f633          	and	a2,a1,a2
 24c:	00f003b7          	lui	t2,0xf00
 250:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 254:	3e761463          	bne	a2,t2,63c <fail>

00000258 <test_8>:
 258:	00800193          	li	gp,8
 25c:	ff0105b7          	lui	a1,0xff010
 260:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00f700>
 264:	00b5f5b3          	and	a1,a1,a1
 268:	ff0103b7          	lui	t2,0xff010
 26c:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f700>
 270:	3c759663          	bne	a1,t2,63c <fail>

00000274 <test_9>:
 274:	00900193          	li	gp,9
 278:	00000213          	li	tp,0
 27c:	ff0100b7          	lui	ra,0xff010
 280:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 284:	0f0f1137          	lui	sp,0xf0f1
 288:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 28c:	0020f733          	and	a4,ra,sp
 290:	00070313          	mv	t1,a4
 294:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 298:	00200293          	li	t0,2
 29c:	fe5210e3          	bne	tp,t0,27c <test_9+0x8>
 2a0:	0f0013b7          	lui	t2,0xf001
 2a4:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 2a8:	38731a63          	bne	t1,t2,63c <fail>

000002ac <test_10>:
 2ac:	00a00193          	li	gp,10
 2b0:	00000213          	li	tp,0
 2b4:	0ff010b7          	lui	ra,0xff01
 2b8:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 2bc:	f0f0f137          	lui	sp,0xf0f0f
 2c0:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 2c4:	0020f733          	and	a4,ra,sp
 2c8:	00000013          	nop
 2cc:	00070313          	mv	t1,a4
 2d0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2d4:	00200293          	li	t0,2
 2d8:	fc521ee3          	bne	tp,t0,2b4 <test_10+0x8>
 2dc:	00f003b7          	lui	t2,0xf00
 2e0:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 2e4:	34731c63          	bne	t1,t2,63c <fail>

000002e8 <test_11>:
 2e8:	00b00193          	li	gp,11
 2ec:	00000213          	li	tp,0
 2f0:	00ff00b7          	lui	ra,0xff0
 2f4:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 2f8:	0f0f1137          	lui	sp,0xf0f1
 2fc:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 300:	0020f733          	and	a4,ra,sp
 304:	00000013          	nop
 308:	00000013          	nop
 30c:	00070313          	mv	t1,a4
 310:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 314:	00200293          	li	t0,2
 318:	fc521ce3          	bne	tp,t0,2f0 <test_11+0x8>
 31c:	000f03b7          	lui	t2,0xf0
 320:	00f38393          	addi	t2,t2,15 # f000f <_end+0xef80f>
 324:	30731c63          	bne	t1,t2,63c <fail>

00000328 <test_12>:
 328:	00c00193          	li	gp,12
 32c:	00000213          	li	tp,0
 330:	ff0100b7          	lui	ra,0xff010
 334:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 338:	0f0f1137          	lui	sp,0xf0f1
 33c:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 340:	0020f733          	and	a4,ra,sp
 344:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 348:	00200293          	li	t0,2
 34c:	fe5212e3          	bne	tp,t0,330 <test_12+0x8>
 350:	0f0013b7          	lui	t2,0xf001
 354:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 358:	2e771263          	bne	a4,t2,63c <fail>

0000035c <test_13>:
 35c:	00d00193          	li	gp,13
 360:	00000213          	li	tp,0
 364:	0ff010b7          	lui	ra,0xff01
 368:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 36c:	f0f0f137          	lui	sp,0xf0f0f
 370:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 374:	00000013          	nop
 378:	0020f733          	and	a4,ra,sp
 37c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 380:	00200293          	li	t0,2
 384:	fe5210e3          	bne	tp,t0,364 <test_13+0x8>
 388:	00f003b7          	lui	t2,0xf00
 38c:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 390:	2a771663          	bne	a4,t2,63c <fail>

00000394 <test_14>:
 394:	00e00193          	li	gp,14
 398:	00000213          	li	tp,0
 39c:	00ff00b7          	lui	ra,0xff0
 3a0:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 3a4:	0f0f1137          	lui	sp,0xf0f1
 3a8:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 3ac:	00000013          	nop
 3b0:	00000013          	nop
 3b4:	0020f733          	and	a4,ra,sp
 3b8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3bc:	00200293          	li	t0,2
 3c0:	fc521ee3          	bne	tp,t0,39c <test_14+0x8>
 3c4:	000f03b7          	lui	t2,0xf0
 3c8:	00f38393          	addi	t2,t2,15 # f000f <_end+0xef80f>
 3cc:	26771863          	bne	a4,t2,63c <fail>

000003d0 <test_15>:
 3d0:	00f00193          	li	gp,15
 3d4:	00000213          	li	tp,0
 3d8:	ff0100b7          	lui	ra,0xff010
 3dc:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 3e0:	00000013          	nop
 3e4:	0f0f1137          	lui	sp,0xf0f1
 3e8:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 3ec:	0020f733          	and	a4,ra,sp
 3f0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3f4:	00200293          	li	t0,2
 3f8:	fe5210e3          	bne	tp,t0,3d8 <test_15+0x8>
 3fc:	0f0013b7          	lui	t2,0xf001
 400:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 404:	22771c63          	bne	a4,t2,63c <fail>

00000408 <test_16>:
 408:	01000193          	li	gp,16
 40c:	00000213          	li	tp,0
 410:	0ff010b7          	lui	ra,0xff01
 414:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 418:	00000013          	nop
 41c:	f0f0f137          	lui	sp,0xf0f0f
 420:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 424:	00000013          	nop
 428:	0020f733          	and	a4,ra,sp
 42c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 430:	00200293          	li	t0,2
 434:	fc521ee3          	bne	tp,t0,410 <test_16+0x8>
 438:	00f003b7          	lui	t2,0xf00
 43c:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 440:	1e771e63          	bne	a4,t2,63c <fail>

00000444 <test_17>:
 444:	01100193          	li	gp,17
 448:	00000213          	li	tp,0
 44c:	00ff00b7          	lui	ra,0xff0
 450:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 454:	00000013          	nop
 458:	00000013          	nop
 45c:	0f0f1137          	lui	sp,0xf0f1
 460:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 464:	0020f733          	and	a4,ra,sp
 468:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 46c:	00200293          	li	t0,2
 470:	fc521ee3          	bne	tp,t0,44c <test_17+0x8>
 474:	000f03b7          	lui	t2,0xf0
 478:	00f38393          	addi	t2,t2,15 # f000f <_end+0xef80f>
 47c:	1c771063          	bne	a4,t2,63c <fail>

00000480 <test_18>:
 480:	01200193          	li	gp,18
 484:	00000213          	li	tp,0
 488:	0f0f1137          	lui	sp,0xf0f1
 48c:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 490:	ff0100b7          	lui	ra,0xff010
 494:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 498:	0020f733          	and	a4,ra,sp
 49c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4a0:	00200293          	li	t0,2
 4a4:	fe5212e3          	bne	tp,t0,488 <test_18+0x8>
 4a8:	0f0013b7          	lui	t2,0xf001
 4ac:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 4b0:	18771663          	bne	a4,t2,63c <fail>

000004b4 <test_19>:
 4b4:	01300193          	li	gp,19
 4b8:	00000213          	li	tp,0
 4bc:	f0f0f137          	lui	sp,0xf0f0f
 4c0:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 4c4:	0ff010b7          	lui	ra,0xff01
 4c8:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 4cc:	00000013          	nop
 4d0:	0020f733          	and	a4,ra,sp
 4d4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4d8:	00200293          	li	t0,2
 4dc:	fe5210e3          	bne	tp,t0,4bc <test_19+0x8>
 4e0:	00f003b7          	lui	t2,0xf00
 4e4:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 4e8:	14771a63          	bne	a4,t2,63c <fail>

000004ec <test_20>:
 4ec:	01400193          	li	gp,20
 4f0:	00000213          	li	tp,0
 4f4:	0f0f1137          	lui	sp,0xf0f1
 4f8:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 4fc:	00ff00b7          	lui	ra,0xff0
 500:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 504:	00000013          	nop
 508:	00000013          	nop
 50c:	0020f733          	and	a4,ra,sp
 510:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 514:	00200293          	li	t0,2
 518:	fc521ee3          	bne	tp,t0,4f4 <test_20+0x8>
 51c:	000f03b7          	lui	t2,0xf0
 520:	00f38393          	addi	t2,t2,15 # f000f <_end+0xef80f>
 524:	10771c63          	bne	a4,t2,63c <fail>

00000528 <test_21>:
 528:	01500193          	li	gp,21
 52c:	00000213          	li	tp,0
 530:	0f0f1137          	lui	sp,0xf0f1
 534:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 538:	00000013          	nop
 53c:	ff0100b7          	lui	ra,0xff010
 540:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 544:	0020f733          	and	a4,ra,sp
 548:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 54c:	00200293          	li	t0,2
 550:	fe5210e3          	bne	tp,t0,530 <test_21+0x8>
 554:	0f0013b7          	lui	t2,0xf001
 558:	f0038393          	addi	t2,t2,-256 # f000f00 <_end+0xf000700>
 55c:	0e771063          	bne	a4,t2,63c <fail>

00000560 <test_22>:
 560:	01600193          	li	gp,22
 564:	00000213          	li	tp,0
 568:	f0f0f137          	lui	sp,0xf0f0f
 56c:	0f010113          	addi	sp,sp,240 # f0f0f0f0 <_end+0xf0f0e8f0>
 570:	00000013          	nop
 574:	0ff010b7          	lui	ra,0xff01
 578:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff007f0>
 57c:	00000013          	nop
 580:	0020f733          	and	a4,ra,sp
 584:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 588:	00200293          	li	t0,2
 58c:	fc521ee3          	bne	tp,t0,568 <test_22+0x8>
 590:	00f003b7          	lui	t2,0xf00
 594:	0f038393          	addi	t2,t2,240 # f000f0 <_end+0xeff8f0>
 598:	0a771263          	bne	a4,t2,63c <fail>

0000059c <test_23>:
 59c:	01700193          	li	gp,23
 5a0:	00000213          	li	tp,0
 5a4:	0f0f1137          	lui	sp,0xf0f1
 5a8:	f0f10113          	addi	sp,sp,-241 # f0f0f0f <_end+0xf0f070f>
 5ac:	00000013          	nop
 5b0:	00000013          	nop
 5b4:	00ff00b7          	lui	ra,0xff0
 5b8:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 5bc:	0020f733          	and	a4,ra,sp
 5c0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5c4:	00200293          	li	t0,2
 5c8:	fc521ee3          	bne	tp,t0,5a4 <test_23+0x8>
 5cc:	000f03b7          	lui	t2,0xf0
 5d0:	00f38393          	addi	t2,t2,15 # f000f <_end+0xef80f>
 5d4:	06771463          	bne	a4,t2,63c <fail>

000005d8 <test_24>:
 5d8:	01800193          	li	gp,24
 5dc:	ff0100b7          	lui	ra,0xff010
 5e0:	f0008093          	addi	ra,ra,-256 # ff00ff00 <_end+0xff00f700>
 5e4:	00107133          	and	sp,zero,ra
 5e8:	00000393          	li	t2,0
 5ec:	04711863          	bne	sp,t2,63c <fail>

000005f0 <test_25>:
 5f0:	01900193          	li	gp,25
 5f4:	00ff00b7          	lui	ra,0xff0
 5f8:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfef8ff>
 5fc:	0000f133          	and	sp,ra,zero
 600:	00000393          	li	t2,0
 604:	02711c63          	bne	sp,t2,63c <fail>

00000608 <test_26>:
 608:	01a00193          	li	gp,26
 60c:	000070b3          	and	ra,zero,zero
 610:	00000393          	li	t2,0
 614:	02709463          	bne	ra,t2,63c <fail>

00000618 <test_27>:
 618:	01b00193          	li	gp,27
 61c:	111110b7          	lui	ra,0x11111
 620:	11108093          	addi	ra,ra,273 # 11111111 <_end+0x11110911>
 624:	22222137          	lui	sp,0x22222
 628:	22210113          	addi	sp,sp,546 # 22222222 <_end+0x22221a22>
 62c:	0020f033          	and	zero,ra,sp
 630:	00000393          	li	t2,0
 634:	00701463          	bne	zero,t2,63c <fail>
 638:	02301063          	bne	zero,gp,658 <pass>

0000063c <fail>:
 63c:	0ff0000f          	fence
 640:	00018063          	beqz	gp,640 <fail+0x4>
 644:	00119193          	slli	gp,gp,0x1
 648:	0011e193          	ori	gp,gp,1
 64c:	05d00893          	li	a7,93
 650:	00018513          	mv	a0,gp
 654:	00000073          	ecall

00000658 <pass>:
 658:	0ff0000f          	fence
 65c:	00100193          	li	gp,1
 660:	05d00893          	li	a7,93
 664:	00000513          	li	a0,0
 668:	00000073          	ecall
 66c:	c0001073          	unimp
 670:	0000                	.insn	2, 0x
 672:	0000                	.insn	2, 0x