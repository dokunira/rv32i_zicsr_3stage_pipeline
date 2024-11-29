
rv32mi-p-csr:     file format elf32-littleriscv


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
  24:	38cf0f13          	addi	t5,t5,908 # 3ac <mtvec_handler>
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
 184:	01428293          	addi	t0,t0,20 # 194 <test_20>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret

00000194 <test_20>:
 194:	01400193          	li	gp,20
 198:	34001073          	csrw	mscratch,zero
 19c:	34002573          	csrr	a0,mscratch
 1a0:	00000393          	li	t2,0
 1a4:	1c751c63          	bne	a0,t2,37c <fail>

000001a8 <test_21>:
 1a8:	01500193          	li	gp,21
 1ac:	34005573          	csrrwi	a0,mscratch,0
 1b0:	3407d573          	csrrwi	a0,mscratch,15
 1b4:	00000393          	li	t2,0
 1b8:	1c751263          	bne	a0,t2,37c <fail>

000001bc <test_22>:
 1bc:	01600193          	li	gp,22
 1c0:	34086073          	csrsi	mscratch,16
 1c4:	34002573          	csrr	a0,mscratch
 1c8:	01f00393          	li	t2,31
 1cc:	1a751863          	bne	a0,t2,37c <fail>
 1d0:	3401d073          	csrwi	mscratch,3

000001d4 <test_2>:
 1d4:	00200193          	li	gp,2
 1d8:	34002573          	csrr	a0,mscratch
 1dc:	00300393          	li	t2,3
 1e0:	18751e63          	bne	a0,t2,37c <fail>

000001e4 <test_3>:
 1e4:	00300193          	li	gp,3
 1e8:	3400f5f3          	csrrci	a1,mscratch,1
 1ec:	00300393          	li	t2,3
 1f0:	18759663          	bne	a1,t2,37c <fail>

000001f4 <test_4>:
 1f4:	00400193          	li	gp,4
 1f8:	34026673          	csrrsi	a2,mscratch,4
 1fc:	00200393          	li	t2,2
 200:	16761e63          	bne	a2,t2,37c <fail>

00000204 <test_5>:
 204:	00500193          	li	gp,5
 208:	340156f3          	csrrwi	a3,mscratch,2
 20c:	00600393          	li	t2,6
 210:	16769663          	bne	a3,t2,37c <fail>

00000214 <test_6>:
 214:	00600193          	li	gp,6
 218:	0bad2537          	lui	a0,0xbad2
 21c:	dea50513          	addi	a0,a0,-534 # bad1dea <_end+0xbad17da>
 220:	340515f3          	csrrw	a1,mscratch,a0
 224:	00200393          	li	t2,2
 228:	14759a63          	bne	a1,t2,37c <fail>

0000022c <test_7>:
 22c:	00700193          	li	gp,7
 230:	00002537          	lui	a0,0x2
 234:	dea50513          	addi	a0,a0,-534 # 1dea <_end+0x17da>
 238:	340535f3          	csrrc	a1,mscratch,a0
 23c:	0bad23b7          	lui	t2,0xbad2
 240:	dea38393          	addi	t2,t2,-534 # bad1dea <_end+0xbad17da>
 244:	12759c63          	bne	a1,t2,37c <fail>

00000248 <test_8>:
 248:	00800193          	li	gp,8
 24c:	0000c537          	lui	a0,0xc
 250:	eef50513          	addi	a0,a0,-273 # beef <_end+0xb8df>
 254:	340525f3          	csrrs	a1,mscratch,a0
 258:	0bad03b7          	lui	t2,0xbad0
 25c:	12759063          	bne	a1,t2,37c <fail>

00000260 <test_9>:
 260:	00900193          	li	gp,9
 264:	0bad2537          	lui	a0,0xbad2
 268:	dea50513          	addi	a0,a0,-534 # bad1dea <_end+0xbad17da>
 26c:	34051573          	csrrw	a0,mscratch,a0
 270:	0badc3b7          	lui	t2,0xbadc
 274:	eef38393          	addi	t2,t2,-273 # badbeef <_end+0xbadb8df>
 278:	10751263          	bne	a0,t2,37c <fail>

0000027c <test_10>:
 27c:	00a00193          	li	gp,10
 280:	00002537          	lui	a0,0x2
 284:	dea50513          	addi	a0,a0,-534 # 1dea <_end+0x17da>
 288:	34053573          	csrrc	a0,mscratch,a0
 28c:	0bad23b7          	lui	t2,0xbad2
 290:	dea38393          	addi	t2,t2,-534 # bad1dea <_end+0xbad17da>
 294:	0e751463          	bne	a0,t2,37c <fail>

00000298 <test_11>:
 298:	00b00193          	li	gp,11
 29c:	0000c537          	lui	a0,0xc
 2a0:	eef50513          	addi	a0,a0,-273 # beef <_end+0xb8df>
 2a4:	34052573          	csrrs	a0,mscratch,a0
 2a8:	0bad03b7          	lui	t2,0xbad0
 2ac:	0c751863          	bne	a0,t2,37c <fail>

