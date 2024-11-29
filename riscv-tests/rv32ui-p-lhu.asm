
rv32ui-p-lhu:     file format elf32-littleriscv


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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff9ef>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xaaf9>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	0ff00793          	li	a5,255
 18c:	60000113          	li	sp,1536
 190:	00015703          	lhu	a4,0(sp)
 194:	0ff00393          	li	t2,255
 198:	24771e63          	bne	a4,t2,3f4 <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	000107b7          	lui	a5,0x10
 1a4:	f0078793          	addi	a5,a5,-256 # ff00 <_end+0xf8f0>
 1a8:	60000113          	li	sp,1536
 1ac:	00215703          	lhu	a4,2(sp)
 1b0:	000103b7          	lui	t2,0x10
 1b4:	f0038393          	addi	t2,t2,-256 # ff00 <_end+0xf8f0>
 1b8:	22771e63          	bne	a4,t2,3f4 <fail>

000001bc <test_4>:
 1bc:	00400193          	li	gp,4
 1c0:	000017b7          	lui	a5,0x1
 1c4:	ff078793          	addi	a5,a5,-16 # ff0 <_end+0x9e0>
 1c8:	60000113          	li	sp,1536
 1cc:	00415703          	lhu	a4,4(sp)
 1d0:	000013b7          	lui	t2,0x1
 1d4:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 1d8:	20771e63          	bne	a4,t2,3f4 <fail>

000001dc <test_5>:
 1dc:	00500193          	li	gp,5
 1e0:	0000f7b7          	lui	a5,0xf
 1e4:	00f78793          	addi	a5,a5,15 # f00f <_end+0xe9ff>
 1e8:	60000113          	li	sp,1536
 1ec:	00615703          	lhu	a4,6(sp)
 1f0:	0000f3b7          	lui	t2,0xf
 1f4:	00f38393          	addi	t2,t2,15 # f00f <_end+0xe9ff>
 1f8:	1e771e63          	bne	a4,t2,3f4 <fail>

000001fc <test_6>:
 1fc:	00600193          	li	gp,6
 200:	0ff00793          	li	a5,255
 204:	60600113          	li	sp,1542
 208:	ffa15703          	lhu	a4,-6(sp)
 20c:	0ff00393          	li	t2,255
 210:	1e771263          	bne	a4,t2,3f4 <fail>

00000214 <test_7>:
 214:	00700193          	li	gp,7
 218:	000107b7          	lui	a5,0x10
 21c:	f0078793          	addi	a5,a5,-256 # ff00 <_end+0xf8f0>
 220:	60600113          	li	sp,1542
 224:	ffc15703          	lhu	a4,-4(sp)
 228:	000103b7          	lui	t2,0x10
 22c:	f0038393          	addi	t2,t2,-256 # ff00 <_end+0xf8f0>
 230:	1c771263          	bne	a4,t2,3f4 <fail>

00000234 <test_8>:
 234:	00800193          	li	gp,8
 238:	000017b7          	lui	a5,0x1
 23c:	ff078793          	addi	a5,a5,-16 # ff0 <_end+0x9e0>
 240:	60600113          	li	sp,1542
 244:	ffe15703          	lhu	a4,-2(sp)
 248:	000013b7          	lui	t2,0x1
 24c:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 250:	1a771263          	bne	a4,t2,3f4 <fail>

00000254 <test_9>:
 254:	00900193          	li	gp,9
 258:	0000f7b7          	lui	a5,0xf
 25c:	00f78793          	addi	a5,a5,15 # f00f <_end+0xe9ff>
 260:	60600113          	li	sp,1542
 264:	00015703          	lhu	a4,0(sp)
 268:	0000f3b7          	lui	t2,0xf
 26c:	00f38393          	addi	t2,t2,15 # f00f <_end+0xe9ff>
 270:	18771263          	bne	a4,t2,3f4 <fail>

00000274 <test_10>:
 274:	00a00193          	li	gp,10
 278:	60000093          	li	ra,1536
 27c:	fe008093          	addi	ra,ra,-32
 280:	0200d283          	lhu	t0,32(ra)
 284:	0ff00393          	li	t2,255
 288:	16729663          	bne	t0,t2,3f4 <fail>

0000028c <test_11>:
 28c:	00b00193          	li	gp,11
 290:	60000093          	li	ra,1536
 294:	ffb08093          	addi	ra,ra,-5
 298:	0070d283          	lhu	t0,7(ra)
 29c:	000103b7          	lui	t2,0x10
 2a0:	f0038393          	addi	t2,t2,-256 # ff00 <_end+0xf8f0>
 2a4:	14729863          	bne	t0,t2,3f4 <fail>

000002a8 <test_12>:
 2a8:	00c00193          	li	gp,12
 2ac:	00000213          	li	tp,0
 2b0:	60200693          	li	a3,1538
 2b4:	0026d703          	lhu	a4,2(a3)
 2b8:	00070313          	mv	t1,a4
 2bc:	000013b7          	lui	t2,0x1
 2c0:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 2c4:	12731863          	bne	t1,t2,3f4 <fail>
 2c8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2cc:	00200293          	li	t0,2
 2d0:	fe5210e3          	bne	tp,t0,2b0 <test_12+0x8>

