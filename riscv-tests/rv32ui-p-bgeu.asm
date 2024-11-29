
rv32ui-p-bgeu:     file format elf32-littleriscv


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
  3c:	60302023          	sw	gp,1536(zero) # 600 <tohost>
  40:	60002223          	sw	zero,1540(zero) # 604 <tohost+0x4>
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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff8ff>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xaa09>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	00000093          	li	ra,0
 18c:	00000113          	li	sp,0
 190:	0020f663          	bgeu	ra,sp,19c <test_2+0x18>
 194:	34301263          	bne	zero,gp,4d8 <fail>
 198:	00301663          	bne	zero,gp,1a4 <test_3>
 19c:	fe20fee3          	bgeu	ra,sp,198 <test_2+0x14>
 1a0:	32301c63          	bne	zero,gp,4d8 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	00100093          	li	ra,1
 1ac:	00100113          	li	sp,1
 1b0:	0020f663          	bgeu	ra,sp,1bc <test_3+0x18>
 1b4:	32301263          	bne	zero,gp,4d8 <fail>
 1b8:	00301663          	bne	zero,gp,1c4 <test_4>
 1bc:	fe20fee3          	bgeu	ra,sp,1b8 <test_3+0x14>
 1c0:	30301c63          	bne	zero,gp,4d8 <fail>

000001c4 <test_4>:
 1c4:	00400193          	li	gp,4
 1c8:	fff00093          	li	ra,-1
 1cc:	fff00113          	li	sp,-1
 1d0:	0020f663          	bgeu	ra,sp,1dc <test_4+0x18>
 1d4:	30301263          	bne	zero,gp,4d8 <fail>
 1d8:	00301663          	bne	zero,gp,1e4 <test_5>
 1dc:	fe20fee3          	bgeu	ra,sp,1d8 <test_4+0x14>
 1e0:	2e301c63          	bne	zero,gp,4d8 <fail>

000001e4 <test_5>:
 1e4:	00500193          	li	gp,5
 1e8:	00100093          	li	ra,1
 1ec:	00000113          	li	sp,0
 1f0:	0020f663          	bgeu	ra,sp,1fc <test_5+0x18>
 1f4:	2e301263          	bne	zero,gp,4d8 <fail>
 1f8:	00301663          	bne	zero,gp,204 <test_6>
 1fc:	fe20fee3          	bgeu	ra,sp,1f8 <test_5+0x14>
 200:	2c301c63          	bne	zero,gp,4d8 <fail>

00000204 <test_6>:
 204:	00600193          	li	gp,6
 208:	fff00093          	li	ra,-1
 20c:	ffe00113          	li	sp,-2
 210:	0020f663          	bgeu	ra,sp,21c <test_6+0x18>
 214:	2c301263          	bne	zero,gp,4d8 <fail>
 218:	00301663          	bne	zero,gp,224 <test_7>
 21c:	fe20fee3          	bgeu	ra,sp,218 <test_6+0x14>
 220:	2a301c63          	bne	zero,gp,4d8 <fail>

00000224 <test_7>:
 224:	00700193          	li	gp,7
 228:	fff00093          	li	ra,-1
 22c:	00000113          	li	sp,0
 230:	0020f663          	bgeu	ra,sp,23c <test_7+0x18>
 234:	2a301263          	bne	zero,gp,4d8 <fail>
 238:	00301663          	bne	zero,gp,244 <test_8>
 23c:	fe20fee3          	bgeu	ra,sp,238 <test_7+0x14>
 240:	28301c63          	bne	zero,gp,4d8 <fail>

00000244 <test_8>:
 244:	00800193          	li	gp,8
 248:	00000093          	li	ra,0
 24c:	00100113          	li	sp,1
 250:	0020f463          	bgeu	ra,sp,258 <test_8+0x14>
 254:	00301463          	bne	zero,gp,25c <test_8+0x18>
 258:	28301063          	bne	zero,gp,4d8 <fail>
 25c:	fe20fee3          	bgeu	ra,sp,258 <test_8+0x14>

00000260 <test_9>:
 260:	00900193          	li	gp,9
 264:	ffe00093          	li	ra,-2
 268:	fff00113          	li	sp,-1
 26c:	0020f463          	bgeu	ra,sp,274 <test_9+0x14>
 270:	00301463          	bne	zero,gp,278 <test_9+0x18>
 274:	26301263          	bne	zero,gp,4d8 <fail>
 278:	fe20fee3          	bgeu	ra,sp,274 <test_9+0x14>

