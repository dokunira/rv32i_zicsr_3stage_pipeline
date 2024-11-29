
rv32mi-p-breakpoint:     file format elf32-littleriscv


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
  24:	2a0f0f13          	addi	t5,t5,672 # 2c0 <mtvec_handler>
  28:	000f0463          	beqz	t5,30 <trap_vector+0x2c>
  2c:	000f0067          	jr	t5
  30:	34202f73          	csrr	t5,mcause
  34:	000f5463          	bgez	t5,3c <handle_exception>
  38:	0040006f          	j	3c <handle_exception>

0000003c <handle_exception>:
  3c:	5391e193          	ori	gp,gp,1337

00000040 <write_tohost>:
  40:	30302023          	sw	gp,768(zero) # 300 <tohost>
  44:	30002223          	sw	zero,772(zero) # 304 <tohost+0x4>
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
 100:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffbef>
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
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xacf9>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00002537          	lui	a0,0x2
 178:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x13f0>
 17c:	30052073          	csrs	mstatus,a0
 180:	00000297          	auipc	t0,0x0
 184:	01428293          	addi	t0,t0,20 # 194 <reset_vector+0x148>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret
 194:	00200193          	li	gp,2
 198:	00000517          	auipc	a0,0x0
 19c:	01450513          	addi	a0,a0,20 # 1ac <reset_vector+0x160>
 1a0:	30551573          	csrrw	a0,mtvec,a0
 1a4:	00800593          	li	a1,8
 1a8:	7a55a073          	csrs	tcontrol,a1
 1ac:	30551073          	csrw	mtvec,a0
 1b0:	30046073          	csrsi	mstatus,8
 1b4:	7a001073          	csrw	tselect,zero
 1b8:	7a0025f3          	csrr	a1,tselect
 1bc:	0eb01863          	bne	zero,a1,2ac <pass>
 1c0:	00000617          	auipc	a2,0x0
 1c4:	02060613          	addi	a2,a2,32 # 1e0 <reset_vector+0x194>
 1c8:	7a261073          	csrw	tdata2,a2
 1cc:	20000537          	lui	a0,0x20000
 1d0:	04450513          	addi	a0,a0,68 # 20000044 <_end+0x1ffffc34>
 1d4:	7a151073          	csrw	tdata1,a0
 1d8:	7a1025f3          	csrr	a1,tdata1
 1dc:	00b51863          	bne	a0,a1,1ec <reset_vector+0x1a0>
 1e0:	0a000863          	beqz	zero,290 <fail>
 1e4:	00300193          	li	gp,3
 1e8:	00062503          	lw	a0,0(a2)
 1ec:	00400193          	li	gp,4
 1f0:	20000537          	lui	a0,0x20000
 1f4:	04150513          	addi	a0,a0,65 # 20000041 <_end+0x1ffffc31>
 1f8:	7a151073          	csrw	tdata1,a0
 1fc:	7a1025f3          	csrr	a1,tdata1
 200:	00b51e63          	bne	a0,a1,21c <reset_vector+0x1d0>
 204:	40000613          	li	a2,1024
 208:	7a261073          	csrw	tdata2,a2
 20c:	00062603          	lw	a2,0(a2)
 210:	08060063          	beqz	a2,290 <fail>
 214:	00500193          	li	gp,5
 218:	00062023          	sw	zero,0(a2)
 21c:	00600193          	li	gp,6
 220:	20000537          	lui	a0,0x20000
 224:	04250513          	addi	a0,a0,66 # 20000042 <_end+0x1ffffc32>
 228:	7a151073          	csrw	tdata1,a0
 22c:	7a1025f3          	csrr	a1,tdata1
 230:	04b51e63          	bne	a0,a1,28c <reset_vector+0x240>
 234:	00c62023          	sw	a2,0(a2)
 238:	00700193          	li	gp,7
 23c:	00062603          	lw	a2,0(a2)
 240:	04061863          	bnez	a2,290 <fail>
 244:	00100513          	li	a0,1
 248:	7a051073          	csrw	tselect,a0
 24c:	7a0025f3          	csrr	a1,tselect
 250:	04b51e63          	bne	a0,a1,2ac <pass>
 254:	20000537          	lui	a0,0x20000
 258:	04150513          	addi	a0,a0,65 # 20000041 <_end+0x1ffffc31>
 25c:	7a151073          	csrw	tdata1,a0
 260:	40400693          	li	a3,1028
 264:	7a269073          	csrw	tdata2,a3
 268:	00800193          	li	gp,8
 26c:	0006a683          	lw	a3,0(a3)
 270:	02068063          	beqz	a3,290 <fail>
 274:	00a00193          	li	gp,10
 278:	40000613          	li	a2,1024
 27c:	00c62023          	sw	a2,0(a2)
 280:	00b00193          	li	gp,11
 284:	00062603          	lw	a2,0(a2)
 288:	00061463          	bnez	a2,290 <fail>
 28c:	02301063          	bne	zero,gp,2ac <pass>

00000290 <fail>:
 290:	0ff0000f          	fence
 294:	00018063          	beqz	gp,294 <fail+0x4>
 298:	00119193          	slli	gp,gp,0x1
 29c:	0011e193          	ori	gp,gp,1
 2a0:	05d00893          	li	a7,93
 2a4:	00018513          	mv	a0,gp
 2a8:	00000073          	ecall

000002ac <pass>:
 2ac:	0ff0000f          	fence
 2b0:	00100193          	li	gp,1
 2b4:	05d00893          	li	a7,93
 2b8:	00000513          	li	a0,0
 2bc:	00000073          	ecall

000002c0 <mtvec_handler>:
 2c0:	0011f293          	andi	t0,gp,1
 2c4:	fc0296e3          	bnez	t0,290 <fail>
 2c8:	00300293          	li	t0,3
 2cc:	34202373          	csrr	t1,mcause
 2d0:	fc6290e3          	bne	t0,t1,290 <fail>
 2d4:	341022f3          	csrr	t0,mepc
 2d8:	00428293          	addi	t0,t0,4
 2dc:	34129073          	csrw	mepc,t0
 2e0:	30200073          	mret
 2e4:	c0001073          	unimp
 2e8:	0000                	.insn	2, 0x
 2ea:	0000                	.insn	2, 0x

Disassembly of section .data:

00000400 <begin_signature>:
 400:	0000                	.insn	2, 0x
 402:	0000                	.insn	2, 0x

00000404 <data2>:
 404:	0000                	.insn	2, 0x
 406:	0000                	.insn	2, 0x
 408:	0000                	.insn	2, 0x
 40a:	0000                	.insn	2, 0x
 40c:	0000                	.insn	2, 0x
 40e:	0000                	.insn	2, 0x
