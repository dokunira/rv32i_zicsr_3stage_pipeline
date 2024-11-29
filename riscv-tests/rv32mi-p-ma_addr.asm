
rv32mi-p-ma_addr:     file format elf32-littleriscv


Disassembly of section .text.init:

00000000 <_start>:
   0:	04c0006f          	j	4c <reset_vector>

00000004 <trap_vector>:
   4:	34202f73          	csrr	t5,mcause
   8:	00800f93          	li	t6,8
   c:	03ff0a63          	beq	t5,t6,40 <write_tohost>
  10:	00900f93          	li	t6,9
  14:	03ff0663          	beq	t5,t6,40 <write_tohost>
  18:	00b00f93          	li	t6,11
  1c:	03ff0263          	beq	t5,t6,40 <write_tohost>
  20:	00000f17          	auipc	t5,0x0
  24:	330f0f13          	addi	t5,t5,816 # 350 <mtvec_handler>
  28:	000f0463          	beqz	t5,30 <trap_vector+0x2c>
  2c:	000f0067          	jr	t5
  30:	34202f73          	csrr	t5,mcause
  34:	000f5463          	bgez	t5,3c <handle_exception>
  38:	0040006f          	j	3c <handle_exception>

0000003c <handle_exception>:
  3c:	5391e193          	ori	gp,gp,1337

00000040 <write_tohost>:
  40:	40302023          	sw	gp,1024(zero) # 400 <tohost>
  44:	40002223          	sw	zero,1028(zero) # 404 <tohost+0x4>
  48:	ff9ff06f          	j	40 <write_tohost>

