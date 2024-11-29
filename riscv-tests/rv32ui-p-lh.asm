
rv32ui-p-lh:     file format elf32-littleriscv


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
 190:	00011703          	lh	a4,0(sp)
 194:	0ff00393          	li	t2,255
 198:	24771063          	bne	a4,t2,3d8 <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	f0000793          	li	a5,-256
 1a4:	60000113          	li	sp,1536
 1a8:	00211703          	lh	a4,2(sp)
 1ac:	f0000393          	li	t2,-256
 1b0:	22771463          	bne	a4,t2,3d8 <fail>

000001b4 <test_4>:
 1b4:	00400193          	li	gp,4
 1b8:	000017b7          	lui	a5,0x1
 1bc:	ff078793          	addi	a5,a5,-16 # ff0 <_end+0x9e0>
 1c0:	60000113          	li	sp,1536
 1c4:	00411703          	lh	a4,4(sp)
 1c8:	000013b7          	lui	t2,0x1
 1cc:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 1d0:	20771463          	bne	a4,t2,3d8 <fail>

000001d4 <test_5>:
 1d4:	00500193          	li	gp,5
 1d8:	fffff7b7          	lui	a5,0xfffff
 1dc:	00f78793          	addi	a5,a5,15 # fffff00f <_end+0xffffe9ff>
 1e0:	60000113          	li	sp,1536
 1e4:	00611703          	lh	a4,6(sp)
 1e8:	fffff3b7          	lui	t2,0xfffff
 1ec:	00f38393          	addi	t2,t2,15 # fffff00f <_end+0xffffe9ff>
 1f0:	1e771463          	bne	a4,t2,3d8 <fail>

000001f4 <test_6>:
 1f4:	00600193          	li	gp,6
 1f8:	0ff00793          	li	a5,255
 1fc:	60600113          	li	sp,1542
 200:	ffa11703          	lh	a4,-6(sp)
 204:	0ff00393          	li	t2,255
 208:	1c771863          	bne	a4,t2,3d8 <fail>

0000020c <test_7>:
 20c:	00700193          	li	gp,7
 210:	f0000793          	li	a5,-256
 214:	60600113          	li	sp,1542
 218:	ffc11703          	lh	a4,-4(sp)
 21c:	f0000393          	li	t2,-256
 220:	1a771c63          	bne	a4,t2,3d8 <fail>

00000224 <test_8>:
 224:	00800193          	li	gp,8
 228:	000017b7          	lui	a5,0x1
 22c:	ff078793          	addi	a5,a5,-16 # ff0 <_end+0x9e0>
 230:	60600113          	li	sp,1542
 234:	ffe11703          	lh	a4,-2(sp)
 238:	000013b7          	lui	t2,0x1
 23c:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 240:	18771c63          	bne	a4,t2,3d8 <fail>

00000244 <test_9>:
 244:	00900193          	li	gp,9
 248:	fffff7b7          	lui	a5,0xfffff
 24c:	00f78793          	addi	a5,a5,15 # fffff00f <_end+0xffffe9ff>
 250:	60600113          	li	sp,1542
 254:	00011703          	lh	a4,0(sp)
 258:	fffff3b7          	lui	t2,0xfffff
 25c:	00f38393          	addi	t2,t2,15 # fffff00f <_end+0xffffe9ff>
 260:	16771c63          	bne	a4,t2,3d8 <fail>

00000264 <test_10>:
 264:	00a00193          	li	gp,10
 268:	60000093          	li	ra,1536
 26c:	fe008093          	addi	ra,ra,-32
 270:	02009283          	lh	t0,32(ra)
 274:	0ff00393          	li	t2,255
 278:	16729063          	bne	t0,t2,3d8 <fail>

0000027c <test_11>:
 27c:	00b00193          	li	gp,11
 280:	60000093          	li	ra,1536
 284:	ffb08093          	addi	ra,ra,-5
 288:	00709283          	lh	t0,7(ra)
 28c:	f0000393          	li	t2,-256
 290:	14729463          	bne	t0,t2,3d8 <fail>

00000294 <test_12>:
 294:	00c00193          	li	gp,12
 298:	00000213          	li	tp,0
 29c:	60200693          	li	a3,1538
 2a0:	00269703          	lh	a4,2(a3)
 2a4:	00070313          	mv	t1,a4
 2a8:	000013b7          	lui	t2,0x1
 2ac:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 2b0:	12731463          	bne	t1,t2,3d8 <fail>
 2b4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2b8:	00200293          	li	t0,2
 2bc:	fe5210e3          	bne	tp,t0,29c <test_12+0x8>

