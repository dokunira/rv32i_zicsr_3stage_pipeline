
rv32ui-p-slti:     file format elf32-littleriscv


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
 18c:	0006a713          	slti	a4,a3,0
 190:	00000393          	li	t2,0
 194:	26771263          	bne	a4,t2,3f8 <fail>

00000198 <test_3>:
 198:	00300193          	li	gp,3
 19c:	00100693          	li	a3,1
 1a0:	0016a713          	slti	a4,a3,1
 1a4:	00000393          	li	t2,0
 1a8:	24771863          	bne	a4,t2,3f8 <fail>

000001ac <test_4>:
 1ac:	00400193          	li	gp,4
 1b0:	00300693          	li	a3,3
 1b4:	0076a713          	slti	a4,a3,7
 1b8:	00100393          	li	t2,1
 1bc:	22771e63          	bne	a4,t2,3f8 <fail>

000001c0 <test_5>:
 1c0:	00500193          	li	gp,5
 1c4:	00700693          	li	a3,7
 1c8:	0036a713          	slti	a4,a3,3
 1cc:	00000393          	li	t2,0
 1d0:	22771463          	bne	a4,t2,3f8 <fail>

000001d4 <test_6>:
 1d4:	00600193          	li	gp,6
 1d8:	00000693          	li	a3,0
 1dc:	8006a713          	slti	a4,a3,-2048
 1e0:	00000393          	li	t2,0
 1e4:	20771a63          	bne	a4,t2,3f8 <fail>

000001e8 <test_7>:
 1e8:	00700193          	li	gp,7
 1ec:	800006b7          	lui	a3,0x80000
 1f0:	0006a713          	slti	a4,a3,0
 1f4:	00100393          	li	t2,1
 1f8:	20771063          	bne	a4,t2,3f8 <fail>

000001fc <test_8>:
 1fc:	00800193          	li	gp,8
 200:	800006b7          	lui	a3,0x80000
 204:	8006a713          	slti	a4,a3,-2048
 208:	00100393          	li	t2,1
 20c:	1e771663          	bne	a4,t2,3f8 <fail>

00000210 <test_9>:
 210:	00900193          	li	gp,9
 214:	00000693          	li	a3,0
 218:	7ff6a713          	slti	a4,a3,2047
 21c:	00100393          	li	t2,1
 220:	1c771c63          	bne	a4,t2,3f8 <fail>

00000224 <test_10>:
 224:	00a00193          	li	gp,10
 228:	800006b7          	lui	a3,0x80000
 22c:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 230:	0006a713          	slti	a4,a3,0
 234:	00000393          	li	t2,0
 238:	1c771063          	bne	a4,t2,3f8 <fail>

0000023c <test_11>:
 23c:	00b00193          	li	gp,11
 240:	800006b7          	lui	a3,0x80000
 244:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 248:	7ff6a713          	slti	a4,a3,2047
 24c:	00000393          	li	t2,0
 250:	1a771463          	bne	a4,t2,3f8 <fail>

00000254 <test_12>:
 254:	00c00193          	li	gp,12
 258:	800006b7          	lui	a3,0x80000
 25c:	7ff6a713          	slti	a4,a3,2047
 260:	00100393          	li	t2,1
 264:	18771a63          	bne	a4,t2,3f8 <fail>

00000268 <test_13>:
 268:	00d00193          	li	gp,13
 26c:	800006b7          	lui	a3,0x80000
 270:	fff68693          	addi	a3,a3,-1 # 7fffffff <_end+0x7ffff9ff>
 274:	8006a713          	slti	a4,a3,-2048
 278:	00000393          	li	t2,0
 27c:	16771e63          	bne	a4,t2,3f8 <fail>

00000280 <test_14>:
 280:	00e00193          	li	gp,14
 284:	00000693          	li	a3,0
 288:	fff6a713          	slti	a4,a3,-1
 28c:	00000393          	li	t2,0
 290:	16771463          	bne	a4,t2,3f8 <fail>

00000294 <test_15>:
 294:	00f00193          	li	gp,15
 298:	fff00693          	li	a3,-1
 29c:	0016a713          	slti	a4,a3,1
 2a0:	00100393          	li	t2,1
 2a4:	14771a63          	bne	a4,t2,3f8 <fail>

000002a8 <test_16>:
 2a8:	01000193          	li	gp,16
 2ac:	fff00693          	li	a3,-1
 2b0:	fff6a713          	slti	a4,a3,-1
 2b4:	00000393          	li	t2,0
 2b8:	14771063          	bne	a4,t2,3f8 <fail>

000002bc <test_17>:
 2bc:	01100193          	li	gp,17
 2c0:	00b00593          	li	a1,11
 2c4:	00d5a593          	slti	a1,a1,13
 2c8:	00100393          	li	t2,1
 2cc:	12759663          	bne	a1,t2,3f8 <fail>

