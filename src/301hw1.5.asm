

; TraceASM support code:
section .bss align=32

global TraceASM_state
TraceASM_state:
	resq 16 ; times 16 dq 0 ; [0]: general purpose integer registers, rax - r15
	resq 32 ; times 16 dq 0,0 ; [8*16]: xmm0-15
TraceASM_state_flags:
	resq 2 ; times 2 dq 0 ; flags area (big for alignment)
TraceASM_state_end:

TraceASM_stack:
	resq 1024*1024
TraceASM_stack_end:

section .text

;  trace arguments: %1 is line number; %2 is code being executed.
%macro TraceASM 2

; Basic idea: show differences in machine state after each line of x86 code.
; Need a user-visible copy of all machine state:

%%save_TraceASM:
	; Save all the integer registers:
	mov QWORD[TraceASM_state+8*0],rax
	mov QWORD[TraceASM_state+8*1],rcx
	mov QWORD[TraceASM_state+8*2],rdx
	mov QWORD[TraceASM_state+8*3],rbx
	mov QWORD[TraceASM_state+8*4],rsp
	mov QWORD[TraceASM_state+8*5],rbp
	mov QWORD[TraceASM_state+8*6],rsi
	mov QWORD[TraceASM_state+8*7],rdi
	mov QWORD[TraceASM_state+8*8],r8
	mov QWORD[TraceASM_state+8*9],r9
	mov QWORD[TraceASM_state+8*10],r10
	mov QWORD[TraceASM_state+8*11],r11
	mov QWORD[TraceASM_state+8*12],r12
	mov QWORD[TraceASM_state+8*13],r13
	mov QWORD[TraceASM_state+8*14],r14
	mov QWORD[TraceASM_state+8*15],r15
	
	; Save all the floating point registers
	movaps [TraceASM_state+8*16+16*0],xmm0
	movaps [TraceASM_state+8*16+16*1],xmm1
	movaps [TraceASM_state+8*16+16*2],xmm2
	movaps [TraceASM_state+8*16+16*3],xmm3
	movaps [TraceASM_state+8*16+16*4],xmm4
	movaps [TraceASM_state+8*16+16*5],xmm5
	movaps [TraceASM_state+8*16+16*6],xmm6
	movaps [TraceASM_state+8*16+16*7],xmm7
	movaps [TraceASM_state+8*16+16*8],xmm8
	movaps [TraceASM_state+8*16+16*9],xmm9
	movaps [TraceASM_state+8*16+16*10],xmm10
	movaps [TraceASM_state+8*16+16*11],xmm11
	movaps [TraceASM_state+8*16+16*12],xmm12
	movaps [TraceASM_state+8*16+16*13],xmm13
	movaps [TraceASM_state+8*16+16*14],xmm14
	movaps [TraceASM_state+8*16+16*15],xmm15
	
	
	; Switch stacks to the tracer stack 
	;  (avoids trashing user stack while printing)
	mov rsp,TraceASM_stack_end
	
	; Save flags (mov above does not change flags)
	pushf
	pop rax
	mov QWORD[TraceASM_state_flags],rax

	mov rdi,%1,
	mov rsi,%%codestring
	mov rdx,TraceASM_state
	mov rcx,TraceASM_state_end-TraceASM_state
	extern TraceASM_cside
	call TraceASM_cside
	jmp %%restore_TraceASM

%%codestring: db %2,0
	
; Restore the machine from the single TraceASM_state:
%%restore_TraceASM:
	; Restore flags
	mov rax,QWORD[TraceASM_state_flags]
	push rax
	popf
	
	; Restore all the integer registers:
	mov rax,QWORD[TraceASM_state+8*0]
	mov rcx,QWORD[TraceASM_state+8*1]
	mov rdx,QWORD[TraceASM_state+8*2]
	mov rbx,QWORD[TraceASM_state+8*3]
	mov rsp,QWORD[TraceASM_state+8*4]
	mov rbp,QWORD[TraceASM_state+8*5]
	mov rsi,QWORD[TraceASM_state+8*6]
	mov rdi,QWORD[TraceASM_state+8*7]
	mov r8,QWORD[TraceASM_state+8*8]
	mov r9,QWORD[TraceASM_state+8*9]
	mov r10,QWORD[TraceASM_state+8*10]
	mov r11,QWORD[TraceASM_state+8*11]
	mov r12,QWORD[TraceASM_state+8*12]
	mov r13,QWORD[TraceASM_state+8*13]
	mov r14,QWORD[TraceASM_state+8*14]
	mov r15,QWORD[TraceASM_state+8*15]
	
	; Restore all the floating point registers
	movaps xmm0, [TraceASM_state+8*16+16*0]
	movaps xmm1, [TraceASM_state+8*16+16*1]
	movaps xmm2, [TraceASM_state+8*16+16*2]
	movaps xmm3, [TraceASM_state+8*16+16*3]
	movaps xmm4, [TraceASM_state+8*16+16*4]
	movaps xmm5, [TraceASM_state+8*16+16*5]
	movaps xmm6, [TraceASM_state+8*16+16*6]
	movaps xmm7, [TraceASM_state+8*16+16*7]
	movaps xmm8, [TraceASM_state+8*16+16*8]
	movaps xmm9, [TraceASM_state+8*16+16*9]
	movaps xmm10, [TraceASM_state+8*16+16*10]
	movaps xmm11, [TraceASM_state+8*16+16*11]
	movaps xmm12, [TraceASM_state+8*16+16*12]
	movaps xmm13, [TraceASM_state+8*16+16*13]
	movaps xmm14, [TraceASM_state+8*16+16*14]
	movaps xmm15, [TraceASM_state+8*16+16*15]

%endmacro

section .text
global foo

foo:


TraceASM 0,"Startup"

; your assembly code here!
mov rax, rdi
TraceASM 2,'mov rax, rdi'
mov rcx, 1
TraceASM 3,'mov rcx, 1'

cmp rdi, 0
TraceASM 5,'cmp rdi, 0'
je retzero
TraceASM 6,'je retzero'

loop:

imul rax, rcx
TraceASM 10,'imul rax, rcx'
add rcx, 1
TraceASM 11,'add rcx, 1'

cmp rcx, rdi
TraceASM 13,'cmp rcx, rdi'
jl loop
TraceASM 14,'jl loop'
jmp ret
TraceASM 15,'jmp ret'

retzero:

mov rax, 1
TraceASM 19,'mov rax, 1'

ret:

ret
TraceASM 23,'ret'


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
			

