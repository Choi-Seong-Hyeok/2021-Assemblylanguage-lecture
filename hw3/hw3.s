.text
.global main
main:
	save %sp, -96, %sp
	set str1, %o0
	call printf
	nop
	set str2, %o0
	set val, %o1
	call scanf 
	nop
	set val, %l0
	ld [%l0], %l0

	set str1, %o0
	call printf
	nop
	set str2 ,%o0
	set val, %o1
	call scanf 
	nop
	set val, %l1
	ld [%l1], %l1

	cmp %l0, %l1
	bl case_1
	nop
	mov %l0, %o0  !큰수 o0에 저장
	mov %l1, %o1  !작은수 o1에 저장
	ba loop
	nop
case_1:
	mov %l1, %o0  !큰수 o0에 저장
	mov %l0, %o1  !작은수 o1에 저장 

loop:    
	call .rem
	nop
	mov %o0, %l0
	cmp %o0, 0
	be result
	nop
	mov %o1, %o0
	mov %l0, %o1
	ba loop
	nop

result:
	set str3, %o0
	call printf
	nop
	ret
	restore
.data
str1:.asciz "Value?>"
str2:.asciz "%d"
str3:.asciz "GCD is %d"
.align 4
val:.word 0





















