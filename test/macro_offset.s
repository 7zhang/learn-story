	.file	"macro_offset.c"
	.text
.Ltext0:
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata
.LC0:
	.string	"A virtual"
	.section	.text._ZN1A3addEv,"axG",@progbits,_ZN1A3addEv,comdat
	.align 2
	.weak	_ZN1A3addEv
	.type	_ZN1A3addEv, @function
_ZN1A3addEv:
.LFB971:
	.file 1 "macro_offset.c"
	.loc 1 7 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 7 0
	movl	$.LC0, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE971:
	.size	_ZN1A3addEv, .-_ZN1A3addEv
	.section	.rodata
.LC1:
	.string	"B virtual"
	.section	.text._ZN1B3addEv,"axG",@progbits,_ZN1B3addEv,comdat
	.align 2
	.weak	_ZN1B3addEv
	.type	_ZN1B3addEv, @function
_ZN1B3addEv:
.LFB972:
	.loc 1 12 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 12 0
	movl	$.LC1, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE972:
	.size	_ZN1B3addEv, .-_ZN1B3addEv
	.section	.text._ZN1AC2Ev,"axG",@progbits,_ZN1AC5Ev,comdat
	.align 2
	.weak	_ZN1AC2Ev
	.type	_ZN1AC2Ev, @function
_ZN1AC2Ev:
.LFB975:
	.loc 1 4 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
.LBB2:
	.loc 1 4 0
	movl	8(%ebp), %eax
	movl	$_ZTV1A+8, (%eax)
.LBE2:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE975:
	.size	_ZN1AC2Ev, .-_ZN1AC2Ev
	.weak	_ZN1AC1Ev
	.set	_ZN1AC1Ev,_ZN1AC2Ev
	.section	.text._ZN1BC2Ev,"axG",@progbits,_ZN1BC5Ev,comdat
	.align 2
	.weak	_ZN1BC2Ev
	.type	_ZN1BC2Ev, @function
_ZN1BC2Ev:
.LFB978:
	.loc 1 9 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
.LBB3:
	.loc 1 9 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ZN1AC2Ev
	movl	8(%ebp), %eax
	movl	$_ZTV1B+8, (%eax)
.LBE3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE978:
	.size	_ZN1BC2Ev, .-_ZN1BC2Ev
	.weak	_ZN1BC1Ev
	.set	_ZN1BC1Ev,_ZN1BC2Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB973:
	.loc 1 16 0
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA973
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
.LBB4:
	.loc 1 17 0
	leal	24(%esp), %eax
	movl	%eax, (%esp)
	call	_ZN1AC1Ev
	.loc 1 18 0
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_ZN1BC1Ev
	.loc 1 19 0
	leal	24(%esp), %eax
	movl	%eax, 28(%esp)
	.loc 1 20 0
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	movl	28(%esp), %edx
	movl	%edx, (%esp)
.LEHB0:
	call	*%eax
	.loc 1 21 0
	leal	20(%esp), %eax
	movl	%eax, 28(%esp)
	.loc 1 22 0
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	movl	28(%esp), %edx
	movl	%edx, (%esp)
	call	*%eax
	.loc 1 23 0
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_ZN1A3addEv
.LEHE0:
	.loc 1 24 0
	movl	$0, %eax
	jmp	.L9
.L8:
	movl	%eax, (%esp)
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
.L9:
.LBE4:
	.loc 1 25 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE973:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA973:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE973-.LLSDACSB973
.LLSDACSB973:
	.uleb128 .LEHB0-.LFB973
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L8-.LFB973
	.uleb128 0
	.uleb128 .LEHB1-.LFB973
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE973:
	.text
	.size	main, .-main
	.weak	_ZTV1B
	.section	.rodata._ZTV1B,"aG",@progbits,_ZTV1B,comdat
	.align 8
	.type	_ZTV1B, @object
	.size	_ZTV1B, 12
_ZTV1B:
	.long	0
	.long	_ZTI1B
	.long	_ZN1B3addEv
	.weak	_ZTV1A
	.section	.rodata._ZTV1A,"aG",@progbits,_ZTV1A,comdat
	.align 8
	.type	_ZTV1A, @object
	.size	_ZTV1A, 12
_ZTV1A:
	.long	0
	.long	_ZTI1A
	.long	_ZN1A3addEv
	.weak	_ZTS1B
	.section	.rodata._ZTS1B,"aG",@progbits,_ZTS1B,comdat
	.type	_ZTS1B, @object
	.size	_ZTS1B, 3
_ZTS1B:
	.string	"1B"
	.weak	_ZTI1B
	.section	.rodata._ZTI1B,"aG",@progbits,_ZTI1B,comdat
	.align 4
	.type	_ZTI1B, @object
	.size	_ZTI1B, 12
_ZTI1B:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS1B
	.long	_ZTI1A
	.weak	_ZTS1A
	.section	.rodata._ZTS1A,"aG",@progbits,_ZTS1A,comdat
	.type	_ZTS1A, @object
	.size	_ZTS1A, 3
_ZTS1A:
	.string	"1A"
	.weak	_ZTI1A
	.section	.rodata._ZTI1A,"aG",@progbits,_ZTI1A,comdat
	.align 4
	.type	_ZTI1A, @object
	.size	_ZTI1A, 8
_ZTI1A:
	.long	_ZTVN10__cxxabiv117__class_type_infoE+8
	.long	_ZTS1A
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB980:
	.loc 1 25 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 25 0
	cmpl	$1, 8(%ebp)
	jne	.L10
	.loc 1 25 0 is_stmt 0 discriminator 1
	cmpl	$65535, 12(%ebp)
	jne	.L10
	.file 2 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/iostream"
	.loc 2 75 0 is_stmt 1
	movl	$_ZStL8__ioinit, (%esp)
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, 8(%esp)
	movl	$_ZStL8__ioinit, 4(%esp)
	movl	$_ZNSt8ios_base4InitD1Ev, (%esp)
	call	__cxa_atexit
