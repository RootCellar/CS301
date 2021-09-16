
section .text
global foo

foo:


; Your I/O assembly code here!
extern puts
mov rdi, datalabel
call puts
ret

datalabel:
	db "Hello, world!", 0

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
			

