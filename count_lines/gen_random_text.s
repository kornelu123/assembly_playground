	.file	"gen_random_text.c"
	.text
	.globl	buff
	.bss
	.align 32
	.type	buff, @object
	.size	buff, 65536
buff:
	.zero	65536
	.section	.rodata
.LC0:
	.string	"r+"
.LC1:
	.string	"./string.txt"
.LC2:
	.string	"%s"
.LC3:
	.string	"w+"
.LC4:
	.string	"%c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	$65536, %esi
	leaq	buff(%rip), %rax
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	buff(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -20(%rbp)
	jmp	.L2
.L4:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$780903145, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$44, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	$48, %eax
	movb	%al, -21(%rbp)
	cmpb	$48, -21(%rbp)
	jne	.L3
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
.L3:
	movl	-20(%rbp), %eax
	cltq
	leaq	buff(%rip), %rcx
	movzbl	-21(%rbp), %edx
	movb	%dl, (%rax,%rcx)
	movsbl	-21(%rbp), %eax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	addl	$1, -20(%rbp)
.L2:
	cmpl	$65535, -20(%rbp)
	jle	.L4
	movq	-8(%rbp), %rax
	leaq	buff(%rip), %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
