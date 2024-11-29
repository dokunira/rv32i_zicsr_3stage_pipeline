
rv32ui-p-beq:     file format elf32-littleriscv


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
 190:	00208663          	beq	ra,sp,19c <test_2+0x18>
 194:	2a301863          	bne	zero,gp,444 <fail>
 198:	00301663          	bne	zero,gp,1a4 <test_3>
 19c:	fe208ee3          	beq	ra,sp,198 <test_2+0x14>
 1a0:	2a301263          	bne	zero,gp,444 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	00100093          	li	ra,1
 1ac:	00100113          	li	sp,1
 1b0:	00208663          	beq	ra,sp,1bc <test_3+0x18>
 1b4:	28301863          	bne	zero,gp,444 <fail>
 1b8:	00301663          	bne	zero,gp,1c4 <test_4>
 1bc:	fe208ee3          	beq	ra,sp,1b8 <test_3+0x14>
 1c0:	28301263          	bne	zero,gp,444 <fail>

000001c4 <test_4>:
 1c4:	00400193          	li	gp,4
 1c8:	fff00093          	li	ra,-1
 1cc:	fff00113          	li	sp,-1
 1d0:	00208663          	beq	ra,sp,1dc <test_4+0x18>
 1d4:	26301863          	bne	zero,gp,444 <fail>
 1d8:	00301663          	bne	zero,gp,1e4 <test_5>
 1dc:	fe208ee3          	beq	ra,sp,1d8 <test_4+0x14>
 1e0:	26301263          	bne	zero,gp,444 <fail>

000001e4 <test_5>:
 1e4:	00500193          	li	gp,5
 1e8:	00000093          	li	ra,0
 1ec:	00100113          	li	sp,1
 1f0:	00208463          	beq	ra,sp,1f8 <test_5+0x14>
 1f4:	00301463          	bne	zero,gp,1fc <test_5+0x18>
 1f8:	24301663          	bne	zero,gp,444 <fail>
 1fc:	fe208ee3          	beq	ra,sp,1f8 <test_5+0x14>

00000200 <test_6>:
 200:	00600193          	li	gp,6
 204:	00100093          	li	ra,1
 208:	00000113          	li	sp,0
 20c:	00208463          	beq	ra,sp,214 <test_6+0x14>
 210:	00301463          	bne	zero,gp,218 <test_6+0x18>
 214:	22301863          	bne	zero,gp,444 <fail>
 218:	fe208ee3          	beq	ra,sp,214 <test_6+0x14>

0000021c <test_7>:
 21c:	00700193          	li	gp,7
 220:	fff00093          	li	ra,-1
 224:	00100113          	li	sp,1
 228:	00208463          	beq	ra,sp,230 <test_7+0x14>
 22c:	00301463          	bne	zero,gp,234 <test_7+0x18>
 230:	20301a63          	bne	zero,gp,444 <fail>
 234:	fe208ee3          	beq	ra,sp,230 <test_7+0x14>

00000238 <test_8>:
 238:	00800193          	li	gp,8
 23c:	00100093          	li	ra,1
 240:	fff00113          	li	sp,-1
 244:	00208463          	beq	ra,sp,24c <test_8+0x14>
 248:	00301463          	bne	zero,gp,250 <test_8+0x18>
 24c:	1e301c63          	bne	zero,gp,444 <fail>
 250:	fe208ee3          	beq	ra,sp,24c <test_8+0x14>

00000254 <test_9>:
 254:	00900193          	li	gp,9
 258:	00000213          	li	tp,0
 25c:	00000093          	li	ra,0
 260:	fff00113          	li	sp,-1
 264:	1e208063          	beq	ra,sp,444 <fail>
 268:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 26c:	00200293          	li	t0,2
 270:	fe5216e3          	bne	tp,t0,25c <test_9+0x8>

00000274 <test_10>:
 274:	00a00193          	li	gp,10
 278:	00000213          	li	tp,0
 27c:	00000093          	li	ra,0
 280:	fff00113          	li	sp,-1
 284:	00000013          	nop
 288:	1a208e63          	beq	ra,sp,444 <fail>
 28c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 290:	00200293          	li	t0,2
 294:	fe5214e3          	bne	tp,t0,27c <test_10+0x8>

00000298 <test_11>:
 298:	00b00193          	li	gp,11
 29c:	00000213          	li	tp,0
 2a0:	00000093          	li	ra,0
 2a4:	fff00113          	li	sp,-1
 2a8:	00000013          	nop
 2ac:	00000013          	nop
 2b0:	18208a63          	beq	ra,sp,444 <fail>
 2b4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2b8:	00200293          	li	t0,2
 2bc:	fe5212e3          	bne	tp,t0,2a0 <test_11+0x8>

000002c0 <test_12>:
 2c0:	00c00193          	li	gp,12
 2c4:	00000213          	li	tp,0
 2c8:	00000093          	li	ra,0
 2cc:	00000013          	nop
 2d0:	fff00113          	li	sp,-1
 2d4:	16208863          	beq	ra,sp,444 <fail>
 2d8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2dc:	00200293          	li	t0,2
 2e0:	fe5214e3          	bne	tp,t0,2c8 <test_12+0x8>

