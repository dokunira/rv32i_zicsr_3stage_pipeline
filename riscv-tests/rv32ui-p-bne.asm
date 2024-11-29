
rv32ui-p-bne:     file format elf32-littleriscv


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
 18c:	00100113          	li	sp,1
 190:	00209663          	bne	ra,sp,19c <test_2+0x18>
 194:	2a301a63          	bne	zero,gp,448 <fail>
 198:	00301663          	bne	zero,gp,1a4 <test_3>
 19c:	fe209ee3          	bne	ra,sp,198 <test_2+0x14>
 1a0:	2a301463          	bne	zero,gp,448 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	00100093          	li	ra,1
 1ac:	00000113          	li	sp,0
 1b0:	00209663          	bne	ra,sp,1bc <test_3+0x18>
 1b4:	28301a63          	bne	zero,gp,448 <fail>
 1b8:	00301663          	bne	zero,gp,1c4 <test_4>
 1bc:	fe209ee3          	bne	ra,sp,1b8 <test_3+0x14>
 1c0:	28301463          	bne	zero,gp,448 <fail>

000001c4 <test_4>:
 1c4:	00400193          	li	gp,4
 1c8:	fff00093          	li	ra,-1
 1cc:	00100113          	li	sp,1
 1d0:	00209663          	bne	ra,sp,1dc <test_4+0x18>
 1d4:	26301a63          	bne	zero,gp,448 <fail>
 1d8:	00301663          	bne	zero,gp,1e4 <test_5>
 1dc:	fe209ee3          	bne	ra,sp,1d8 <test_4+0x14>
 1e0:	26301463          	bne	zero,gp,448 <fail>

000001e4 <test_5>:
 1e4:	00500193          	li	gp,5
 1e8:	00100093          	li	ra,1
 1ec:	fff00113          	li	sp,-1
 1f0:	00209663          	bne	ra,sp,1fc <test_5+0x18>
 1f4:	24301a63          	bne	zero,gp,448 <fail>
 1f8:	00301663          	bne	zero,gp,204 <test_6>
 1fc:	fe209ee3          	bne	ra,sp,1f8 <test_5+0x14>
 200:	24301463          	bne	zero,gp,448 <fail>

00000204 <test_6>:
 204:	00600193          	li	gp,6
 208:	00000093          	li	ra,0
 20c:	00000113          	li	sp,0
 210:	00209463          	bne	ra,sp,218 <test_6+0x14>
 214:	00301463          	bne	zero,gp,21c <test_6+0x18>
 218:	22301863          	bne	zero,gp,448 <fail>
 21c:	fe209ee3          	bne	ra,sp,218 <test_6+0x14>

00000220 <test_7>:
 220:	00700193          	li	gp,7
 224:	00100093          	li	ra,1
 228:	00100113          	li	sp,1
 22c:	00209463          	bne	ra,sp,234 <test_7+0x14>
 230:	00301463          	bne	zero,gp,238 <test_7+0x18>
 234:	20301a63          	bne	zero,gp,448 <fail>
 238:	fe209ee3          	bne	ra,sp,234 <test_7+0x14>

0000023c <test_8>:
 23c:	00800193          	li	gp,8
 240:	fff00093          	li	ra,-1
 244:	fff00113          	li	sp,-1
 248:	00209463          	bne	ra,sp,250 <test_8+0x14>
 24c:	00301463          	bne	zero,gp,254 <test_8+0x18>
 250:	1e301c63          	bne	zero,gp,448 <fail>
 254:	fe209ee3          	bne	ra,sp,250 <test_8+0x14>

00000258 <test_9>:
 258:	00900193          	li	gp,9
 25c:	00000213          	li	tp,0
 260:	00000093          	li	ra,0
 264:	00000113          	li	sp,0
 268:	1e209063          	bne	ra,sp,448 <fail>
 26c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 270:	00200293          	li	t0,2
 274:	fe5216e3          	bne	tp,t0,260 <test_9+0x8>

