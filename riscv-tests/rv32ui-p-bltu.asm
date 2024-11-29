
rv32ui-p-bltu:     file format elf32-littleriscv


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
 190:	0020e663          	bltu	ra,sp,19c <test_2+0x18>
 194:	2e301263          	bne	zero,gp,478 <fail>
 198:	00301663          	bne	zero,gp,1a4 <test_3>
 19c:	fe20eee3          	bltu	ra,sp,198 <test_2+0x14>
 1a0:	2c301c63          	bne	zero,gp,478 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	ffe00093          	li	ra,-2
 1ac:	fff00113          	li	sp,-1
 1b0:	0020e663          	bltu	ra,sp,1bc <test_3+0x18>
 1b4:	2c301263          	bne	zero,gp,478 <fail>
 1b8:	00301663          	bne	zero,gp,1c4 <test_4>
 1bc:	fe20eee3          	bltu	ra,sp,1b8 <test_3+0x14>
 1c0:	2a301c63          	bne	zero,gp,478 <fail>

000001c4 <test_4>:
 1c4:	00400193          	li	gp,4
 1c8:	00000093          	li	ra,0
 1cc:	fff00113          	li	sp,-1
 1d0:	0020e663          	bltu	ra,sp,1dc <test_4+0x18>
 1d4:	2a301263          	bne	zero,gp,478 <fail>
 1d8:	00301663          	bne	zero,gp,1e4 <test_5>
 1dc:	fe20eee3          	bltu	ra,sp,1d8 <test_4+0x14>
 1e0:	28301c63          	bne	zero,gp,478 <fail>

000001e4 <test_5>:
 1e4:	00500193          	li	gp,5
 1e8:	00100093          	li	ra,1
 1ec:	00000113          	li	sp,0
 1f0:	0020e463          	bltu	ra,sp,1f8 <test_5+0x14>
 1f4:	00301463          	bne	zero,gp,1fc <test_5+0x18>
 1f8:	28301063          	bne	zero,gp,478 <fail>
 1fc:	fe20eee3          	bltu	ra,sp,1f8 <test_5+0x14>

00000200 <test_6>:
 200:	00600193          	li	gp,6
 204:	fff00093          	li	ra,-1
 208:	ffe00113          	li	sp,-2
 20c:	0020e463          	bltu	ra,sp,214 <test_6+0x14>
 210:	00301463          	bne	zero,gp,218 <test_6+0x18>
 214:	26301263          	bne	zero,gp,478 <fail>
 218:	fe20eee3          	bltu	ra,sp,214 <test_6+0x14>

0000021c <test_7>:
 21c:	00700193          	li	gp,7
 220:	fff00093          	li	ra,-1
 224:	00000113          	li	sp,0
 228:	0020e463          	bltu	ra,sp,230 <test_7+0x14>
 22c:	00301463          	bne	zero,gp,234 <test_7+0x18>
 230:	24301463          	bne	zero,gp,478 <fail>
 234:	fe20eee3          	bltu	ra,sp,230 <test_7+0x14>

00000238 <test_8>:
 238:	00800193          	li	gp,8
 23c:	800000b7          	lui	ra,0x80000
 240:	80000137          	lui	sp,0x80000
 244:	fff10113          	addi	sp,sp,-1 # 7fffffff <_end+0x7ffff9ff>
 248:	0020e463          	bltu	ra,sp,250 <test_8+0x18>
 24c:	00301463          	bne	zero,gp,254 <test_8+0x1c>
 250:	22301463          	bne	zero,gp,478 <fail>
 254:	fe20eee3          	bltu	ra,sp,250 <test_8+0x18>

00000258 <test_9>:
 258:	00900193          	li	gp,9
 25c:	00000213          	li	tp,0
 260:	f00000b7          	lui	ra,0xf0000
 264:	f0000137          	lui	sp,0xf0000
 268:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 26c:	2020e663          	bltu	ra,sp,478 <fail>
 270:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 274:	00200293          	li	t0,2
 278:	fe5214e3          	bne	tp,t0,260 <test_9+0x8>

0000027c <test_10>:
 27c:	00a00193          	li	gp,10
 280:	00000213          	li	tp,0
 284:	f00000b7          	lui	ra,0xf0000
 288:	f0000137          	lui	sp,0xf0000
 28c:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 290:	00000013          	nop
 294:	1e20e263          	bltu	ra,sp,478 <fail>
 298:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 29c:	00200293          	li	t0,2
 2a0:	fe5212e3          	bne	tp,t0,284 <test_10+0x8>

000002a4 <test_11>:
 2a4:	00b00193          	li	gp,11
 2a8:	00000213          	li	tp,0
 2ac:	f00000b7          	lui	ra,0xf0000
 2b0:	f0000137          	lui	sp,0xf0000
 2b4:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 2b8:	00000013          	nop
 2bc:	00000013          	nop
 2c0:	1a20ec63          	bltu	ra,sp,478 <fail>
 2c4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2c8:	00200293          	li	t0,2
 2cc:	fe5210e3          	bne	tp,t0,2ac <test_11+0x8>

000002d0 <test_12>:
 2d0:	00c00193          	li	gp,12
 2d4:	00000213          	li	tp,0
 2d8:	f00000b7          	lui	ra,0xf0000
 2dc:	00000013          	nop
 2e0:	f0000137          	lui	sp,0xf0000
 2e4:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 2e8:	1820e863          	bltu	ra,sp,478 <fail>
 2ec:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2f0:	00200293          	li	t0,2
 2f4:	fe5212e3          	bne	tp,t0,2d8 <test_12+0x8>

