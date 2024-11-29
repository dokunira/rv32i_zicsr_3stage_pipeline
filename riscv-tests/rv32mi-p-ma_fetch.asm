
rv32mi-p-ma_fetch:     file format elf32-littleriscv


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
  24:	2dcf0f13          	addi	t5,t5,732 # 2fc <mtvec_handler>
  28:	000f0463          	beqz	t5,30 <trap_vector+0x2c>
  2c:	000f0067          	jr	t5
  30:	34202f73          	csrr	t5,mcause
  34:	000f5463          	bgez	t5,3c <handle_exception>
  38:	0040006f          	j	3c <handle_exception>

0000003c <handle_exception>:
  3c:	5391e193          	ori	gp,gp,1337

00000040 <write_tohost>:
  40:	40302023          	sw	gp,1024(zero) # 400 <tohost>
  44:	40002223          	sw	zero,1028(zero) # 404 <tohost+0x4>
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
 100:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffaff>
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
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xac09>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00002537          	lui	a0,0x2
 178:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x1300>
 17c:	30052073          	csrs	mstatus,a0
 180:	00000297          	auipc	t0,0x0
 184:	01428293          	addi	t0,t0,20 # 194 <reset_vector+0x148>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret
 194:	00200193          	li	gp,2
 198:	00000313          	li	t1,0
 19c:	00000297          	auipc	t0,0x0
 1a0:	00c28293          	addi	t0,t0,12 # 1a8 <reset_vector+0x15c>
 1a4:	00228367          	jalr	t1,2(t0)
 1a8:	a011                	j	1ac <reset_vector+0x160>
 1aa:	a019                	j	1b0 <reset_vector+0x164>
 1ac:	1200006f          	j	2cc <fail>
 1b0:	00300193          	li	gp,3
 1b4:	00000297          	auipc	t0,0x0
 1b8:	00c28293          	addi	t0,t0,12 # 1c0 <reset_vector+0x174>
 1bc:	00128367          	jalr	t1,1(t0)
 1c0:	0080006f          	j	1c8 <reset_vector+0x17c>
 1c4:	1080006f          	j	2cc <fail>
 1c8:	00400193          	li	gp,4
 1cc:	00000313          	li	t1,0
 1d0:	00000297          	auipc	t0,0x0
 1d4:	00c28293          	addi	t0,t0,12 # 1dc <reset_vector+0x190>
 1d8:	00328367          	jalr	t1,3(t0)
 1dc:	a011                	j	1e0 <reset_vector+0x194>
 1de:	a019                	j	1e4 <reset_vector+0x198>
 1e0:	0ec0006f          	j	2cc <fail>
 1e4:	00500193          	li	gp,5
 1e8:	00000313          	li	t1,0
 1ec:	00000297          	auipc	t0,0x0
 1f0:	00c28293          	addi	t0,t0,12 # 1f8 <reset_vector+0x1ac>
 1f4:	0060036f          	jal	t1,1fa <reset_vector+0x1ae>
 1f8:	a011                	j	1fc <reset_vector+0x1b0>
 1fa:	a019                	j	200 <reset_vector+0x1b4>
 1fc:	0d00006f          	j	2cc <fail>
 200:	00600193          	li	gp,6
 204:	00000313          	li	t1,0
 208:	00000297          	auipc	t0,0x0
 20c:	00c28293          	addi	t0,t0,12 # 214 <reset_vector+0x1c8>
 210:	00000363          	beqz	zero,216 <reset_vector+0x1ca>
 214:	a011                	j	218 <reset_vector+0x1cc>
 216:	a019                	j	21c <reset_vector+0x1d0>
 218:	0b40006f          	j	2cc <fail>
 21c:	00700193          	li	gp,7
 220:	00001563          	bnez	zero,22a <reset_vector+0x1de>
 224:	00c0006f          	j	230 <reset_vector+0x1e4>
 228:	a009                	j	22a <reset_vector+0x1de>
 22a:	a009                	j	22c <reset_vector+0x1e0>
 22c:	0a00006f          	j	2cc <fail>
 230:	30126073          	csrsi	misa,4
 234:	301023f3          	csrr	t2,misa
 238:	0043f393          	andi	t2,t2,4
 23c:	0a038663          	beqz	t2,2e8 <pass>
 240:	30127073          	csrci	misa,4
 244:	301023f3          	csrr	t2,misa
 248:	0043f393          	andi	t2,t2,4
 24c:	08039e63          	bnez	t2,2e8 <pass>
 250:	305022f3          	csrr	t0,mtvec
 254:	00000317          	auipc	t1,0x0
 258:	01630313          	addi	t1,t1,22 # 26a <reset_vector+0x21e>
 25c:	00230313          	addi	t1,t1,2
 260:	30531073          	csrw	mtvec,t1
 264:	0060006f          	j	26a <reset_vector+0x21e>
 268:	0001                	nop
 26a:	a8bd                	j	2e8 <pass>
 26c:	30529073          	csrw	mtvec,t0
 270:	30126073          	csrsi	misa,4
 274:	00800193          	li	gp,8
 278:	301023f3          	csrr	t2,misa
 27c:	0043f393          	andi	t2,t2,4
 280:	06038463          	beqz	t2,2e8 <pass>
 284:	0001                	nop
 286:	30127073          	csrci	misa,4
 28a:	0001                	nop
 28c:	301023f3          	csrr	t2,misa
 290:	0043f393          	andi	t2,t2,4
 294:	02038c63          	beqz	t2,2cc <fail>
 298:	00000297          	auipc	t0,0x0
 29c:	02828293          	addi	t0,t0,40 # 2c0 <reset_vector+0x274>
 2a0:	ffe28293          	addi	t0,t0,-2
 2a4:	34129073          	csrw	mepc,t0
 2a8:	30127073          	csrci	misa,4
 2ac:	000023b7          	lui	t2,0x2
 2b0:	80038393          	addi	t2,t2,-2048 # 1800 <_end+0x1300>
 2b4:	3003a073          	csrs	mstatus,t2
 2b8:	30200073          	mret
 2bc:	00000263          	beqz	zero,2c0 <reset_vector+0x274>
 2c0:	30126073          	csrsi	misa,4
 2c4:	0240006f          	j	2e8 <pass>
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

