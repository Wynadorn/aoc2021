;hello world in assembly

; rdi		1st argument
; rsi		2nd argument
; rdx		3rd argument
; rcx		4th argument
; r8		5th argument
; r9		6th argument
; rax		syscall number
; syscall	call the kernel


section .text
	global _start

section .data
	msg: db 0x48, 0x45, 0x4C, 0x4C, 0x4F, 0x20, 0x57, 0x4F, 0x52, 0x4C, 0x44, 0xA
	;msg: db "Hello world!", 10
	msglen: equ $ - msg

section .text
	; Linker entry point
	_start:

		; Write to stdout
		mov rax,1		;system call number (sys_write) (rax = 64-bit Accumulator Register)
		mov rdi,1		;push 1 (file descriptior) to rbx (64-bit Base Register) / stdout
		mov rsi,msg		;push message to rcx (64-Bit Counter Register)
		mov rdx,msglen	;push message length to rdx (64-bit Data Register)
		syscall			;call kernel

		; Exit via kernel
		mov rax, 60		;Set the 64-bit Accumulator Register to 60 to execute sys_exit on syscall
		mov rdi, 0		;Set the 64-bit Destination Index to 0
		syscall			;call kernel, this interrupt won't return