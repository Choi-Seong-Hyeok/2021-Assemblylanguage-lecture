.global main
main : save %sp, -96, %sp
		mov %i0, %o0
		mov %i1, %o1
		call .rem
		nop
		sub %i2, %i3, %i2
		add %i4, %i5, %i4
		add %o0, %i2, %o0
		mov 12, %o1
		call .mul
		nop
		mov %i4, %o1
		call .div
		nop
		mov %o0, %i0
result: ret
        restore

