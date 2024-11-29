
rv32ui-p-srli:     file format elf32-littleriscv


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
 188:	800006b7          	lui	a3,0x80000
 18c:	0006d713          	srli	a4,a3,0x0
 190:	800003b7          	lui	t2,0x80000
 194:	28771863          	bne	a4,t2,424 <fail>

00000198 <test_3>:
 198:	00300193          	li	gp,3
 19c:	800006b7          	lui	a3,0x80000
 1a0:	0016d713          	srli	a4,a3,0x1
 1a4:	400003b7          	lui	t2,0x40000
 1a8:	26771e63          	bne	a4,t2,424 <fail>

000001ac <test_4>:
 1ac:	00400193          	li	gp,4
 1b0:	800006b7          	lui	a3,0x80000
 1b4:	0076d713          	srli	a4,a3,0x7
 1b8:	010003b7          	lui	t2,0x1000
 1bc:	26771463          	bne	a4,t2,424 <fail>

000001c0 <test_5>:
 1c0:	00500193          	li	gp,5
 1c4:	800006b7          	lui	a3,0x80000
 1c8:	00e6d713          	srli	a4,a3,0xe
 1cc:	000203b7          	lui	t2,0x20
 1d0:	24771a63          	bne	a4,t2,424 <fail>

000001d4 <test_6>:
 1d4:	00600193          	li	gp,6
 1d8:	800006b7          	lui	a3,0x80000
 1dc:	00168693          	addi	a3,a3,1 # 80000001 <_end+0x7ffffa01>
 1e0:	01f6d713          	srli	a4,a3,0x1f
 1e4:	00100393          	li	t2,1
 1e8:	22771e63          	bne	a4,t2,424 <fail>

000001ec <test_7>:
 1ec:	00700193          	li	gp,7
 1f0:	fff00693          	li	a3,-1
 1f4:	0006d713          	srli	a4,a3,0x0
 1f8:	fff00393          	li	t2,-1
 1fc:	22771463          	bne	a4,t2,424 <fail>

00000200 <test_8>:
 200:	00800193          	li	gp,8
 204:	fff00693          	li	a3,-1
 208:	0016d713          	srli	a4,a3,0x1
 20c:	800003b7          	lui	t2,0x80000
 210:	fff38393          	addi	t2,t2,-1 # 7fffffff <_end+0x7ffff9ff>
 214:	20771863          	bne	a4,t2,424 <fail>

00000218 <test_9>:
 218:	00900193          	li	gp,9
 21c:	fff00693          	li	a3,-1
 220:	0076d713          	srli	a4,a3,0x7
 224:	020003b7          	lui	t2,0x2000
 228:	fff38393          	addi	t2,t2,-1 # 1ffffff <_end+0x1fff9ff>
 22c:	1e771c63          	bne	a4,t2,424 <fail>

00000230 <test_10>:
 230:	00a00193          	li	gp,10
 234:	fff00693          	li	a3,-1
 238:	00e6d713          	srli	a4,a3,0xe
 23c:	000403b7          	lui	t2,0x40
 240:	fff38393          	addi	t2,t2,-1 # 3ffff <_end+0x3f9ff>
 244:	1e771063          	bne	a4,t2,424 <fail>

00000248 <test_11>:
 248:	00b00193          	li	gp,11
 24c:	fff00693          	li	a3,-1
 250:	01f6d713          	srli	a4,a3,0x1f
 254:	00100393          	li	t2,1
 258:	1c771663          	bne	a4,t2,424 <fail>

0000025c <test_12>:
 25c:	00c00193          	li	gp,12
 260:	212126b7          	lui	a3,0x21212
 264:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 268:	0006d713          	srli	a4,a3,0x0
 26c:	212123b7          	lui	t2,0x21212
 270:	12138393          	addi	t2,t2,289 # 21212121 <_end+0x21211b21>
 274:	1a771863          	bne	a4,t2,424 <fail>

00000278 <test_13>:
 278:	00d00193          	li	gp,13
 27c:	212126b7          	lui	a3,0x21212
 280:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 284:	0016d713          	srli	a4,a3,0x1
 288:	109093b7          	lui	t2,0x10909
 28c:	09038393          	addi	t2,t2,144 # 10909090 <_end+0x10908a90>
 290:	18771a63          	bne	a4,t2,424 <fail>

00000294 <test_14>:
 294:	00e00193          	li	gp,14
 298:	212126b7          	lui	a3,0x21212
 29c:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 2a0:	0076d713          	srli	a4,a3,0x7
 2a4:	004243b7          	lui	t2,0x424
 2a8:	24238393          	addi	t2,t2,578 # 424242 <_end+0x423c42>
 2ac:	16771c63          	bne	a4,t2,424 <fail>

000002b0 <test_15>:
 2b0:	00f00193          	li	gp,15
 2b4:	212126b7          	lui	a3,0x21212
 2b8:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 2bc:	00e6d713          	srli	a4,a3,0xe
 2c0:	000083b7          	lui	t2,0x8
 2c4:	48438393          	addi	t2,t2,1156 # 8484 <_end+0x7e84>
 2c8:	14771e63          	bne	a4,t2,424 <fail>

