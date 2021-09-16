
section .text
global foo

foo:


;setup
;push reserved

cmp rdi, 0
je retzero

push rbx
push r12

mov rcx, 1
mov rax, 0
mov rbx, 0
mov r12, rdi

;loop
mainloop:

	mov rdi, rcx
	push rcx
	call factorial
	pop rcx
	add rbx, rax
	add rcx, 1
	
	cmp rcx, r12
	jg mainret
	jmp mainloop
	
	
mainret:
	
mov rax, rbx

;pop reserved
pop r12
pop rbx
jmp retnow

retzero:

mov rax, 0

retnow:

ret


;compute the factorial of rdi
factorial:
mov rax, rdi
mov rcx, 1

cmp rdi, 0
je facretone

facloop:

imul rax, rcx
add rcx, 1

cmp rcx, rdi
jl facloop
jmp facret

facretone:

mov rax, 1

facret:

ret

section .text
netrun_ran_off_end:
	mov rdi,netrun_ran_off_end_string
	extern puts
	call puts
	mov rax,0
	ret ; added by netrun

section .data
netrun_ran_off_end_string: db "Your assembly needs a ret at the end."
section .text
			

