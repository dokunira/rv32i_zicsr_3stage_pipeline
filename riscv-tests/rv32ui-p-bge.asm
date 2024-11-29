
rv32ui-p-bge:     file format elf32-littleriscv


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
  3c:	50302023          	sw	gp,1280(zero) # 500 <tohost>
  40:	50002223          	sw	zero,1284(zero) # 504 <tohost+0x4>
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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff9ff>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xab09>
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
 190:	0020d663          	bge	ra,sp,19c <test_2+0x18>
 194:	30301863          	bne	zero,gp,4a4 <fail>
 198:	00301663          	bne	zero,gp,1a4 <test_3>
 19c:	fe20dee3          	bge	ra,sp,198 <test_2+0x14>
 1a0:	30301263          	bne	zero,gp,4a4 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	00100093          	li	ra,1
 1ac:	00100113          	li	sp,1
 1b0:	0020d663          	bge	ra,sp,1bc <test_3+0x18>
 1b4:	2e301863          	bne	zero,gp,4a4 <fail>
 1b8:	00301663          	bne	zero,gp,1c4 <test_4>
 1bc:	fe20dee3          	bge	ra,sp,1b8 <test_3+0x14>
 1c0:	2e301263          	bne	zero,gp,4a4 <fail>

000001c4 <test_4>:
 1c4:	00400193          	li	gp,4
 1c8:	fff00093          	li	ra,-1
 1cc:	fff00113          	li	sp,-1
 1d0:	0020d663          	bge	ra,sp,1dc <test_4+0x18>
 1d4:	2c301863          	bne	zero,gp,4a4 <fail>
 1d8:	00301663          	bne	zero,gp,1e4 <test_5>
 1dc:	fe20dee3          	bge	ra,sp,1d8 <test_4+0x14>
 1e0:	2c301263          	bne	zero,gp,4a4 <fail>

000001e4 <test_5>:
 1e4:	00500193          	li	gp,5
 1e8:	00100093          	li	ra,1
 1ec:	00000113          	li	sp,0
 1f0:	0020d663          	bge	ra,sp,1fc <test_5+0x18>
 1f4:	2a301863          	bne	zero,gp,4a4 <fail>
 1f8:	00301663          	bne	zero,gp,204 <test_6>
 1fc:	fe20dee3          	bge	ra,sp,1f8 <test_5+0x14>
 200:	2a301263          	bne	zero,gp,4a4 <fail>

00000204 <test_6>:
 204:	00600193          	li	gp,6
 208:	00100093          	li	ra,1
 20c:	fff00113          	li	sp,-1
 210:	0020d663          	bge	ra,sp,21c <test_6+0x18>
 214:	28301863          	bne	zero,gp,4a4 <fail>
 218:	00301663          	bne	zero,gp,224 <test_7>
 21c:	fe20dee3          	bge	ra,sp,218 <test_6+0x14>
 220:	28301263          	bne	zero,gp,4a4 <fail>

00000224 <test_7>:
 224:	00700193          	li	gp,7
 228:	fff00093          	li	ra,-1
 22c:	ffe00113          	li	sp,-2
 230:	0020d663          	bge	ra,sp,23c <test_7+0x18>
 234:	26301863          	bne	zero,gp,4a4 <fail>
 238:	00301663          	bne	zero,gp,244 <test_8>
 23c:	fe20dee3          	bge	ra,sp,238 <test_7+0x14>
 240:	26301263          	bne	zero,gp,4a4 <fail>

00000244 <test_8>:
 244:	00800193          	li	gp,8
 248:	00000093          	li	ra,0
 24c:	00100113          	li	sp,1
 250:	0020d463          	bge	ra,sp,258 <test_8+0x14>
 254:	00301463          	bne	zero,gp,25c <test_8+0x18>
 258:	24301663          	bne	zero,gp,4a4 <fail>
 25c:	fe20dee3          	bge	ra,sp,258 <test_8+0x14>

00000260 <test_9>:
 260:	00900193          	li	gp,9
 264:	fff00093          	li	ra,-1
 268:	00100113          	li	sp,1
 26c:	0020d463          	bge	ra,sp,274 <test_9+0x14>
 270:	00301463          	bne	zero,gp,278 <test_9+0x18>
 274:	22301863          	bne	zero,gp,4a4 <fail>
 278:	fe20dee3          	bge	ra,sp,274 <test_9+0x14>

