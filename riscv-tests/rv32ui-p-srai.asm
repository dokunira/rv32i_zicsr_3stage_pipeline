
rv32ui-p-srai:     file format elf32-littleriscv


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
 18c:	4006d713          	srai	a4,a3,0x0
 190:	00000393          	li	t2,0
 194:	2a771463          	bne	a4,t2,43c <fail>

00000198 <test_3>:
 198:	00300193          	li	gp,3
 19c:	800006b7          	lui	a3,0x80000
 1a0:	4016d713          	srai	a4,a3,0x1
 1a4:	c00003b7          	lui	t2,0xc0000
 1a8:	28771a63          	bne	a4,t2,43c <fail>

000001ac <test_4>:
 1ac:	00400193          	li	gp,4
 1b0:	800006b7          	lui	a3,0x80000
 1b4:	4076d713          	srai	a4,a3,0x7
 1b8:	ff0003b7          	lui	t2,0xff000
 1bc:	28771063          	bne	a4,t2,43c <fail>

000001c0 <test_5>:
 1c0:	00500193          	li	gp,5
 1c4:	800006b7          	lui	a3,0x80000
 1c8:	40e6d713          	srai	a4,a3,0xe
 1cc:	fffe03b7          	lui	t2,0xfffe0
 1d0:	26771663          	bne	a4,t2,43c <fail>

000001d4 <test_6>:
 1d4:	00600193          	li	gp,6
 1d8:	800006b7          	lui	a3,0x80000
 1dc:	00168693          	addi	a3,a3,1 # 80000001 <_end+0x7ffffa01>
 1e0:	41f6d713          	srai	a4,a3,0x1f
 1e4:	fff00393          	li	t2,-1
 1e8:	24771a63          	bne	a4,t2,43c <fail>

000001ec <test_7>:
 1ec:	00700193          	li	gp,7
 1f0:	800006b7          	lui	a3,0x80000
 1f4:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 1f8:	4006d713          	srai	a4,a3,0x0
 1fc:	800003b7          	lui	t2,0x80000
 200:	fff38393          	addi	t2,t2,-1 # 7fffffff <_end+0x7ffff9ff>
 204:	22771c63          	bne	a4,t2,43c <fail>

00000208 <test_8>:
 208:	00800193          	li	gp,8
 20c:	800006b7          	lui	a3,0x80000
 210:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 214:	4016d713          	srai	a4,a3,0x1
 218:	400003b7          	lui	t2,0x40000
 21c:	fff38393          	addi	t2,t2,-1 # 3fffffff <_end+0x3ffff9ff>
 220:	20771e63          	bne	a4,t2,43c <fail>

00000224 <test_9>:
 224:	00900193          	li	gp,9
 228:	800006b7          	lui	a3,0x80000
 22c:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 230:	4076d713          	srai	a4,a3,0x7
 234:	010003b7          	lui	t2,0x1000
 238:	fff38393          	addi	t2,t2,-1 # ffffff <_end+0xfff9ff>
 23c:	20771063          	bne	a4,t2,43c <fail>

00000240 <test_10>:
 240:	00a00193          	li	gp,10
 244:	800006b7          	lui	a3,0x80000
 248:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 24c:	40e6d713          	srai	a4,a3,0xe
 250:	000203b7          	lui	t2,0x20
 254:	fff38393          	addi	t2,t2,-1 # 1ffff <_end+0x1f9ff>
 258:	1e771263          	bne	a4,t2,43c <fail>

0000025c <test_11>:
 25c:	00b00193          	li	gp,11
 260:	800006b7          	lui	a3,0x80000
 264:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 268:	41f6d713          	srai	a4,a3,0x1f
 26c:	00000393          	li	t2,0
 270:	1c771663          	bne	a4,t2,43c <fail>

00000274 <test_12>:
 274:	00c00193          	li	gp,12
 278:	818186b7          	lui	a3,0x81818
 27c:	18168693          	addi	a3,a3,385 # 81818181 <_end+0x81817b81>
 280:	4006d713          	srai	a4,a3,0x0
 284:	818183b7          	lui	t2,0x81818
 288:	18138393          	addi	t2,t2,385 # 81818181 <_end+0x81817b81>
 28c:	1a771863          	bne	a4,t2,43c <fail>

00000290 <test_13>:
 290:	00d00193          	li	gp,13
 294:	818186b7          	lui	a3,0x81818
 298:	18168693          	addi	a3,a3,385 # 81818181 <_end+0x81817b81>
 29c:	4016d713          	srai	a4,a3,0x1
 2a0:	c0c0c3b7          	lui	t2,0xc0c0c
 2a4:	0c038393          	addi	t2,t2,192 # c0c0c0c0 <_end+0xc0c0bac0>
 2a8:	18771a63          	bne	a4,t2,43c <fail>

000002ac <test_14>:
 2ac:	00e00193          	li	gp,14
 2b0:	818186b7          	lui	a3,0x81818
 2b4:	18168693          	addi	a3,a3,385 # 81818181 <_end+0x81817b81>
 2b8:	4076d713          	srai	a4,a3,0x7
 2bc:	ff0303b7          	lui	t2,0xff030
 2c0:	30338393          	addi	t2,t2,771 # ff030303 <_end+0xff02fd03>
 2c4:	16771c63          	bne	a4,t2,43c <fail>

000002c8 <test_15>:
 2c8:	00f00193          	li	gp,15
 2cc:	818186b7          	lui	a3,0x81818
 2d0:	18168693          	addi	a3,a3,385 # 81818181 <_end+0x81817b81>
 2d4:	40e6d713          	srai	a4,a3,0xe
 2d8:	fffe03b7          	lui	t2,0xfffe0
 2dc:	60638393          	addi	t2,t2,1542 # fffe0606 <_end+0xfffe0006>
 2e0:	14771e63          	bne	a4,t2,43c <fail>