00000278 <test_10>:
 278:	00a00193          	li	gp,10
 27c:	00000213          	li	tp,0
 280:	00000093          	li	ra,0
 284:	00000113          	li	sp,0
 288:	00000013          	nop
 28c:	1a209e63          	bne	ra,sp,448 <fail>
 290:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 294:	00200293          	li	t0,2
 298:	fe5214e3          	bne	tp,t0,280 <test_10+0x8>

0000029c <test_11>:
 29c:	00b00193          	li	gp,11
 2a0:	00000213          	li	tp,0
 2a4:	00000093          	li	ra,0
 2a8:	00000113          	li	sp,0
 2ac:	00000013          	nop
 2b0:	00000013          	nop
 2b4:	18209a63          	bne	ra,sp,448 <fail>
 2b8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2bc:	00200293          	li	t0,2
 2c0:	fe5212e3          	bne	tp,t0,2a4 <test_11+0x8>

000002c4 <test_12>:
 2c4:	00c00193          	li	gp,12
 2c8:	00000213          	li	tp,0
 2cc:	00000093          	li	ra,0
 2d0:	00000013          	nop
 2d4:	00000113          	li	sp,0
 2d8:	16209863          	bne	ra,sp,448 <fail>
 2dc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2e0:	00200293          	li	t0,2
 2e4:	fe5214e3          	bne	tp,t0,2cc <test_12+0x8>

000002e8 <test_13>:
 2e8:	00d00193          	li	gp,13
 2ec:	00000213          	li	tp,0
 2f0:	00000093          	li	ra,0
 2f4:	00000013          	nop
 2f8:	00000113          	li	sp,0
 2fc:	00000013          	nop
 300:	14209463          	bne	ra,sp,448 <fail>
 304:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 308:	00200293          	li	t0,2
 30c:	fe5212e3          	bne	tp,t0,2f0 <test_13+0x8>

00000310 <test_14>:
 310:	00e00193          	li	gp,14
 314:	00000213          	li	tp,0
 318:	00000093          	li	ra,0
 31c:	00000013          	nop
 320:	00000013          	nop
 324:	00000113          	li	sp,0
 328:	12209063          	bne	ra,sp,448 <fail>
 32c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 330:	00200293          	li	t0,2
 334:	fe5212e3          	bne	tp,t0,318 <test_14+0x8>

00000338 <test_15>:
 338:	00f00193          	li	gp,15
 33c:	00000213          	li	tp,0
 340:	00000093          	li	ra,0
 344:	00000113          	li	sp,0
 348:	10209063          	bne	ra,sp,448 <fail>
 34c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 350:	00200293          	li	t0,2
 354:	fe5216e3          	bne	tp,t0,340 <test_15+0x8>

00000358 <test_16>:
 358:	01000193          	li	gp,16
 35c:	00000213          	li	tp,0
 360:	00000093          	li	ra,0
 364:	00000113          	li	sp,0
 368:	00000013          	nop
 36c:	0c209e63          	bne	ra,sp,448 <fail>
 370:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 374:	00200293          	li	t0,2
 378:	fe5214e3          	bne	tp,t0,360 <test_16+0x8>

0000037c <test_17>:
 37c:	01100193          	li	gp,17
 380:	00000213          	li	tp,0
 384:	00000093          	li	ra,0
 388:	00000113          	li	sp,0
 38c:	00000013          	nop
 390:	00000013          	nop
 394:	0a209a63          	bne	ra,sp,448 <fail>
 398:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 39c:	00200293          	li	t0,2
 3a0:	fe5212e3          	bne	tp,t0,384 <test_17+0x8>

