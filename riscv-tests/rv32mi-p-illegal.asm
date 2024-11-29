
rv32mi-p-illegal:     file format elf32-littleriscv


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
  24:	2e0f0f13          	addi	t5,t5,736 # 300 <mtvec_handler>
  28:	000f0463          	beqz	t5,30 <trap_vector+0x2c>
  2c:	000f0067          	jr	t5
  30:	34202f73          	csrr	t5,mcause
  34:	000f5463          	bgez	t5,3c <handle_exception>
  38:	0040006f          	j	3c <handle_exception>

0000003c <handle_exception>:
  3c:	5391e193          	ori	gp,gp,1337

00000040 <write_tohost>:
  40:	50302023          	sw	gp,1280(zero) # 500 <tohost>
  44:	50002223          	sw	zero,1284(zero) # 504 <tohost+0x4>
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
 100:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff9ff>
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
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xab09>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00002537          	lui	a0,0x2
 178:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x1200>
 17c:	30052073          	csrs	mstatus,a0
 180:	00000297          	auipc	t0,0x0
 184:	01428293          	addi	t0,t0,20 # 194 <reset_vector+0x148>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret
 194:	00200193          	li	gp,2

00000198 <bad2>:
 198:	0000                	.insn	2, 0x
 19a:	0000                	.insn	2, 0x
 19c:	1300006f          	j	2cc <fail>
 1a0:	000022b7          	lui	t0,0x2
 1a4:	80028293          	addi	t0,t0,-2048 # 1800 <_end+0x1200>
 1a8:	3002b073          	csrc	mstatus,t0
 1ac:	00001337          	lui	t1,0x1
 1b0:	80030313          	addi	t1,t1,-2048 # 800 <_end+0x200>
 1b4:	30032073          	csrs	mstatus,t1
 1b8:	300023f3          	csrr	t2,mstatus
 1bc:	0053f3b3          	and	t2,t2,t0
 1c0:	12731463          	bne	t1,t2,2e8 <pass>

000001c4 <test_vectored_interrupts>:
 1c4:	34415073          	csrwi	mip,2
 1c8:	30415073          	csrwi	mie,2
 1cc:	00000297          	auipc	t0,0x0
 1d0:	13528293          	addi	t0,t0,309 # 301 <mtvec_handler+0x1>
 1d4:	30529473          	csrrw	s0,mtvec,t0
 1d8:	305022f3          	csrr	t0,mtvec
 1dc:	0012f293          	andi	t0,t0,1
 1e0:	00028663          	beqz	t0,1ec <msip>
 1e4:	30046073          	csrsi	mstatus,8
 1e8:	0000006f          	j	1e8 <test_vectored_interrupts+0x24>

000001ec <msip>:
 1ec:	30541073          	csrw	mtvec,s0
 1f0:	30315073          	csrwi	mideleg,2
 1f4:	00000297          	auipc	t0,0x0
 1f8:	02828293          	addi	t0,t0,40 # 21c <msip+0x30>
 1fc:	34129073          	csrw	mepc,t0
 200:	000022b7          	lui	t0,0x2
 204:	80028293          	addi	t0,t0,-2048 # 1800 <_end+0x1200>
 208:	3002b073          	csrc	mstatus,t0
 20c:	00001337          	lui	t1,0x1
 210:	80030313          	addi	t1,t1,-2048 # 800 <_end+0x200>
 214:	30032073          	csrs	mstatus,t1
 218:	30200073          	mret
 21c:	10500073          	wfi
 220:	0002f2b3          	and	t0,t0,zero
 224:	000c02b7          	lui	t0,0xc0
 228:	1002b073          	csrc	sstatus,t0
 22c:	00037333          	and	t1,t1,zero
 230:	000c0337          	lui	t1,0xc0
 234:	10032073          	csrs	sstatus,t1
 238:	100023f3          	csrr	t2,sstatus
 23c:	0053f3b3          	and	t2,t2,t0
 240:	06038463          	beqz	t2,2a8 <bare_s_1>
 244:	1002b073          	csrc	sstatus,t0
 248:	12000073          	sfence.vma
 24c:	180022f3          	csrr	t0,satp

00000250 <bad5>:
 250:	0000                	.insn	2, 0x
 252:	0000                	.insn	2, 0x
 254:	0780006f          	j	2cc <fail>