000002d4 <test_13>:
 2d4:	00d00193          	li	gp,13
 2d8:	00000213          	li	tp,0
 2dc:	60400693          	li	a3,1540
 2e0:	0026d703          	lhu	a4,2(a3)
 2e4:	00000013          	nop
 2e8:	00070313          	mv	t1,a4
 2ec:	0000f3b7          	lui	t2,0xf
 2f0:	00f38393          	addi	t2,t2,15 # f00f <_end+0xe9ff>
 2f4:	10731063          	bne	t1,t2,3f4 <fail>
 2f8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2fc:	00200293          	li	t0,2
 300:	fc521ee3          	bne	tp,t0,2dc <test_13+0x8>

00000304 <test_14>:
 304:	00e00193          	li	gp,14
 308:	00000213          	li	tp,0
 30c:	60000693          	li	a3,1536
 310:	0026d703          	lhu	a4,2(a3)
 314:	00000013          	nop
 318:	00000013          	nop
 31c:	00070313          	mv	t1,a4
 320:	000103b7          	lui	t2,0x10
 324:	f0038393          	addi	t2,t2,-256 # ff00 <_end+0xf8f0>
 328:	0c731663          	bne	t1,t2,3f4 <fail>
 32c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 330:	00200293          	li	t0,2
 334:	fc521ce3          	bne	tp,t0,30c <test_14+0x8>

00000338 <test_15>:
 338:	00f00193          	li	gp,15
 33c:	00000213          	li	tp,0
 340:	60200693          	li	a3,1538
 344:	0026d703          	lhu	a4,2(a3)
 348:	000013b7          	lui	t2,0x1
 34c:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 350:	0a771263          	bne	a4,t2,3f4 <fail>
 354:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 358:	00200293          	li	t0,2
 35c:	fe5212e3          	bne	tp,t0,340 <test_15+0x8>

00000360 <test_16>:
 360:	01000193          	li	gp,16
 364:	00000213          	li	tp,0
 368:	60400693          	li	a3,1540
 36c:	00000013          	nop
 370:	0026d703          	lhu	a4,2(a3)
 374:	0000f3b7          	lui	t2,0xf
 378:	00f38393          	addi	t2,t2,15 # f00f <_end+0xe9ff>
 37c:	06771c63          	bne	a4,t2,3f4 <fail>
 380:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 384:	00200293          	li	t0,2
 388:	fe5210e3          	bne	tp,t0,368 <test_16+0x8>

0000038c <test_17>:
 38c:	01100193          	li	gp,17
 390:	00000213          	li	tp,0
 394:	60000693          	li	a3,1536
 398:	00000013          	nop
 39c:	00000013          	nop
 3a0:	0026d703          	lhu	a4,2(a3)
 3a4:	000103b7          	lui	t2,0x10
 3a8:	f0038393          	addi	t2,t2,-256 # ff00 <_end+0xf8f0>
 3ac:	04771463          	bne	a4,t2,3f4 <fail>
 3b0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3b4:	00200293          	li	t0,2
 3b8:	fc521ee3          	bne	tp,t0,394 <test_17+0x8>

000003bc <test_18>:
 3bc:	01200193          	li	gp,18
 3c0:	60000293          	li	t0,1536
 3c4:	0002d103          	lhu	sp,0(t0)
 3c8:	00200113          	li	sp,2
 3cc:	00200393          	li	t2,2
 3d0:	02711263          	bne	sp,t2,3f4 <fail>

000003d4 <test_19>:
 3d4:	01300193          	li	gp,19
 3d8:	60000293          	li	t0,1536
 3dc:	0002d103          	lhu	sp,0(t0)
 3e0:	00000013          	nop
 3e4:	00200113          	li	sp,2
 3e8:	00200393          	li	t2,2
 3ec:	00711463          	bne	sp,t2,3f4 <fail>
 3f0:	02301063          	bne	zero,gp,410 <pass>

000003f4 <fail>:
 3f4:	0ff0000f          	fence
 3f8:	00018063          	beqz	gp,3f8 <fail+0x4>
 3fc:	00119193          	slli	gp,gp,0x1
 400:	0011e193          	ori	gp,gp,1
 404:	05d00893          	li	a7,93
 408:	00018513          	mv	a0,gp
 40c:	00000073          	ecall

00000410 <pass>:
 410:	0ff0000f          	fence
 414:	00100193          	li	gp,1
 418:	05d00893          	li	a7,93
 41c:	00000513          	li	a0,0
 420:	00000073          	ecall
 424:	c0001073          	unimp
 428:	0000                	.insn	2, 0x
 42a:	0000                	.insn	2, 0x

Disassembly of section .data:

00000600 <begin_signature>:
 600:	00ff    	.insn	10, 0xf00f0ff0ff0000ff
 608:	 

00000602 <tdat2>:
 602:	ff00                	.insn	2, 0xff00

00000604 <tdat3>:
 604:	0ff0                	.insn	2, 0x0ff0

00000606 <tdat4>:
 606:	0000f00f          	.insn	4, 0xf00f
 60a:	0000                	.insn	2, 0x
 60c:	0000                	.insn	2, 0x
 60e:	0000                	.insn	2, 0x
