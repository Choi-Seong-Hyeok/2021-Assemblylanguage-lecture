.data
str1: .asciz "Value?> "
str2: .asciz "%d"
str3: .asciz "{%d, %d, %d, %d, %d}\n"
str4: .asciz "Max: %d\n"
str5: .asciz "Min: %d\n"
.align 4
val: .word 0
.text 
max_num = -28
min_num = -24
arr_nums = -20

.global main
main:
	save %sp, -120, %sp
	set str1, %o0
	call printf
	nop
	set str2, %o0
	set val, %o1
	call scanf
	nop
	set val, %o0
	ld [%o0], %o0
	cmp %o0, 1   !insert 1
	be random
	nop

	mov arr_nums, %o0   !insert 0
	add %fp, %o0, %o0
	mov 10, %l0
	st %l0, [%o0]
	mov 20, %l0
	st %l0, [%o0+4]
	mov 30, %l0
	st %l0, [%o0+8]
	mov 40, %l0
	st %l0, [%o0+12]
	mov 50, %l0
	st %l0, [%o0+16]

	call print
	nop



random:
	call time
	mov 0, %o0
	call srand
	mov 0, %l0

random_loop:
	cmp %l0, 5
	be print
	nop

	call rand 
	nop
	mov 100, %o1
	call .rem

	mov %l0, %l1
	sll %l1, 2, %l1
	mov arr_nums, %o1
	add %fp, %o1, %o1
	st %o0, [%o1+%l1]
	inc %l0
	ba random_loop 
	nop

print:
	add %fp, arr_nums, %o0
	ld [%o0], %o1
	add %fp, max_num, %l0
	add %fp, min_num, %l1
	st %o1, [%l0]
	st %o1, [%l1]
	ld [%o0+4], %o2
	ld [%o0+8], %o3
	ld [%o0+12], %o4
	ld [%o0+16], %o5
	set str3, %o0
	call printf
	nop
	
	ba max
	mov 1, %l0

max_change:
	add %fp, max_num, %o0
	st %l4, [%o0]
	inc %l0


max:
	cmp %l0, 5
	be min_s
	nop

	ld [%fp+max_num],%l5 ! max
	mov %l0, %l1
	sll %l1, 2, %l1
	add arr_nums, %l1, %o0
	add %fp, %o0, %o0
	ld [%o0], %l4	
	
	cmp %l5, %l4
	bl max_change
	nop

	inc %l0
	ba max
	nop

min_change:
	add %fp, min_num, %o0
	st %l4, [%o0]
	inc %l0

min:
	cmp %l0, 5
	be result
	nop

	ld [%fp+min_num],%l5 ! min
	mov %l0, %l1
	sll %l1, 2, %l1
	add arr_nums, %l1, %o0
	add %fp, %o0, %o0
	ld [%o0], %l4	
	
	cmp %l4, %l5
	bl min_change
	nop

	inc %l0
	ba min
	nop
min_s:
	mov 1, %l0
	ba min
	nop

result:

	set str4, %o0
	add %fp, max_num, %o1
	ld [%o1], %o1
	call printf
	nop
	set str5, %o0
	add %fp, min_num, %o1
	ld [%o1], %o1
	call printf
	nop
	



	ret
	restore