00000258 <bad6>:
 258:	12000073          	sfence.vma
 25c:	0700006f          	j	2cc <fail>

00000260 <bad7>:
 260:	180022f3          	csrr	t0,satp
 264:	0680006f          	j	2cc <fail>

00000268 <test_tsr>:
 268:	00000297          	auipc	t0,0x0
 26c:	02028293          	addi	t0,t0,32 # 288 <bad8>
 270:	14129073          	csrw	sepc,t0
 274:	10000293          	li	t0,256
 278:	1002a073          	csrs	sstatus,t0
 27c:	02000293          	li	t0,32
 280:	1002b073          	csrc	sstatus,t0
 284:	10200073          	sret

00000288 <bad8>:
 288:	0000                	.insn	2, 0x
 28a:	0000                	.insn	2, 0x
 28c:	0400006f          	j	2cc <fail>
 290:	00000297          	auipc	t0,0x0
 294:	01028293          	addi	t0,t0,16 # 2a0 <bad9+0x4>
 298:	14129073          	csrw	sepc,t0

0000029c <bad9>:
 29c:	10200073          	sret
 2a0:	02c0006f          	j	2cc <fail>
 2a4:	0240006f          	j	2c8 <skip_bare_s>

000002a8 <bare_s_1>:
 2a8:	12000073          	sfence.vma
 2ac:	0200006f          	j	2cc <fail>

000002b0 <bare_s_2>:
 2b0:	12000073          	sfence.vma
 2b4:	0180006f          	j	2cc <fail>
 2b8:	180022f3          	csrr	t0,satp

000002bc <bare_s_3>:
 2bc:	0000                	.insn	2, 0x
 2be:	0000                	.insn	2, 0x
 2c0:	00c0006f          	j	2cc <fail>
 2c4:	fa5ff06f          	j	268 <test_tsr>

000002c8 <skip_bare_s>:
 2c8:	02301063          	bne	zero,gp,2e8 <pass>

000002cc <fail>:
 2cc:	0ff0000f          	fence
 2d0:	00018063          	beqz	gp,2d0 <fail+0x4>
 2d4:	00119193          	slli	gp,gp,0x1
 2d8:	0011e193          	ori	gp,gp,1
 2dc:	05d00893          	li	a7,93
 2e0:	00018513          	mv	a0,gp
 2e4:	00000073          	ecall

000002e8 <pass>:
 2e8:	0ff0000f          	fence
 2ec:	00100193          	li	gp,1
 2f0:	05d00893          	li	a7,93
 2f4:	00000513          	li	a0,0
 2f8:	00000073          	ecall
 2fc:	00000013          	nop

00000300 <mtvec_handler>:
 300:	0400006f          	j	340 <synchronous_exception>
 304:	ee9ff06f          	j	1ec <msip>
 308:	fc5ff06f          	j	2cc <fail>
 30c:	fc1ff06f          	j	2cc <fail>
 310:	fbdff06f          	j	2cc <fail>
 314:	fb9ff06f          	j	2cc <fail>
 318:	fb5ff06f          	j	2cc <fail>
 31c:	fb1ff06f          	j	2cc <fail>
 320:	fadff06f          	j	2cc <fail>
 324:	fa9ff06f          	j	2cc <fail>
 328:	fa5ff06f          	j	2cc <fail>
 32c:	fa1ff06f          	j	2cc <fail>
 330:	f9dff06f          	j	2cc <fail>
 334:	f99ff06f          	j	2cc <fail>
 338:	f95ff06f          	j	2cc <fail>
 33c:	f91ff06f          	j	2cc <fail>

