
rv32ui-p-xori:     file format elf32-littleriscv


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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffaff>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xac09>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	00ff16b7          	lui	a3,0xff1
 18c:	f0068693          	addi	a3,a3,-256 # ff0f00 <_end+0xff0a00>
 190:	f0f6c713          	xori	a4,a3,-241
 194:	ff00f3b7          	lui	t2,0xff00f
 198:	00f38393          	addi	t2,t2,15 # ff00f00f <_end+0xff00eb0f>
 19c:	1c771663          	bne	a4,t2,368 <fail>

000001a0 <test_3>:
 1a0:	00300193          	li	gp,3
 1a4:	0ff016b7          	lui	a3,0xff01
 1a8:	ff068693          	addi	a3,a3,-16 # ff00ff0 <_end+0xff00af0>
 1ac:	0f06c713          	xori	a4,a3,240
 1b0:	0ff013b7          	lui	t2,0xff01
 1b4:	f0038393          	addi	t2,t2,-256 # ff00f00 <_end+0xff00a00>
 1b8:	1a771863          	bne	a4,t2,368 <fail>

000001bc <test_4>:
 1bc:	00400193          	li	gp,4
 1c0:	00ff16b7          	lui	a3,0xff1
 1c4:	8ff68693          	addi	a3,a3,-1793 # ff08ff <_end+0xff03ff>
 1c8:	70f6c713          	xori	a4,a3,1807
 1cc:	00ff13b7          	lui	t2,0xff1
 1d0:	ff038393          	addi	t2,t2,-16 # ff0ff0 <_end+0xff0af0>
 1d4:	18771a63          	bne	a4,t2,368 <fail>

000001d8 <test_5>:
 1d8:	00500193          	li	gp,5
 1dc:	f00ff6b7          	lui	a3,0xf00ff
 1e0:	00f68693          	addi	a3,a3,15 # f00ff00f <_end+0xf00feb0f>
 1e4:	0f06c713          	xori	a4,a3,240
 1e8:	f00ff3b7          	lui	t2,0xf00ff
 1ec:	0ff38393          	addi	t2,t2,255 # f00ff0ff <_end+0xf00febff>
 1f0:	16771c63          	bne	a4,t2,368 <fail>

000001f4 <test_6>:
 1f4:	00600193          	li	gp,6
 1f8:	ff00f5b7          	lui	a1,0xff00f
 1fc:	70058593          	addi	a1,a1,1792 # ff00f700 <_end+0xff00f200>
 200:	70f5c593          	xori	a1,a1,1807
 204:	ff00f3b7          	lui	t2,0xff00f
 208:	00f38393          	addi	t2,t2,15 # ff00f00f <_end+0xff00eb0f>
 20c:	14759e63          	bne	a1,t2,368 <fail>

00000210 <test_7>:
 210:	00700193          	li	gp,7
 214:	00000213          	li	tp,0
 218:	0ff010b7          	lui	ra,0xff01
 21c:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff00af0>
 220:	0f00c713          	xori	a4,ra,240
 224:	00070313          	mv	t1,a4
 228:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 22c:	00200293          	li	t0,2
 230:	fe5214e3          	bne	tp,t0,218 <test_7+0x8>
 234:	0ff013b7          	lui	t2,0xff01
 238:	f0038393          	addi	t2,t2,-256 # ff00f00 <_end+0xff00a00>
 23c:	12731663          	bne	t1,t2,368 <fail>

00000240 <test_8>:
 240:	00800193          	li	gp,8
 244:	00000213          	li	tp,0
 248:	00ff10b7          	lui	ra,0xff1
 24c:	8ff08093          	addi	ra,ra,-1793 # ff08ff <_end+0xff03ff>
 250:	70f0c713          	xori	a4,ra,1807
 254:	00000013          	nop
 258:	00070313          	mv	t1,a4
 25c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 260:	00200293          	li	t0,2
 264:	fe5212e3          	bne	tp,t0,248 <test_8+0x8>
 268:	00ff13b7          	lui	t2,0xff1
 26c:	ff038393          	addi	t2,t2,-16 # ff0ff0 <_end+0xff0af0>
 270:	0e731c63          	bne	t1,t2,368 <fail>

