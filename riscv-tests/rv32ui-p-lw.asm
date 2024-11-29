
rv32ui-p-lw:     file format elf32-littleriscv


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
 188:	00ff07b7          	lui	a5,0xff0
 18c:	0ff78793          	addi	a5,a5,255 # ff00ff <_end+0xfefaef>
 190:	60000113          	li	sp,1536
 194:	00012703          	lw	a4,0(sp)
 198:	00ff03b7          	lui	t2,0xff0
 19c:	0ff38393          	addi	t2,t2,255 # ff00ff <_end+0xfefaef>
 1a0:	26771463          	bne	a4,t2,408 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	ff0107b7          	lui	a5,0xff010
 1ac:	f0078793          	addi	a5,a5,-256 # ff00ff00 <_end+0xff00f8f0>
 1b0:	60000113          	li	sp,1536
 1b4:	00412703          	lw	a4,4(sp)
 1b8:	ff0103b7          	lui	t2,0xff010
 1bc:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f8f0>
 1c0:	24771463          	bne	a4,t2,408 <fail>

000001c4 <test_4>:
 1c4:	00400193          	li	gp,4
 1c8:	0ff017b7          	lui	a5,0xff01
 1cc:	ff078793          	addi	a5,a5,-16 # ff00ff0 <_end+0xff009e0>
 1d0:	60000113          	li	sp,1536
 1d4:	00812703          	lw	a4,8(sp)
 1d8:	0ff013b7          	lui	t2,0xff01
 1dc:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff009e0>
 1e0:	22771463          	bne	a4,t2,408 <fail>

000001e4 <test_5>:
 1e4:	00500193          	li	gp,5
 1e8:	f00ff7b7          	lui	a5,0xf00ff
 1ec:	00f78793          	addi	a5,a5,15 # f00ff00f <_end+0xf00fe9ff>
 1f0:	60000113          	li	sp,1536
 1f4:	00c12703          	lw	a4,12(sp)
 1f8:	f00ff3b7          	lui	t2,0xf00ff
 1fc:	00f38393          	addi	t2,t2,15 # f00ff00f <_end+0xf00fe9ff>
 200:	20771463          	bne	a4,t2,408 <fail>

00000204 <test_6>:
 204:	00600193          	li	gp,6
 208:	00ff07b7          	lui	a5,0xff0
 20c:	0ff78793          	addi	a5,a5,255 # ff00ff <_end+0xfefaef>
 210:	60c00113          	li	sp,1548
 214:	ff412703          	lw	a4,-12(sp)
 218:	00ff03b7          	lui	t2,0xff0
 21c:	0ff38393          	addi	t2,t2,255 # ff00ff <_end+0xfefaef>
 220:	1e771463          	bne	a4,t2,408 <fail>

00000224 <test_7>:
 224:	00700193          	li	gp,7
 228:	ff0107b7          	lui	a5,0xff010
 22c:	f0078793          	addi	a5,a5,-256 # ff00ff00 <_end+0xff00f8f0>
 230:	60c00113          	li	sp,1548
 234:	ff812703          	lw	a4,-8(sp)
 238:	ff0103b7          	lui	t2,0xff010
 23c:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f8f0>
 240:	1c771463          	bne	a4,t2,408 <fail>

00000244 <test_8>:
 244:	00800193          	li	gp,8
 248:	0ff017b7          	lui	a5,0xff01
 24c:	ff078793          	addi	a5,a5,-16 # ff00ff0 <_end+0xff009e0>
 250:	60c00113          	li	sp,1548
 254:	ffc12703          	lw	a4,-4(sp)
 258:	0ff013b7          	lui	t2,0xff01
 25c:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff009e0>
 260:	1a771463          	bne	a4,t2,408 <fail>

00000264 <test_9>:
 264:	00900193          	li	gp,9
 268:	f00ff7b7          	lui	a5,0xf00ff
 26c:	00f78793          	addi	a5,a5,15 # f00ff00f <_end+0xf00fe9ff>
 270:	60c00113          	li	sp,1548
 274:	00012703          	lw	a4,0(sp)
 278:	f00ff3b7          	lui	t2,0xf00ff
 27c:	00f38393          	addi	t2,t2,15 # f00ff00f <_end+0xf00fe9ff>
 280:	18771463          	bne	a4,t2,408 <fail>

00000284 <test_10>:
 284:	00a00193          	li	gp,10
 288:	60000093          	li	ra,1536
 28c:	fe008093          	addi	ra,ra,-32
 290:	0200a283          	lw	t0,32(ra)
 294:	00ff03b7          	lui	t2,0xff0
 298:	0ff38393          	addi	t2,t2,255 # ff00ff <_end+0xfefaef>
 29c:	16729663          	bne	t0,t2,408 <fail>

000002a0 <test_11>:
 2a0:	00b00193          	li	gp,11
 2a4:	60000093          	li	ra,1536
 2a8:	ffd08093          	addi	ra,ra,-3
 2ac:	0070a283          	lw	t0,7(ra)
 2b0:	ff0103b7          	lui	t2,0xff010
 2b4:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f8f0>
 2b8:	14729863          	bne	t0,t2,408 <fail>