.L10:
	.loc 1 25 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE980:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB981:
	.loc 1 25 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 25 0
	movl	$65535, 4(%esp)
	movl	$1, (%esp)
	call	_Z41__static_initialization_and_destruction_0ii
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE981:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I_main
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/i686-redhat-linux/4.7.2/include/stddef.h"
	.file 4 "/usr/include/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/wchar.h"
	.file 8 "/usr/lib/gcc/i686-redhat-linux/4.7.2/include/stdarg.h"
	.file 9 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/cwchar"
	.file 10 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/i686-redhat-linux/bits/c++config.h"
	.file 11 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/clocale"
	.file 12 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/bits/ios_base.h"
	.file 13 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/cwctype"
	.file 14 "/usr/include/time.h"
	.file 15 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/ext/new_allocator.h"
	.file 16 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/ext/numeric_traits.h"
	.file 17 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/debug/debug.h"
	.file 18 "/usr/include/locale.h"
	.file 19 "/usr/lib/gcc/i686-redhat-linux/4.7.2/../../../../include/c++/4.7.2/i686-redhat-linux/bits/atomic_word.h"
	.file 20 "/usr/include/wctype.h"
	.file 21 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1303
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF200
	.byte	0x4
	.long	.LASF201
	.long	.LASF202
	.long	.Ldebug_ranges0+0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF6
	.byte	0x3
	.byte	0xd5
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0x28
	.long	0x65
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.long	.LASF10
	.byte	0x4
	.byte	0x37
	.long	0x6c
	.uleb128 0x2
	.long	.LASF11
	.byte	0x4
	.byte	0x8c
	.long	0x90
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF12
	.uleb128 0x2
	.long	.LASF13
	.byte	0x4
	.byte	0x8d
	.long	0x7a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF14
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.long	0xb1
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x7
	.long	.LASF52
	.byte	0x94
	.byte	0x5
	.byte	0xfd
	.long	0x23d
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xfe
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF17
	.byte	0x5
	.value	0x103
	.long	0xab
	.byte	0x4
	.uleb128 0x9
	.long	.LASF18
	.byte	0x5
	.value	0x104
	.long	0xab
	.byte	0x8
	.uleb128 0x9
	.long	.LASF19
	.byte	0x5
	.value	0x105
	.long	0xab
	.byte	0xc
	.uleb128 0x9
	.long	.LASF20
	.byte	0x5
	.value	0x106
	.long	0xab
	.byte	0x10
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.value	0x107
	.long	0xab
	.byte	0x14
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x108
	.long	0xab
	.byte	0x18
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x109
	.long	0xab
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x10a
	.long	0xab
	.byte	0x20
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x10c
	.long	0xab
	.byte	0x24
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x10d
	.long	0xab
	.byte	0x28
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x10e
	.long	0xab
	.byte	0x2c
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x110
	.long	0x2f4
	.byte	0x30
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x112
	.long	0x2fa
	.byte	0x34
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x114
	.long	0x65
	.byte	0x38
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x118
	.long	0x65
	.byte	0x3c
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x11a
	.long	0x85
	.byte	0x40
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x11e
	.long	0x3e
	.byte	0x44
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x11f
	.long	0x4c
	.byte	0x46
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x120
	.long	0x300
	.byte	0x47
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x124
	.long	0x310
	.byte	0x48
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12d
	.long	0x97
	.byte	0x4c
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x136
	.long	0xa9
	.byte	0x54
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x137
	.long	0xa9
	.byte	0x58
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x138
	.long	0xa9
	.byte	0x5c
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x139
	.long	0xa9
	.byte	0x60
	.uleb128 0x9
	.long	.LASF42
	.byte	0x5
	.value	0x13a
	.long	0x25
	.byte	0x64
	.uleb128 0x9
	.long	.LASF43
	.byte	0x5
	.value	0x13c
	.long	0x65
	.byte	0x68
	.uleb128 0x9
	.long	.LASF44
	.byte	0x5
	.value	0x13e
	.long	0x316
	.byte	0x6c
	.byte	0
	.uleb128 0x2
	.long	.LASF45
	.byte	0x6
	.byte	0x40
	.long	0xb8
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.byte	0x53
	.long	.LASF203
	.long	0x28c
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.byte	0x56
	.long	0x273
	.uleb128 0xc
	.long	.LASF46
	.byte	0x7
	.byte	0x58
	.long	0x30
	.uleb128 0xc
	.long	.LASF47
	.byte	0x7
	.byte	0x5c
	.long	0x28c
	.byte	0
	.uleb128 0x8
	.long	.LASF48
	.byte	0x7
	.byte	0x54
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF49
	.byte	0x7
	.byte	0x5d
	.long	0x254
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.long	0xb1
	.long	0x29c
	.uleb128 0xe
	.long	0xa2
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF50
	.byte	0x7
	.byte	0x5e
	.long	0x248
	.uleb128 0x2
	.long	.LASF51
	.byte	0x8
	.byte	0x28
	.long	0x2b2
	.uleb128 0xf
	.byte	0x4
	.long	.LASF185
	.long	0xb1
	.uleb128 0x10
	.long	.LASF204
	.byte	0x5
	.byte	0xa2
	.uleb128 0x7
	.long	.LASF53
	.byte	0xc
	.byte	0x5
	.byte	0xa8
	.long	0x2f4
	.uleb128 0x8
	.long	.LASF54
	.byte	0x5
	.byte	0xa9
	.long	0x2f4
	.byte	0
	.uleb128 0x8
	.long	.LASF55
	.byte	0x5
	.byte	0xaa
	.long	0x2fa
	.byte	0x4
	.uleb128 0x8
	.long	.LASF56
	.byte	0x5
	.byte	0xae
	.long	0x65
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x2c3
	.uleb128 0x6
	.byte	0x4
	.long	0xb8
	.uleb128 0xd
	.long	0xb1
	.long	0x310
	.uleb128 0xe
	.long	0xa2
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x2bc
	.uleb128 0xd
	.long	0xb1
	.long	0x326
	.uleb128 0xe
	.long	0xa2
	.byte	0x27
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x32c
	.uleb128 0x11
	.long	0xb1
	.uleb128 0x12
	.long	.LASF57
	.byte	0x3
	.value	0x162
	.long	0x30
	.uleb128 0x2
	.long	.LASF58
	.byte	0x7
	.byte	0x6a
	.long	0x29c
	.uleb128 0x11
	.long	0x65
	.uleb128 0x13
	.string	"std"
	.byte	0x15
	.byte	0
	.long	0x5d1
	.uleb128 0x14
	.byte	0x9
	.byte	0x42
	.long	0x33d
	.uleb128 0x14
	.byte	0x9
	.byte	0x8d
	.long	0x331
	.uleb128 0x14
	.byte	0x9
	.byte	0x8f
	.long	0x5d1
	.uleb128 0x14
	.byte	0x9
	.byte	0x90
	.long	0x5e7
	.uleb128 0x14
	.byte	0x9
	.byte	0x91
	.long	0x603
	.uleb128 0x14
	.byte	0x9
	.byte	0x92
	.long	0x630
	.uleb128 0x14
	.byte	0x9
	.byte	0x93
	.long	0x64b
	.uleb128 0x14
	.byte	0x9
	.byte	0x94
	.long	0x671
	.uleb128 0x14
	.byte	0x9
	.byte	0x95
	.long	0x68c
	.uleb128 0x14
	.byte	0x9
	.byte	0x96
	.long	0x6a8
	.uleb128 0x14
	.byte	0x9
	.byte	0x97
	.long	0x6c4
	.uleb128 0x14
	.byte	0x9
	.byte	0x98
	.long	0x6da
	.uleb128 0x14
	.byte	0x9
	.byte	0x99
	.long	0x6e6
	.uleb128 0x14
	.byte	0x9
	.byte	0x9a
	.long	0x70c
	.uleb128 0x14
	.byte	0x9
	.byte	0x9b
	.long	0x731
	.uleb128 0x14
	.byte	0x9
	.byte	0x9c
	.long	0x752
	.uleb128 0x14
	.byte	0x9
	.byte	0x9d
	.long	0x77d
	.uleb128 0x14
	.byte	0x9
	.byte	0x9e
	.long	0x798
	.uleb128 0x14
	.byte	0x9
	.byte	0xa0
	.long	0x7ae
	.uleb128 0x14
	.byte	0x9
	.byte	0xa2
	.long	0x7cf
	.uleb128 0x14
	.byte	0x9
	.byte	0xa3
	.long	0x7eb
	.uleb128 0x14
	.byte	0x9
	.byte	0xa4
	.long	0x806
	.uleb128 0x14
	.byte	0x9
	.byte	0xa6
	.long	0x826
	.uleb128 0x14
	.byte	0x9
	.byte	0xa9
	.long	0x846
	.uleb128 0x14
	.byte	0x9
	.byte	0xac
	.long	0x86b
	.uleb128 0x14
	.byte	0x9
	.byte	0xae
	.long	0x88b
	.uleb128 0x14
	.byte	0x9
	.byte	0xb0
	.long	0x8a6
	.uleb128 0x14
	.byte	0x9
	.byte	0xb2
	.long	0x8c1
	.uleb128 0x14
	.byte	0x9
	.byte	0xb3
	.long	0x8e1
	.uleb128 0x14
	.byte	0x9
	.byte	0xb4
	.long	0x8fb
	.uleb128 0x14
	.byte	0x9
	.byte	0xb5
	.long	0x915
	.uleb128 0x14
	.byte	0x9
	.byte	0xb6
	.long	0x92f
	.uleb128 0x14
	.byte	0x9
	.byte	0xb7
	.long	0x949
	.uleb128 0x14
	.byte	0x9
	.byte	0xb8
	.long	0x963
	.uleb128 0x14
	.byte	0x9
	.byte	0xb9
	.long	0xa23
	.uleb128 0x14
	.byte	0x9
	.byte	0xba
	.long	0xa39
	.uleb128 0x14
	.byte	0x9
	.byte	0xbb
	.long	0xa58
	.uleb128 0x14
	.byte	0x9
	.byte	0xbc
	.long	0xa77
	.uleb128 0x14
	.byte	0x9
	.byte	0xbd
	.long	0xa96
	.uleb128 0x14
	.byte	0x9
	.byte	0xbe
	.long	0xac1
	.uleb128 0x14
	.byte	0x9
	.byte	0xbf
	.long	0xadc
	.uleb128 0x14
	.byte	0x9
	.byte	0xc1
	.long	0xb04
	.uleb128 0x14
	.byte	0x9
	.byte	0xc3
	.long	0xb26
	.uleb128 0x14
	.byte	0x9
	.byte	0xc4
	.long	0xb46
	.uleb128 0x14
	.byte	0x9
	.byte	0xc5
	.long	0xb66
	.uleb128 0x14
	.byte	0x9
	.byte	0xc6
	.long	0xb86
	.uleb128 0x14
	.byte	0x9
	.byte	0xc7
	.long	0xba5
	.uleb128 0x14
	.byte	0x9
	.byte	0xc8
	.long	0xbbb
	.uleb128 0x14
	.byte	0x9
	.byte	0xc9
	.long	0xbdb
	.uleb128 0x14
	.byte	0x9
	.byte	0xca
	.long	0xbfb
	.uleb128 0x14
	.byte	0x9
	.byte	0xcb
	.long	0xc1b
	.uleb128 0x14
	.byte	0x9
	.byte	0xcc
	.long	0xc3b
	.uleb128 0x14
	.byte	0x9
	.byte	0xcd
	.long	0xc52
	.uleb128 0x14
	.byte	0x9
	.byte	0xce
	.long	0xc69
	.uleb128 0x14
	.byte	0x9
	.byte	0xcf
	.long	0xc87
	.uleb128 0x14
	.byte	0x9
	.byte	0xd0
	.long	0xca6
	.uleb128 0x14
	.byte	0x9
	.byte	0xd1
	.long	0xcc4
	.uleb128 0x14
	.byte	0x9
	.byte	0xd2
	.long	0xce3
	.uleb128 0x15
	.byte	0x9
	.value	0x10a
	.long	0xdf2
	.uleb128 0x15
	.byte	0x9
	.value	0x10b
	.long	0xe14
	.uleb128 0x15
	.byte	0x9
	.value	0x10c
	.long	0xe34
	.uleb128 0x16
	.long	.LASF205
	.byte	0x11
	.byte	0x31
	.uleb128 0x2
	.long	.LASF6
	.byte	0xa
	.byte	0xad
	.long	0x30
	.uleb128 0x14
	.byte	0xb
	.byte	0x37
	.long	0xe6e
	.uleb128 0x14
	.byte	0xb
	.byte	0x38
	.long	0xf9b
	.uleb128 0x14
	.byte	0xb
	.byte	0x39
	.long	0xfb5
	.uleb128 0x2
	.long	.LASF59
	.byte	0xa
	.byte	0xae
	.long	0x65
	.uleb128 0x17
	.long	.LASF206
	.long	0x594
	.uleb128 0x18
	.long	.LASF127
	.byte	0x1
	.byte	0xc
	.value	0x217
	.byte	0x1
	.uleb128 0x19
	.long	.LASF60
	.byte	0xc
	.value	0x21f
	.long	0xfc6
	.uleb128 0x19
	.long	.LASF61
	.byte	0xc
	.value	0x220
	.long	0xe67
	.uleb128 0x1a
	.long	.LASF127
	.byte	0xc
	.value	0x21b
	.byte	0x1
	.long	0x574
	.long	0x57a
	.uleb128 0x1b
	.long	0xfd1
	.byte	0
	.uleb128 0x1c
	.long	.LASF62
	.byte	0xc
	.value	0x21c
	.byte	0x1
	.long	0x587
	.uleb128 0x1b
	.long	0xfd1
	.uleb128 0x1b
	.long	0x65
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0xd
	.byte	0x54
	.long	0xfe2
	.uleb128 0x14
	.byte	0xd
	.byte	0x55
	.long	0xfd7
	.uleb128 0x14
	.byte	0xd
	.byte	0x56
	.long	0x331
	.uleb128 0x14
	.byte	0xd
	.byte	0x5e
	.long	0xff8
	.uleb128 0x14
	.byte	0xd
	.byte	0x67
	.long	0x1012
	.uleb128 0x14
	.byte	0xd
	.byte	0x6a
	.long	0x102c
	.uleb128 0x14
	.byte	0xd
	.byte	0x6b
	.long	0x1041
	.uleb128 0x1d
	.long	.LASF190
	.byte	0x2
	.byte	0x4b
	.long	0x541
	.byte	0
	.uleb128 0x1e
	.long	.LASF63
	.byte	0x7
	.value	0x161
	.long	0x331
	.long	0x5e7
	.uleb128 0x1f
	.long	0x65
	.byte	0
	.uleb128 0x1e
	.long	.LASF64
	.byte	0x7
	.value	0x2e9
	.long	0x331
	.long	0x5fd
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x23d
	.uleb128 0x1e
	.long	.LASF65
	.byte	0x7
	.value	0x306
	.long	0x623
	.long	0x623
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x65
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x629
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF66
	.uleb128 0x1e
	.long	.LASF67
	.byte	0x7
	.value	0x2f7
	.long	0x331
	.long	0x64b
	.uleb128 0x1f
	.long	0x629
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x1e
	.long	.LASF68
	.byte	0x7
	.value	0x30d
	.long	0x65
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x66c
	.uleb128 0x11
	.long	0x629
	.uleb128 0x1e
	.long	.LASF69
	.byte	0x7
	.value	0x24b
	.long	0x65
	.long	0x68c
	.uleb128 0x1f
	.long	0x5fd
	.uleb128 0x1f
	.long	0x65
	.byte	0
	.uleb128 0x1e
	.long	.LASF70
	.byte	0x7
	.value	0x252
	.long	0x65
	.long	0x6a8
	.uleb128 0x1f
	.long	0x5fd
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x20
	.byte	0
	.uleb128 0x1e
	.long	.LASF71
	.byte	0x7
	.value	0x27b
	.long	0x65
	.long	0x6c4
	.uleb128 0x1f
	.long	0x5fd
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x20
	.byte	0
	.uleb128 0x1e
	.long	.LASF72
	.byte	0x7
	.value	0x2ea
	.long	0x331
	.long	0x6da
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x21
	.long	.LASF173
	.byte	0x7
	.value	0x2f0
	.long	0x331
	.uleb128 0x1e
	.long	.LASF73
	.byte	0x7
	.value	0x178
	.long	0x25
	.long	0x706
	.uleb128 0x1f
	.long	0x326
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x706
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x33d
	.uleb128 0x1e
	.long	.LASF74
	.byte	0x7
	.value	0x16d
	.long	0x25
	.long	0x731
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x326
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x706
	.byte	0
	.uleb128 0x1e
	.long	.LASF75
	.byte	0x7
	.value	0x169
	.long	0x65
	.long	0x747
	.uleb128 0x1f
	.long	0x747
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x74d
	.uleb128 0x11
	.long	0x33d
	.uleb128 0x1e
	.long	.LASF76
	.byte	0x7
	.value	0x198
	.long	0x25
	.long	0x777
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x777
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x706
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x326
	.uleb128 0x1e
	.long	.LASF77
	.byte	0x7
	.value	0x2f8
	.long	0x331
	.long	0x798
	.uleb128 0x1f
	.long	0x629
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x1e
	.long	.LASF78
	.byte	0x7
	.value	0x2fe
	.long	0x331
	.long	0x7ae
	.uleb128 0x1f
	.long	0x629
	.byte	0
	.uleb128 0x1e
	.long	.LASF79
	.byte	0x7
	.value	0x25c
	.long	0x65
	.long	0x7cf
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x20
	.byte	0
	.uleb128 0x1e
	.long	.LASF80
	.byte	0x7
	.value	0x285
	.long	0x65
	.long	0x7eb
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x20
	.byte	0
	.uleb128 0x1e
	.long	.LASF81
	.byte	0x7
	.value	0x315
	.long	0x331
	.long	0x806
	.uleb128 0x1f
	.long	0x331
	.uleb128 0x1f
	.long	0x5fd
	.byte	0
	.uleb128 0x1e
	.long	.LASF82
	.byte	0x7
	.value	0x264
	.long	0x65
	.long	0x826
	.uleb128 0x1f
	.long	0x5fd
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x2a7
	.byte	0
	.uleb128 0x1e
	.long	.LASF83
	.byte	0x7
	.value	0x2b1
	.long	0x65
	.long	0x846
	.uleb128 0x1f
	.long	0x5fd
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x2a7
	.byte	0
	.uleb128 0x1e
	.long	.LASF84
	.byte	0x7
	.value	0x271
	.long	0x65
	.long	0x86b
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x2a7
	.byte	0
	.uleb128 0x1e
	.long	.LASF85
	.byte	0x7
	.value	0x2bd
	.long	0x65
	.long	0x88b
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x2a7
	.byte	0
	.uleb128 0x1e
	.long	.LASF86
	.byte	0x7
	.value	0x26c
	.long	0x65
	.long	0x8a6
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x2a7
	.byte	0
	.uleb128 0x1e
	.long	.LASF87
	.byte	0x7
	.value	0x2b9
	.long	0x65
	.long	0x8c1
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x2a7
	.byte	0
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x7
	.value	0x172
	.long	0x25
	.long	0x8e1
	.uleb128 0x1f
	.long	0xab
	.uleb128 0x1f
	.long	0x629
	.uleb128 0x1f
	.long	0x706
	.byte	0
	.uleb128 0x22
	.long	.LASF89
	.byte	0x7
	.byte	0x9b
	.long	0x623
	.long	0x8fb
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x22
	.long	.LASF90
	.byte	0x7
	.byte	0xa3
	.long	0x65
	.long	0x915
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x22
	.long	.LASF91
	.byte	0x7
	.byte	0xc0
	.long	0x65
	.long	0x92f
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x22
	.long	.LASF92
	.byte	0x7
	.byte	0x93
	.long	0x623
	.long	0x949
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x22
	.long	.LASF93
	.byte	0x7
	.byte	0xfc
	.long	0x25
	.long	0x963
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x1e
	.long	.LASF94
	.byte	0x7
	.value	0x357
	.long	0x25
	.long	0x988
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x988
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x98e
	.uleb128 0x11
	.long	0x993
	.uleb128 0x23
	.string	"tm"
	.byte	0x2c
	.byte	0xe
	.byte	0x85
	.long	0xa23
	.uleb128 0x8
	.long	.LASF95
	.byte	0xe
	.byte	0x87
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF96
	.byte	0xe
	.byte	0x88
	.long	0x65
	.byte	0x4
	.uleb128 0x8
	.long	.LASF97
	.byte	0xe
	.byte	0x89
	.long	0x65
	.byte	0x8
	.uleb128 0x8
	.long	.LASF98
	.byte	0xe
	.byte	0x8a
	.long	0x65
	.byte	0xc
	.uleb128 0x8
	.long	.LASF99
	.byte	0xe
	.byte	0x8b
	.long	0x65
	.byte	0x10
	.uleb128 0x8
	.long	.LASF100
	.byte	0xe
	.byte	0x8c
	.long	0x65
	.byte	0x14
	.uleb128 0x8
	.long	.LASF101
	.byte	0xe
	.byte	0x8d
	.long	0x65
	.byte	0x18
	.uleb128 0x8
	.long	.LASF102
	.byte	0xe
	.byte	0x8e
	.long	0x65
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF103
	.byte	0xe
	.byte	0x8f
	.long	0x65
	.byte	0x20
	.uleb128 0x8
	.long	.LASF104
	.byte	0xe
	.byte	0x92
	.long	0x90
	.byte	0x24
	.uleb128 0x8
	.long	.LASF105
	.byte	0xe
	.byte	0x93
	.long	0x326
	.byte	0x28
	.byte	0
	.uleb128 0x1e
	.long	.LASF106
	.byte	0x7
	.value	0x11f
	.long	0x25
	.long	0xa39
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x22
	.long	.LASF107
	.byte	0x7
	.byte	0x9e
	.long	0x623
	.long	0xa58
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x22
	.long	.LASF108
	.byte	0x7
	.byte	0xa6
	.long	0x65
	.long	0xa77
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x22
	.long	.LASF109
	.byte	0x7
	.byte	0x96
	.long	0x623
	.long	0xa96
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.long	.LASF110
	.byte	0x7
	.value	0x19e
	.long	0x25
	.long	0xabb
	.uleb128 0x1f
	.long	0xab
	.uleb128 0x1f
	.long	0xabb
	.uleb128 0x1f
	.long	0x25
	.uleb128 0x1f
	.long	0x706
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x666
	.uleb128 0x1e
	.long	.LASF111
	.byte	0x7
	.value	0x100
	.long	0x25
	.long	0xadc
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x1e
	.long	.LASF112
	.byte	0x7
	.value	0x1c2
	.long	0xaf7
	.long	0xaf7
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF113
	.uleb128 0x6
	.byte	0x4
	.long	0x623
	.uleb128 0x1e
	.long	.LASF114
	.byte	0x7
	.value	0x1c9
	.long	0xb1f
	.long	0xb1f
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF115
	.uleb128 0x1e
	.long	.LASF116
	.byte	0x7
	.value	0x11a
	.long	0x623
	.long	0xb46
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.byte	0
	.uleb128 0x1e
	.long	.LASF117
	.byte	0x7
	.value	0x1d4
	.long	0x90
	.long	0xb66
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.uleb128 0x1f
	.long	0x65
	.byte	0
	.uleb128 0x1e
	.long	.LASF118
	.byte	0x7
	.value	0x1d9
	.long	0x45
	.long	0xb86
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.uleb128 0x1f
	.long	0x65
	.byte	0
	.uleb128 0x22
	.long	.LASF119
	.byte	0x7
	.byte	0xc4
	.long	0x25
	.long	0xba5
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.long	.LASF120
	.byte	0x7
	.value	0x165
	.long	0x65
	.long	0xbbb
	.uleb128 0x1f
	.long	0x331
	.byte	0
	.uleb128 0x1e
	.long	.LASF121
	.byte	0x7
	.value	0x145
	.long	0x65
	.long	0xbdb
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.long	.LASF122
	.byte	0x7
	.value	0x149
	.long	0x623
	.long	0xbfb
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.long	.LASF123
	.byte	0x7
	.value	0x14e
	.long	0x623
	.long	0xc1b
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.long	.LASF124
	.byte	0x7
	.value	0x152
	.long	0x623
	.long	0xc3b
	.uleb128 0x1f
	.long	0x623
	.uleb128 0x1f
	.long	0x629
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.long	.LASF125
	.byte	0x7
	.value	0x259
	.long	0x65
	.long	0xc52
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x20
	.byte	0
	.uleb128 0x1e
	.long	.LASF126
	.byte	0x7
	.value	0x282
	.long	0x65
	.long	0xc69
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x20
	.byte	0
	.uleb128 0x24
	.long	.LASF128
	.byte	0x7
	.byte	0xe0
	.long	.LASF128
	.long	0x666
	.long	0xc87
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x629
	.byte	0
	.uleb128 0x25
	.long	.LASF129
	.byte	0x7
	.value	0x106
	.long	.LASF129
	.long	0x666
	.long	0xca6
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x24
	.long	.LASF130
	.byte	0x7
	.byte	0xea
	.long	.LASF130
	.long	0x666
	.long	0xcc4
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x629
	.byte	0
	.uleb128 0x25
	.long	.LASF131
	.byte	0x7
	.value	0x111
	.long	.LASF131
	.long	0x666
	.long	0xce3
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x666
	.byte	0
	.uleb128 0x25
	.long	.LASF132
	.byte	0x7
	.value	0x13c
	.long	.LASF132
	.long	0x666
	.long	0xd07
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0x629
	.uleb128 0x1f
	.long	0x25
	.byte	0
	.uleb128 0x26
	.long	.LASF133
	.byte	0x9
	.byte	0xf4
	.long	0xdf2
	.uleb128 0x14
	.byte	0x9
	.byte	0xfa
	.long	0xdf2
	.uleb128 0x15
	.byte	0x9
	.value	0x103
	.long	0xe14
	.uleb128 0x15
	.byte	0x9
	.value	0x104
	.long	0xe34
	.uleb128 0x14
	.byte	0xf
	.byte	0x2a
	.long	0x50d
	.uleb128 0x14
	.byte	0xf
	.byte	0x2b
	.long	0x52d
	.uleb128 0x7
	.long	.LASF134
	.byte	0x1
	.byte	0x10
	.byte	0x37
	.long	0xd6c
	.uleb128 0x27
	.long	.LASF135
	.byte	0x10
	.byte	0x3a
	.long	0x348
	.uleb128 0x27
	.long	.LASF136
	.byte	0x10
	.byte	0x3b
	.long	0x348
	.uleb128 0x28
	.long	.LASF137
	.long	0x65
	.uleb128 0x28
	.long	.LASF137
	.long	0x65
	.byte	0
	.uleb128 0x7
	.long	.LASF138
	.byte	0x1
	.byte	0x10
	.byte	0x37
	.long	0xd96
	.uleb128 0x27
	.long	.LASF139
	.byte	0x10
	.byte	0x40
	.long	0x348
	.uleb128 0x28
	.long	.LASF137
	.long	0x45
	.uleb128 0x28
	.long	.LASF137
	.long	0x45
	.byte	0
	.uleb128 0x7
	.long	.LASF140
	.byte	0x1
	.byte	0x10
	.byte	0x37
	.long	0xdc0
	.uleb128 0x27
	.long	.LASF136
	.byte	0x10
	.byte	0x3b
	.long	0x32c
	.uleb128 0x28
	.long	.LASF137
	.long	0xb1
	.uleb128 0x28
	.long	.LASF137
	.long	0xb1
	.byte	0
	.uleb128 0x29
	.long	.LASF207
	.byte	0x1
	.byte	0x10
	.byte	0x37
	.uleb128 0x27
	.long	.LASF135
	.byte	0x10
	.byte	0x3a
	.long	0x1056
	.uleb128 0x27
	.long	.LASF136
	.byte	0x10
	.byte	0x3b
	.long	0x1056
	.uleb128 0x28
	.long	.LASF137
	.long	0x53
	.uleb128 0x28
	.long	.LASF137
	.long	0x53
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF141
	.byte	0x7
	.value	0x1cb
	.long	0xe0d
	.long	0xe0d
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.byte	0
	.uleb128 0x3
	.byte	0xc
	.byte	0x4
	.long	.LASF142
	.uleb128 0x1e
	.long	.LASF143
	.byte	0x7
	.value	0x1e3
	.long	0x6c
	.long	0xe34
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.uleb128 0x1f
	.long	0x65
	.byte	0
	.uleb128 0x1e
	.long	.LASF144
	.byte	0x7
	.value	0x1ea
	.long	0x73
	.long	0xe54
	.uleb128 0x1f
	.long	0x666
	.uleb128 0x1f
	.long	0xafe
	.uleb128 0x1f
	.long	0x65
	.byte	0
	.uleb128 0x26
	.long	.LASF145
	.byte	0x11
	.byte	0x38
	.long	0xe67
	.uleb128 0x2a
	.byte	0x11
	.byte	0x39
	.long	0x506
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF146
	.uleb128 0x7
	.long	.LASF147
	.byte	0x38
	.byte	0x12
	.byte	0x36
	.long	0xf9b
	.uleb128 0x8
	.long	.LASF148
	.byte	0x12
	.byte	0x3a
	.long	0xab
	.byte	0
	.uleb128 0x8
	.long	.LASF149
	.byte	0x12
	.byte	0x3b
	.long	0xab
	.byte	0x4
	.uleb128 0x8
	.long	.LASF150
	.byte	0x12
	.byte	0x41
	.long	0xab
	.byte	0x8
	.uleb128 0x8
	.long	.LASF151
	.byte	0x12
	.byte	0x47
	.long	0xab
	.byte	0xc
	.uleb128 0x8
	.long	.LASF152
	.byte	0x12
	.byte	0x48
	.long	0xab
	.byte	0x10
	.uleb128 0x8
	.long	.LASF153
	.byte	0x12
	.byte	0x49
	.long	0xab
	.byte	0x14
	.uleb128 0x8
	.long	.LASF154
	.byte	0x12
	.byte	0x4a
	.long	0xab
	.byte	0x18
	.uleb128 0x8
	.long	.LASF155
	.byte	0x12
	.byte	0x4b
	.long	0xab
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF156
	.byte	0x12
	.byte	0x4c
	.long	0xab
	.byte	0x20
	.uleb128 0x8
	.long	.LASF157
	.byte	0x12
	.byte	0x4d
	.long	0xab
	.byte	0x24
	.uleb128 0x8
	.long	.LASF158
	.byte	0x12
	.byte	0x4e
	.long	0xb1
	.byte	0x28
	.uleb128 0x8
	.long	.LASF159
	.byte	0x12
	.byte	0x4f
	.long	0xb1
	.byte	0x29
	.uleb128 0x8
	.long	.LASF160
	.byte	0x12
	.byte	0x51
	.long	0xb1
	.byte	0x2a
	.uleb128 0x8
	.long	.LASF161
	.byte	0x12
	.byte	0x53
	.long	0xb1
	.byte	0x2b
	.uleb128 0x8
	.long	.LASF162
	.byte	0x12
	.byte	0x55
	.long	0xb1
	.byte	0x2c
	.uleb128 0x8
	.long	.LASF163
	.byte	0x12
	.byte	0x57
	.long	0xb1
	.byte	0x2d
	.uleb128 0x8
	.long	.LASF164
	.byte	0x12
	.byte	0x5e
	.long	0xb1
	.byte	0x2e
	.uleb128 0x8
	.long	.LASF165
	.byte	0x12
	.byte	0x5f
	.long	0xb1
	.byte	0x2f
	.uleb128 0x8
	.long	.LASF166
	.byte	0x12
	.byte	0x62
	.long	0xb1
	.byte	0x30
	.uleb128 0x8
	.long	.LASF167
	.byte	0x12
	.byte	0x64
	.long	0xb1
	.byte	0x31
	.uleb128 0x8
	.long	.LASF168
	.byte	0x12
	.byte	0x66
	.long	0xb1
	.byte	0x32
	.uleb128 0x8
	.long	.LASF169
	.byte	0x12
	.byte	0x68
	.long	0xb1
	.byte	0x33
	.uleb128 0x8
	.long	.LASF170
	.byte	0x12
	.byte	0x6f
	.long	0xb1
	.byte	0x34
	.uleb128 0x8
	.long	.LASF171
	.byte	0x12
	.byte	0x70
	.long	0xb1
	.byte	0x35
	.byte	0
	.uleb128 0x22
	.long	.LASF172
	.byte	0x12
	.byte	0x7d
	.long	0xab
	.long	0xfb5
	.uleb128 0x1f
	.long	0x65
	.uleb128 0x1f
	.long	0x326
	.byte	0
	.uleb128 0x2b
	.long	.LASF174
	.byte	0x12
	.byte	0x80
	.long	0xfc0
	.uleb128 0x6
	.byte	0x4
	.long	0xe6e
	.uleb128 0x2
	.long	.LASF175
	.byte	0x13
	.byte	0x20
	.long	0x65
	.uleb128 0x6
	.byte	0x4
	.long	0x541
	.uleb128 0x2
	.long	.LASF176
	.byte	0x14
	.byte	0x34
	.long	0x45
	.uleb128 0x2
	.long	.LASF177
	.byte	0x14
	.byte	0xba
	.long	0xfed
	.uleb128 0x6
	.byte	0x4
	.long	0xff3
	.uleb128 0x11
	.long	0x5a
	.uleb128 0x22
	.long	.LASF178
	.byte	0x14
	.byte	0xaf
	.long	0x65
	.long	0x1012
	.uleb128 0x1f
	.long	0x331
	.uleb128 0x1f
	.long	0xfd7
	.byte	0
	.uleb128 0x22
	.long	.LASF179
	.byte	0x14
	.byte	0xdd
	.long	0x331
	.long	0x102c
	.uleb128 0x1f
	.long	0x331
	.uleb128 0x1f
	.long	0xfe2
	.byte	0
	.uleb128 0x22
	.long	.LASF180
	.byte	0x14
	.byte	0xda
	.long	0xfe2
	.long	0x1041
	.uleb128 0x1f
	.long	0x326
	.byte	0
	.uleb128 0x22
	.long	.LASF181
	.byte	0x14
	.byte	0xab
	.long	0xfd7
	.long	0x1056
	.uleb128 0x1f
	.long	0x326
	.byte	0
	.uleb128 0x11
	.long	0x53
	.uleb128 0x2c
	.string	"B"
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.long	0x10b8
	.long	0x10b8
	.uleb128 0x2d
	.long	0x10b8
	.byte	0
	.byte	0x1
	.uleb128 0x2e
	.string	"B"
	.byte	0x1
	.long	0x107c
	.long	0x1087
	.uleb128 0x1b
	.long	0x1119
	.uleb128 0x1f
	.long	0x111f
	.byte	0
	.uleb128 0x2e
	.string	"B"
	.byte	0x1
	.long	0x1093
	.long	0x1099
	.uleb128 0x1b
	.long	0x1119
	.byte	0
	.uleb128 0x2f
	.string	"add"
	.byte	0x1
	.byte	0xc
	.long	.LASF183
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0x105b
	.byte	0x1
	.long	0x10b1
	.uleb128 0x1b
	.long	0x1119
	.byte	0
	.byte	0
	.uleb128 0x2c
	.string	"A"
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.long	0x10b8
	.long	0x1119
	.uleb128 0x30
	.long	.LASF182
	.long	0x1135
	.byte	0
	.byte	0x1
	.uleb128 0x2e
	.string	"A"
	.byte	0x1
	.long	0x10dd
	.long	0x10e8
	.uleb128 0x1b
	.long	0x1145
	.uleb128 0x1f
	.long	0x114b
	.byte	0
	.uleb128 0x2e
	.string	"A"
	.byte	0x1
	.long	0x10f4
	.long	0x10fa
	.uleb128 0x1b
	.long	0x1145
	.byte	0
	.uleb128 0x2f
	.string	"add"
	.byte	0x1
	.byte	0x7
	.long	.LASF184
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0x10b8
	.byte	0x1
	.long	0x1112
	.uleb128 0x1b
	.long	0x1145
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x105b
	.uleb128 0x31
	.byte	0x4
	.long	0x1125
	.uleb128 0x11
	.long	0x105b
	.uleb128 0x32
	.long	0x65
	.long	0x1135
	.uleb128 0x20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x113b
	.uleb128 0xf
	.byte	0x4
	.long	.LASF186
	.long	0x112a
	.uleb128 0x6
	.byte	0x4
	.long	0x10b8
	.uleb128 0x31
	.byte	0x4
	.long	0x1151
	.uleb128 0x11
	.long	0x10b8
	.uleb128 0x33
	.long	0x10fa
	.long	.LFB971
	.long	.LFE971
	.uleb128 0x1
	.byte	0x9c
	.long	0x116d
	.long	0x117a
	.uleb128 0x34
	.long	.LASF187
	.long	0x117a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.long	0x1145
	.uleb128 0x33
	.long	0x1099
	.long	.LFB972
	.long	.LFE972
	.uleb128 0x1
	.byte	0x9c
	.long	0x1196
	.long	0x11a3
	.uleb128 0x34
	.long	.LASF187
	.long	0x11a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.long	0x1119
	.uleb128 0x35
	.long	0x10e8
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.long	0x11b8
	.long	0x11c2
	.uleb128 0x36
	.long	.LASF187
	.long	0x117a
	.byte	0
	.uleb128 0x37
	.long	0x11a8
	.long	.LASF188
	.long	.LFB975
	.long	.LFE975
	.uleb128 0x1
	.byte	0x9c
	.long	0x11dd
	.long	0x11e6
	.uleb128 0x38
	.long	0x11b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x35
	.long	0x1087
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.long	0x11f6
	.long	0x1200
	.uleb128 0x36
	.long	.LASF187
	.long	0x11a3
	.byte	0
	.uleb128 0x39
	.long	0x11e6
	.long	.LASF189
	.long	.LFB978
	.long	.LFE978
	.uleb128 0x1
	.byte	0x9c
	.long	0x121b
	.long	0x1224
	.uleb128 0x38
	.long	0x11f6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x3a
	.long	.LASF208
	.byte	0x1
	.byte	0xf
	.long	0x65
	.long	.LFB973
	.long	.LFE973
	.uleb128 0x1
	.byte	0x9c
	.long	0x126d
	.uleb128 0x3b
	.long	.LBB4
	.long	.LBE4
	.uleb128 0x3c
	.string	"a"
	.byte	0x1
	.byte	0x11
	.long	0x10b8
	.uleb128 0x2
	.byte	0x74
	.sleb128 24
	.uleb128 0x3c
	.string	"b"
	.byte	0x1
	.byte	0x12
	.long	0x105b
	.uleb128 0x2
	.byte	0x74
	.sleb128 20
	.uleb128 0x3c
	.string	"pa"
	.byte	0x1
	.byte	0x13
	.long	0x1145
	.uleb128 0x2
	.byte	0x74
	.sleb128 28
	.byte	0
	.byte	0
	.uleb128 0x3d
	.long	.LASF209
	.long	.LFB980
	.long	.LFE980
	.uleb128 0x1
	.byte	0x9c
	.long	0x129d
	.uleb128 0x3e
	.long	.LASF191
	.byte	0x1
	.byte	0x19
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3e
	.long	.LASF192
	.byte	0x1
	.byte	0x19
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x3f
	.long	.LASF210
	.long	.LFB981
	.long	.LFE981
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x40
	.long	.LASF193
	.long	0xa9
	.uleb128 0x41
	.long	0x5c5
	.uleb128 0x5
	.byte	0x3
	.long	_ZStL8__ioinit
	.uleb128 0x42
	.long	0xd43
	.long	.LASF194
	.sleb128 -2147483648
	.uleb128 0x43
	.long	0xd4e
	.long	.LASF195
	.long	0x7fffffff
	.uleb128 0x44
	.long	0xd78
	.long	.LASF196
	.byte	0x20
	.uleb128 0x44
	.long	0xda2
	.long	.LASF197
	.byte	0x7f
	.uleb128 0x42
	.long	0xdc8
	.long	.LASF198
	.sleb128 -32768
	.uleb128 0x45
	.long	0xdd3
	.long	.LASF199
	.value	0x7fff
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x1c
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x3c
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
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x3f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
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
	.uleb128 0x40
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB971
	.long	.LFE971-.LFB971
	.long	.LFB972
	.long	.LFE972-.LFB972
	.long	.LFB975
	.long	.LFE975-.LFB975
	.long	.LFB978
	.long	.LFE978-.LFB978
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB971
	.long	.LFE971
	.long	.LFB972
	.long	.LFE972
	.long	.LFB975
	.long	.LFE975
	.long	.LFB978
	.long	.LFE978
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"__off_t"
.LASF152:
	.string	"currency_symbol"