000002f8 <test_13>:
 2f8:	00d00193          	li	gp,13
 2fc:	00000213          	li	tp,0
 300:	f00000b7          	lui	ra,0xf0000
 304:	00000013          	nop
 308:	f0000137          	lui	sp,0xf0000
 30c:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 310:	00000013          	nop
 314:	1620e263          	bltu	ra,sp,478 <fail>
 318:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 31c:	00200293          	li	t0,2
 320:	fe5210e3          	bne	tp,t0,300 <test_13+0x8>

00000324 <test_14>:
 324:	00e00193          	li	gp,14
 328:	00000213          	li	tp,0
 32c:	f00000b7          	lui	ra,0xf0000
 330:	00000013          	nop
 334:	00000013          	nop
 338:	f0000137          	lui	sp,0xf0000
 33c:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 340:	1220ec63          	bltu	ra,sp,478 <fail>
 344:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 348:	00200293          	li	t0,2
 34c:	fe5210e3          	bne	tp,t0,32c <test_14+0x8>

00000350 <test_15>:
 350:	00f00193          	li	gp,15
 354:	00000213          	li	tp,0
 358:	f00000b7          	lui	ra,0xf0000
 35c:	f0000137          	lui	sp,0xf0000
 360:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 364:	1020ea63          	bltu	ra,sp,478 <fail>
 368:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 36c:	00200293          	li	t0,2
 370:	fe5214e3          	bne	tp,t0,358 <test_15+0x8>

00000374 <test_16>:
 374:	01000193          	li	gp,16
 378:	00000213          	li	tp,0
 37c:	f00000b7          	lui	ra,0xf0000
 380:	f0000137          	lui	sp,0xf0000
 384:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 388:	00000013          	nop
 38c:	0e20e663          	bltu	ra,sp,478 <fail>
 390:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 394:	00200293          	li	t0,2
 398:	fe5212e3          	bne	tp,t0,37c <test_16+0x8>

0000039c <test_17>:
 39c:	01100193          	li	gp,17
 3a0:	00000213          	li	tp,0
 3a4:	f00000b7          	lui	ra,0xf0000
 3a8:	f0000137          	lui	sp,0xf0000
 3ac:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 3b0:	00000013          	nop
 3b4:	00000013          	nop
 3b8:	0c20e063          	bltu	ra,sp,478 <fail>
 3bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c0:	00200293          	li	t0,2
 3c4:	fe5210e3          	bne	tp,t0,3a4 <test_17+0x8>

000003c8 <test_18>:
 3c8:	01200193          	li	gp,18
 3cc:	00000213          	li	tp,0
 3d0:	f00000b7          	lui	ra,0xf0000
 3d4:	00000013          	nop
 3d8:	f0000137          	lui	sp,0xf0000
 3dc:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 3e0:	0820ec63          	bltu	ra,sp,478 <fail>
 3e4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3e8:	00200293          	li	t0,2
 3ec:	fe5212e3          	bne	tp,t0,3d0 <test_18+0x8>

000003f0 <test_19>:
 3f0:	01300193          	li	gp,19
 3f4:	00000213          	li	tp,0
 3f8:	f00000b7          	lui	ra,0xf0000
 3fc:	00000013          	nop
 400:	f0000137          	lui	sp,0xf0000
 404:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 408:	00000013          	nop
 40c:	0620e663          	bltu	ra,sp,478 <fail>
 410:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 414:	00200293          	li	t0,2
 418:	fe5210e3          	bne	tp,t0,3f8 <test_19+0x8>

0000041c <test_20>:
 41c:	01400193          	li	gp,20
 420:	00000213          	li	tp,0
 424:	f00000b7          	lui	ra,0xf0000
 428:	00000013          	nop
 42c:	00000013          	nop
 430:	f0000137          	lui	sp,0xf0000
 434:	fff10113          	addi	sp,sp,-1 # efffffff <_end+0xeffff9ff>
 438:	0420e063          	bltu	ra,sp,478 <fail>
 43c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 440:	00200293          	li	t0,2
 444:	fe5210e3          	bne	tp,t0,424 <test_20+0x8>

00000448 <test_21>:
 448:	01500193          	li	gp,21
 44c:	00100093          	li	ra,1
 450:	00106a63          	bltu	zero,ra,464 <test_21+0x1c>
 454:	00108093          	addi	ra,ra,1 # f0000001 <_end+0xeffffa01>
 458:	00108093          	addi	ra,ra,1
 45c:	00108093          	addi	ra,ra,1
 460:	00108093          	addi	ra,ra,1
 464:	00108093          	addi	ra,ra,1
 468:	00108093          	addi	ra,ra,1
 46c:	00300393          	li	t2,3
 470:	00709463          	bne	ra,t2,478 <fail>
 474:	02301063          	bne	zero,gp,494 <pass>

00000478 <fail>:
 478:	0ff0000f          	fence
 47c:	00018063          	beqz	gp,47c <fail+0x4>
 480:	00119193          	slli	gp,gp,0x1
 484:	0011e193          	ori	gp,gp,1
 488:	05d00893          	li	a7,93
 48c:	00018513          	mv	a0,gp
 490:	00000073          	ecall

00000494 <pass>:
 494:	0ff0000f          	fence
 498:	00100193          	li	gp,1
 49c:	05d00893          	li	a7,93
 4a0:	00000513          	li	a0,0
 4a4:	00000073          	ecall
 4a8:	c0001073          	unimp
 4ac:	0000                	.insn	2, 0x
 4ae:	0000                	.insn	2, 0x
 4b0:	0000                	.insn	2, 0x
 4b2:	0000                	.insn	2, 0x
