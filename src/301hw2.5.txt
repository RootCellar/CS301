
section .text
global foo

foo:


; your assembly code here!
extern print_long

cmp rdi, 1
jl end

mov rcx, 1

loop:

push rdi
mov rdi, rcx
push rcx
call print_long
pop rcx
pop rdi
add rcx, 1
cmp rcx, rdi
jle loop

end:

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
			