000003a4 <test_18>:
 3a4:	01200193          	li	gp,18
 3a8:	00000213          	li	tp,0
 3ac:	00000093          	li	ra,0
 3b0:	00000013          	nop
 3b4:	00000113          	li	sp,0
 3b8:	08209863          	bne	ra,sp,448 <fail>
 3bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c0:	00200293          	li	t0,2
 3c4:	fe5214e3          	bne	tp,t0,3ac <test_18+0x8>

000003c8 <test_19>:
 3c8:	01300193          	li	gp,19
 3cc:	00000213          	li	tp,0
 3d0:	00000093          	li	ra,0
 3d4:	00000013          	nop
 3d8:	00000113          	li	sp,0
 3dc:	00000013          	nop
 3e0:	06209463          	bne	ra,sp,448 <fail>
 3e4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3e8:	00200293          	li	t0,2
 3ec:	fe5212e3          	bne	tp,t0,3d0 <test_19+0x8>

000003f0 <test_20>:
 3f0:	01400193          	li	gp,20
 3f4:	00000213          	li	tp,0
 3f8:	00000093          	li	ra,0
 3fc:	00000013          	nop
 400:	00000013          	nop
 404:	00000113          	li	sp,0
 408:	04209063          	bne	ra,sp,448 <fail>
 40c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 410:	00200293          	li	t0,2
 414:	fe5212e3          	bne	tp,t0,3f8 <test_20+0x8>

00000418 <test_21>:
 418:	01500193          	li	gp,21
 41c:	00100093          	li	ra,1
 420:	00009a63          	bnez	ra,434 <test_21+0x1c>
 424:	00108093          	addi	ra,ra,1
 428:	00108093          	addi	ra,ra,1
 42c:	00108093          	addi	ra,ra,1
 430:	00108093          	addi	ra,ra,1
 434:	00108093          	addi	ra,ra,1
 438:	00108093          	addi	ra,ra,1
 43c:	00300393          	li	t2,3
 440:	00709463          	bne	ra,t2,448 <fail>
 444:	02301063          	bne	zero,gp,464 <pass>

00000448 <fail>:
 448:	0ff0000f          	fence
 44c:	00018063          	beqz	gp,44c <fail+0x4>
 450:	00119193          	slli	gp,gp,0x1
 454:	0011e193          	ori	gp,gp,1
 458:	05d00893          	li	a7,93
 45c:	00018513          	mv	a0,gp
 460:	00000073          	ecall

00000464 <pass>:
 464:	0ff0000f          	fence
 468:	00100193          	li	gp,1
 46c:	05d00893          	li	a7,93
 470:	00000513          	li	a0,0
 474:	00000073          	ecall
 478:	c0001073          	unimp
 47c:	0000                	.insn	2, 0x
 47e:	0000                	.insn	2, 0x
 480:	0000                	.insn	2, 0x
 482:	0000                	.insn	2, 0x
 484:	0000                	.insn	2, 0x
 486:	0000                	.insn	2, 0x
 488:	0000                	.insn	2, 0x
 48a:	0000                	.insn	2, 0x
 48c:	0000                	.insn	2, 0x
 48e:	0000                	.insn	2, 0x
 490:	0000                	.insn	2, 0x
 492:	0000                	.insn	2, 0x
 494:	0000                	.insn	2, 0x
 496:	0000                	.insn	2, 0x
 498:	0000                	.insn	2, 0x
 49a:	0000                	.insn	2, 0x
 49c:	0000                	.insn	2, 0x
 49e:	0000                	.insn	2, 0x
 4a0:	0000                	.insn	2, 0x
 4a2:	0000                	.insn	2, 0x
 4a4:	0000                	.insn	2, 0x
 4a6:	0000                	.insn	2, 0x
 4a8:	0000                	.insn	2, 0x
 4aa:	0000                	.insn	2, 0x
 4ac:	0000                	.insn	2, 0x
 4ae:	0000                	.insn	2, 0x
 4b0:	0000                	.insn	2, 0x
 4b2:	0000                	.insn	2, 0x