0000004c <reset_vector>:
  4c:	00000093          	li	ra,0
  50:	00000113          	li	sp,0
  54:	00000193          	li	gp,0
  58:	00000213          	li	tp,0
  5c:	00000293          	li	t0,0
  60:	00000313          	li	t1,0
  64:	00000393          	li	t2,0
  68:	00000413          	li	s0,0
  6c:	00000493          	li	s1,0
  70:	00000513          	li	a0,0
  74:	00000593          	li	a1,0
  78:	00000613          	li	a2,0
  7c:	00000693          	li	a3,0
  80:	00000713          	li	a4,0
  84:	00000793          	li	a5,0
  88:	00000813          	li	a6,0
  8c:	00000893          	li	a7,0
  90:	00000913          	li	s2,0
  94:	00000993          	li	s3,0
  98:	00000a13          	li	s4,0
  9c:	00000a93          	li	s5,0
  a0:	00000b13          	li	s6,0
  a4:	00000b93          	li	s7,0
  a8:	00000c13          	li	s8,0
  ac:	00000c93          	li	s9,0
  b0:	00000d13          	li	s10,0
  b4:	00000d93          	li	s11,0
  b8:	00000e13          	li	t3,0
  bc:	00000e93          	li	t4,0
  c0:	00000f13          	li	t5,0
  c4:	00000f93          	li	t6,0
  c8:	f1402573          	csrr	a0,mhartid
  cc:	00051063          	bnez	a0,cc <reset_vector+0x80>
  d0:	00000297          	auipc	t0,0x0
  d4:	01028293          	addi	t0,t0,16 # e0 <reset_vector+0x94>
  d8:	30529073          	csrw	mtvec,t0
  dc:	74445073          	csrwi	0x744,8
  e0:	00000297          	auipc	t0,0x0
  e4:	01028293          	addi	t0,t0,16 # f0 <reset_vector+0xa4>
  e8:	30529073          	csrw	mtvec,t0
  ec:	18005073          	csrwi	satp,0
  f0:	00000297          	auipc	t0,0x0
  f4:	02028293          	addi	t0,t0,32 # 110 <reset_vector+0xc4>
  f8:	30529073          	csrw	mtvec,t0
  fc:	800002b7          	lui	t0,0x80000
 100:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff9ef>
 104:	3b029073          	csrw	pmpaddr0,t0
 108:	01f00293          	li	t0,31
 10c:	3a029073          	csrw	pmpcfg0,t0
 110:	30405073          	csrwi	mie,0
 114:	00000297          	auipc	t0,0x0
 118:	01428293          	addi	t0,t0,20 # 128 <reset_vector+0xdc>
 11c:	30529073          	csrw	mtvec,t0
 120:	30205073          	csrwi	medeleg,0
 124:	30305073          	csrwi	mideleg,0
 128:	00000193          	li	gp,0
 12c:	00000297          	auipc	t0,0x0
 130:	ed828293          	addi	t0,t0,-296 # 4 <trap_vector>
 134:	30529073          	csrw	mtvec,t0
 138:	00100513          	li	a0,1
 13c:	01f51513          	slli	a0,a0,0x1f
 140:	00054c63          	bltz	a0,158 <reset_vector+0x10c>
 144:	0ff0000f          	fence
 148:	00100193          	li	gp,1
 14c:	05d00893          	li	a7,93
 150:	00000513          	li	a0,0
 154:	00000073          	ecall
 158:	00000293          	li	t0,0
 15c:	00028a63          	beqz	t0,170 <reset_vector+0x124>
 160:	10529073          	csrw	stvec,t0
 164:	0000b2b7          	lui	t0,0xb
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xaaf9>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00002537          	lui	a0,0x2
 178:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x11f0>
 17c:	30052073          	csrs	mstatus,a0
 180:	00000297          	auipc	t0,0x0
 184:	01428293          	addi	t0,t0,20 # 194 <reset_vector+0x148>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret
 194:	50000413          	li	s0,1280
 198:	00400493          	li	s1,4
 19c:	00500913          	li	s2,5
 1a0:	00200193          	li	gp,2
 1a4:	00000397          	auipc	t2,0x0
 1a8:	01c38393          	addi	t2,t2,28 # 1c0 <reset_vector+0x174>
 1ac:	00140313          	addi	t1,s0,1
 1b0:	00141303          	lh	t1,1(s0)
 1b4:	ffffc3b7          	lui	t2,0xffffc
 1b8:	bcc38393          	addi	t2,t2,-1076 # ffffbbcc <_end+0xffffb5bc>
 1bc:	16731063          	bne	t1,t2,31c <fail>
 1c0:	00300193          	li	gp,3
 1c4:	00000397          	auipc	t2,0x0
 1c8:	01c38393          	addi	t2,t2,28 # 1e0 <reset_vector+0x194>
 1cc:	00140313          	addi	t1,s0,1
 1d0:	00145303          	lhu	t1,1(s0)
 1d4:	0000c3b7          	lui	t2,0xc
 1d8:	bcc38393          	addi	t2,t2,-1076 # bbcc <_end+0xb5bc>
 1dc:	14731063          	bne	t1,t2,31c <fail>
 1e0:	00400193          	li	gp,4
 1e4:	00000397          	auipc	t2,0x0
 1e8:	01c38393          	addi	t2,t2,28 # 200 <reset_vector+0x1b4>
 1ec:	00140313          	addi	t1,s0,1
 1f0:	00142303          	lw	t1,1(s0)
 1f4:	99aac3b7          	lui	t2,0x99aac
 1f8:	bcc38393          	addi	t2,t2,-1076 # 99aabbcc <_end+0x99aab5bc>
 1fc:	12731063          	bne	t1,t2,31c <fail>
 200:	00500193          	li	gp,5
 204:	00000397          	auipc	t2,0x0
 208:	01c38393          	addi	t2,t2,28 # 220 <reset_vector+0x1d4>
 20c:	00240313          	addi	t1,s0,2
 210:	00242303          	lw	t1,2(s0)
 214:	8899b3b7          	lui	t2,0x8899b
 218:	abb38393          	addi	t2,t2,-1349 # 8899aabb <_end+0x8899a4ab>
 21c:	10731063          	bne	t1,t2,31c <fail>
 220:	00600193          	li	gp,6
 224:	00000397          	auipc	t2,0x0
 228:	01c38393          	addi	t2,t2,28 # 240 <reset_vector+0x1f4>
 22c:	00340313          	addi	t1,s0,3
 230:	00342303          	lw	t1,3(s0)
 234:	7788a3b7          	lui	t2,0x7788a
 238:	9aa38393          	addi	t2,t2,-1622 # 778899aa <_end+0x7788939a>
 23c:	0e731063          	bne	t1,t2,31c <fail>
 240:	00600493          	li	s1,6
 244:	00700913          	li	s2,7
 248:	01600193          	li	gp,22
 24c:	00000397          	auipc	t2,0x0
 250:	03038393          	addi	t2,t2,48 # 27c <reset_vector+0x230>
 254:	00140313          	addi	t1,s0,1
 258:	000410a3          	sh	zero,1(s0)
 25c:	00040303          	lb	t1,0(s0)
 260:	0a030e63          	beqz	t1,31c <fail>
 264:	00340303          	lb	t1,3(s0)
 268:	0a030a63          	beqz	t1,31c <fail>
 26c:	00140303          	lb	t1,1(s0)
 270:	0a031663          	bnez	t1,31c <fail>
 274:	00240303          	lb	t1,2(s0)
 278:	0a031263          	bnez	t1,31c <fail>
 27c:	01700193          	li	gp,23
 280:	00000397          	auipc	t2,0x0
 284:	03038393          	addi	t2,t2,48 # 2b0 <reset_vector+0x264>
 288:	00540313          	addi	t1,s0,5
 28c:	000422a3          	sw	zero,5(s0)
 290:	00440303          	lb	t1,4(s0)
 294:	08030463          	beqz	t1,31c <fail>
 298:	00940303          	lb	t1,9(s0)
 29c:	08030063          	beqz	t1,31c <fail>
 2a0:	00540303          	lb	t1,5(s0)
 2a4:	06031c63          	bnez	t1,31c <fail>
 2a8:	00840303          	lb	t1,8(s0)
 2ac:	06031863          	bnez	t1,31c <fail>
 2b0:	01800193          	li	gp,24
 2b4:	00000397          	auipc	t2,0x0
 2b8:	03038393          	addi	t2,t2,48 # 2e4 <reset_vector+0x298>
 2bc:	00a40313          	addi	t1,s0,10
 2c0:	00042523          	sw	zero,10(s0)
 2c4:	00940303          	lb	t1,9(s0)
 2c8:	04030a63          	beqz	t1,31c <fail>
 2cc:	00e40303          	lb	t1,14(s0)
 2d0:	04030663          	beqz	t1,31c <fail>
 2d4:	00a40303          	lb	t1,10(s0)
 2d8:	04031263          	bnez	t1,31c <fail>
 2dc:	00d40303          	lb	t1,13(s0)
 2e0:	02031e63          	bnez	t1,31c <fail>
 2e4:	01900193          	li	gp,25
 2e8:	00000397          	auipc	t2,0x0
 2ec:	03038393          	addi	t2,t2,48 # 318 <reset_vector+0x2cc>
 2f0:	00f40313          	addi	t1,s0,15
 2f4:	000427a3          	sw	zero,15(s0)
 2f8:	00e40303          	lb	t1,14(s0)
 2fc:	02030063          	beqz	t1,31c <fail>
 300:	01340303          	lb	t1,19(s0)
 304:	00030c63          	beqz	t1,31c <fail>
 308:	00f40303          	lb	t1,15(s0)
 30c:	00031863          	bnez	t1,31c <fail>
 310:	01240303          	lb	t1,18(s0)
 314:	00031463          	bnez	t1,31c <fail>
 318:	02301063          	bne	zero,gp,338 <pass>