.LASF17:
	.string	"_IO_read_ptr"
.LASF29:
	.string	"_chain"
.LASF97:
	.string	"tm_hour"
.LASF43:
	.string	"_mode"
.LASF74:
	.string	"mbrtowc"
.LASF135:
	.string	"__min"
.LASF62:
	.string	"~Init"
.LASF6:
	.string	"size_t"
.LASF127:
	.string	"Init"
.LASF35:
	.string	"_shortbuf"
.LASF131:
	.string	"wcsstr"
.LASF160:
	.string	"p_cs_precedes"
.LASF63:
	.string	"btowc"
.LASF209:
	.string	"__static_initialization_and_destruction_0"
.LASF129:
	.string	"wcspbrk"
.LASF147:
	.string	"lconv"
.LASF23:
	.string	"_IO_buf_base"
.LASF188:
	.string	"_ZN1AC2Ev"
.LASF199:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIsE5__maxE"
.LASF105:
	.string	"tm_zone"
.LASF9:
	.string	"long long unsigned int"
.LASF139:
	.string	"__digits"
.LASF50:
	.string	"__mbstate_t"
.LASF70:
	.string	"fwprintf"
.LASF85:
	.string	"vswscanf"
.LASF83:
	.string	"vfwscanf"
.LASF8:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF180:
	.string	"wctrans"