000002b0 <test_12>:
 2b0:	00c00193          	li	gp,12
 2b4:	34002573          	csrr	a0,mscratch
 2b8:	0badc3b7          	lui	t2,0xbadc
 2bc:	eef38393          	addi	t2,t2,-273 # badbeef <_end+0xbadb8df>
 2c0:	0a751e63          	bne	a0,t2,37c <fail>
 2c4:	30102573          	csrr	a0,misa
 2c8:	02057513          	andi	a0,a0,32
 2cc:	02050663          	beqz	a0,2f8 <test_13+0x14>
 2d0:	000065b7          	lui	a1,0x6
 2d4:	3005a073          	csrs	mstatus,a1
 2d8:	f0000053          	fmv.w.x	ft0,zero
 2dc:	3005b073          	csrc	mstatus,a1
 2e0:	60000593          	li	a1,1536

000002e4 <test_13>:
 2e4:	00d00193          	li	gp,13
 2e8:	0005a027          	fsw	ft0,0(a1) # 6000 <_end+0x59f0>
 2ec:	0005a503          	lw	a0,0(a1)
 2f0:	00100393          	li	t2,1
 2f4:	08751463          	bne	a0,t2,37c <fail>
 2f8:	30102573          	csrr	a0,misa
 2fc:	01455513          	srli	a0,a0,0x14
 300:	00157513          	andi	a0,a0,1
 304:	06050063          	beqz	a0,364 <finish>
 308:	3060d073          	csrwi	mcounteren,1
 30c:	30102573          	csrr	a0,misa
 310:	01255513          	srli	a0,a0,0x12
 314:	00157513          	andi	a0,a0,1
 318:	00050463          	beqz	a0,320 <test_13+0x3c>
 31c:	1060d073          	csrwi	scounteren,1
 320:	000022b7          	lui	t0,0x2
 324:	80028293          	addi	t0,t0,-2048 # 1800 <_end+0x11f0>
 328:	3002b073          	csrc	mstatus,t0
 32c:	00000297          	auipc	t0,0x0
 330:	01028293          	addi	t0,t0,16 # 33c <test_14>
 334:	34129073          	csrw	mepc,t0
 338:	30200073          	mret

0000033c <test_14>:
 33c:	00e00193          	li	gp,14
 340:	0ff00513          	li	a0,255
 344:	c0001573          	csrrw	a0,cycle,zero
 348:	0ff00393          	li	t2,255
 34c:	02751863          	bne	a0,t2,37c <fail>

00000350 <test_15>:
 350:	00f00193          	li	gp,15
 354:	0ff00513          	li	a0,255
 358:	30002573          	csrr	a0,mstatus
 35c:	0ff00393          	li	t2,255
 360:	00751e63          	bne	a0,t2,37c <fail>

00000364 <finish>:
 364:	0ff0000f          	fence
 368:	00100193          	li	gp,1
 36c:	05d00893          	li	a7,93
 370:	00000513          	li	a0,0
 374:	00000073          	ecall
 378:	02301063          	bne	zero,gp,398 <pass>

0000037c <fail>:
 37c:	0ff0000f          	fence
 380:	00018063          	beqz	gp,380 <fail+0x4>
 384:	00119193          	slli	gp,gp,0x1
 388:	0011e193          	ori	gp,gp,1
 38c:	05d00893          	li	a7,93
 390:	00018513          	mv	a0,gp
 394:	00000073          	ecall

00000398 <pass>:
 398:	0ff0000f          	fence
 39c:	00100193          	li	gp,1
 3a0:	05d00893          	li	a7,93
 3a4:	00000513          	li	a0,0
 3a8:	00000073          	ecall

000003ac <mtvec_handler>:
 3ac:	00d00293          	li	t0,13
 3b0:	0051e663          	bltu	gp,t0,3bc <mtvec_handler+0x10>
 3b4:	00f00293          	li	t0,15
 3b8:	0232f263          	bgeu	t0,gp,3dc <privileged>
 3bc:	342022f3          	csrr	t0,mcause
 3c0:	00800313          	li	t1,8
 3c4:	fa629ce3          	bne	t0,t1,37c <fail>
 3c8:	0ff0000f          	fence
 3cc:	00100193          	li	gp,1
 3d0:	05d00893          	li	a7,93
 3d4:	00000513          	li	a0,0
 3d8:	00000073          	ecall

000003dc <privileged>:
 3dc:	342022f3          	csrr	t0,mcause
 3e0:	00200313          	li	t1,2
 3e4:	f8629ce3          	bne	t0,t1,37c <fail>
 3e8:	341022f3          	csrr	t0,mepc
 3ec:	00428293          	addi	t0,t0,4
 3f0:	34129073          	csrw	mepc,t0
 3f4:	30200073          	mret
 3f8:	c0001073          	unimp
 3fc:	0000                	.insn	2, 0x
 3fe:	0000                	.insn	2, 0x
 400:	0000                	.insn	2, 0x
 402:	0000                	.insn	2, 0x
 404:	0000                	.insn	2, 0x
 406:	0000                	.insn	2, 0x
 408:	0000                	.insn	2, 0x
 40a:	0000                	.insn	2, 0x
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

Disassembly of section .data:

00000600 <begin_signature>:
 600:	0001                	.insn	2, 0x0001
 602:	0000                	.insn	2, 0x
 604:	0000                	.insn	2, 0x
 606:	0000                	.insn	2, 0x
 608:	0000                	.insn	2, 0x
 60a:	0000                	.insn	2, 0x
 60c:	0000                	.insn	2, 0x
 60e:	0000                	.insn	2, 0x
