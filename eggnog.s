    .global	main
main:
    // pre-increment the stack point to create space for two 8-byte registers
    // link register (x30), and frame pointer (x29), and store them.
	stp	x29, x30, [sp, -16]!

    // Load the argument and perform the call. Like 'printf("...")' in C.
	ldr	x0, =message1
	bl	printf

	ldr	x0, =message2
	bl	printf

	ldr	x0, =message3
	bl	printf

    // initialize the return value in the return register
	mov	x0, 0

    // restore the registers and post-decrement 
    // the stack pointer for consistency
	ldp	x29, x30, [sp], 16

    // return from the call
	ret

message1:
	.asciz "havent had eggnog\n"
message2:
	.asciz "so i dont know what to say\n"
message3:
	.asciz "but seems pretty good\n"
