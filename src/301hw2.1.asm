
section .text
global foo

foo:


; your assembly code here!
extern print_long
add rdi, 10
call print_long
mov rax, 0
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
			