000002c0 <test_13>:
 2c0:	00d00193          	li	gp,13
 2c4:	00000213          	li	tp,0
 2c8:	60400693          	li	a3,1540
 2cc:	00269703          	lh	a4,2(a3)
 2d0:	00000013          	nop
 2d4:	00070313          	mv	t1,a4
 2d8:	fffff3b7          	lui	t2,0xfffff
 2dc:	00f38393          	addi	t2,t2,15 # fffff00f <_end+0xffffe9ff>
 2e0:	0e731c63          	bne	t1,t2,3d8 <fail>
 2e4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2e8:	00200293          	li	t0,2
 2ec:	fc521ee3          	bne	tp,t0,2c8 <test_13+0x8>

000002f0 <test_14>:
 2f0:	00e00193          	li	gp,14
 2f4:	00000213          	li	tp,0
 2f8:	60000693          	li	a3,1536
 2fc:	00269703          	lh	a4,2(a3)
 300:	00000013          	nop
 304:	00000013          	nop
 308:	00070313          	mv	t1,a4
 30c:	f0000393          	li	t2,-256
 310:	0c731463          	bne	t1,t2,3d8 <fail>
 314:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 318:	00200293          	li	t0,2
 31c:	fc521ee3          	bne	tp,t0,2f8 <test_14+0x8>

00000320 <test_15>:
 320:	00f00193          	li	gp,15
 324:	00000213          	li	tp,0
 328:	60200693          	li	a3,1538
 32c:	00269703          	lh	a4,2(a3)
 330:	000013b7          	lui	t2,0x1
 334:	ff038393          	addi	t2,t2,-16 # ff0 <_end+0x9e0>
 338:	0a771063          	bne	a4,t2,3d8 <fail>
 33c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 340:	00200293          	li	t0,2
 344:	fe5212e3          	bne	tp,t0,328 <test_15+0x8>

00000348 <test_16>:
 348:	01000193          	li	gp,16
 34c:	00000213          	li	tp,0
 350:	60400693          	li	a3,1540
 354:	00000013          	nop
 358:	00269703          	lh	a4,2(a3)
 35c:	fffff3b7          	lui	t2,0xfffff
 360:	00f38393          	addi	t2,t2,15 # fffff00f <_end+0xffffe9ff>
 364:	06771a63          	bne	a4,t2,3d8 <fail>
 368:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 36c:	00200293          	li	t0,2
 370:	fe5210e3          	bne	tp,t0,350 <test_16+0x8>

00000374 <test_17>:
 374:	01100193          	li	gp,17
 378:	00000213          	li	tp,0
 37c:	60000693          	li	a3,1536
 380:	00000013          	nop
 384:	00000013          	nop
 388:	00269703          	lh	a4,2(a3)
 38c:	f0000393          	li	t2,-256
 390:	04771463          	bne	a4,t2,3d8 <fail>
 394:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 398:	00200293          	li	t0,2
 39c:	fe5210e3          	bne	tp,t0,37c <test_17+0x8>

000003a0 <test_18>:
 3a0:	01200193          	li	gp,18
 3a4:	60000293          	li	t0,1536
 3a8:	00029103          	lh	sp,0(t0)
 3ac:	00200113          	li	sp,2
 3b0:	00200393          	li	t2,2
 3b4:	02711263          	bne	sp,t2,3d8 <fail>

000003b8 <test_19>:
 3b8:	01300193          	li	gp,19
 3bc:	60000293          	li	t0,1536
 3c0:	00029103          	lh	sp,0(t0)
 3c4:	00000013          	nop
 3c8:	00200113          	li	sp,2
 3cc:	00200393          	li	t2,2
 3d0:	00711463          	bne	sp,t2,3d8 <fail>
 3d4:	02301063          	bne	zero,gp,3f4 <pass>

000003d8 <fail>:
 3d8:	0ff0000f          	fence
 3dc:	00018063          	beqz	gp,3dc <fail+0x4>
 3e0:	00119193          	slli	gp,gp,0x1
 3e4:	0011e193          	ori	gp,gp,1
 3e8:	05d00893          	li	a7,93
 3ec:	00018513          	mv	a0,gp
 3f0:	00000073          	ecall

000003f4 <pass>:
 3f4:	0ff0000f          	fence
 3f8:	00100193          	li	gp,1
 3fc:	05d00893          	li	a7,93
 400:	00000513          	li	a0,0
 404:	00000073          	ecall
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