0000027c <test_10>:
 27c:	00a00193          	li	gp,10
 280:	00000093          	li	ra,0
 284:	fff00113          	li	sp,-1
 288:	0020f463          	bgeu	ra,sp,290 <test_10+0x14>
 28c:	00301463          	bne	zero,gp,294 <test_10+0x18>
 290:	24301463          	bne	zero,gp,4d8 <fail>
 294:	fe20fee3          	bgeu	ra,sp,290 <test_10+0x14>

00000298 <test_11>:
 298:	00b00193          	li	gp,11
 29c:	800000b7          	lui	ra,0x80000
 2a0:	fff08093          	addi	ra,ra,-1 # 7fffffff <_end+0x7ffff8ff>
 2a4:	80000137          	lui	sp,0x80000
 2a8:	0020f463          	bgeu	ra,sp,2b0 <test_11+0x18>
 2ac:	00301463          	bne	zero,gp,2b4 <test_11+0x1c>
 2b0:	22301463          	bne	zero,gp,4d8 <fail>
 2b4:	fe20fee3          	bgeu	ra,sp,2b0 <test_11+0x18>

000002b8 <test_12>:
 2b8:	00c00193          	li	gp,12
 2bc:	00000213          	li	tp,0
 2c0:	f00000b7          	lui	ra,0xf0000
 2c4:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 2c8:	f0000137          	lui	sp,0xf0000
 2cc:	2020f663          	bgeu	ra,sp,4d8 <fail>
 2d0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2d4:	00200293          	li	t0,2
 2d8:	fe5214e3          	bne	tp,t0,2c0 <test_12+0x8>

000002dc <test_13>:
 2dc:	00d00193          	li	gp,13
 2e0:	00000213          	li	tp,0
 2e4:	f00000b7          	lui	ra,0xf0000
 2e8:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 2ec:	f0000137          	lui	sp,0xf0000
 2f0:	00000013          	nop
 2f4:	1e20f263          	bgeu	ra,sp,4d8 <fail>
 2f8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2fc:	00200293          	li	t0,2
 300:	fe5212e3          	bne	tp,t0,2e4 <test_13+0x8>

00000304 <test_14>:
 304:	00e00193          	li	gp,14
 308:	00000213          	li	tp,0
 30c:	f00000b7          	lui	ra,0xf0000
 310:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 314:	f0000137          	lui	sp,0xf0000
 318:	00000013          	nop
 31c:	00000013          	nop
 320:	1a20fc63          	bgeu	ra,sp,4d8 <fail>
 324:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 328:	00200293          	li	t0,2
 32c:	fe5210e3          	bne	tp,t0,30c <test_14+0x8>

00000330 <test_15>:
 330:	00f00193          	li	gp,15
 334:	00000213          	li	tp,0
 338:	f00000b7          	lui	ra,0xf0000
 33c:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 340:	00000013          	nop
 344:	f0000137          	lui	sp,0xf0000
 348:	1820f863          	bgeu	ra,sp,4d8 <fail>
 34c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 350:	00200293          	li	t0,2
 354:	fe5212e3          	bne	tp,t0,338 <test_15+0x8>

00000358 <test_16>:
 358:	01000193          	li	gp,16
 35c:	00000213          	li	tp,0
 360:	f00000b7          	lui	ra,0xf0000
 364:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 368:	00000013          	nop
 36c:	f0000137          	lui	sp,0xf0000
 370:	00000013          	nop
 374:	1620f263          	bgeu	ra,sp,4d8 <fail>
 378:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 37c:	00200293          	li	t0,2
 380:	fe5210e3          	bne	tp,t0,360 <test_16+0x8>

00000384 <test_17>:
 384:	01100193          	li	gp,17
 388:	00000213          	li	tp,0
 38c:	f00000b7          	lui	ra,0xf0000
 390:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 394:	00000013          	nop
 398:	00000013          	nop
 39c:	f0000137          	lui	sp,0xf0000
 3a0:	1220fc63          	bgeu	ra,sp,4d8 <fail>
 3a4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3a8:	00200293          	li	t0,2
 3ac:	fe5210e3          	bne	tp,t0,38c <test_17+0x8>

000003b0 <test_18>:
 3b0:	01200193          	li	gp,18
 3b4:	00000213          	li	tp,0
 3b8:	f00000b7          	lui	ra,0xf0000
 3bc:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 3c0:	f0000137          	lui	sp,0xf0000
 3c4:	1020fa63          	bgeu	ra,sp,4d8 <fail>
 3c8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3cc:	00200293          	li	t0,2
 3d0:	fe5214e3          	bne	tp,t0,3b8 <test_18+0x8>