000002e4 <test_16>:
 2e4:	01000193          	li	gp,16
 2e8:	818186b7          	lui	a3,0x81818
 2ec:	18168693          	addi	a3,a3,385 # 81818181 <_end+0x81817b81>
 2f0:	41f6d713          	srai	a4,a3,0x1f
 2f4:	fff00393          	li	t2,-1
 2f8:	14771263          	bne	a4,t2,43c <fail>

000002fc <test_17>:
 2fc:	01100193          	li	gp,17
 300:	800005b7          	lui	a1,0x80000
 304:	4075d593          	srai	a1,a1,0x7
 308:	ff0003b7          	lui	t2,0xff000
 30c:	12759863          	bne	a1,t2,43c <fail>

00000310 <test_18>:
 310:	01200193          	li	gp,18
 314:	00000213          	li	tp,0
 318:	800000b7          	lui	ra,0x80000
 31c:	4070d713          	srai	a4,ra,0x7
 320:	00070313          	mv	t1,a4
 324:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 328:	00200293          	li	t0,2
 32c:	fe5216e3          	bne	tp,t0,318 <test_18+0x8>
 330:	ff0003b7          	lui	t2,0xff000
 334:	10731463          	bne	t1,t2,43c <fail>

00000338 <test_19>:
 338:	01300193          	li	gp,19
 33c:	00000213          	li	tp,0
 340:	800000b7          	lui	ra,0x80000
 344:	40e0d713          	srai	a4,ra,0xe
 348:	00000013          	nop
 34c:	00070313          	mv	t1,a4
 350:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 354:	00200293          	li	t0,2
 358:	fe5214e3          	bne	tp,t0,340 <test_19+0x8>
 35c:	fffe03b7          	lui	t2,0xfffe0
 360:	0c731e63          	bne	t1,t2,43c <fail>

00000364 <test_20>:
 364:	01400193          	li	gp,20
 368:	00000213          	li	tp,0
 36c:	800000b7          	lui	ra,0x80000
 370:	00108093          	addi	ra,ra,1 # 80000001 <_end+0x7ffffa01>
 374:	41f0d713          	srai	a4,ra,0x1f
 378:	00000013          	nop
 37c:	00000013          	nop
 380:	00070313          	mv	t1,a4
 384:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 388:	00200293          	li	t0,2
 38c:	fe5210e3          	bne	tp,t0,36c <test_20+0x8>
 390:	fff00393          	li	t2,-1
 394:	0a731463          	bne	t1,t2,43c <fail>

00000398 <test_21>:
 398:	01500193          	li	gp,21
 39c:	00000213          	li	tp,0
 3a0:	800000b7          	lui	ra,0x80000
 3a4:	4070d713          	srai	a4,ra,0x7
 3a8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3ac:	00200293          	li	t0,2
 3b0:	fe5218e3          	bne	tp,t0,3a0 <test_21+0x8>
 3b4:	ff0003b7          	lui	t2,0xff000
 3b8:	08771263          	bne	a4,t2,43c <fail>

000003bc <test_22>:
 3bc:	01600193          	li	gp,22
 3c0:	00000213          	li	tp,0
 3c4:	800000b7          	lui	ra,0x80000
 3c8:	00000013          	nop
 3cc:	40e0d713          	srai	a4,ra,0xe
 3d0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3d4:	00200293          	li	t0,2
 3d8:	fe5216e3          	bne	tp,t0,3c4 <test_22+0x8>
 3dc:	fffe03b7          	lui	t2,0xfffe0
 3e0:	04771e63          	bne	a4,t2,43c <fail>

000003e4 <test_23>:
 3e4:	01700193          	li	gp,23
 3e8:	00000213          	li	tp,0
 3ec:	800000b7          	lui	ra,0x80000
 3f0:	00108093          	addi	ra,ra,1 # 80000001 <_end+0x7ffffa01>
 3f4:	00000013          	nop
 3f8:	00000013          	nop
 3fc:	41f0d713          	srai	a4,ra,0x1f
 400:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 404:	00200293          	li	t0,2
 408:	fe5212e3          	bne	tp,t0,3ec <test_23+0x8>
 40c:	fff00393          	li	t2,-1
 410:	02771663          	bne	a4,t2,43c <fail>

00000414 <test_24>:
 414:	01800193          	li	gp,24
 418:	40405093          	srai	ra,zero,0x4
 41c:	00000393          	li	t2,0
 420:	00709e63          	bne	ra,t2,43c <fail>

00000424 <test_25>:
 424:	01900193          	li	gp,25
 428:	02100093          	li	ra,33
 42c:	40a0d013          	srai	zero,ra,0xa
 430:	00000393          	li	t2,0
 434:	00701463          	bne	zero,t2,43c <fail>
 438:	02301063          	bne	zero,gp,458 <pass>

0000043c <fail>:
 43c:	0ff0000f          	fence
 440:	00018063          	beqz	gp,440 <fail+0x4>
 444:	00119193          	slli	gp,gp,0x1
 448:	0011e193          	ori	gp,gp,1
 44c:	05d00893          	li	a7,93
 450:	00018513          	mv	a0,gp
 454:	00000073          	ecall

00000458 <pass>:
 458:	0ff0000f          	fence
 45c:	00100193          	li	gp,1
 460:	05d00893          	li	a7,93
 464:	00000513          	li	a0,0
 468:	00000073          	ecall
 46c:	c0001073          	unimp
 470:	0000                	.insn	2, 0x
 472:	0000                	.insn	2, 0x
