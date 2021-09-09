	.file	"ProjectCode.c"
	.globl	rootOfSearchTree
	.bss
	.align 8
rootOfSearchTree:
	.space 8
	.globl	rootOfDeleteTree
	.align 8
rootOfDeleteTree:
	.space 8
	.comm	fptr1, 8, 3
	.globl	fname1
	.data
	.align 32
fname1:
	.ascii "NGODatabase.db\0"
	.space 85
	.comm	fptr2, 8, 3
	.globl	fname2
	.align 32
fname2:
	.ascii "AdminDatabase.db\0"
	.space 83
	.comm	fptr3, 8, 3
	.globl	fname3
	.align 32
fname3:
	.ascii "UserDatabase.db\0"
	.space 84
	.comm	stack, 8, 3
	.globl	size
	.align 4
size:
	.long	5
	.globl	top
	.align 4
top:
	.long	-1
	.comm	adminName, 25, 4
	.comm	userName, 25, 4
	.globl	bufferForSearchFun
	.bss
	.align 4
bufferForSearchFun:
	.space 4
	.globl	count
	.data
	.align 4
count:
	.long	1
	.comm	noDataFlag, 4, 2
	.comm	date, 30, 4
	.globl	coord
	.bss
	.align 2
coord:
	.space 4
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "a\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	call	welcome
	leaq	.LC0(%rip), %rdx
	leaq	fname1(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr1(%rip), %rax
	movq	%rdx, (%rax)
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	.LC0(%rip), %rdx
	leaq	fname2(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr2(%rip), %rax
	movq	%rdx, (%rax)
	leaq	fptr2(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	.LC0(%rip), %rdx
	leaq	fname3(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr3(%rip), %rax
	movq	%rdx, (%rax)
	leaq	fptr3(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	movl	size(%rip), %eax
	cltq
	movl	$4, %edx
	movq	%rax, %rcx
	call	calloc
	movq	%rax, %rdx
	leaq	stack(%rip), %rax
	movq	%rdx, (%rax)
	movl	$-1, %ecx
	call	createTree
	movl	$1, %ecx
	call	createTree
	call	logIn
	movq	rootOfSearchTree(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	rootOfDeleteTree(%rip), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "cls\0"
.LC2:
	.ascii "%c\11\11      Welcome to\11\11%c\0"
.LC3:
	.ascii "%c\11\11COVID-19 AID TRACKER\11\11%c\0"
.LC4:
	.ascii "Tejashwin U\0"
.LC5:
	.ascii "1NH19CS238\0"
	.text
	.globl	welcome
	.def	welcome;	.scl	2;	.type	32;	.endef
	.seh_proc	welcome
welcome:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC1(%rip), %rcx
	call	system
	movl	$9, %edx
	movl	$45, %ecx
	call	gotoXY
	movl	$0, -4(%rbp)
	jmp	.L4
.L8:
	movl	$0, -8(%rbp)
	jmp	.L5
.L6:
	movl	$205, %ecx
	call	putchar
	addl	$1, -8(%rbp)
.L5:
	cmpl	$42, -8(%rbp)
	jle	.L6
	cmpl	$0, -4(%rbp)
	jne	.L7
	movl	$10, %edx
	movl	$45, %ecx
	call	gotoXY
	movl	$186, %r8d
	movl	$186, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$11, %edx
	movl	$45, %ecx
	call	gotoXY
	movl	$186, %r8d
	movl	$186, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$12, %edx
	movl	$45, %ecx
	call	gotoXY
.L7:
	addl	$1, -4(%rbp)
.L4:
	cmpl	$1, -4(%rbp)
	jle	.L8
	movl	$29, %edx
	movl	$120, %ecx
	call	gotoXY
	leaq	.LC4(%rip), %rcx
	call	printf
	movl	$30, %edx
	movl	$120, %ecx
	call	gotoXY
	leaq	.LC5(%rip), %rcx
	call	printf
	call	getche
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "\12\11\11\11\11\11\11COVID-19 AID TRACKER\0"
	.text
	.globl	title
	.def	title;	.scl	2;	.type	32;	.endef
	.seh_proc	title
title:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC1(%rip), %rcx
	call	system
	movl	$0, -4(%rbp)
	jmp	.L10
.L11:
	movl	$196, %ecx
	call	putchar
	addl	$1, -4(%rbp)
.L10:
	cmpl	$143, -4(%rbp)
	jle	.L11
	leaq	.LC6(%rip), %rcx
	call	puts
	movl	$0, -4(%rbp)
	jmp	.L12
.L13:
	movl	$196, %ecx
	call	putchar
	addl	$1, -4(%rbp)
.L12:
	cmpl	$143, -4(%rbp)
	jle	.L13
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "\12Press any key to continue\0"
	.text
	.globl	press
	.def	press;	.scl	2;	.type	32;	.endef
	.seh_proc	press
press:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movl	$10, %ecx
	call	putchar
	addl	$1, -4(%rbp)
.L15:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L16
	leaq	.LC7(%rip), %rcx
	call	printf
	movl	$250, %edx
	movl	$4, %ecx
	call	loading
	call	getche
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	gotoXY
	.def	gotoXY;	.scl	2;	.type	32;	.endef
	.seh_proc	gotoXY
gotoXY:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	movw	%ax, coord(%rip)
	movl	24(%rbp), %eax
	movw	%ax, 2+coord(%rip)
	movl	$-11, %ecx
	movq	__imp_GetStdHandle(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movl	coord(%rip), %eax
	movl	%eax, %edx
	movq	__imp_SetConsoleCursorPosition(%rip), %rax
	call	*%rax
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	loading
	.def	loading;	.scl	2;	.type	32;	.endef
	.seh_proc	loading
loading:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L19
.L20:
	movl	$46, %ecx
	call	putchar
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	movq	__imp_Sleep(%rip), %rax
	call	*%rax
	addl	$1, -4(%rbp)
.L19:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jle	.L20
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "\12\11PIN CODE:        %.lf\0"
.LC9:
	.ascii "\12\11Unique ID:       %ld\0"
.LC10:
	.ascii "\12\11NGO name:        %s\0"
.LC11:
	.ascii "\12\11NGO address:     %s\0"
.LC12:
	.ascii "\12\11NGO owner name:  %s\0"
.LC13:
	.ascii "\12\11NGO Phone no.    %s\0"
.LC14:
	.ascii "\12\0"
	.text
	.globl	printNgo
	.def	printNgo;	.scl	2;	.type	32;	.endef
	.seh_proc	printNgo
printNgo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	addq	$20, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	addq	$120, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	addq	$420, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC12(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	addq	$520, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rcx
	call	printf
	leaq	.LC14(%rip), %rcx
	call	puts
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	replace
	.def	replace;	.scl	2;	.type	32;	.endef
	.seh_proc	replace
replace:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -48(%rbp)
	movl	%edx, %eax
	movl	%r8d, %edx
	movb	%al, -40(%rbp)
	movb	%dl, -32(%rbp)
	movl	$0, -88(%rbp)
	movl	$1, %edx
	movl	$300, %ecx
	call	calloc
	movq	%rax, -96(%rbp)
	movl	$0, -84(%rbp)
	jmp	.L23
.L28:
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	-40(%rbp), %al
	jne	.L24
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-96(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-32(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -88(%rbp)
	jmp	.L25
.L24:
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	movq	__imp_isalnum(%rip), %rax
	call	*%rax
	testl	%eax, %eax
	jne	.L26
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	movq	__imp_ispunct(%rip), %rax
	call	*%rax
	testl	%eax, %eax
	je	.L27
.L26:
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-96(%rbp), %rax
	addq	%rax, %rdx
	movl	-84(%rbp), %eax
	movslq	%eax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -88(%rbp)
	jmp	.L25
.L27:
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-96(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-32(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -88(%rbp)
.L25:
	addl	$1, -84(%rbp)
.L23:
	movl	-84(%rbp), %eax
	movslq	%eax, %rbx
	movq	-48(%rbp), %rcx
	call	strlen
	cmpq	%rax, %rbx
	jbe	.L28
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-96(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	randomNumberGenerator
	.def	randomNumberGenerator;	.scl	2;	.type	32;	.endef
	.seh_proc	randomNumberGenerator
randomNumberGenerator:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$0, %ecx
	call	time
	movq	%rax, -8(%rbp)
	call	rand
	movl	%eax, %ecx
	movl	$386369719, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$11, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$22766, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$10000, %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %ecx
	movl	$1125899907, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$18, %eax
	imull	$1000000, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "[A] for ADMINISTRATOR\0"
.LC16:
	.ascii "[U] for USER\0"
.LC17:
	.ascii "[ESC] to exit\0"
.LC18:
	.ascii "\12nExiting\0"
	.text
	.globl	logIn
	.def	logIn;	.scl	2;	.type	32;	.endef
	.seh_proc	logIn
logIn:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC1(%rip), %rcx
	call	system
	call	title
	movl	$8, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC15(%rip), %rcx
	call	printf
	movl	$9, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC16(%rip), %rcx
	call	printf
	movl	$10, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC17(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -1(%rbp)
	cmpb	$97, -1(%rbp)
	je	.L33
	cmpb	$65, -1(%rbp)
	jne	.L34
.L33:
	call	adminLog
	jmp	.L35
.L34:
	cmpb	$117, -1(%rbp)
	je	.L36
	cmpb	$85, -1(%rbp)
	jne	.L37
.L36:
	call	userLog
	jmp	.L35
.L37:
	cmpb	$27, -1(%rbp)
	jne	.L38
	leaq	.LC18(%rip), %rcx
	call	printf
	movl	$250, %edx
	movl	$8, %ecx
	call	loading
	movl	$0, %ecx
	call	exit
.L38:
	call	logIn
.L35:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "Logging in as an Admin\0"
.LC20:
	.ascii "Enter the name:  \0"
.LC21:
	.ascii "%s\0"
.LC22:
	.ascii "Enter the default password:  \0"
.LC23:
	.ascii "\10 \10\0"
.LC24:
	.ascii "a+\0"
.LC25:
	.ascii "\12%s %s\0"
.LC26:
	.ascii "\12\12Successfully logged in.\0"
.LC27:
	.ascii "\12Password wrong :(\0"
.LC28:
	.ascii "\12\12\12Press\0"
	.align 8
.LC29:
	.ascii "\12\11\11[1] to re-enter credentials.\0"
	.align 8
.LC30:
	.ascii "\12\11\11[2] to choose the user once again.\0"
.LC31:
	.ascii "\12\11\11[ESC] to exit.\0"
.LC32:
	.ascii "\12\12nExiting.......\0"
	.text
	.globl	adminLog
	.def	adminLog;	.scl	2;	.type	32;	.endef
	.seh_proc	adminLog
adminLog:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	title
	movl	$1752527426, -48(%rbp)
	movb	$0, -44(%rbp)
	movl	$0, -4(%rbp)
	movl	$7, %edx
	movl	$25, %ecx
	call	gotoXY
	leaq	.LC19(%rip), %rcx
	call	puts
	movl	$10, %edx
	movl	$35, %ecx
	call	gotoXY
	leaq	.LC20(%rip), %rcx
	call	printf
	leaq	adminName(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	scanf
	movl	$11, %edx
	movl	$35, %ecx
	call	gotoXY
	leaq	.LC22(%rip), %rcx
	call	printf
.L42:
	call	getch
	movb	%al, -5(%rbp)
	movsbl	-5(%rbp), %eax
	movl	%eax, %ecx
	movq	__imp_isprint(%rip), %rax
	call	*%rax
	testl	%eax, %eax
	je	.L40
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	movzbl	-5(%rbp), %edx
	movb	%dl, -32(%rbp,%rax)
	movl	$42, %ecx
	call	putchar
	jmp	.L41
.L40:
	cmpb	$8, -5(%rbp)
	jne	.L41
	cmpl	$0, -4(%rbp)
	je	.L41
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -4(%rbp)
	cltq
	movb	$0, -32(%rbp,%rax)
	leaq	.LC23(%rip), %rdx
	leaq	.LC21(%rip), %rcx
	call	printf
.L41:
	cmpb	$13, -5(%rbp)
	jne	.L42
	leaq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L43
	leaq	.LC24(%rip), %rdx
	leaq	fname2(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr2(%rip), %rax
	movq	%rdx, (%rax)
	call	dateAndTimeGenerator
	movq	%rax, %rdx
	leaq	fptr2(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	leaq	adminName(%rip), %rdx
	movq	%rdx, %r8
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	leaq	fptr2(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$13, %edx
	movl	$35, %ecx
	call	gotoXY
	leaq	.LC26(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	leaq	adminName(%rip), %rax
	movq	%rax, %rcx
	call	adminMainMenu
	jmp	.L48
.L43:
	leaq	.LC27(%rip), %rcx
	call	printf
.L47:
	leaq	.LC28(%rip), %rcx
	call	puts
	leaq	.LC29(%rip), %rcx
	call	printf
	leaq	.LC30(%rip), %rcx
	call	printf
	leaq	.LC31(%rip), %rcx
	call	printf
	call	getche
	movl	%eax, -12(%rbp)
	cmpl	$27, -12(%rbp)
	jne	.L44
	leaq	.LC32(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	exit
.L44:
	cmpl	$49, -12(%rbp)
	jne	.L45
	call	adminLog
	jmp	.L47
.L45:
	movl	$50, -12(%rbp)
	call	logIn
	jmp	.L47
.L48:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC33:
	.ascii "Loggining in as a general user\0"
.LC34:
	.ascii "Enter your name: \0"
.LC35:
	.ascii "Successfully logged in.\0"
	.text
	.globl	userLog
	.def	userLog;	.scl	2;	.type	32;	.endef
	.seh_proc	userLog
userLog:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	title
	movl	$8, %edx
	movl	$25, %ecx
	call	gotoXY
	leaq	.LC33(%rip), %rcx
	call	printf
	movl	$12, %edx
	movl	$35, %ecx
	call	gotoXY
	leaq	.LC34(%rip), %rcx
	call	printf
	leaq	userName(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC21(%rip), %rcx
	call	scanf
	leaq	.LC24(%rip), %rdx
	leaq	fname3(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr3(%rip), %rax
	movq	%rdx, (%rax)
	call	dateAndTimeGenerator
	movq	%rax, %rdx
	leaq	fptr3(%rip), %rax
	movq	(%rax), %rax
	movq	%rdx, %r9
	leaq	userName(%rip), %rdx
	movq	%rdx, %r8
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	leaq	fptr3(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$18, %edx
	movl	$0, %ecx
	call	gotoXY
	leaq	.LC35(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	leaq	userName(%rip), %rax
	movq	%rax, %rcx
	call	userMainMenu
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC36:
	.ascii "\12Admin Name: %s\0"
.LC37:
	.ascii "Press:\0"
.LC38:
	.ascii "[1] to search\0"
.LC39:
	.ascii "[2] to add a NGO\0"
.LC40:
	.ascii "[3] to view the NGO list\0"
.LC41:
	.ascii "[4] to delete\0"
.LC42:
	.ascii "[5] to view the Audit log\0"
	.align 8
.LC43:
	.ascii "[6] to return to the login page\0"
.LC44:
	.ascii "Your choice: \0"
.LC45:
	.ascii "%*c\0"
.LC46:
	.ascii "nExiting\0"
.LC47:
	.ascii "\12\12Your input is out of range!\0"
	.text
	.globl	adminMainMenu
	.def	adminMainMenu;	.scl	2;	.type	32;	.endef
	.seh_proc	adminMainMenu
adminMainMenu:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
.L61:
	leaq	.LC1(%rip), %rcx
	call	system
	call	title
	movq	16(%rbp), %rdx
	leaq	.LC36(%rip), %rcx
	call	printf
	movl	$8, %edx
	movl	$38, %ecx
	call	gotoXY
	leaq	.LC37(%rip), %rcx
	call	printf
	movl	$10, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC38(%rip), %rcx
	call	printf
	movl	$11, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC39(%rip), %rcx
	call	printf
	movl	$12, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC40(%rip), %rcx
	call	printf
	movl	$13, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC41(%rip), %rcx
	call	printf
	movl	$14, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC42(%rip), %rcx
	call	printf
	movl	$15, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC43(%rip), %rcx
	call	printf
	movl	$16, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC17(%rip), %rcx
	call	printf
	movl	$17, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC44(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -1(%rbp)
	leaq	.LC45(%rip), %rcx
	call	scanf
	movsbl	-1(%rbp), %eax
	subl	$27, %eax
	cmpl	$27, %eax
	ja	.L51
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L53(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L53(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L53:
	.long	.L52-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L51-.L53
	.long	.L54-.L53
	.long	.L55-.L53
	.long	.L56-.L53
	.long	.L57-.L53
	.long	.L58-.L53
	.long	.L59-.L53
	.text
.L54:
	call	searchParent
	jmp	.L60
.L55:
	call	addNgo
	jmp	.L60
.L56:
	call	viewNgo
	jmp	.L60
.L57:
	call	deleteNodeGrandParent
	jmp	.L60
.L58:
	call	auditLog
	jmp	.L60
.L59:
	call	logIn
	jmp	.L60
.L52:
	movl	$21, %edx
	movl	$40, %ecx
	call	gotoXY
	leaq	.LC46(%rip), %rcx
	call	printf
	movl	$250, %edx
	movl	$8, %ecx
	call	loading
	movl	$0, %ecx
	call	exit
.L51:
	leaq	.LC47(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	nop
.L60:
	jmp	.L61
	.seh_endproc
	.section .rdata,"dr"
.LC48:
	.ascii "\12General User Name: %s\0"
.LC49:
	.ascii "[2] to view the NGO list\0"
	.align 8
.LC50:
	.ascii "[3] to return to the login page\0"
	.text
	.globl	userMainMenu
	.def	userMainMenu;	.scl	2;	.type	32;	.endef
	.seh_proc	userMainMenu
userMainMenu:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
.L70:
	leaq	.LC1(%rip), %rcx
	call	system
	call	title
	movq	16(%rbp), %rdx
	leaq	.LC48(%rip), %rcx
	call	printf
	movl	$8, %edx
	movl	$38, %ecx
	call	gotoXY
	leaq	.LC37(%rip), %rcx
	call	printf
	movl	$10, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC38(%rip), %rcx
	call	printf
	movl	$11, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC49(%rip), %rcx
	call	printf
	movl	$12, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC50(%rip), %rcx
	call	printf
	movl	$13, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC17(%rip), %rcx
	call	printf
	movl	$14, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC44(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -1(%rbp)
	leaq	.LC45(%rip), %rcx
	call	scanf
	movsbl	-1(%rbp), %eax
	cmpl	$49, %eax
	je	.L64
	cmpl	$49, %eax
	jg	.L65
	cmpl	$27, %eax
	je	.L66
	jmp	.L63
.L65:
	cmpl	$50, %eax
	je	.L67
	cmpl	$51, %eax
	je	.L68
	jmp	.L63
.L64:
	call	searchParent
	jmp	.L69
.L67:
	call	viewNgo
	jmp	.L69
.L68:
	call	logIn
.L66:
	movl	$16, %edx
	movl	$45, %ecx
	call	gotoXY
	leaq	.LC46(%rip), %rcx
	call	printf
	movl	$250, %edx
	movl	$8, %ecx
	call	loading
	movl	$0, %ecx
	call	exit
.L63:
	leaq	.LC47(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	nop
.L69:
	jmp	.L70
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC51:
	.ascii "Enter NIL if any information is not present\0"
.LC52:
	.ascii "Enter the pin code:    \0"
.LC53:
	.ascii "Enter the NGO name:    \0"
.LC54:
	.ascii "Enter the Address:     \0"
.LC55:
	.ascii "Enter the owner name:  \0"
.LC56:
	.ascii "Enter the Phone no.:   \0"
.LC57:
	.ascii "\12%.lf\12%ld\12%s\12%s\12%s\12%s\12\0"
	.align 8
.LC58:
	.ascii "The below NGO details were successfully added: \0"
.LC59:
	.ascii "PIN CODE:        %.lf\0"
.LC60:
	.ascii "Unique ID:       %ld\0"
.LC61:
	.ascii "NGO name:        %s\0"
.LC62:
	.ascii "NGO address:     %s\0"
.LC63:
	.ascii "NGO owner name:  %s\0"
.LC64:
	.ascii "NGO Phone no.:   %s\0"
	.text
	.globl	addNgo
	.def	addNgo;	.scl	2;	.type	32;	.endef
	.seh_proc	addNgo
addNgo:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	title
	leaq	.LC0(%rip), %rdx
	leaq	fname1(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr1(%rip), %rax
	movq	%rdx, (%rax)
	movl	$592, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$7, %edx
	movl	$36, %ecx
	call	gotoXY
	leaq	.LC51(%rip), %rcx
	call	printf
	movl	$9, %edx
	movl	$30, %ecx
	call	gotoXY
	leaq	.LC52(%rip), %rcx
	call	printf
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	gets
	leaq	-48(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	numberChecker
	movq	%xmm0, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$10, %edx
	movl	$30, %ecx
	call	gotoXY
	leaq	.LC53(%rip), %rcx
	call	printf
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$20, %rax
	movq	%rdx, %r8
	movl	$100, %edx
	movq	%rax, %rcx
	call	fgets
	movq	-24(%rbp), %rax
	addq	$20, %rax
	movl	$95, %r8d
	movl	$32, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rcx
	call	strcpy
	movl	$11, %edx
	movl	$30, %ecx
	call	gotoXY
	leaq	.LC54(%rip), %rcx
	call	printf
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$120, %rax
	movq	%rdx, %r8
	movl	$300, %edx
	movq	%rax, %rcx
	call	fgets
	movq	-24(%rbp), %rax
	addq	$120, %rax
	movl	$95, %r8d
	movl	$32, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$120, %rax
	movq	%rax, %rcx
	call	strcpy
	movl	$12, %edx
	movl	$30, %ecx
	call	gotoXY
	leaq	.LC55(%rip), %rcx
	call	printf
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$420, %rax
	movq	%rdx, %r8
	movl	$100, %edx
	movq	%rax, %rcx
	call	fgets
	movq	-24(%rbp), %rax
	addq	$420, %rax
	movl	$95, %r8d
	movl	$32, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$420, %rax
	movq	%rax, %rcx
	call	strcpy
	movl	$13, %edx
	movl	$30, %ecx
	call	gotoXY
	leaq	.LC56(%rip), %rcx
	call	printf
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$520, %rax
	movq	%rdx, %r8
	movl	$50, %edx
	movq	%rax, %rcx
	call	fgets
	movq	-24(%rbp), %rax
	addq	$520, %rax
	movl	$95, %r8d
	movl	$32, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$520, %rax
	movq	%rax, %rcx
	call	strcpy
	call	randomNumberGenerator
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 576(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 584(%rax)
	movq	-24(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	insert
	movq	-24(%rbp), %rax
	leaq	520(%rax), %r10
	movq	-24(%rbp), %rax
	leaq	420(%rax), %r9
	movq	-24(%rbp), %rax
	leaq	120(%rax), %r8
	movq	-24(%rbp), %rax
	leaq	20(%rax), %rcx
	movq	-24(%rbp), %rax
	movl	16(%rax), %edx
	movq	-24(%rbp), %rax
	movsd	8(%rax), %xmm0
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%xmm0, %r11
	movq	%r11, %rbx
	movq	%rbx, -56(%rbp)
	movsd	-56(%rbp), %xmm1
	movq	%r11, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	%r10, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%edx, %r9d
	movapd	%xmm1, %xmm2
	movq	%xmm0, %r8
	leaq	.LC57(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	movq	$0, rootOfDeleteTree(%rip)
	movl	$1, %ecx
	call	createTree
	leaq	.LC1(%rip), %rcx
	call	system
	call	title
	movl	$6, %edx
	movl	$20, %ecx
	call	gotoXY
	movl	$10, -28(%rbp)
	leaq	.LC58(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movq	-24(%rbp), %rax
	movsd	8(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC59(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %edx
	leaq	.LC60(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movq	-24(%rbp), %rax
	addq	$20, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC61(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movq	-24(%rbp), %rax
	addq	$120, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC62(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movq	-24(%rbp), %rax
	addq	$420, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC63(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movq	-24(%rbp), %rax
	addq	$520, %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC64(%rip), %rcx
	call	printf
	movl	-28(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -28(%rbp)
	movl	%eax, %edx
	movl	$30, %ecx
	call	gotoXY
	movl	$2, %ecx
	call	press
	nop
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC65:
	.ascii "r+\0"
.LC66:
	.ascii "\12The NGO details are:\0"
.LC67:
	.ascii "%lf\12%ld\12%s\12%s\12%s\12%s\12\0"
	.align 8
.LC68:
	.ascii "\12\12\12\12Press [ENTER] to return to the mainmenu \12\0"
	.text
	.globl	viewNgo
	.def	viewNgo;	.scl	2;	.type	32;	.endef
	.seh_proc	viewNgo
viewNgo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC65(%rip), %rdx
	leaq	fname1(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr1(%rip), %rax
	movq	%rdx, (%rax)
	movl	$1, -4(%rbp)
	call	title
	movl	$592, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	leaq	.LC66(%rip), %rcx
	call	printf
	jmp	.L74
.L76:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	printNgo
	leaq	.LC14(%rip), %rcx
	call	puts
	movl	-4(%rbp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%rax,4), %edx
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	testl	%edx, %edx
	jne	.L75
	movl	$0, %ecx
	call	press
.L75:
	addl	$1, -4(%rbp)
.L74:
	movq	-16(%rbp), %rax
	leaq	520(%rax), %r9
	movq	-16(%rbp), %rax
	leaq	420(%rax), %r8
	movq	-16(%rbp), %rax
	leaq	120(%rax), %rcx
	movq	-16(%rbp), %rax
	leaq	20(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	16(%rax), %r11
	movq	-16(%rbp), %rax
	leaq	8(%rax), %r10
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%r11, %r9
	movq	%r10, %r8
	leaq	.LC67(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	cmpl	$-1, %eax
	jne	.L76
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	.LC68(%rip), %rcx
	call	puts
	call	getch
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC69:
	.ascii "Unable to open the NGO data file :(\0"
.LC70:
	.ascii "The file is  empty :(\0"
	.align 8
.LC71:
	.ascii "Do you want to change the file location?[Y\\N]\0"
.LC72:
	.ascii "Enter the new file location: \0"
	.align 8
.LC73:
	.ascii "File was Changed successful :)\0"
	.text
	.globl	createTree
	.def	createTree;	.scl	2;	.type	32;	.endef
	.seh_proc	createTree
createTree:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	$0, -4(%rbp)
	leaq	.LC65(%rip), %rdx
	leaq	fname1(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr1(%rip), %rax
	movq	%rdx, (%rax)
	movl	$592, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L79
	leaq	.LC69(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	movl	$0, %ecx
	call	exit
.L80:
	movl	$592, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movsd	8(%rax), %xmm0
	movq	-24(%rbp), %rax
	movsd	%xmm0, 8(%rax)
	movq	-16(%rbp), %rax
	movl	16(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 16(%rax)
	movq	-16(%rbp), %rax
	leaq	20(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rcx
	call	strcpy
	movq	-16(%rbp), %rax
	leaq	120(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$120, %rax
	movq	%rax, %rcx
	call	strcpy
	movq	-16(%rbp), %rax
	leaq	420(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$420, %rax
	movq	%rax, %rcx
	call	strcpy
	movq	-16(%rbp), %rax
	leaq	520(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	$520, %rax
	movq	%rax, %rcx
	call	strcpy
	movq	-24(%rbp), %rax
	movl	16(%rbp), %edx
	movq	%rax, %rcx
	call	insert
	addl	$1, -4(%rbp)
.L79:
	movq	-16(%rbp), %rax
	leaq	520(%rax), %r9
	movq	-16(%rbp), %rax
	leaq	420(%rax), %r8
	movq	-16(%rbp), %rax
	leaq	120(%rax), %rcx
	movq	-16(%rbp), %rax
	leaq	20(%rax), %rdx
	movq	-16(%rbp), %rax
	leaq	16(%rax), %r11
	movq	-16(%rbp), %rax
	leaq	8(%rax), %r10
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%r11, %r9
	movq	%r10, %r8
	leaq	.LC67(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	cmpl	$-1, %eax
	jne	.L80
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	cmpl	$0, -4(%rbp)
	jne	.L84
	call	title
	movl	$10, %edx
	movl	$20, %ecx
	call	gotoXY
	leaq	.LC70(%rip), %rcx
	call	printf
	movl	$11, %edx
	movl	$20, %ecx
	call	gotoXY
	leaq	.LC71(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -25(%rbp)
	cmpb	$121, -25(%rbp)
	je	.L82
	cmpb	$89, -25(%rbp)
	jne	.L83
.L82:
	movl	$12, %edx
	movl	$20, %ecx
	call	gotoXY
	leaq	.LC72(%rip), %rcx
	call	printf
	leaq	fname1(%rip), %rcx
	call	gets
	movl	$14, %edx
	movl	$20, %ecx
	call	gotoXY
	leaq	.LC73(%rip), %rcx
	call	printf
	movl	$15, %edx
	movl	$20, %ecx
	call	gotoXY
	movl	$0, %ecx
	call	press
	call	main
	jmp	.L84
.L83:
	movl	$0, %ecx
	call	exit
.L84:
	nop
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	insert
	.def	insert;	.scl	2;	.type	32;	.endef
	.seh_proc	insert
insert:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	cmpl	$-1, %eax
	je	.L87
	cmpl	$1, %eax
	jne	.L110
	movq	16(%rbp), %rax
	movq	$0, 576(%rax)
	movq	16(%rbp), %rax
	movq	$0, 584(%rax)
	movq	16(%rbp), %rax
	movl	$1, (%rax)
	movq	rootOfDeleteTree(%rip), %rax
	testq	%rax, %rax
	jne	.L89
	movq	16(%rbp), %rax
	movq	%rax, rootOfDeleteTree(%rip)
	movq	rootOfDeleteTree(%rip), %rax
	movq	$0, 576(%rax)
	movq	rootOfDeleteTree(%rip), %rax
	movq	$0, 584(%rax)
	jmp	.L90
.L89:
	movq	rootOfDeleteTree(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L91
.L94:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jne	.L92
	call	randomNumberGenerator
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, 16(%rax)
.L92:
	movq	16(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jge	.L93
	movq	-8(%rbp), %rax
	movq	576(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L91
.L93:
	movq	-8(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, -8(%rbp)
.L91:
	cmpq	$0, -8(%rbp)
	jne	.L94
	movq	16(%rbp), %rax
	movl	16(%rax), %edx
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jge	.L95
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 576(%rax)
	jmp	.L90
.L95:
	movq	-16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 584(%rax)
.L90:
	movq	rootOfDeleteTree(%rip), %rax
	jmp	.L85
.L87:
	movq	16(%rbp), %rax
	movq	$0, 576(%rax)
	movq	16(%rbp), %rax
	movq	$0, 584(%rax)
	movq	16(%rbp), %rax
	movl	$1, (%rax)
	movq	rootOfSearchTree(%rip), %rax
	testq	%rax, %rax
	jne	.L97
	movq	16(%rbp), %rax
	movq	%rax, rootOfSearchTree(%rip)
	movq	rootOfSearchTree(%rip), %rax
	movq	$0, 576(%rax)
	movq	rootOfSearchTree(%rip), %rax
	movq	$0, 584(%rax)
	jmp	.L98
.L97:
	movq	rootOfSearchTree(%rip), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L99
.L104:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm0
	movq	-24(%rbp), %rax
	movsd	8(%rax), %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L100
	ucomisd	%xmm1, %xmm0
	jne	.L100
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm1
	movsd	.LC74(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	16(%rbp), %rax
	movsd	%xmm0, 8(%rax)
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, (%rax)
.L100:
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm1
	movq	-24(%rbp), %rax
	movsd	8(%rax), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L111
	movq	-24(%rbp), %rax
	movq	576(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L99
.L111:
	movq	-24(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, -24(%rbp)
.L99:
	cmpq	$0, -24(%rbp)
	jne	.L104
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm1
	movq	-32(%rbp), %rax
	movsd	8(%rax), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L112
	movq	-32(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 576(%rax)
	jmp	.L98
.L112:
	movq	-32(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, 584(%rax)
.L98:
	movq	rootOfSearchTree(%rip), %rax
	jmp	.L85
.L110:
.L85:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC75:
	.ascii "\12 No such Data\0"
	.text
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
	.seh_proc	search
search:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movsd	%xmm1, 24(%rbp)
	movl	%r8d, 32(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L114
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm0
	ucomisd	24(%rbp), %xmm0
	jp	.L115
	ucomisd	24(%rbp), %xmm0
	jne	.L115
	cmpl	$0, 32(%rbp)
	jns	.L115
	movq	16(%rbp), %rcx
	call	printNgo
	movl	bufferForSearchFun(%rip), %eax
	addl	$1, %eax
	movl	%eax, bufferForSearchFun(%rip)
	leaq	noDataFlag(%rip), %rax
	movl	$0, (%rax)
	movsd	24(%rbp), %xmm1
	movsd	.LC74(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rbp)
	cmpl	$-2, 32(%rbp)
	jne	.L117
	movq	16(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, %ecx
	call	push
.L117:
	movq	16(%rbp), %rax
	movq	584(%rax), %rax
	movl	32(%rbp), %edx
	movsd	24(%rbp), %xmm0
	movl	%edx, %r8d
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	search
	jmp	.L118
.L115:
	movq	16(%rbp), %rax
	movsd	8(%rax), %xmm1
	movsd	24(%rbp), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L124
	movq	16(%rbp), %rax
	movq	584(%rax), %rax
	movl	32(%rbp), %edx
	movsd	24(%rbp), %xmm0
	movl	%edx, %r8d
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	search
	jmp	.L118
.L124:
	movq	16(%rbp), %rax
	movq	576(%rax), %rax
	movl	32(%rbp), %edx
	movsd	24(%rbp), %xmm0
	movl	%edx, %r8d
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	search
	jmp	.L118
.L114:
	movl	bufferForSearchFun(%rip), %eax
	testl	%eax, %eax
	jne	.L121
	leaq	.LC75(%rip), %rcx
	call	printf
	leaq	noDataFlag(%rip), %rax
	movl	$1, (%rax)
	cmpl	$-2, 32(%rbp)
	jne	.L121
	movl	$0, %ecx
	call	press
.L121:
	movq	16(%rbp), %rax
.L118:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC76:
	.ascii "\12 Enter the Pin Code: \0"
.LC77:
	.ascii "\12Searching\0"
	.text
	.globl	searchParent
	.def	searchParent;	.scl	2;	.type	32;	.endef
	.seh_proc	searchParent
searchParent:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	title
	leaq	.LC76(%rip), %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	gets
	leaq	-32(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	numberChecker
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	leaq	.LC77(%rip), %rcx
	call	printf
	movl	$150, %edx
	movl	$8, %ecx
	call	loading
	movl	$10, %ecx
	call	putchar
	movl	$0, bufferForSearchFun(%rip)
	movq	rootOfSearchTree(%rip), %rax
	movsd	-8(%rbp), %xmm0
	movl	$-1, %r8d
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	search
	movl	$0, %ecx
	call	press
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	push
	.def	push;	.scl	2;	.type	32;	.endef
	.seh_proc	push
push:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	size(%rip), %eax
	leal	-1(%rax), %edx
	movl	top(%rip), %eax
	cmpl	%eax, %edx
	jne	.L128
	movl	size(%rip), %eax
	addl	$1, %eax
	movl	%eax, size(%rip)
	movl	size(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	realloc
	movq	%rax, %rdx
	leaq	stack(%rip), %rax
	movq	%rdx, (%rax)
	movl	16(%rbp), %ecx
	call	push
	jmp	.L130
.L128:
	movl	top(%rip), %eax
	addl	$1, %eax
	movl	%eax, top(%rip)
	leaq	stack(%rip), %rax
	movq	(%rax), %rax
	movl	top(%rip), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	16(%rbp), %eax
	movl	%eax, (%rdx)
.L130:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pop
	.def	pop;	.scl	2;	.type	32;	.endef
	.seh_proc	pop
pop:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	leaq	stack(%rip), %rax
	movq	(%rax), %rax
	movl	top(%rip), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	top(%rip), %eax
	subl	$1, %eax
	movl	%eax, top(%rip)
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC78:
	.ascii "\12The below NGO information was successfully deleted: \12\0"
	.text
	.globl	deleteNode
	.def	deleteNode;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteNode
deleteNode:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L134
	movq	16(%rbp), %rax
	jmp	.L135
.L134:
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L136
.L139:
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	24(%rbp), %eax
	jle	.L137
	movq	-8(%rbp), %rax
	movq	576(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L136
.L137:
	movq	-8(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, -8(%rbp)
.L136:
	cmpq	$0, -8(%rbp)
	je	.L138
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	24(%rbp), %eax
	jne	.L139
.L138:
	movq	-8(%rbp), %rax
	movq	576(%rax), %rax
	testq	%rax, %rax
	jne	.L140
	movq	-8(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L141
.L140:
	movq	-8(%rbp), %rax
	movq	584(%rax), %rax
	testq	%rax, %rax
	jne	.L142
	movq	-8(%rbp), %rax
	movq	576(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L141
.L142:
	movq	-8(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L143
.L144:
	movq	-24(%rbp), %rax
	movq	576(%rax), %rax
	movq	%rax, -24(%rbp)
.L143:
	movq	-24(%rbp), %rax
	movq	576(%rax), %rax
	testq	%rax, %rax
	jne	.L144
	movq	-8(%rbp), %rax
	movq	576(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 576(%rax)
	movq	-8(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, -16(%rbp)
.L141:
	movq	-32(%rbp), %rax
	movq	576(%rax), %rax
	cmpq	-8(%rbp), %rax
	jne	.L145
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 576(%rax)
	jmp	.L146
.L145:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 584(%rax)
.L146:
	leaq	.LC78(%rip), %rcx
	call	puts
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	printNgo
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %ecx
	call	press
	call	printTree
	movq	$0, rootOfSearchTree(%rip)
	movl	$-1, %ecx
	call	createTree
	movq	16(%rbp), %rax
.L135:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC79:
	.ascii "\12Are you sure that you want to delete the above NGO information?\12[Press Y\\N]\0"
.LC80:
	.ascii "\12Deletion was cancelled\0"
.LC81:
	.ascii "\12Wrong option :(\0"
	.text
	.globl	deleteNodeParent
	.def	deleteNodeParent;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteNodeParent
deleteNodeParent:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
.L153:
	leaq	.LC79(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -1(%rbp)
	cmpb	$121, -1(%rbp)
	je	.L148
	cmpb	$89, -1(%rbp)
	jne	.L149
.L148:
	movq	rootOfDeleteTree(%rip), %rax
	movl	16(%rbp), %edx
	movq	%rax, %rcx
	call	deleteNode
	jmp	.L150
.L149:
	cmpb	$110, -1(%rbp)
	je	.L151
	cmpb	$78, -1(%rbp)
	jne	.L152
.L151:
	leaq	.LC80(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	jmp	.L150
.L152:
	leaq	.LC81(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	jmp	.L153
.L150:
	leaq	adminName(%rip), %rax
	movq	%rax, %rcx
	call	adminMainMenu
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC82:
	.ascii "\12Enter the pin code to be deleted: \0"
.LC83:
	.ascii "\12No Such Data\0"
	.align 8
.LC84:
	.ascii "\12Now enter the Unique ID of the NGO from the above list: \0"
.LC85:
	.ascii "%ld\0"
.LC86:
	.ascii "\12\12\12Wrong Unique ID entered\0"
	.text
	.globl	deleteNodeGrandParent
	.def	deleteNodeGrandParent;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteNodeGrandParent
deleteNodeGrandParent:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movl	$0, -4(%rbp)
	movl	top(%rip), %eax
	movl	%eax, -8(%rbp)
	call	title
	leaq	.LC82(%rip), %rcx
	call	printf
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	gets
	leaq	-48(%rbp), %rax
	movl	$3, %edx
	movq	%rax, %rcx
	call	numberChecker
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movl	$0, bufferForSearchFun(%rip)
	movq	rootOfSearchTree(%rip), %rax
	movsd	-16(%rbp), %xmm0
	movl	$-2, %r8d
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	search
	leaq	noDataFlag(%rip), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L155
	leaq	.LC83(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	leaq	adminName(%rip), %rax
	movq	%rax, %rcx
	call	adminMainMenu
	jmp	.L160
.L155:
	leaq	noDataFlag(%rip), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L160
	leaq	.LC84(%rip), %rcx
	call	printf
	leaq	-24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC85(%rip), %rcx
	call	scanf
	jmp	.L157
.L159:
	call	pop
	movl	%eax, -20(%rbp)
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jne	.L157
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	call	deleteNodeParent
	addl	$1, -4(%rbp)
.L157:
	movl	top(%rip), %eax
	cmpl	$-1, %eax
	je	.L158
	cmpl	$0, -4(%rbp)
	je	.L159
.L158:
	movl	top(%rip), %eax
	cmpl	$-1, %eax
	jne	.L160
	cmpl	$0, -4(%rbp)
	jne	.L160
	leaq	.LC86(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	jmp	.L160
.L161:
	call	pop
.L160:
	movl	top(%rip), %eax
	cmpl	$-1, %eax
	jne	.L161
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	printDataToFile
	.def	printDataToFile;	.scl	2;	.type	32;	.endef
	.seh_proc	printDataToFile
printDataToFile:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L165
	movq	24(%rbp), %rax
	leaq	520(%rax), %r10
	movq	24(%rbp), %rax
	leaq	420(%rax), %r9
	movq	24(%rbp), %rax
	leaq	120(%rax), %r8
	movq	24(%rbp), %rax
	leaq	20(%rax), %rcx
	movq	24(%rbp), %rax
	movl	16(%rax), %edx
	movq	24(%rbp), %rax
	movsd	8(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %r11
	movq	%r11, -8(%rbp)
	movsd	-8(%rbp), %xmm1
	movq	%rax, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	%r10, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%edx, %r9d
	movapd	%xmm1, %xmm2
	movq	%xmm0, %r8
	leaq	.LC57(%rip), %rdx
	movq	16(%rbp), %rcx
	call	fprintf
	movq	24(%rbp), %rax
	movq	576(%rax), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	printDataToFile
	movq	24(%rbp), %rax
	movq	584(%rax), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	printDataToFile
	jmp	.L162
.L165:
	nop
.L162:
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC87:
	.ascii "w\0"
	.text
	.globl	printTree
	.def	printTree;	.scl	2;	.type	32;	.endef
	.seh_proc	printTree
printTree:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC87(%rip), %rdx
	leaq	fname1(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr1(%rip), %rax
	movq	%rdx, (%rax)
	movq	rootOfDeleteTree(%rip), %rdx
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	printDataToFile
	leaq	fptr1(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC88:
	.ascii "\12\12\12\11\11\11Only numbers allowed\0"
	.align 8
.LC89:
	.ascii "\12\12\12\12Press\12\11\11[1] to continue\12\11\11[Esc] to exit\0"
.LC90:
	.ascii "\12Wrong Option\0"
	.text
	.globl	numberChecker
	.def	numberChecker;	.scl	2;	.type	32;	.endef
	.seh_proc	numberChecker
numberChecker:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -32(%rbp)
	movl	%edx, -24(%rbp)
	movl	$0, -68(%rbp)
	jmp	.L168
.L176:
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$9, %eax
	jbe	.L169
	leaq	.LC88(%rip), %rcx
	call	printf
.L175:
	leaq	.LC89(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -69(%rbp)
	cmpb	$49, -69(%rbp)
	jne	.L170
	cmpl	$1, -24(%rbp)
	jne	.L171
	call	addNgo
	jmp	.L178
.L171:
	cmpl	$-1, -24(%rbp)
	jne	.L173
	call	searchParent
	jmp	.L178
.L173:
	cmpl	$3, -24(%rbp)
	jne	.L178
	movq	rootOfDeleteTree(%rip), %rax
	movq	%rax, %rcx
	call	deleteNodeGrandParent
	jmp	.L178
.L170:
	cmpb	$27, -69(%rbp)
	jne	.L174
	movl	$0, %ecx
	call	exit
.L174:
	leaq	.LC90(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	jmp	.L175
.L178:
	nop
.L169:
	addl	$1, -68(%rbp)
.L168:
	movl	-68(%rbp), %eax
	movslq	%eax, %rbx
	movq	-32(%rbp), %rcx
	call	strlen
	cmpq	%rax, %rbx
	jb	.L176
	movq	-32(%rbp), %rcx
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC91:
	.ascii "%c\0"
	.text
	.globl	dateAndTimeGenerator
	.def	dateAndTimeGenerator;	.scl	2;	.type	32;	.endef
	.seh_proc	dateAndTimeGenerator
dateAndTimeGenerator:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$0, %ecx
	call	time
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	localtime
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %r9
	leaq	.LC91(%rip), %r8
	movl	$30, %edx
	leaq	date(%rip), %rax
	movq	%rax, %rcx
	call	strftime
	movl	$95, %r8d
	movl	$32, %edx
	leaq	date(%rip), %rax
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	date(%rip), %rax
	movq	%rax, %rcx
	call	strcpy
	leaq	date(%rip), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC92:
	.ascii "[1] Admin Log\0"
.LC93:
	.ascii "[2] User Log\0"
	.align 8
.LC94:
	.ascii "[3] to return to the Main Menu\0"
.LC95:
	.ascii "[Esc] to Exit\0"
.LC96:
	.ascii "r\0"
.LC97:
	.ascii "\12The Admin log is: \0"
.LC98:
	.ascii "\12\11\11[%d]\11Name: %s\0"
.LC99:
	.ascii "\12\11\11\11Time: %s\12\0"
.LC100:
	.ascii "\12The User Log Details are: \0"
.LC101:
	.ascii "%s %s\0"
	.text
	.globl	auditLog
	.def	auditLog;	.scl	2;	.type	32;	.endef
	.seh_proc	auditLog
auditLog:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movl	$12, -4(%rbp)
	movl	$0, -8(%rbp)
.L193:
	call	title
	movl	$10, %edx
	movl	$40, %ecx
	call	gotoXY
	leaq	.LC37(%rip), %rcx
	call	printf
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movl	%eax, %edx
	movl	$50, %ecx
	call	gotoXY
	leaq	.LC92(%rip), %rcx
	call	printf
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movl	%eax, %edx
	movl	$50, %ecx
	call	gotoXY
	leaq	.LC93(%rip), %rcx
	call	printf
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movl	%eax, %edx
	movl	$50, %ecx
	call	gotoXY
	leaq	.LC94(%rip), %rcx
	call	printf
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movl	%eax, %edx
	movl	$50, %ecx
	call	gotoXY
	leaq	.LC95(%rip), %rcx
	call	printf
	call	getche
	movb	%al, -9(%rbp)
	movsbl	-9(%rbp), %eax
	cmpl	$49, %eax
	je	.L183
	cmpl	$49, %eax
	jg	.L184
	cmpl	$27, %eax
	je	.L185
	jmp	.L182
.L184:
	cmpl	$50, %eax
	je	.L186
	cmpl	$51, %eax
	je	.L187
	jmp	.L182
.L183:
	leaq	.LC14(%rip), %rcx
	call	puts
	movl	$0, -8(%rbp)
	leaq	.LC96(%rip), %rdx
	leaq	fname2(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr2(%rip), %rax
	movq	%rdx, (%rax)
	call	title
	leaq	.LC97(%rip), %rcx
	call	printf
	jmp	.L188
.L189:
	addl	$1, -8(%rbp)
	leaq	-48(%rbp), %rdx
	movl	-8(%rbp), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC98(%rip), %rcx
	call	printf
	leaq	-80(%rbp), %rax
	movl	$32, %r8d
	movl	$95, %edx
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC99(%rip), %rcx
	call	printf
.L188:
	leaq	fptr2(%rip), %rax
	movq	(%rax), %rax
	leaq	-80(%rbp), %rcx
	leaq	-48(%rbp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	cmpl	$-1, %eax
	jne	.L189
	movl	$0, %ecx
	call	press
	leaq	fptr2(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	jmp	.L190
.L186:
	call	title
	movl	$0, -8(%rbp)
	leaq	.LC14(%rip), %rcx
	call	puts
	leaq	.LC100(%rip), %rcx
	call	printf
	leaq	.LC96(%rip), %rdx
	leaq	fname3(%rip), %rcx
	call	fopen
	movq	%rax, %rdx
	leaq	fptr3(%rip), %rax
	movq	%rdx, (%rax)
	jmp	.L191
.L192:
	addl	$1, -8(%rbp)
	leaq	-48(%rbp), %rdx
	movl	-8(%rbp), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC98(%rip), %rcx
	call	printf
	movl	$32, %r8d
	movl	$95, %edx
	leaq	date(%rip), %rax
	movq	%rax, %rcx
	call	replace
	movq	%rax, %rdx
	leaq	.LC99(%rip), %rcx
	call	printf
.L191:
	leaq	fptr3(%rip), %rax
	movq	(%rax), %rax
	leaq	-48(%rbp), %rdx
	leaq	date(%rip), %rcx
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC101(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	cmpl	$-1, %eax
	jne	.L192
	movl	$0, %ecx
	call	press
	leaq	fptr3(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	fclose
	jmp	.L190
.L185:
	leaq	.LC18(%rip), %rcx
	call	printf
	movl	$250, %edx
	movl	$8, %ecx
	call	loading
	movl	$0, %ecx
	call	exit
.L187:
	leaq	adminName(%rip), %rax
	movq	%rax, %rcx
	call	adminMainMenu
	jmp	.L190
.L182:
	leaq	.LC90(%rip), %rcx
	call	printf
	movl	$0, %ecx
	call	press
	nop
.L190:
	jmp	.L193
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC74:
	.long	-1998362383
	.long	1055193269
	.ident	"GCC: (tdm64-1) 5.1.0"
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	calloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	getche;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	getch;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	gets;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	fscanf;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	atof;	.scl	2;	.type	32;	.endef
	.def	localtime;	.scl	2;	.type	32;	.endef
	.def	strftime;	.scl	2;	.type	32;	.endef