0000027c <test_10>:
 27c:	00a00193          	li	gp,10
 280:	ffe00093          	li	ra,-2
 284:	fff00113          	li	sp,-1
 288:	0020d463          	bge	ra,sp,290 <test_10+0x14>
 28c:	00301463          	bne	zero,gp,294 <test_10+0x18>
 290:	20301a63          	bne	zero,gp,4a4 <fail>
 294:	fe20dee3          	bge	ra,sp,290 <test_10+0x14>

00000298 <test_11>:
 298:	00b00193          	li	gp,11
 29c:	ffe00093          	li	ra,-2
 2a0:	00100113          	li	sp,1
 2a4:	0020d463          	bge	ra,sp,2ac <test_11+0x14>
 2a8:	00301463          	bne	zero,gp,2b0 <test_11+0x18>
 2ac:	1e301c63          	bne	zero,gp,4a4 <fail>
 2b0:	fe20dee3          	bge	ra,sp,2ac <test_11+0x14>

000002b4 <test_12>:
 2b4:	00c00193          	li	gp,12
 2b8:	00000213          	li	tp,0
 2bc:	fff00093          	li	ra,-1
 2c0:	00000113          	li	sp,0
 2c4:	1e20d063          	bge	ra,sp,4a4 <fail>
 2c8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2cc:	00200293          	li	t0,2
 2d0:	fe5216e3          	bne	tp,t0,2bc <test_12+0x8>

000002d4 <test_13>:
 2d4:	00d00193          	li	gp,13
 2d8:	00000213          	li	tp,0
 2dc:	fff00093          	li	ra,-1
 2e0:	00000113          	li	sp,0
 2e4:	00000013          	nop
 2e8:	1a20de63          	bge	ra,sp,4a4 <fail>
 2ec:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2f0:	00200293          	li	t0,2
 2f4:	fe5214e3          	bne	tp,t0,2dc <test_13+0x8>

000002f8 <test_14>:
 2f8:	00e00193          	li	gp,14
 2fc:	00000213          	li	tp,0
 300:	fff00093          	li	ra,-1
 304:	00000113          	li	sp,0
 308:	00000013          	nop
 30c:	00000013          	nop
 310:	1820da63          	bge	ra,sp,4a4 <fail>
 314:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 318:	00200293          	li	t0,2
 31c:	fe5212e3          	bne	tp,t0,300 <test_14+0x8>

00000320 <test_15>:
 320:	00f00193          	li	gp,15
 324:	00000213          	li	tp,0
 328:	fff00093          	li	ra,-1
 32c:	00000013          	nop
 330:	00000113          	li	sp,0
 334:	1620d863          	bge	ra,sp,4a4 <fail>
 338:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 33c:	00200293          	li	t0,2
 340:	fe5214e3          	bne	tp,t0,328 <test_15+0x8>

00000344 <test_16>:
 344:	01000193          	li	gp,16
 348:	00000213          	li	tp,0
 34c:	fff00093          	li	ra,-1
 350:	00000013          	nop
 354:	00000113          	li	sp,0
 358:	00000013          	nop
 35c:	1420d463          	bge	ra,sp,4a4 <fail>
 360:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 364:	00200293          	li	t0,2
 368:	fe5212e3          	bne	tp,t0,34c <test_16+0x8>

0000036c <test_17>:
 36c:	01100193          	li	gp,17
 370:	00000213          	li	tp,0
 374:	fff00093          	li	ra,-1
 378:	00000013          	nop
 37c:	00000013          	nop
 380:	00000113          	li	sp,0
 384:	1220d063          	bge	ra,sp,4a4 <fail>
 388:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 38c:	00200293          	li	t0,2
 390:	fe5212e3          	bne	tp,t0,374 <test_17+0x8>

00000394 <test_18>:
 394:	01200193          	li	gp,18
 398:	00000213          	li	tp,0
 39c:	fff00093          	li	ra,-1
 3a0:	00000113          	li	sp,0
 3a4:	1020d063          	bge	ra,sp,4a4 <fail>
 3a8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3ac:	00200293          	li	t0,2
 3b0:	fe5216e3          	bne	tp,t0,39c <test_18+0x8>