000002fc <mtvec_handler>:
 2fc:	00200513          	li	a0,2
 300:	02a18063          	beq	gp,a0,320 <mtvec_handler+0x24>
 304:	00400513          	li	a0,4
 308:	00a18c63          	beq	gp,a0,320 <mtvec_handler+0x24>
 30c:	00500513          	li	a0,5
 310:	00a18863          	beq	gp,a0,320 <mtvec_handler+0x24>
 314:	00600513          	li	a0,6
 318:	00a18463          	beq	gp,a0,320 <mtvec_handler+0x24>
 31c:	fb1ff06f          	j	2cc <fail>
 320:	fa0316e3          	bnez	t1,2cc <fail>
 324:	00000593          	li	a1,0
 328:	34202573          	csrr	a0,mcause
 32c:	fab510e3          	bne	a0,a1,2cc <fail>
 330:	341025f3          	csrr	a1,mepc
 334:	00458593          	addi	a1,a1,4
 338:	f8b29ae3          	bne	t0,a1,2cc <fail>
 33c:	34302573          	csrr	a0,mtval
 340:	00050663          	beqz	a0,34c <mtvec_handler+0x50>
 344:	ffe50513          	addi	a0,a0,-2
 348:	f85512e3          	bne	a0,t0,2cc <fail>
 34c:	00858593          	addi	a1,a1,8
 350:	34159073          	csrw	mepc,a1
 354:	30200073          	mret
 358:	c0001073          	unimp
 35c:	0000                	.insn	2, 0x
 35e:	0000                	.insn	2, 0x
 360:	0000                	.insn	2, 0x
 362:	0000                	.insn	2, 0x
 364:	0000                	.insn	2, 0x
 366:	0000                	.insn	2, 0x
 368:	0000                	.insn	2, 0x
 36a:	0000                	.insn	2, 0x
 36c:	0000                	.insn	2, 0x
 36e:	0000                	.insn	2, 0x
 370:	0000                	.insn	2, 0x
 372:	0000                	.insn	2, 0x
 374:	0000                	.insn	2, 0x
 376:	0000                	.insn	2, 0x
