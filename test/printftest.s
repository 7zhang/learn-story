	.file	"printftest.c"
	.text
.Ltext0:
	.globl	sum
	.type	sum, @function
sum:
.LFB0:
	.file 1 "printftest.c"
	.loc 1 5 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 6 0
	movl	$0, -4(%ebp)
	.loc 1 8 0
	leal	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	.loc 1 9 0
	movl	$0, -8(%ebp)
	movl	-8(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.L2
	.loc 1 10 0
		.value	0x0b0f
.L2:
	.loc 1 12 0
	movl	-4(%ebp), %eax
	.loc 1 13 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	sum, .-sum
	.section	.rodata
.LC0:
	.string	"sum=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 15 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	.loc 1 17 0
	movl	$7, 40(%esp)
	movl	$3, 36(%esp)
	movl	$2, 32(%esp)
	movl	$3, 28(%esp)
	movl	$4, 24(%esp)
	movl	$5, 20(%esp)
	movl	$5, 16(%esp)
	movl	$3, 12(%esp)
	movl	$2, 8(%esp)
	movl	$1, 4(%esp)
	movl	$11, (%esp)
	call	sum
	movl	%eax, 60(%esp)
	.loc 1 18 0
	movl	60(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	.loc 1 19 0
	movl	$0, %eax
	.loc 1 20 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/i686-redhat-linux/4.7.2/include/stdarg.h"
	.file 3 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x106
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF13
	.byte	0x1
	.long	.LASF14
	.long	.LASF15
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x4
	.long	.LASF11
	.byte	0x2
	.byte	0x28
	.long	0x84
	.uleb128 0x5
	.byte	0x4
	.long	.LASF16
	.long	0x72
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0x4f
	.long	0x79
	.uleb128 0x6
	.string	"sum"
	.byte	0x1
	.byte	0x4
	.long	0x4f
	.long	.LFB0
	.long	.LFE0
	.uleb128 0x1
	.byte	0x9c
	.long	0xe7
	.uleb128 0x7
	.string	"n"
	.byte	0x1
	.byte	0x4
	.long	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.uleb128 0x9
	.string	"i"
	.byte	0x1
	.byte	0x6
	.long	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.string	"sum"
	.byte	0x1
	.byte	0x6
	.long	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.string	"vl"
	.byte	0x1
	.byte	0x7
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xa
	.long	.LASF17
	.byte	0x1
	.byte	0xe
	.long	0x4f
	.long	.LFB1
	.long	.LFE1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.string	"x"
	.byte	0x1
	.byte	0x10
	.long	0x4f
	.uleb128 0x2
	.byte	0x74
	.sleb128 60
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.string	"long long int"
.LASF11:
	.string	"__gnuc_va_list"
.LASF0:
	.string	"unsigned int"
.LASF16:
	.string	"__builtin_va_list"
.LASF14:
	.string	"printftest.c"
.LASF3:
	.string	"long unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF10:
	.string	"char"
.LASF1:
	.string	"unsigned char"
.LASF17:
	.string	"main"
.LASF8:
	.string	"long int"
.LASF12:
	.string	"va_list"
.LASF2:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF15:
	.string	"/usr/src"
.LASF5:
	.string	"short int"
.LASF13:
	.string	"GNU C 4.7.2 20121109 (Red Hat 4.7.2-8) -mtune=generic -march=i686 -g"
.LASF9:
	.string	"sizetype"
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