.LASF77:
	.string	"putwc"
.LASF178:
	.string	"iswctype"
.LASF93:
	.string	"wcscspn"
.LASF67:
	.string	"fputwc"
.LASF94:
	.string	"wcsftime"
.LASF112:
	.string	"wcstod"
.LASF87:
	.string	"vwscanf"
.LASF137:
	.string	"_Value"
.LASF30:
	.string	"_fileno"
.LASF12:
	.string	"long int"
.LASF121:
	.string	"wmemcmp"
.LASF60:
	.string	"_S_refcount"
.LASF179:
	.string	"towctrans"
.LASF16:
	.string	"_flags"
.LASF185:
	.string	"__builtin_va_list"
.LASF24:
	.string	"_IO_buf_end"
.LASF151:
	.string	"int_curr_symbol"
.LASF5:
	.string	"short int"
.LASF110:
	.string	"wcsrtombs"
.LASF10:
	.string	"__quad_t"
.LASF75:
	.string	"mbsinit"
.LASF113:
	.string	"double"
.LASF156:
	.string	"positive_sign"
.LASF166:
	.string	"int_p_cs_precedes"
.LASF187:
	.string	"this"
.LASF145:
	.string	"__gnu_debug"
.LASF200:
	.string	"GNU C++ 4.7.2 20121109 (Red Hat 4.7.2-8) -mtune=generic -march=i686 -g"