000003b4 <test_19>:
 3b4:	01300193          	li	gp,19
 3b8:	00000213          	li	tp,0
 3bc:	fff00093          	li	ra,-1
 3c0:	00000113          	li	sp,0
 3c4:	00000013          	nop
 3c8:	0c20de63          	bge	ra,sp,4a4 <fail>
 3cc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3d0:	00200293          	li	t0,2
 3d4:	fe5214e3          	bne	tp,t0,3bc <test_19+0x8>

000003d8 <test_20>:
 3d8:	01400193          	li	gp,20
 3dc:	00000213          	li	tp,0
 3e0:	fff00093          	li	ra,-1
 3e4:	00000113          	li	sp,0
 3e8:	00000013          	nop
 3ec:	00000013          	nop
 3f0:	0a20da63          	bge	ra,sp,4a4 <fail>
 3f4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3f8:	00200293          	li	t0,2
 3fc:	fe5212e3          	bne	tp,t0,3e0 <test_20+0x8>

00000400 <test_21>:
 400:	01500193          	li	gp,21
 404:	00000213          	li	tp,0
 408:	fff00093          	li	ra,-1
 40c:	00000013          	nop
 410:	00000113          	li	sp,0
 414:	0820d863          	bge	ra,sp,4a4 <fail>
 418:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 41c:	00200293          	li	t0,2
 420:	fe5214e3          	bne	tp,t0,408 <test_21+0x8>

00000424 <test_22>:
 424:	01600193          	li	gp,22
 428:	00000213          	li	tp,0
 42c:	fff00093          	li	ra,-1
 430:	00000013          	nop
 434:	00000113          	li	sp,0
 438:	00000013          	nop
 43c:	0620d463          	bge	ra,sp,4a4 <fail>
 440:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 444:	00200293          	li	t0,2
 448:	fe5212e3          	bne	tp,t0,42c <test_22+0x8>

0000044c <test_23>:
 44c:	01700193          	li	gp,23
 450:	00000213          	li	tp,0
 454:	fff00093          	li	ra,-1
 458:	00000013          	nop
 45c:	00000013          	nop
 460:	00000113          	li	sp,0
 464:	0420d063          	bge	ra,sp,4a4 <fail>
 468:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 46c:	00200293          	li	t0,2
 470:	fe5212e3          	bne	tp,t0,454 <test_23+0x8>

00000474 <test_24>:
 474:	01800193          	li	gp,24
 478:	00100093          	li	ra,1
 47c:	0000da63          	bgez	ra,490 <test_24+0x1c>
 480:	00108093          	addi	ra,ra,1
 484:	00108093          	addi	ra,ra,1
 488:	00108093          	addi	ra,ra,1
 48c:	00108093          	addi	ra,ra,1
 490:	00108093          	addi	ra,ra,1
 494:	00108093          	addi	ra,ra,1
 498:	00300393          	li	t2,3
 49c:	00709463          	bne	ra,t2,4a4 <fail>
 4a0:	02301063          	bne	zero,gp,4c0 <pass>

000004a4 <fail>:
 4a4:	0ff0000f          	fence
 4a8:	00018063          	beqz	gp,4a8 <fail+0x4>
 4ac:	00119193          	slli	gp,gp,0x1
 4b0:	0011e193          	ori	gp,gp,1
 4b4:	05d00893          	li	a7,93
 4b8:	00018513          	mv	a0,gp
 4bc:	00000073          	ecall

000004c0 <pass>:
 4c0:	0ff0000f          	fence
 4c4:	00100193          	li	gp,1
 4c8:	05d00893          	li	a7,93
 4cc:	00000513          	li	a0,0
 4d0:	00000073          	ecall
 4d4:	c0001073          	unimp
 4d8:	0000                	.insn	2, 0x
 4da:	0000                	.insn	2, 0x
 4dc:	0000                	.insn	2, 0x
 4de:	0000                	.insn	2, 0x
 4e0:	0000                	.insn	2, 0x
 4e2:	0000                	.insn	2, 0x
 4e4:	0000                	.insn	2, 0x
 4e6:	0000                	.insn	2, 0x
 4e8:	0000                	.insn	2, 0x
 4ea:	0000                	.insn	2, 0x
 4ec:	0000                	.insn	2, 0x
 4ee:	0000                	.insn	2, 0x
 4f0:	0000                	.insn	2, 0x
 4f2:	0000                	.insn	2, 0x
