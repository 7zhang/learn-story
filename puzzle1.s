	.file	"puzzle1.c"
	.globl	array
	.data
	.align 4
	.type	array, @object
	.size	array, 28
array:
	.long	23
	.long	34
	.long	12
	.long	17
	.long	204
	.long	99
	.long	16
	.section	.rodata
.LC0:
	.string	"%d\n"
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
	subl	$32, %esp
	movl	$-1, 28(%esp)
	jmp	.L2
.L3:
	movl	28(%esp), %eax
	addl	$1, %eax
	movl	array(,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	addl	$1, 28(%esp)
.L2:
	movl	28(%esp), %eax
	cmpl	$5, %eax
	jbe	.L3
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