000002d0 <test_18>:
 2d0:	01200193          	li	gp,18
 2d4:	00000213          	li	tp,0
 2d8:	00f00093          	li	ra,15
 2dc:	00a0a713          	slti	a4,ra,10
 2e0:	00070313          	mv	t1,a4
 2e4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2e8:	00200293          	li	t0,2
 2ec:	fe5216e3          	bne	tp,t0,2d8 <test_18+0x8>
 2f0:	00000393          	li	t2,0
 2f4:	10731263          	bne	t1,t2,3f8 <fail>

000002f8 <test_19>:
 2f8:	01300193          	li	gp,19
 2fc:	00000213          	li	tp,0
 300:	00a00093          	li	ra,10
 304:	0100a713          	slti	a4,ra,16
 308:	00000013          	nop
 30c:	00070313          	mv	t1,a4
 310:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 314:	00200293          	li	t0,2
 318:	fe5214e3          	bne	tp,t0,300 <test_19+0x8>
 31c:	00100393          	li	t2,1
 320:	0c731c63          	bne	t1,t2,3f8 <fail>

00000324 <test_20>:
 324:	01400193          	li	gp,20
 328:	00000213          	li	tp,0
 32c:	01000093          	li	ra,16
 330:	0090a713          	slti	a4,ra,9
 334:	00000013          	nop
 338:	00000013          	nop
 33c:	00070313          	mv	t1,a4
 340:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 344:	00200293          	li	t0,2
 348:	fe5212e3          	bne	tp,t0,32c <test_20+0x8>
 34c:	00000393          	li	t2,0
 350:	0a731463          	bne	t1,t2,3f8 <fail>

00000354 <test_21>:
 354:	01500193          	li	gp,21
 358:	00000213          	li	tp,0
 35c:	00b00093          	li	ra,11
 360:	00f0a713          	slti	a4,ra,15
 364:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 368:	00200293          	li	t0,2
 36c:	fe5218e3          	bne	tp,t0,35c <test_21+0x8>
 370:	00100393          	li	t2,1
 374:	08771263          	bne	a4,t2,3f8 <fail>

00000378 <test_22>:
 378:	01600193          	li	gp,22
 37c:	00000213          	li	tp,0
 380:	01100093          	li	ra,17
 384:	00000013          	nop
 388:	0080a713          	slti	a4,ra,8
 38c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 390:	00200293          	li	t0,2
 394:	fe5216e3          	bne	tp,t0,380 <test_22+0x8>
 398:	00000393          	li	t2,0
 39c:	04771e63          	bne	a4,t2,3f8 <fail>

000003a0 <test_23>:
 3a0:	01700193          	li	gp,23
 3a4:	00000213          	li	tp,0
 3a8:	00c00093          	li	ra,12
 3ac:	00000013          	nop
 3b0:	00000013          	nop
 3b4:	00e0a713          	slti	a4,ra,14
 3b8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3bc:	00200293          	li	t0,2
 3c0:	fe5214e3          	bne	tp,t0,3a8 <test_23+0x8>
 3c4:	00100393          	li	t2,1
 3c8:	02771863          	bne	a4,t2,3f8 <fail>

000003cc <test_24>:
 3cc:	01800193          	li	gp,24
 3d0:	fff02093          	slti	ra,zero,-1
 3d4:	00000393          	li	t2,0
 3d8:	02709063          	bne	ra,t2,3f8 <fail>

000003dc <test_25>:
 3dc:	01900193          	li	gp,25
 3e0:	00ff00b7          	lui	ra,0xff0
 3e4:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefaff>
 3e8:	fff0a013          	slti	zero,ra,-1
 3ec:	00000393          	li	t2,0
 3f0:	00701463          	bne	zero,t2,3f8 <fail>
 3f4:	02301063          	bne	zero,gp,414 <pass>

000003f8 <fail>:
 3f8:	0ff0000f          	fence
 3fc:	00018063          	beqz	gp,3fc <fail+0x4>
 400:	00119193          	slli	gp,gp,0x1
 404:	0011e193          	ori	gp,gp,1
 408:	05d00893          	li	a7,93
 40c:	00018513          	mv	a0,gp
 410:	00000073          	ecall

00000414 <pass>:
 414:	0ff0000f          	fence
 418:	00100193          	li	gp,1
 41c:	05d00893          	li	a7,93
 420:	00000513          	li	a0,0
 424:	00000073          	ecall
 428:	c0001073          	unimp
 42c:	0000                	.insn	2, 0x
 42e:	0000                	.insn	2, 0x
 430:	0000                	.insn	2, 0x
 432:	0000                	.insn	2, 0x
