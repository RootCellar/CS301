
section .text
global foo

foo:


mov rdi,theString
add rdi, 4
extern puts
call puts
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
			theString:
	db 'NOT the right answer.',0

