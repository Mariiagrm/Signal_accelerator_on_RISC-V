	.file	"operacionesVectoriales.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	saxpy_scalar
	.type	saxpy_scalar, @function
saxpy_scalar:
	beq	a0,zero,.L12
	addi	a3,a2,-4
	csrr	a6,vlenb
	sub	a3,a3,a1
	addi	a6,a6,-8
	mv	a5,a2
	mv	a4,a1
	bleu	a3,a6,.L3
	vsetvli	a5,zero,e32,m1,ta,ma
	vfmv.v.f	v3,fa0
	mv	a4,a2
.L4:
	vsetvli	a5,a0,e32,m1,ta,ma
	vle32.v	v1,0(a1)
	vle32.v	v2,0(a2)
	slli	a3,a5,2
	sub	a0,a0,a5
	add	a1,a1,a3
	add	a2,a2,a3
	vfmadd.vv	v1,v3,v2
	vse32.v	v1,0(a4)
	add	a4,a4,a3
	bne	a0,zero,.L4
	ret
.L3:
	slli	a0,a0,2
	add	a0,a2,a0
.L6:
	flw	fa5,0(a4)
	flw	fa4,0(a5)
	addi	a5,a5,4
	addi	a4,a4,4
	fmadd.s	fa5,fa0,fa5,fa4
	fsw	fa5,-4(a5)
	bne	a5,a0,.L6
.L12:
	ret
	.size	saxpy_scalar, .-saxpy_scalar
	.align	1
	.globl	saxpy_vec
	.type	saxpy_vec, @function
saxpy_vec:
	beq	a0,zero,.L25
.L18:
	vsetvli	a5,a0,e32,m8,ta,ma
	vle32.v	v16,0(a1)
	vle32.v	v8,0(a2)
	slli	a4,a5,2
	sub	a0,a0,a5
	add	a1,a1,a4
	vfmacc.vf	v8,fa0,v16
	vse32.v	v8,0(a2)
	add	a2,a2,a4
	bne	a0,zero,.L18
.L25:
	ret
	.size	saxpy_vec, .-saxpy_vec
	.ident	"GCC: (g5115c7e447) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
