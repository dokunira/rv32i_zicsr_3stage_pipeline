
rv32mi-p-mcsr:     file format elf32-littleriscv


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
  3c:	30302023          	sw	gp,768(zero) # 300 <tohost>
  40:	30002223          	sw	zero,772(zero) # 304 <tohost+0x4>
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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffbff>
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
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xad09>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00002537          	lui	a0,0x2
 174:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x1400>
 178:	30052073          	csrs	mstatus,a0
 17c:	00000297          	auipc	t0,0x0
 180:	01428293          	addi	t0,t0,20 # 190 <test_2>
 184:	34129073          	csrw	mepc,t0
 188:	f1402573          	csrr	a0,mhartid
 18c:	30200073          	mret

00000190 <test_2>:
 190:	00200193          	li	gp,2
 194:	30102573          	csrr	a0,misa
 198:	01e55513          	srli	a0,a0,0x1e
 19c:	00100393          	li	t2,1
 1a0:	02751863          	bne	a0,t2,1d0 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	f1402573          	csrr	a0,mhartid
 1ac:	00000393          	li	t2,0
 1b0:	02751063          	bne	a0,t2,1d0 <fail>
 1b4:	f1302573          	csrr	a0,mimpid
 1b8:	f1202573          	csrr	a0,marchid
 1bc:	f1102573          	csrr	a0,mvendorid
 1c0:	00000293          	li	t0,0
 1c4:	3052a073          	csrs	mtvec,t0
 1c8:	3412a073          	csrs	mepc,t0
 1cc:	02301063          	bne	zero,gp,1ec <pass>

000001d0 <fail>:
 1d0:	0ff0000f          	fence
 1d4:	00018063          	beqz	gp,1d4 <fail+0x4>
 1d8:	00119193          	slli	gp,gp,0x1
 1dc:	0011e193          	ori	gp,gp,1
 1e0:	05d00893          	li	a7,93
 1e4:	00018513          	mv	a0,gp
 1e8:	00000073          	ecall

000001ec <pass>:
 1ec:	0ff0000f          	fence
 1f0:	00100193          	li	gp,1
 1f4:	05d00893          	li	a7,93
 1f8:	00000513          	li	a0,0
 1fc:	00000073          	ecall
 200:	c0001073          	unimp
 204:	0000                	.insn	2, 0x
 206:	0000                	.insn	2, 0x
 208:	0000                	.insn	2, 0x
 20a:	0000                	.insn	2, 0x
 20c:	0000                	.insn	2, 0x
 20e:	0000                	.insn	2, 0x
 210:	0000                	.insn	2, 0x
 212:	0000                	.insn	2, 0x
 214:	0000                	.insn	2, 0x
 216:	0000                	.insn	2, 0x
 218:	0000                	.insn	2, 0x
 21a:	0000                	.insn	2, 0x
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
 230:	0000                	.insn	2, 0x
 232:	0000                	.insn	2, 0x