0000031c <fail>:
 31c:	0ff0000f          	fence
 320:	00018063          	beqz	gp,320 <fail+0x4>
 324:	00119193          	slli	gp,gp,0x1
 328:	0011e193          	ori	gp,gp,1
 32c:	05d00893          	li	a7,93
 330:	00018513          	mv	a0,gp
 334:	00000073          	ecall

00000338 <pass>:
 338:	0ff0000f          	fence
 33c:	00100193          	li	gp,1
 340:	05d00893          	li	a7,93
 344:	00000513          	li	a0,0
 348:	00000073          	ecall
 34c:	00000013          	nop

00000350 <mtvec_handler>:
 350:	342022f3          	csrr	t0,mcause
 354:	00928663          	beq	t0,s1,360 <mtvec_handler+0x10>
 358:	01228463          	beq	t0,s2,360 <mtvec_handler+0x10>
 35c:	fc1ff06f          	j	31c <fail>
 360:	343022f3          	csrr	t0,mtval
 364:	00028863          	beqz	t0,374 <mtvec_handler+0x24>
 368:	fa629ae3          	bne	t0,t1,31c <fail>
 36c:	00028283          	lb	t0,0(t0)
 370:	fa0286e3          	beqz	t0,31c <fail>
 374:	34139073          	csrw	mepc,t2
 378:	30200073          	mret
 37c:	c0001073          	unimp
 380:	0000                	.insn	2, 0x
 382:	0000                	.insn	2, 0x
 384:	0000                	.insn	2, 0x
 386:	0000                	.insn	2, 0x
 388:	0000                	.insn	2, 0x
 38a:	0000                	.insn	2, 0x
 38c:	0000                	.insn	2, 0x
 38e:	0000                	.insn	2, 0x
 390:	0000                	.insn	2, 0x
 392:	0000                	.insn	2, 0x
 394:	0000                	.insn	2, 0x
 396:	0000                	.insn	2, 0x
 398:	0000                	.insn	2, 0x
 39a:	0000                	.insn	2, 0x
 39c:	0000                	.insn	2, 0x
 39e:	0000                	.insn	2, 0x
 3a0:	0000                	.insn	2, 0x
 3a2:	0000                	.insn	2, 0x
 3a4:	0000                	.insn	2, 0x
 3a6:	0000                	.insn	2, 0x
 3a8:	0000                	.insn	2, 0x
 3aa:	0000                	.insn	2, 0x
 3ac:	0000                	.insn	2, 0x
 3ae:	0000                	.insn	2, 0x
 3b0:	0000                	.insn	2, 0x
 3b2:	0000                	.insn	2, 0x