.LASF66:
	.string	"wchar_t"
.LASF124:
	.string	"wmemset"
.LASF201:
	.string	"macro_offset.c"
.LASF116:
	.string	"wcstok"
.LASF99:
	.string	"tm_mon"
.LASF176:
	.string	"wctype_t"
.LASF182:
	.string	"_vptr.A"
.LASF191:
	.string	"__initialize_p"
.LASF165:
	.string	"n_sign_posn"
.LASF61:
	.string	"_S_synced_with_stdio"
.LASF126:
	.string	"wscanf"
.LASF53:
	.string	"_IO_marker"
.LASF100:
	.string	"tm_year"
.LASF186:
	.string	"__vtbl_ptr_type"
.LASF138:
	.string	"__numeric_traits_integer<long unsigned int>"
.LASF0:
	.string	"unsigned int"
.LASF106:
	.string	"wcslen"
.LASF47:
	.string	"__wchb"
.LASF153:
	.string	"mon_decimal_point"
.LASF155:
	.string	"mon_grouping"
.LASF150:
	.string	"grouping"
.LASF3:
	.string	"long unsigned int"
.LASF128:
	.string	"wcschr"
.LASF91:
	.string	"wcscoll"
.LASF21:
	.string	"_IO_write_ptr"
.LASF130:
	.string	"wcsrchr"
