
rv32ui-p-addi:     file format elf32-littleriscv


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
 188:	00000693          	li	a3,0
 18c:	00068713          	mv	a4,a3
 190:	00000393          	li	t2,0
 194:	26771c63          	bne	a4,t2,40c <fail>

00000198 <test_3>:
 198:	00300193          	li	gp,3
 19c:	00100693          	li	a3,1
 1a0:	00168713          	addi	a4,a3,1
 1a4:	00200393          	li	t2,2
 1a8:	26771263          	bne	a4,t2,40c <fail>

000001ac <test_4>:
 1ac:	00400193          	li	gp,4
 1b0:	00300693          	li	a3,3
 1b4:	00768713          	addi	a4,a3,7
 1b8:	00a00393          	li	t2,10
 1bc:	24771863          	bne	a4,t2,40c <fail>

000001c0 <test_5>:
 1c0:	00500193          	li	gp,5
 1c4:	00000693          	li	a3,0
 1c8:	80068713          	addi	a4,a3,-2048
 1cc:	80000393          	li	t2,-2048
 1d0:	22771e63          	bne	a4,t2,40c <fail>

000001d4 <test_6>:
 1d4:	00600193          	li	gp,6
 1d8:	800006b7          	lui	a3,0x80000
 1dc:	00068713          	mv	a4,a3
 1e0:	800003b7          	lui	t2,0x80000
 1e4:	22771463          	bne	a4,t2,40c <fail>

000001e8 <test_7>:
 1e8:	00700193          	li	gp,7
 1ec:	800006b7          	lui	a3,0x80000
 1f0:	80068713          	addi	a4,a3,-2048 # 7ffff800 <_end+0x7ffff200>
 1f4:	800003b7          	lui	t2,0x80000
 1f8:	80038393          	addi	t2,t2,-2048 # 7ffff800 <_end+0x7ffff200>
 1fc:	20771863          	bne	a4,t2,40c <fail>

00000200 <test_8>:
 200:	00800193          	li	gp,8
 204:	00000693          	li	a3,0
 208:	7ff68713          	addi	a4,a3,2047
 20c:	7ff00393          	li	t2,2047
 210:	1e771e63          	bne	a4,t2,40c <fail>

00000214 <test_9>:
 214:	00900193          	li	gp,9
 218:	800006b7          	lui	a3,0x80000
 21c:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 220:	00068713          	mv	a4,a3
 224:	800003b7          	lui	t2,0x80000
 228:	fff38393          	addi	t2,t2,-1 # 7fffffff <_end+0x7ffff9ff>
 22c:	1e771063          	bne	a4,t2,40c <fail>

00000230 <test_10>:
 230:	00a00193          	li	gp,10
 234:	800006b7          	lui	a3,0x80000
 238:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 23c:	7ff68713          	addi	a4,a3,2047
 240:	800003b7          	lui	t2,0x80000
 244:	7fe38393          	addi	t2,t2,2046 # 800007fe <_end+0x800001fe>
 248:	1c771263          	bne	a4,t2,40c <fail>

0000024c <test_11>:
 24c:	00b00193          	li	gp,11
 250:	800006b7          	lui	a3,0x80000
 254:	7ff68713          	addi	a4,a3,2047 # 800007ff <_end+0x800001ff>
 258:	800003b7          	lui	t2,0x80000
 25c:	7ff38393          	addi	t2,t2,2047 # 800007ff <_end+0x800001ff>
 260:	1a771663          	bne	a4,t2,40c <fail>

00000264 <test_12>:
 264:	00c00193          	li	gp,12
 268:	800006b7          	lui	a3,0x80000
 26c:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 270:	80068713          	addi	a4,a3,-2048
 274:	7ffff3b7          	lui	t2,0x7ffff
 278:	7ff38393          	addi	t2,t2,2047 # 7ffff7ff <_end+0x7ffff1ff>
 27c:	18771863          	bne	a4,t2,40c <fail>

00000280 <test_13>:
 280:	00d00193          	li	gp,13
 284:	00000693          	li	a3,0
 288:	fff68713          	addi	a4,a3,-1
 28c:	fff00393          	li	t2,-1
 290:	16771e63          	bne	a4,t2,40c <fail>

00000294 <test_14>:
 294:	00e00193          	li	gp,14
 298:	fff00693          	li	a3,-1
 29c:	00168713          	addi	a4,a3,1
 2a0:	00000393          	li	t2,0
 2a4:	16771463          	bne	a4,t2,40c <fail>

000002a8 <test_15>:
 2a8:	00f00193          	li	gp,15
 2ac:	fff00693          	li	a3,-1
 2b0:	fff68713          	addi	a4,a3,-1
 2b4:	ffe00393          	li	t2,-2
 2b8:	14771a63          	bne	a4,t2,40c <fail>

000002bc <test_16>:
 2bc:	01000193          	li	gp,16
 2c0:	800006b7          	lui	a3,0x80000
 2c4:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 2c8:	00168713          	addi	a4,a3,1
 2cc:	800003b7          	lui	t2,0x80000
 2d0:	12771e63          	bne	a4,t2,40c <fail>

000002d4 <test_17>:
 2d4:	01100193          	li	gp,17
 2d8:	00d00593          	li	a1,13
 2dc:	00b58593          	addi	a1,a1,11
 2e0:	01800393          	li	t2,24
 2e4:	12759463          	bne	a1,t2,40c <fail>