000002cc <test_16>:
 2cc:	01000193          	li	gp,16
 2d0:	212126b7          	lui	a3,0x21212
 2d4:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 2d8:	01f6d713          	srli	a4,a3,0x1f
 2dc:	00000393          	li	t2,0
 2e0:	14771263          	bne	a4,t2,424 <fail>

000002e4 <test_17>:
 2e4:	01100193          	li	gp,17
 2e8:	800005b7          	lui	a1,0x80000
 2ec:	0075d593          	srli	a1,a1,0x7
 2f0:	010003b7          	lui	t2,0x1000
 2f4:	12759863          	bne	a1,t2,424 <fail>

000002f8 <test_18>:
 2f8:	01200193          	li	gp,18
 2fc:	00000213          	li	tp,0
 300:	800000b7          	lui	ra,0x80000
 304:	0070d713          	srli	a4,ra,0x7
 308:	00070313          	mv	t1,a4
 30c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 310:	00200293          	li	t0,2
 314:	fe5216e3          	bne	tp,t0,300 <test_18+0x8>
 318:	010003b7          	lui	t2,0x1000
 31c:	10731463          	bne	t1,t2,424 <fail>

00000320 <test_19>:
 320:	01300193          	li	gp,19
 324:	00000213          	li	tp,0
 328:	800000b7          	lui	ra,0x80000
 32c:	00e0d713          	srli	a4,ra,0xe
 330:	00000013          	nop
 334:	00070313          	mv	t1,a4
 338:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 33c:	00200293          	li	t0,2
 340:	fe5214e3          	bne	tp,t0,328 <test_19+0x8>
 344:	000203b7          	lui	t2,0x20
 348:	0c731e63          	bne	t1,t2,424 <fail>

0000034c <test_20>:
 34c:	01400193          	li	gp,20
 350:	00000213          	li	tp,0
 354:	800000b7          	lui	ra,0x80000
 358:	00108093          	addi	ra,ra,1 # 80000001 <_end+0x7ffffa01>
 35c:	01f0d713          	srli	a4,ra,0x1f
 360:	00000013          	nop
 364:	00000013          	nop
 368:	00070313          	mv	t1,a4
 36c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 370:	00200293          	li	t0,2
 374:	fe5210e3          	bne	tp,t0,354 <test_20+0x8>
 378:	00100393          	li	t2,1
 37c:	0a731463          	bne	t1,t2,424 <fail>

00000380 <test_21>:
 380:	01500193          	li	gp,21
 384:	00000213          	li	tp,0
 388:	800000b7          	lui	ra,0x80000
 38c:	0070d713          	srli	a4,ra,0x7
 390:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 394:	00200293          	li	t0,2
 398:	fe5218e3          	bne	tp,t0,388 <test_21+0x8>
 39c:	010003b7          	lui	t2,0x1000
 3a0:	08771263          	bne	a4,t2,424 <fail>

000003a4 <test_22>:
 3a4:	01600193          	li	gp,22
 3a8:	00000213          	li	tp,0
 3ac:	800000b7          	lui	ra,0x80000
 3b0:	00000013          	nop
 3b4:	00e0d713          	srli	a4,ra,0xe
 3b8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3bc:	00200293          	li	t0,2
 3c0:	fe5216e3          	bne	tp,t0,3ac <test_22+0x8>
 3c4:	000203b7          	lui	t2,0x20
 3c8:	04771e63          	bne	a4,t2,424 <fail>

000003cc <test_23>:
 3cc:	01700193          	li	gp,23
 3d0:	00000213          	li	tp,0
 3d4:	800000b7          	lui	ra,0x80000
 3d8:	00108093          	addi	ra,ra,1 # 80000001 <_end+0x7ffffa01>
 3dc:	00000013          	nop
 3e0:	00000013          	nop
 3e4:	01f0d713          	srli	a4,ra,0x1f
 3e8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3ec:	00200293          	li	t0,2
 3f0:	fe5212e3          	bne	tp,t0,3d4 <test_23+0x8>
 3f4:	00100393          	li	t2,1
 3f8:	02771663          	bne	a4,t2,424 <fail>

000003fc <test_24>:
 3fc:	01800193          	li	gp,24
 400:	00405093          	srli	ra,zero,0x4
 404:	00000393          	li	t2,0
 408:	00709e63          	bne	ra,t2,424 <fail>

0000040c <test_25>:
 40c:	01900193          	li	gp,25
 410:	02100093          	li	ra,33
 414:	00a0d013          	srli	zero,ra,0xa
 418:	00000393          	li	t2,0
 41c:	00701463          	bne	zero,t2,424 <fail>
 420:	02301063          	bne	zero,gp,440 <pass>

00000424 <fail>:
 424:	0ff0000f          	fence
 428:	00018063          	beqz	gp,428 <fail+0x4>
 42c:	00119193          	slli	gp,gp,0x1
 430:	0011e193          	ori	gp,gp,1
 434:	05d00893          	li	a7,93
 438:	00018513          	mv	a0,gp
 43c:	00000073          	ecall

00000440 <pass>:
 440:	0ff0000f          	fence
 444:	00100193          	li	gp,1
 448:	05d00893          	li	a7,93
 44c:	00000513          	li	a0,0
 450:	00000073          	ecall
 454:	c0001073          	unimp
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