.LASF149:
	.string	"thousands_sep"
.LASF175:
	.string	"_Atomic_word"
.LASF123:
	.string	"wmemmove"
.LASF184:
	.string	"_ZN1A3addEv"
.LASF163:
	.string	"n_sep_by_space"
.LASF157:
	.string	"negative_sign"
.LASF2:
	.string	"short unsigned int"
.LASF125:
	.string	"wprintf"
.LASF103:
	.string	"tm_isdst"
.LASF52:
	.string	"_IO_FILE"
.LASF25:
	.string	"_IO_save_base"
.LASF46:
	.string	"__wch"
.LASF71:
	.string	"fwscanf"
.LASF92:
	.string	"wcscpy"
.LASF57:
	.string	"wint_t"
.LASF146:
	.string	"bool"
.LASF36:
	.string	"_lock"
.LASF89:
	.string	"wcscat"
.LASF31:
	.string	"_flags2"
.LASF168:
	.string	"int_n_cs_precedes"
.LASF58:
	.string	"mbstate_t"
.LASF172:
	.string	"setlocale"
.LASF181:
	.string	"wctype"
.LASF108:
	.string	"wcsncmp"
.LASF161:
	.string	"p_sep_by_space"
.LASF119:
	.string	"wcsxfrm"
.LASF141:
	.string	"wcstold"
