
section .text
global foo

foo:
extern print_long
mov rdi,5
mov rcx,print_long


; Your code here!
call rcx
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
			

