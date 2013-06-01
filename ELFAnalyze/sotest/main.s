	.file	"main.c"
	.globl	x
	.data
	.align 4
	.type	x, @object
	.size	x, 8
x:
	.long	1
	.long	2
	.globl	y
	.align 4
	.type	y, @object
	.size	y, 8
y:
	.long	3
	.long	4
	.comm	z,8,4
	.section	.rodata
.LC0:
	.string	"z = [%d %d]\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$2, 12(%esp)
	movl	$z, 8(%esp)
	movl	$y, 4(%esp)
	movl	$x, (%esp)
	call	addvec
	movl	z+4, %edx
	movl	z, %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