000003d4 <test_19>:
 3d4:	01300193          	li	gp,19
 3d8:	00000213          	li	tp,0
 3dc:	f00000b7          	lui	ra,0xf0000
 3e0:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 3e4:	f0000137          	lui	sp,0xf0000
 3e8:	00000013          	nop
 3ec:	0e20f663          	bgeu	ra,sp,4d8 <fail>
 3f0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3f4:	00200293          	li	t0,2
 3f8:	fe5212e3          	bne	tp,t0,3dc <test_19+0x8>

000003fc <test_20>:
 3fc:	01400193          	li	gp,20
 400:	00000213          	li	tp,0
 404:	f00000b7          	lui	ra,0xf0000
 408:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 40c:	f0000137          	lui	sp,0xf0000
 410:	00000013          	nop
 414:	00000013          	nop
 418:	0c20f063          	bgeu	ra,sp,4d8 <fail>
 41c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 420:	00200293          	li	t0,2
 424:	fe5210e3          	bne	tp,t0,404 <test_20+0x8>

00000428 <test_21>:
 428:	01500193          	li	gp,21
 42c:	00000213          	li	tp,0
 430:	f00000b7          	lui	ra,0xf0000
 434:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 438:	00000013          	nop
 43c:	f0000137          	lui	sp,0xf0000
 440:	0820fc63          	bgeu	ra,sp,4d8 <fail>
 444:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 448:	00200293          	li	t0,2
 44c:	fe5212e3          	bne	tp,t0,430 <test_21+0x8>

00000450 <test_22>:
 450:	01600193          	li	gp,22
 454:	00000213          	li	tp,0
 458:	f00000b7          	lui	ra,0xf0000
 45c:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 460:	00000013          	nop
 464:	f0000137          	lui	sp,0xf0000
 468:	00000013          	nop
 46c:	0620f663          	bgeu	ra,sp,4d8 <fail>
 470:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 474:	00200293          	li	t0,2
 478:	fe5210e3          	bne	tp,t0,458 <test_22+0x8>

0000047c <test_23>:
 47c:	01700193          	li	gp,23
 480:	00000213          	li	tp,0
 484:	f00000b7          	lui	ra,0xf0000
 488:	fff08093          	addi	ra,ra,-1 # efffffff <_end+0xeffff8ff>
 48c:	00000013          	nop
 490:	00000013          	nop
 494:	f0000137          	lui	sp,0xf0000
 498:	0420f063          	bgeu	ra,sp,4d8 <fail>
 49c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4a0:	00200293          	li	t0,2
 4a4:	fe5210e3          	bne	tp,t0,484 <test_23+0x8>

000004a8 <test_24>:
 4a8:	01800193          	li	gp,24
 4ac:	00100093          	li	ra,1
 4b0:	0000fa63          	bgeu	ra,zero,4c4 <test_24+0x1c>
 4b4:	00108093          	addi	ra,ra,1
 4b8:	00108093          	addi	ra,ra,1
 4bc:	00108093          	addi	ra,ra,1
 4c0:	00108093          	addi	ra,ra,1
 4c4:	00108093          	addi	ra,ra,1
 4c8:	00108093          	addi	ra,ra,1
 4cc:	00300393          	li	t2,3
 4d0:	00709463          	bne	ra,t2,4d8 <fail>
 4d4:	02301063          	bne	zero,gp,4f4 <pass>

000004d8 <fail>:
 4d8:	0ff0000f          	fence
 4dc:	00018063          	beqz	gp,4dc <fail+0x4>
 4e0:	00119193          	slli	gp,gp,0x1
 4e4:	0011e193          	ori	gp,gp,1
 4e8:	05d00893          	li	a7,93
 4ec:	00018513          	mv	a0,gp
 4f0:	00000073          	ecall

000004f4 <pass>:
 4f4:	0ff0000f          	fence
 4f8:	00100193          	li	gp,1
 4fc:	05d00893          	li	a7,93
 500:	00000513          	li	a0,0
 504:	00000073          	ecall
 508:	c0001073          	unimp
 50c:	0000                	.insn	2, 0x
 50e:	0000                	.insn	2, 0x
 510:	0000                	.insn	2, 0x
 512:	0000                	.insn	2, 0x
 514:	0000                	.insn	2, 0x
 516:	0000                	.insn	2, 0x
 518:	0000                	.insn	2, 0x
 51a:	0000                	.insn	2, 0x
 51c:	0000                	.insn	2, 0x
 51e:	0000                	.insn	2, 0x
 520:	0000                	.insn	2, 0x
 522:	0000                	.insn	2, 0x
 524:	0000                	.insn	2, 0x
 526:	0000                	.insn	2, 0x
 528:	0000                	.insn	2, 0x
 52a:	0000                	.insn	2, 0x
 52c:	0000                	.insn	2, 0x
 52e:	0000                	.insn	2, 0x
 530:	0000                	.insn	2, 0x
 532:	0000                	.insn	2, 0x
