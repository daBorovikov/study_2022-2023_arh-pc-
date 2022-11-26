%include 'in_out.asm'

	SECTION .data

	msg: DB 'Программа вычисления f(x)=5(x-1)^2 ',0
	rem: DB 'Ответ: ',0
	
	SECTION .bss
	x: RESB 80

	SECTION .text
	GLOBAL _start
	_start:

	mov eax, msg
	call sprintLF
	
	mov ecx, x
	mov edx, 80
	call sread
	
	mov eax,x
	call atoi
	
	add eax,-1
	
	mov ebx,eax
	mul ebx
	
	mov ebx,5
	mul ebx
	
	mov edi,eax 

	mov eax,rem 
	call sprint  
	mov eax,edi 
	call iprintLF 

	call quit 