000002e8 <test_18>:
 2e8:	01200193          	li	gp,18
 2ec:	00000213          	li	tp,0
 2f0:	00d00093          	li	ra,13
 2f4:	00b08713          	addi	a4,ra,11
 2f8:	00070313          	mv	t1,a4
 2fc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 300:	00200293          	li	t0,2
 304:	fe5216e3          	bne	tp,t0,2f0 <test_18+0x8>
 308:	01800393          	li	t2,24
 30c:	10731063          	bne	t1,t2,40c <fail>

00000310 <test_19>:
 310:	01300193          	li	gp,19
 314:	00000213          	li	tp,0
 318:	00d00093          	li	ra,13
 31c:	00a08713          	addi	a4,ra,10
 320:	00000013          	nop
 324:	00070313          	mv	t1,a4
 328:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 32c:	00200293          	li	t0,2
 330:	fe5214e3          	bne	tp,t0,318 <test_19+0x8>
 334:	01700393          	li	t2,23
 338:	0c731a63          	bne	t1,t2,40c <fail>

0000033c <test_20>:
 33c:	01400193          	li	gp,20
 340:	00000213          	li	tp,0
 344:	00d00093          	li	ra,13
 348:	00908713          	addi	a4,ra,9
 34c:	00000013          	nop
 350:	00000013          	nop
 354:	00070313          	mv	t1,a4
 358:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 35c:	00200293          	li	t0,2
 360:	fe5212e3          	bne	tp,t0,344 <test_20+0x8>
 364:	01600393          	li	t2,22
 368:	0a731263          	bne	t1,t2,40c <fail>

0000036c <test_21>:
 36c:	01500193          	li	gp,21
 370:	00000213          	li	tp,0
 374:	00d00093          	li	ra,13
 378:	00b08713          	addi	a4,ra,11
 37c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 380:	00200293          	li	t0,2
 384:	fe5218e3          	bne	tp,t0,374 <test_21+0x8>
 388:	01800393          	li	t2,24
 38c:	08771063          	bne	a4,t2,40c <fail>

00000390 <test_22>:
 390:	01600193          	li	gp,22
 394:	00000213          	li	tp,0
 398:	00d00093          	li	ra,13
 39c:	00000013          	nop
 3a0:	00a08713          	addi	a4,ra,10
 3a4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3a8:	00200293          	li	t0,2
 3ac:	fe5216e3          	bne	tp,t0,398 <test_22+0x8>
 3b0:	01700393          	li	t2,23
 3b4:	04771c63          	bne	a4,t2,40c <fail>

000003b8 <test_23>:
 3b8:	01700193          	li	gp,23
 3bc:	00000213          	li	tp,0
 3c0:	00d00093          	li	ra,13
 3c4:	00000013          	nop
 3c8:	00000013          	nop
 3cc:	00908713          	addi	a4,ra,9
 3d0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3d4:	00200293          	li	t0,2
 3d8:	fe5214e3          	bne	tp,t0,3c0 <test_23+0x8>
 3dc:	01600393          	li	t2,22
 3e0:	02771663          	bne	a4,t2,40c <fail>

000003e4 <test_24>:
 3e4:	01800193          	li	gp,24
 3e8:	02000093          	li	ra,32
 3ec:	02000393          	li	t2,32
 3f0:	00709e63          	bne	ra,t2,40c <fail>

000003f4 <test_25>:
 3f4:	01900193          	li	gp,25
 3f8:	02100093          	li	ra,33
 3fc:	03208013          	addi	zero,ra,50
 400:	00000393          	li	t2,0
 404:	00701463          	bne	zero,t2,40c <fail>
 408:	02301063          	bne	zero,gp,428 <pass>

0000040c <fail>:
 40c:	0ff0000f          	fence
 410:	00018063          	beqz	gp,410 <fail+0x4>
 414:	00119193          	slli	gp,gp,0x1
 418:	0011e193          	ori	gp,gp,1
 41c:	05d00893          	li	a7,93
 420:	00018513          	mv	a0,gp
 424:	00000073          	ecall

00000428 <pass>:
 428:	0ff0000f          	fence
 42c:	00100193          	li	gp,1
 430:	05d00893          	li	a7,93
 434:	00000513          	li	a0,0
 438:	00000073          	ecall
 43c:	c0001073          	unimp
 440:	0000                	.insn	2, 0x
 442:	0000                	.insn	2, 0x
 444:	0000                	.insn	2, 0x
 446:	0000                	.insn	2, 0x
 448:	0000                	.insn	2, 0x
 44a:	0000                	.insn	2, 0x
 44c:	0000                	.insn	2, 0x
 44e:	0000                	.insn	2, 0x
 450:	0000                	.insn	2, 0x
 452:	0000                	.insn	2, 0x
 454:	0000                	.insn	2, 0x
 456:	0000                	.insn	2, 0x
 458:	0000                	.insn	2, 0x
 45a:	0000                	.insn	2, 0x
 45c:	0000                	.insn	2, 0x
 45e:	0000                	.insn	2, 0x
 460:	0000                	.insn	2, 0x
 462:	0000                	.insn	2, 0x
 464:	0000                	.insn	2, 0x
 466:	0000                	.insn	2, 0x
 468:	0000                	.insn	2, 0x
 46a:	0000                	.insn	2, 0x
 46c:	0000                	.insn	2, 0x
 46e:	0000                	.insn	2, 0x
 470:	0000                	.insn	2, 0x
 472:	0000                	.insn	2, 0x
