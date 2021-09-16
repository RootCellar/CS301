
section .text
global foo

foo:


; Your I/O assembly code here!

extern print_long
extern getchar

call getchar
mov rdi, rax

sub rdi, 48
call print
mov rax, 0
ret

print:
cmp rdi, 1
jl printend

mov rcx, 1

printloop:

push rdi
mov rdi, rcx
push rcx
call print_long
pop rcx
pop rdi
add rcx, 1
cmp rcx, rdi
jle printloop

printend:

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
			

