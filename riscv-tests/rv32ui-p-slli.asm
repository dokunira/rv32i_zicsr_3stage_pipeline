
rv32ui-p-slli:     file format elf32-littleriscv


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
 188:	00100693          	li	a3,1
 18c:	00069713          	slli	a4,a3,0x0
 190:	00100393          	li	t2,1
 194:	26771a63          	bne	a4,t2,408 <fail>

00000198 <test_3>:
 198:	00300193          	li	gp,3
 19c:	00100693          	li	a3,1
 1a0:	00169713          	slli	a4,a3,0x1
 1a4:	00200393          	li	t2,2
 1a8:	26771063          	bne	a4,t2,408 <fail>

000001ac <test_4>:
 1ac:	00400193          	li	gp,4
 1b0:	00100693          	li	a3,1
 1b4:	00769713          	slli	a4,a3,0x7
 1b8:	08000393          	li	t2,128
 1bc:	24771663          	bne	a4,t2,408 <fail>

000001c0 <test_5>:
 1c0:	00500193          	li	gp,5
 1c4:	00100693          	li	a3,1
 1c8:	00e69713          	slli	a4,a3,0xe
 1cc:	000043b7          	lui	t2,0x4
 1d0:	22771c63          	bne	a4,t2,408 <fail>

000001d4 <test_6>:
 1d4:	00600193          	li	gp,6
 1d8:	00100693          	li	a3,1
 1dc:	01f69713          	slli	a4,a3,0x1f
 1e0:	800003b7          	lui	t2,0x80000
 1e4:	22771263          	bne	a4,t2,408 <fail>

000001e8 <test_7>:
 1e8:	00700193          	li	gp,7
 1ec:	fff00693          	li	a3,-1
 1f0:	00069713          	slli	a4,a3,0x0
 1f4:	fff00393          	li	t2,-1
 1f8:	20771863          	bne	a4,t2,408 <fail>

000001fc <test_8>:
 1fc:	00800193          	li	gp,8
 200:	fff00693          	li	a3,-1
 204:	00169713          	slli	a4,a3,0x1
 208:	ffe00393          	li	t2,-2
 20c:	1e771e63          	bne	a4,t2,408 <fail>

00000210 <test_9>:
 210:	00900193          	li	gp,9
 214:	fff00693          	li	a3,-1
 218:	00769713          	slli	a4,a3,0x7
 21c:	f8000393          	li	t2,-128
 220:	1e771463          	bne	a4,t2,408 <fail>

00000224 <test_10>:
 224:	00a00193          	li	gp,10
 228:	fff00693          	li	a3,-1
 22c:	00e69713          	slli	a4,a3,0xe
 230:	ffffc3b7          	lui	t2,0xffffc
 234:	1c771a63          	bne	a4,t2,408 <fail>

00000238 <test_11>:
 238:	00b00193          	li	gp,11
 23c:	fff00693          	li	a3,-1
 240:	01f69713          	slli	a4,a3,0x1f
 244:	800003b7          	lui	t2,0x80000
 248:	1c771063          	bne	a4,t2,408 <fail>

0000024c <test_12>:
 24c:	00c00193          	li	gp,12
 250:	212126b7          	lui	a3,0x21212
 254:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 258:	00069713          	slli	a4,a3,0x0
 25c:	212123b7          	lui	t2,0x21212
 260:	12138393          	addi	t2,t2,289 # 21212121 <_end+0x21211b21>
 264:	1a771263          	bne	a4,t2,408 <fail>

00000268 <test_13>:
 268:	00d00193          	li	gp,13
 26c:	212126b7          	lui	a3,0x21212
 270:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 274:	00169713          	slli	a4,a3,0x1
 278:	424243b7          	lui	t2,0x42424
 27c:	24238393          	addi	t2,t2,578 # 42424242 <_end+0x42423c42>
 280:	18771463          	bne	a4,t2,408 <fail>

00000284 <test_14>:
 284:	00e00193          	li	gp,14
 288:	212126b7          	lui	a3,0x21212
 28c:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 290:	00769713          	slli	a4,a3,0x7
 294:	909093b7          	lui	t2,0x90909
 298:	08038393          	addi	t2,t2,128 # 90909080 <_end+0x90908a80>
 29c:	16771663          	bne	a4,t2,408 <fail>

000002a0 <test_15>:
 2a0:	00f00193          	li	gp,15
 2a4:	212126b7          	lui	a3,0x21212
 2a8:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 2ac:	00e69713          	slli	a4,a3,0xe
 2b0:	484843b7          	lui	t2,0x48484
 2b4:	14771a63          	bne	a4,t2,408 <fail>

000002b8 <test_16>:
 2b8:	01000193          	li	gp,16
 2bc:	212126b7          	lui	a3,0x21212
 2c0:	12168693          	addi	a3,a3,289 # 21212121 <_end+0x21211b21>
 2c4:	01f69713          	slli	a4,a3,0x1f
 2c8:	800003b7          	lui	t2,0x80000
 2cc:	12771e63          	bne	a4,t2,408 <fail>