00000274 <test_9>:
 274:	00900193          	li	gp,9
 278:	00000213          	li	tp,0
 27c:	f00ff0b7          	lui	ra,0xf00ff
 280:	00f08093          	addi	ra,ra,15 # f00ff00f <_end+0xf00feb0f>
 284:	0f00c713          	xori	a4,ra,240
 288:	00000013          	nop
 28c:	00000013          	nop
 290:	00070313          	mv	t1,a4
 294:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 298:	00200293          	li	t0,2
 29c:	fe5210e3          	bne	tp,t0,27c <test_9+0x8>
 2a0:	f00ff3b7          	lui	t2,0xf00ff
 2a4:	0ff38393          	addi	t2,t2,255 # f00ff0ff <_end+0xf00febff>
 2a8:	0c731063          	bne	t1,t2,368 <fail>

000002ac <test_10>:
 2ac:	00a00193          	li	gp,10
 2b0:	00000213          	li	tp,0
 2b4:	0ff010b7          	lui	ra,0xff01
 2b8:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff00af0>
 2bc:	0f00c713          	xori	a4,ra,240
 2c0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2c4:	00200293          	li	t0,2
 2c8:	fe5216e3          	bne	tp,t0,2b4 <test_10+0x8>
 2cc:	0ff013b7          	lui	t2,0xff01
 2d0:	f0038393          	addi	t2,t2,-256 # ff00f00 <_end+0xff00a00>
 2d4:	08771a63          	bne	a4,t2,368 <fail>

000002d8 <test_11>:
 2d8:	00b00193          	li	gp,11
 2dc:	00000213          	li	tp,0
 2e0:	00ff10b7          	lui	ra,0xff1
 2e4:	fff08093          	addi	ra,ra,-1 # ff0fff <_end+0xff0aff>
 2e8:	00000013          	nop
 2ec:	00f0c713          	xori	a4,ra,15
 2f0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2f4:	00200293          	li	t0,2
 2f8:	fe5214e3          	bne	tp,t0,2e0 <test_11+0x8>
 2fc:	00ff13b7          	lui	t2,0xff1
 300:	ff038393          	addi	t2,t2,-16 # ff0ff0 <_end+0xff0af0>
 304:	06771263          	bne	a4,t2,368 <fail>

00000308 <test_12>:
 308:	00c00193          	li	gp,12
 30c:	00000213          	li	tp,0
 310:	f00ff0b7          	lui	ra,0xf00ff
 314:	00f08093          	addi	ra,ra,15 # f00ff00f <_end+0xf00feb0f>
 318:	00000013          	nop
 31c:	00000013          	nop
 320:	0f00c713          	xori	a4,ra,240
 324:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 328:	00200293          	li	t0,2
 32c:	fe5212e3          	bne	tp,t0,310 <test_12+0x8>
 330:	f00ff3b7          	lui	t2,0xf00ff
 334:	0ff38393          	addi	t2,t2,255 # f00ff0ff <_end+0xf00febff>
 338:	02771863          	bne	a4,t2,368 <fail>

0000033c <test_13>:
 33c:	00d00193          	li	gp,13
 340:	0f004093          	xori	ra,zero,240
 344:	0f000393          	li	t2,240
 348:	02709063          	bne	ra,t2,368 <fail>

0000034c <test_14>:
 34c:	00e00193          	li	gp,14
 350:	00ff00b7          	lui	ra,0xff0
 354:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 358:	70f0c013          	xori	zero,ra,1807
 35c:	00000393          	li	t2,0
 360:	00701463          	bne	zero,t2,368 <fail>
 364:	02301063          	bne	zero,gp,384 <pass>

00000368 <fail>:
 368:	0ff0000f          	fence
 36c:	00018063          	beqz	gp,36c <fail+0x4>
 370:	00119193          	slli	gp,gp,0x1
 374:	0011e193          	ori	gp,gp,1
 378:	05d00893          	li	a7,93
 37c:	00018513          	mv	a0,gp
 380:	00000073          	ecall

00000384 <pass>:
 384:	0ff0000f          	fence
 388:	00100193          	li	gp,1
 38c:	05d00893          	li	a7,93
 390:	00000513          	li	a0,0
 394:	00000073          	ecall
 398:	c0001073          	unimp
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