.LASF120:
	.string	"wctob"
.LASF202:
	.string	"/usr/src"
.LASF81:
	.string	"ungetwc"
.LASF143:
	.string	"wcstoll"
.LASF96:
	.string	"tm_min"
.LASF14:
	.string	"sizetype"
.LASF190:
	.string	"__ioinit"
.LASF111:
	.string	"wcsspn"
.LASF102:
	.string	"tm_yday"
.LASF51:
	.string	"__gnuc_va_list"
.LASF104:
	.string	"tm_gmtoff"
.LASF84:
	.string	"vswprintf"
.LASF22:
	.string	"_IO_write_end"
.LASF98:
	.string	"tm_mday"
.LASF132:
	.string	"wmemchr"
.LASF164:
	.string	"p_sign_posn"
.LASF204:
	.string	"_IO_lock_t"
.LASF162:
	.string	"n_cs_precedes"
.LASF167:
	.string	"int_p_sep_by_space"
.LASF195:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__maxE"
.LASF115:
	.string	"float"
.LASF56:
	.string	"_pos"
.LASF32:
	.string	"_old_offset"
.LASF55:
	.string	"_sbuf"
.LASF122:
	.string	"wmemcpy"
.LASF28:
	.string	"_markers"
.LASF68:
	.string	"fputws"
