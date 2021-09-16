
section .text
global foo

foo:


; Your code here!
mov rax, [theAnswers]
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
			theAnswers:
  dq 5
  dq 7