000002bc <test_12>:
 2bc:	00c00193          	li	gp,12
 2c0:	00000213          	li	tp,0
 2c4:	60400693          	li	a3,1540
 2c8:	0046a703          	lw	a4,4(a3)
 2cc:	00070313          	mv	t1,a4
 2d0:	0ff013b7          	lui	t2,0xff01
 2d4:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff009e0>
 2d8:	12731863          	bne	t1,t2,408 <fail>
 2dc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2e0:	00200293          	li	t0,2
 2e4:	fe5210e3          	bne	tp,t0,2c4 <test_12+0x8>

000002e8 <test_13>:
 2e8:	00d00193          	li	gp,13
 2ec:	00000213          	li	tp,0
 2f0:	60800693          	li	a3,1544
 2f4:	0046a703          	lw	a4,4(a3)
 2f8:	00000013          	nop
 2fc:	00070313          	mv	t1,a4
 300:	f00ff3b7          	lui	t2,0xf00ff
 304:	00f38393          	addi	t2,t2,15 # f00ff00f <_end+0xf00fe9ff>
 308:	10731063          	bne	t1,t2,408 <fail>
 30c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 310:	00200293          	li	t0,2
 314:	fc521ee3          	bne	tp,t0,2f0 <test_13+0x8>

00000318 <test_14>:
 318:	00e00193          	li	gp,14
 31c:	00000213          	li	tp,0
 320:	60000693          	li	a3,1536
 324:	0046a703          	lw	a4,4(a3)
 328:	00000013          	nop
 32c:	00000013          	nop
 330:	00070313          	mv	t1,a4
 334:	ff0103b7          	lui	t2,0xff010
 338:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f8f0>
 33c:	0c731663          	bne	t1,t2,408 <fail>
 340:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 344:	00200293          	li	t0,2
 348:	fc521ce3          	bne	tp,t0,320 <test_14+0x8>

0000034c <test_15>:
 34c:	00f00193          	li	gp,15
 350:	00000213          	li	tp,0
 354:	60400693          	li	a3,1540
 358:	0046a703          	lw	a4,4(a3)
 35c:	0ff013b7          	lui	t2,0xff01
 360:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff009e0>
 364:	0a771263          	bne	a4,t2,408 <fail>
 368:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 36c:	00200293          	li	t0,2
 370:	fe5212e3          	bne	tp,t0,354 <test_15+0x8>

00000374 <test_16>:
 374:	01000193          	li	gp,16
 378:	00000213          	li	tp,0
 37c:	60800693          	li	a3,1544
 380:	00000013          	nop
 384:	0046a703          	lw	a4,4(a3)
 388:	f00ff3b7          	lui	t2,0xf00ff
 38c:	00f38393          	addi	t2,t2,15 # f00ff00f <_end+0xf00fe9ff>
 390:	06771c63          	bne	a4,t2,408 <fail>
 394:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 398:	00200293          	li	t0,2
 39c:	fe5210e3          	bne	tp,t0,37c <test_16+0x8>

000003a0 <test_17>:
 3a0:	01100193          	li	gp,17
 3a4:	00000213          	li	tp,0
 3a8:	60000693          	li	a3,1536
 3ac:	00000013          	nop
 3b0:	00000013          	nop
 3b4:	0046a703          	lw	a4,4(a3)
 3b8:	ff0103b7          	lui	t2,0xff010
 3bc:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00f8f0>
 3c0:	04771463          	bne	a4,t2,408 <fail>
 3c4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3c8:	00200293          	li	t0,2
 3cc:	fc521ee3          	bne	tp,t0,3a8 <test_17+0x8>

000003d0 <test_18>:
 3d0:	01200193          	li	gp,18
 3d4:	60000293          	li	t0,1536
 3d8:	0002a103          	lw	sp,0(t0)
 3dc:	00200113          	li	sp,2
 3e0:	00200393          	li	t2,2
 3e4:	02711263          	bne	sp,t2,408 <fail>

000003e8 <test_19>:
 3e8:	01300193          	li	gp,19
 3ec:	60000293          	li	t0,1536
 3f0:	0002a103          	lw	sp,0(t0)
 3f4:	00000013          	nop
 3f8:	00200113          	li	sp,2
 3fc:	00200393          	li	t2,2
 400:	00711463          	bne	sp,t2,408 <fail>
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

Disassembly of section .data:

00000600 <begin_signature>:
 600:	00ff 00ff   	.insn	10, 0x0ff0ff00ff0000ff00ff
 608:	 

00000604 <tdat2>:
 604:	ff00                	.insn	2, 0xff00
 606:	ff00                	.insn	2, 0xff00

00000608 <tdat3>:
 608:	0ff0                	.insn	2, 0x0ff0
 60a:	0ff0                	.insn	2, 0x0ff0

0000060c <tdat4>:
 60c:	f00ff00f          	.insn	4, 0xf00ff00f