000002d0 <test_17>:
 2d0:	01100193          	li	gp,17
 2d4:	00100593          	li	a1,1
 2d8:	00759593          	slli	a1,a1,0x7
 2dc:	08000393          	li	t2,128
 2e0:	12759463          	bne	a1,t2,408 <fail>

000002e4 <test_18>:
 2e4:	01200193          	li	gp,18
 2e8:	00000213          	li	tp,0
 2ec:	00100093          	li	ra,1
 2f0:	00709713          	slli	a4,ra,0x7
 2f4:	00070313          	mv	t1,a4
 2f8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2fc:	00200293          	li	t0,2
 300:	fe5216e3          	bne	tp,t0,2ec <test_18+0x8>
 304:	08000393          	li	t2,128
 308:	10731063          	bne	t1,t2,408 <fail>

0000030c <test_19>:
 30c:	01300193          	li	gp,19
 310:	00000213          	li	tp,0
 314:	00100093          	li	ra,1
 318:	00e09713          	slli	a4,ra,0xe
 31c:	00000013          	nop
 320:	00070313          	mv	t1,a4
 324:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 328:	00200293          	li	t0,2
 32c:	fe5214e3          	bne	tp,t0,314 <test_19+0x8>
 330:	000043b7          	lui	t2,0x4
 334:	0c731a63          	bne	t1,t2,408 <fail>

00000338 <test_20>:
 338:	01400193          	li	gp,20
 33c:	00000213          	li	tp,0
 340:	00100093          	li	ra,1
 344:	01f09713          	slli	a4,ra,0x1f
 348:	00000013          	nop
 34c:	00000013          	nop
 350:	00070313          	mv	t1,a4
 354:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 358:	00200293          	li	t0,2
 35c:	fe5212e3          	bne	tp,t0,340 <test_20+0x8>
 360:	800003b7          	lui	t2,0x80000
 364:	0a731263          	bne	t1,t2,408 <fail>

00000368 <test_21>:
 368:	01500193          	li	gp,21
 36c:	00000213          	li	tp,0
 370:	00100093          	li	ra,1
 374:	00709713          	slli	a4,ra,0x7
 378:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 37c:	00200293          	li	t0,2
 380:	fe5218e3          	bne	tp,t0,370 <test_21+0x8>
 384:	08000393          	li	t2,128
 388:	08771063          	bne	a4,t2,408 <fail>

0000038c <test_22>:
 38c:	01600193          	li	gp,22
 390:	00000213          	li	tp,0
 394:	00100093          	li	ra,1
 398:	00000013          	nop
 39c:	00e09713          	slli	a4,ra,0xe
 3a0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3a4:	00200293          	li	t0,2
 3a8:	fe5216e3          	bne	tp,t0,394 <test_22+0x8>
 3ac:	000043b7          	lui	t2,0x4
 3b0:	04771c63          	bne	a4,t2,408 <fail>

000003b4 <test_23>:
 3b4:	01700193          	li	gp,23
 3b8:	00000213          	li	tp,0
 3bc:	00100093          	li	ra,1
 3c0:	00000013          	nop
 3c4:	00000013          	nop
 3c8:	01f09713          	slli	a4,ra,0x1f
 3cc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3d0:	00200293          	li	t0,2
 3d4:	fe5214e3          	bne	tp,t0,3bc <test_23+0x8>
 3d8:	800003b7          	lui	t2,0x80000
 3dc:	02771663          	bne	a4,t2,408 <fail>

000003e0 <test_24>:
 3e0:	01800193          	li	gp,24
 3e4:	01f01093          	slli	ra,zero,0x1f
 3e8:	00000393          	li	t2,0
 3ec:	00709e63          	bne	ra,t2,408 <fail>

000003f0 <test_25>:
 3f0:	01900193          	li	gp,25
 3f4:	02100093          	li	ra,33
 3f8:	01409013          	slli	zero,ra,0x14
 3fc:	00000393          	li	t2,0
 400:	00701463          	bne	zero,t2,408 <fail>
 404:	02301063          	bne	zero,gp,424 <pass>

00000408 <fail>:
 408:	0ff0000f          	fence
 40c:	00018063          	beqz	gp,40c <fail+0x4>
 410:	00119193          	slli	gp,gp,0x1
 414:	0011e193          	ori	gp,gp,1
 418:	05d00893          	li	a7,93
 41c:	00018513          	mv	a0,gp
 420:	00000073          	ecall

00000424 <pass>:
 424:	0ff0000f          	fence
 428:	00100193          	li	gp,1
 42c:	05d00893          	li	a7,93
 430:	00000513          	li	a0,0
 434:	00000073          	ecall
 438:	c0001073          	unimp
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
