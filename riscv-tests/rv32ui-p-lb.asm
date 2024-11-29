
rv32ui-p-lb:     file format elf32-littleriscv


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
  3c:	40302023          	sw	gp,1024(zero) # 400 <tohost>
  40:	40002223          	sw	zero,1028(zero) # 404 <tohost+0x4>
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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffaef>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xabf9>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	fff00793          	li	a5,-1
 18c:	50000113          	li	sp,1280
 190:	00010703          	lb	a4,0(sp)
 194:	fff00393          	li	t2,-1
 198:	20771863          	bne	a4,t2,3a8 <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	00000793          	li	a5,0
 1a4:	50000113          	li	sp,1280
 1a8:	00110703          	lb	a4,1(sp)
 1ac:	00000393          	li	t2,0
 1b0:	1e771c63          	bne	a4,t2,3a8 <fail>

000001b4 <test_4>:
 1b4:	00400193          	li	gp,4
 1b8:	ff000793          	li	a5,-16
 1bc:	50000113          	li	sp,1280
 1c0:	00210703          	lb	a4,2(sp)
 1c4:	ff000393          	li	t2,-16
 1c8:	1e771063          	bne	a4,t2,3a8 <fail>

000001cc <test_5>:
 1cc:	00500193          	li	gp,5
 1d0:	00f00793          	li	a5,15
 1d4:	50000113          	li	sp,1280
 1d8:	00310703          	lb	a4,3(sp)
 1dc:	00f00393          	li	t2,15
 1e0:	1c771463          	bne	a4,t2,3a8 <fail>

000001e4 <test_6>:
 1e4:	00600193          	li	gp,6
 1e8:	fff00793          	li	a5,-1
 1ec:	50300113          	li	sp,1283
 1f0:	ffd10703          	lb	a4,-3(sp)
 1f4:	fff00393          	li	t2,-1
 1f8:	1a771863          	bne	a4,t2,3a8 <fail>

000001fc <test_7>:
 1fc:	00700193          	li	gp,7
 200:	00000793          	li	a5,0
 204:	50300113          	li	sp,1283
 208:	ffe10703          	lb	a4,-2(sp)
 20c:	00000393          	li	t2,0
 210:	18771c63          	bne	a4,t2,3a8 <fail>

00000214 <test_8>:
 214:	00800193          	li	gp,8
 218:	ff000793          	li	a5,-16
 21c:	50300113          	li	sp,1283
 220:	fff10703          	lb	a4,-1(sp)
 224:	ff000393          	li	t2,-16
 228:	18771063          	bne	a4,t2,3a8 <fail>

0000022c <test_9>:
 22c:	00900193          	li	gp,9
 230:	00f00793          	li	a5,15
 234:	50300113          	li	sp,1283
 238:	00010703          	lb	a4,0(sp)
 23c:	00f00393          	li	t2,15
 240:	16771463          	bne	a4,t2,3a8 <fail>

00000244 <test_10>:
 244:	00a00193          	li	gp,10
 248:	50000093          	li	ra,1280
 24c:	fe008093          	addi	ra,ra,-32
 250:	02008283          	lb	t0,32(ra)
 254:	fff00393          	li	t2,-1
 258:	14729863          	bne	t0,t2,3a8 <fail>

0000025c <test_11>:
 25c:	00b00193          	li	gp,11
 260:	50000093          	li	ra,1280
 264:	ffa08093          	addi	ra,ra,-6
 268:	00708283          	lb	t0,7(ra)
 26c:	00000393          	li	t2,0
 270:	12729c63          	bne	t0,t2,3a8 <fail>

00000274 <test_12>:
 274:	00c00193          	li	gp,12
 278:	00000213          	li	tp,0
 27c:	50100693          	li	a3,1281
 280:	00168703          	lb	a4,1(a3)
 284:	00070313          	mv	t1,a4
 288:	ff000393          	li	t2,-16
 28c:	10731e63          	bne	t1,t2,3a8 <fail>
 290:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 294:	00200293          	li	t0,2
 298:	fe5212e3          	bne	tp,t0,27c <test_12+0x8>

0000029c <test_13>:
 29c:	00d00193          	li	gp,13
 2a0:	00000213          	li	tp,0
 2a4:	50200693          	li	a3,1282
 2a8:	00168703          	lb	a4,1(a3)
 2ac:	00000013          	nop
 2b0:	00070313          	mv	t1,a4
 2b4:	00f00393          	li	t2,15
 2b8:	0e731863          	bne	t1,t2,3a8 <fail>
 2bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2c0:	00200293          	li	t0,2
 2c4:	fe5210e3          	bne	tp,t0,2a4 <test_13+0x8>