000002e4 <test_13>:
 2e4:	00d00193          	li	gp,13
 2e8:	00000213          	li	tp,0
 2ec:	00000093          	li	ra,0
 2f0:	00000013          	nop
 2f4:	fff00113          	li	sp,-1
 2f8:	00000013          	nop
 2fc:	14208463          	beq	ra,sp,444 <fail>
 300:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 304:	00200293          	li	t0,2
 308:	fe5212e3          	bne	tp,t0,2ec <test_13+0x8>

0000030c <test_14>:
 30c:	00e00193          	li	gp,14
 310:	00000213          	li	tp,0
 314:	00000093          	li	ra,0
 318:	00000013          	nop
 31c:	00000013          	nop
 320:	fff00113          	li	sp,-1
 324:	12208063          	beq	ra,sp,444 <fail>
 328:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 32c:	00200293          	li	t0,2
 330:	fe5212e3          	bne	tp,t0,314 <test_14+0x8>

00000334 <test_15>:
 334:	00f00193          	li	gp,15
 338:	00000213          	li	tp,0
 33c:	00000093          	li	ra,0
 340:	fff00113          	li	sp,-1
 344:	10208063          	beq	ra,sp,444 <fail>
 348:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 34c:	00200293          	li	t0,2
 350:	fe5216e3          	bne	tp,t0,33c <test_15+0x8>

00000354 <test_16>:
 354:	01000193          	li	gp,16
 358:	00000213          	li	tp,0
 35c:	00000093          	li	ra,0
 360:	fff00113          	li	sp,-1
 364:	00000013          	nop
 368:	0c208e63          	beq	ra,sp,444 <fail>
 36c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 370:	00200293          	li	t0,2
 374:	fe5214e3          	bne	tp,t0,35c <test_16+0x8>

00000378 <test_17>:
 378:	01100193          	li	gp,17
 37c:	00000213          	li	tp,0
 380:	00000093          	li	ra,0
 384:	fff00113          	li	sp,-1
 388:	00000013          	nop
 38c:	00000013          	nop
 390:	0a208a63          	beq	ra,sp,444 <fail>
 394:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 398:	00200293          	li	t0,2
 39c:	fe5212e3          	bne	tp,t0,380 <test_17+0x8>

000003a0 <test_18>:
 3a0:	01200193          	li	gp,18
 3a4:	00000213          	li	tp,0
 3a8:	00000093          	li	ra,0
 3ac:	00000013          	nop
 3b0:	fff00113          	li	sp,-1
 3b4:	08208863          	beq	ra,sp,444 <fail>
 3b8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3bc:	00200293          	li	t0,2
 3c0:	fe5214e3          	bne	tp,t0,3a8 <test_18+0x8>

000003c4 <test_19>:
 3c4:	01300193          	li	gp,19
 3c8:	00000213          	li	tp,0
 3cc:	00000093          	li	ra,0
 3d0:	00000013          	nop
 3d4:	fff00113          	li	sp,-1
 3d8:	00000013          	nop
 3dc:	06208463          	beq	ra,sp,444 <fail>
 3e0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3e4:	00200293          	li	t0,2
 3e8:	fe5212e3          	bne	tp,t0,3cc <test_19+0x8>

000003ec <test_20>:
 3ec:	01400193          	li	gp,20
 3f0:	00000213          	li	tp,0
 3f4:	00000093          	li	ra,0
 3f8:	00000013          	nop
 3fc:	00000013          	nop
 400:	fff00113          	li	sp,-1
 404:	04208063          	beq	ra,sp,444 <fail>
 408:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 40c:	00200293          	li	t0,2
 410:	fe5212e3          	bne	tp,t0,3f4 <test_20+0x8>

00000414 <test_21>:
 414:	01500193          	li	gp,21
 418:	00100093          	li	ra,1
 41c:	00000a63          	beqz	zero,430 <test_21+0x1c>
 420:	00108093          	addi	ra,ra,1
 424:	00108093          	addi	ra,ra,1
 428:	00108093          	addi	ra,ra,1
 42c:	00108093          	addi	ra,ra,1
 430:	00108093          	addi	ra,ra,1
 434:	00108093          	addi	ra,ra,1
 438:	00300393          	li	t2,3
 43c:	00709463          	bne	ra,t2,444 <fail>
 440:	02301063          	bne	zero,gp,460 <pass>

00000444 <fail>:
 444:	0ff0000f          	fence
 448:	00018063          	beqz	gp,448 <fail+0x4>
 44c:	00119193          	slli	gp,gp,0x1
 450:	0011e193          	ori	gp,gp,1
 454:	05d00893          	li	a7,93
 458:	00018513          	mv	a0,gp
 45c:	00000073          	ecall

00000460 <pass>:
 460:	0ff0000f          	fence
 464:	00100193          	li	gp,1
 468:	05d00893          	li	a7,93
 46c:	00000513          	li	a0,0
 470:	00000073          	ecall
 474:	c0001073          	unimp
 478:	0000                	.insn	2, 0x
 47a:	0000                	.insn	2, 0x
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