Disassembly of section .data:

00000500 <begin_signature>:
 500:	ccdd                	.insn	2, 0xccdd
 502:	8899aabb          	.insn	4, 0x8899aabb
 506:	44556677          	.insn	4, 0x44556677
 50a:	ee112233          	.insn	4, 0xee112233
 50e:	eeff 5050 5050 5050 	.insn	22, 0x5050505050505050505050505050505050505050eeff
 516:	5050 5050 5050 5050 
 51e:	5050 5050 5050 
 524:	5050                	.insn	2, 0x5050
 526:	5050                	.insn	2, 0x5050
 528:	5050                	.insn	2, 0x5050
 52a:	5050                	.insn	2, 0x5050
 52c:	5050                	.insn	2, 0x5050
 52e:	5050                	.insn	2, 0x5050
 530:	5050                	.insn	2, 0x5050
 532:	5050                	.insn	2, 0x5050
 534:	5050                	.insn	2, 0x5050
 536:	5050                	.insn	2, 0x5050
 538:	5050                	.insn	2, 0x5050
 53a:	5050                	.insn	2, 0x5050
 53c:	5050                	.insn	2, 0x5050
 53e:	5050                	.insn	2, 0x5050
 540:	5050                	.insn	2, 0x5050
 542:	5050                	.insn	2, 0x5050
 544:	5050                	.insn	2, 0x5050
 546:	5050                	.insn	2, 0x5050
 548:	5050                	.insn	2, 0x5050
 54a:	5050                	.insn	2, 0x5050
 54c:	5050                	.insn	2, 0x5050
 54e:	5050                	.insn	2, 0x5050
 550:	5050                	.insn	2, 0x5050
 552:	5050                	.insn	2, 0x5050
 554:	5050                	.insn	2, 0x5050
 556:	5050                	.insn	2, 0x5050
 558:	5050                	.insn	2, 0x5050
 55a:	5050                	.insn	2, 0x5050
 55c:	5050                	.insn	2, 0x5050
 55e:	5050                	.insn	2, 0x5050
 560:	5050                	.insn	2, 0x5050
 562:	5050                	.insn	2, 0x5050
 564:	5050                	.insn	2, 0x5050
 566:	5050                	.insn	2, 0x5050
 568:	5050                	.insn	2, 0x5050
 56a:	5050                	.insn	2, 0x5050
 56c:	5050                	.insn	2, 0x5050
 56e:	5050                	.insn	2, 0x5050
 570:	5050                	.insn	2, 0x5050
 572:	5050                	.insn	2, 0x5050
 574:	5050                	.insn	2, 0x5050
 576:	5050                	.insn	2, 0x5050
 578:	5050                	.insn	2, 0x5050
 57a:	5050                	.insn	2, 0x5050
 57c:	5050                	.insn	2, 0x5050
 57e:	5050                	.insn	2, 0x5050
 580:	5050                	.insn	2, 0x5050
 582:	5050                	.insn	2, 0x5050
 584:	5050                	.insn	2, 0x5050
 586:	5050                	.insn	2, 0x5050
 588:	5050                	.insn	2, 0x5050
 58a:	5050                	.insn	2, 0x5050
 58c:	5050                	.insn	2, 0x5050
 58e:	5050                	.insn	2, 0x5050
 590:	5050                	.insn	2, 0x5050
 592:	5050                	.insn	2, 0x5050
 594:	5050                	.insn	2, 0x5050
 596:	5050                	.insn	2, 0x5050
 598:	5050                	.insn	2, 0x5050
 59a:	5050                	.insn	2, 0x5050
 59c:	5050                	.insn	2, 0x5050
 59e:	5050                	.insn	2, 0x5050
 5a0:	5050                	.insn	2, 0x5050
 5a2:	5050                	.insn	2, 0x5050
 5a4:	5050                	.insn	2, 0x5050
 5a6:	5050                	.insn	2, 0x5050
 5a8:	5050                	.insn	2, 0x5050
 5aa:	5050                	.insn	2, 0x5050
 5ac:	5050                	.insn	2, 0x5050
 5ae:	5050                	.insn	2, 0x5050
 5b0:	5050                	.insn	2, 0x5050
 5b2:	5050                	.insn	2, 0x5050
 5b4:	5050                	.insn	2, 0x5050
 5b6:	5050                	.insn	2, 0x5050
 5b8:	5050                	.insn	2, 0x5050
 5ba:	5050                	.insn	2, 0x5050
 5bc:	5050                	.insn	2, 0x5050
 5be:	5050                	.insn	2, 0x5050
 5c0:	5050                	.insn	2, 0x5050
 5c2:	5050                	.insn	2, 0x5050
 5c4:	5050                	.insn	2, 0x5050
 5c6:	5050                	.insn	2, 0x5050
 5c8:	5050                	.insn	2, 0x5050
 5ca:	5050                	.insn	2, 0x5050
 5cc:	5050                	.insn	2, 0x5050
 5ce:	5050                	.insn	2, 0x5050
 5d0:	5050                	.insn	2, 0x5050
 5d2:	5050                	.insn	2, 0x5050
 5d4:	5050                	.insn	2, 0x5050
 5d6:	5050                	.insn	2, 0x5050
 5d8:	5050                	.insn	2, 0x5050
 5da:	5050                	.insn	2, 0x5050
 5dc:	5050                	.insn	2, 0x5050
 5de:	5050                	.insn	2, 0x5050
 5e0:	5050                	.insn	2, 0x5050
 5e2:	5050                	.insn	2, 0x5050
 5e4:	5050                	.insn	2, 0x5050
 5e6:	5050                	.insn	2, 0x5050
 5e8:	5050                	.insn	2, 0x5050
 5ea:	5050                	.insn	2, 0x5050
 5ec:	5050                	.insn	2, 0x5050
 5ee:	5050                	.insn	2, 0x5050
 5f0:	5050                	.insn	2, 0x5050
 5f2:	5050                	.insn	2, 0x5050
 5f4:	5050                	.insn	2, 0x5050
 5f6:	5050                	.insn	2, 0x5050
 5f8:	5050                	.insn	2, 0x5050
 5fa:	5050                	.insn	2, 0x5050
 5fc:	5050                	.insn	2, 0x5050
 5fe:	5050                	.insn	2, 0x5050
 600:	5050                	.insn	2, 0x5050
 602:	5050                	.insn	2, 0x5050
 604:	5050                	.insn	2, 0x5050
 606:	5050                	.insn	2, 0x5050
 608:	5050                	.insn	2, 0x5050
 60a:	5050                	.insn	2, 0x5050
 60c:	5050                	.insn	2, 0x5050
 60e:	0050                	.insn	2, 0x0050
