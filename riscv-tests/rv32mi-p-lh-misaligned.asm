
rv32mi-p-lh-misaligned:     file format elf32-littleriscv


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
  24:	1d8f0f13          	addi	t5,t5,472 # 1f8 <mtvec_handler>
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
 184:	01428293          	addi	t0,t0,20 # 194 <test_2>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret

00000194 <test_2>:
 194:	00200193          	li	gp,2
 198:	20100793          	li	a5,513
 19c:	40000113          	li	sp,1024
 1a0:	00011703          	lh	a4,0(sp)
 1a4:	20100393          	li	t2,513
 1a8:	02771063          	bne	a4,t2,1c8 <fail>

000001ac <test_3>:
 1ac:	00300193          	li	gp,3
 1b0:	30200793          	li	a5,770
 1b4:	40000113          	li	sp,1024
 1b8:	00111703          	lh	a4,1(sp)
 1bc:	30200393          	li	t2,770
 1c0:	00771463          	bne	a4,t2,1c8 <fail>
 1c4:	02301063          	bne	zero,gp,1e4 <pass>

000001c8 <fail>:
 1c8:	0ff0000f          	fence
 1cc:	00018063          	beqz	gp,1cc <fail+0x4>
 1d0:	00119193          	slli	gp,gp,0x1
 1d4:	0011e193          	ori	gp,gp,1
 1d8:	05d00893          	li	a7,93
 1dc:	00018513          	mv	a0,gp
 1e0:	00000073          	ecall

000001e4 <pass>:
 1e4:	0ff0000f          	fence
 1e8:	00100193          	li	gp,1
 1ec:	05d00893          	li	a7,93
 1f0:	00000513          	li	a0,0
 1f4:	00000073          	ecall

000001f8 <mtvec_handler>:
 1f8:	00400293          	li	t0,4
 1fc:	34202373          	csrr	t1,mcause
 200:	fc6294e3          	bne	t0,t1,1c8 <fail>
 204:	00078713          	mv	a4,a5
 208:	341022f3          	csrr	t0,mepc
 20c:	00428293          	addi	t0,t0,4
 210:	34129073          	csrw	mepc,t0
 214:	30200073          	mret
 218:	c0001073          	unimp
 21c:	0000                	.insn	2, 0x
 21e:	0000                	.insn	2, 0x
 220:	0000                	.insn	2, 0x
 222:	0000                	.insn	2, 0x
 224:	0000                	.insn	2, 0x
 226:	0000                	.insn	2, 0x
 228:	0000                	.insn	2, 0x
 22a:	0000                	.insn	2, 0x
 22c:	0000                	.insn	2, 0x
 22e:	0000                	.insn	2, 0x

Disassembly of section .data:

00000400 <begin_signature>:
 400:	0201                	.insn	2, 0x0201
 402:	00000403          	lb	s0,0(zero) # 0 <_start>
 406:	0000                	.insn	2, 0x
 408:	0000                	.insn	2, 0x
 40a:	0000                	.insn	2, 0x
 40c:	0000                	.insn	2, 0x
 40e:	0000                	.insn	2, 0x
