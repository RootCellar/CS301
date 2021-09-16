
section .text
global foo

foo:


; Your assembly code here!
mov rdi, 2
mov rax, 2
add rax, rdi
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
			