000002c8 <test_14>:
 2c8:	00e00193          	li	gp,14
 2cc:	00000213          	li	tp,0
 2d0:	50000693          	li	a3,1280
 2d4:	00168703          	lb	a4,1(a3)
 2d8:	00000013          	nop
 2dc:	00000013          	nop
 2e0:	00070313          	mv	t1,a4
 2e4:	00000393          	li	t2,0
 2e8:	0c731063          	bne	t1,t2,3a8 <fail>
 2ec:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2f0:	00200293          	li	t0,2
 2f4:	fc521ee3          	bne	tp,t0,2d0 <test_14+0x8>

000002f8 <test_15>:
 2f8:	00f00193          	li	gp,15
 2fc:	00000213          	li	tp,0
 300:	50100693          	li	a3,1281
 304:	00168703          	lb	a4,1(a3)
 308:	ff000393          	li	t2,-16
 30c:	08771e63          	bne	a4,t2,3a8 <fail>
 310:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 314:	00200293          	li	t0,2
 318:	fe5214e3          	bne	tp,t0,300 <test_15+0x8>

0000031c <test_16>:
 31c:	01000193          	li	gp,16
 320:	00000213          	li	tp,0
 324:	50200693          	li	a3,1282
 328:	00000013          	nop
 32c:	00168703          	lb	a4,1(a3)
 330:	00f00393          	li	t2,15
 334:	06771a63          	bne	a4,t2,3a8 <fail>
 338:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 33c:	00200293          	li	t0,2
 340:	fe5212e3          	bne	tp,t0,324 <test_16+0x8>

00000344 <test_17>:
 344:	01100193          	li	gp,17
 348:	00000213          	li	tp,0
 34c:	50000693          	li	a3,1280
 350:	00000013          	nop
 354:	00000013          	nop
 358:	00168703          	lb	a4,1(a3)
 35c:	00000393          	li	t2,0
 360:	04771463          	bne	a4,t2,3a8 <fail>
 364:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 368:	00200293          	li	t0,2
 36c:	fe5210e3          	bne	tp,t0,34c <test_17+0x8>

00000370 <test_18>:
 370:	01200193          	li	gp,18
 374:	50000293          	li	t0,1280
 378:	00028103          	lb	sp,0(t0)
 37c:	00200113          	li	sp,2
 380:	00200393          	li	t2,2
 384:	02711263          	bne	sp,t2,3a8 <fail>

00000388 <test_19>:
 388:	01300193          	li	gp,19
 38c:	50000293          	li	t0,1280
 390:	00028103          	lb	sp,0(t0)
 394:	00000013          	nop
 398:	00200113          	li	sp,2
 39c:	00200393          	li	t2,2
 3a0:	00711463          	bne	sp,t2,3a8 <fail>
 3a4:	02301063          	bne	zero,gp,3c4 <pass>

000003a8 <fail>:
 3a8:	0ff0000f          	fence
 3ac:	00018063          	beqz	gp,3ac <fail+0x4>
 3b0:	00119193          	slli	gp,gp,0x1
 3b4:	0011e193          	ori	gp,gp,1
 3b8:	05d00893          	li	a7,93
 3bc:	00018513          	mv	a0,gp
 3c0:	00000073          	ecall

000003c4 <pass>:
 3c4:	0ff0000f          	fence
 3c8:	00100193          	li	gp,1
 3cc:	05d00893          	li	a7,93
 3d0:	00000513          	li	a0,0
 3d4:	00000073          	ecall
 3d8:	c0001073          	unimp
 3dc:	0000                	.insn	2, 0x
 3de:	0000                	.insn	2, 0x
 3e0:	0000                	.insn	2, 0x
 3e2:	0000                	.insn	2, 0x
 3e4:	0000                	.insn	2, 0x
 3e6:	0000                	.insn	2, 0x
 3e8:	0000                	.insn	2, 0x
 3ea:	0000                	.insn	2, 0x

Disassembly of section .data:

00000500 <begin_signature>:
 500:	    	.insn	10, 0x0ff000ff
 508:	 

00000501 <tdat2>:
 501:	                	.insn	2, 0xf000

00000502 <tdat3>:
 502:	                	.insn	2, 0x0ff0

00000503 <tdat4>:
 503:	0000000f          	fence	unknown,unknown
 507:	0000                	.insn	2, 0x
 509:	0000                	.insn	2, 0x
 50b:	0000                	.insn	2, 0x
 50d:	0000                	.insn	2, 0x
 50f:	Address 0x50f is out of bounds.