.LASF206:
	.string	"ios_base"
.LASF80:
	.string	"swscanf"
.LASF1:
	.string	"unsigned char"
.LASF59:
	.string	"ptrdiff_t"
.LASF159:
	.string	"frac_digits"
.LASF76:
	.string	"mbsrtowcs"
.LASF44:
	.string	"_unused2"
.LASF193:
	.string	"__dso_handle"
.LASF45:
	.string	"__FILE"
.LASF73:
	.string	"mbrlen"
.LASF34:
	.string	"_vtable_offset"
.LASF197:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIcE5__maxE"
.LASF64:
	.string	"fgetwc"
.LASF198:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIsE5__minE"
.LASF189:
	.string	"_ZN1BC2Ev"
.LASF154:
	.string	"mon_thousands_sep"
.LASF114:
	.string	"wcstof"
.LASF48:
	.string	"__count"
.LASF49:
	.string	"__value"
.LASF177:
	.string	"wctrans_t"
.LASF117:
	.string	"wcstol"
.LASF134:
	.string	"__numeric_traits_integer<int>"
.LASF173:
	.string	"getwchar"
.LASF170:
	.string	"int_p_sign_posn"
.LASF207:
	.string	"__numeric_traits_integer<short int>"
.LASF142:
	.string	"long double"
.LASF15:
	.string	"char"
.LASF37:
	.string	"_offset"
.LASF90:
	.string	"wcscmp"
.LASF79:
	.string	"swprintf"
.LASF205:
	.string	"__debug"
.LASF7:
	.string	"__int32_t"
.LASF101:
	.string	"tm_wday"
.LASF18:
	.string	"_IO_read_end"
.LASF54:
	.string	"_next"
.LASF13:
	.string	"__off64_t"
.LASF65:
	.string	"fgetws"
.LASF33:
	.string	"_cur_column"
.LASF19:
	.string	"_IO_read_base"
.LASF27:
	.string	"_IO_save_end"
.LASF194:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__minE"
.LASF69:
	.string	"fwide"
.LASF174:
	.string	"localeconv"
.LASF38:
	.string	"__pad1"
.LASF39:
	.string	"__pad2"
.LASF40:
	.string	"__pad3"
.LASF41:
	.string	"__pad4"
.LASF42:
	.string	"__pad5"
.LASF203:
	.string	"11__mbstate_t"
.LASF82:
	.string	"vfwprintf"
.LASF95:
	.string	"tm_sec"
.LASF78:
	.string	"putwchar"
.LASF109:
	.string	"wcsncpy"
.LASF86:
	.string	"vwprintf"
.LASF171:
	.string	"int_n_sign_posn"
.LASF107:
	.string	"wcsncat"
.LASF183:
	.string	"_ZN1B3addEv"
.LASF26:
	.string	"_IO_backup_base"
.LASF158:
	.string	"int_frac_digits"
.LASF196:
	.string	"_ZN9__gnu_cxx24__numeric_traits_integerImE8__digitsE"
.LASF118:
	.string	"wcstoul"
.LASF144:
	.string	"wcstoull"
.LASF169:
	.string	"int_n_sep_by_space"
.LASF210:
	.string	"_GLOBAL__sub_I_main"
.LASF72:
	.string	"getwc"
.LASF192:
	.string	"__priority"
.LASF208:
	.string	"main"
.LASF20:
	.string	"_IO_write_base"
.LASF88:
	.string	"wcrtomb"
.LASF148:
	.string	"decimal_point"
.LASF140:
	.string	"__numeric_traits_integer<char>"
.LASF136:
	.string	"__max"
.LASF133:
	.string	"__gnu_cxx"
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