00000340 <synchronous_exception>:
 340:	00200313          	li	t1,2
 344:	342022f3          	csrr	t0,mcause
 348:	f86292e3          	bne	t0,t1,2cc <fail>
 34c:	341022f3          	csrr	t0,mepc
 350:	343023f3          	csrr	t2,mtval
 354:	00038e63          	beqz	t2,370 <synchronous_exception+0x30>
 358:	0002d303          	lhu	t1,0(t0)
 35c:	0063c3b3          	xor	t2,t2,t1
 360:	0022d303          	lhu	t1,2(t0)
 364:	01031313          	slli	t1,t1,0x10
 368:	0063c3b3          	xor	t2,t2,t1
 36c:	f60390e3          	bnez	t2,2cc <fail>
 370:	00000317          	auipc	t1,0x0
 374:	e2830313          	addi	t1,t1,-472 # 198 <bad2>
 378:	06628463          	beq	t0,t1,3e0 <synchronous_exception+0xa0>
 37c:	00000317          	auipc	t1,0x0
 380:	ed430313          	addi	t1,t1,-300 # 250 <bad5>
 384:	06628463          	beq	t0,t1,3ec <synchronous_exception+0xac>
 388:	00000317          	auipc	t1,0x0
 38c:	ed030313          	addi	t1,t1,-304 # 258 <bad6>
 390:	04628863          	beq	t0,t1,3e0 <synchronous_exception+0xa0>
 394:	00000317          	auipc	t1,0x0
 398:	ecc30313          	addi	t1,t1,-308 # 260 <bad7>
 39c:	04628263          	beq	t0,t1,3e0 <synchronous_exception+0xa0>
 3a0:	00000317          	auipc	t1,0x0
 3a4:	ee830313          	addi	t1,t1,-280 # 288 <bad8>
 3a8:	04628863          	beq	t0,t1,3f8 <synchronous_exception+0xb8>
 3ac:	00000317          	auipc	t1,0x0
 3b0:	ef030313          	addi	t1,t1,-272 # 29c <bad9>
 3b4:	04628863          	beq	t0,t1,404 <synchronous_exception+0xc4>
 3b8:	00000317          	auipc	t1,0x0
 3bc:	ef030313          	addi	t1,t1,-272 # 2a8 <bare_s_1>
 3c0:	02628663          	beq	t0,t1,3ec <synchronous_exception+0xac>
 3c4:	00000317          	auipc	t1,0x0
 3c8:	eec30313          	addi	t1,t1,-276 # 2b0 <bare_s_2>
 3cc:	00628a63          	beq	t0,t1,3e0 <synchronous_exception+0xa0>
 3d0:	00000317          	auipc	t1,0x0
 3d4:	eec30313          	addi	t1,t1,-276 # 2bc <bare_s_3>
 3d8:	00628463          	beq	t0,t1,3e0 <synchronous_exception+0xa0>
 3dc:	ef1ff06f          	j	2cc <fail>
 3e0:	00828293          	addi	t0,t0,8
 3e4:	34129073          	csrw	mepc,t0
 3e8:	30200073          	mret
 3ec:	00100337          	lui	t1,0x100
 3f0:	30032073          	csrs	mstatus,t1
 3f4:	fedff06f          	j	3e0 <synchronous_exception+0xa0>
 3f8:	00400337          	lui	t1,0x400
 3fc:	30032073          	csrs	mstatus,t1
 400:	fe1ff06f          	j	3e0 <synchronous_exception+0xa0>
 404:	fddff06f          	j	3e0 <synchronous_exception+0xa0>
 408:	c0001073          	unimp
 40c:	0000                	.insn	2, 0x
 40e:	0000                	.insn	2, 0x
 410:	0000                	.insn	2, 0x
 412:	0000                	.insn	2, 0x
 414:	0000                	.insn	2, 0x
 416:	0000                	.insn	2, 0x
 418:	0000                	.insn	2, 0x
 41a:	0000                	.insn	2, 0x
 41c:	0000                	.insn	2, 0x
 41e:	0000                	.insn	2, 0x
 420:	0000                	.insn	2, 0x
 422:	0000                	.insn	2, 0x
 424:	0000                	.insn	2, 0x
 426:	0000                	.insn	2, 0x
 428:	0000                	.insn	2, 0x
 42a:	0000                	.insn	2, 0x
 42c:	0000                	.insn	2, 0x
 42e:	0000                	.insn	2, 0x
 430:	0000                	.insn	2, 0x
 432:	0000                	.insn	2, 0x
 434:	0000                	.insn	2, 0x
 436:	0000                	.insn	2, 0x
 438:	0000                	.insn	2, 0x
 43a:	0000                	.insn	2, 0x
 43c:	0000                	.insn	2, 0x
 43e:	0000                	.insn	2, 0x
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
 474:	0000                	.insn	2, 0x
 476:	0000                	.insn	2, 0x
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
 4b4:	0000                	.insn	2, 0x
 4b6:	0000                	.insn	2, 0x
 4b8:	0000                	.insn	2, 0x
 4ba:	0000                	.insn	2, 0x
 4bc:	0000                	.insn	2, 0x
 4be:	0000                	.insn	2, 0x
