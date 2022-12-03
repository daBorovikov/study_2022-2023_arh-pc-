%include 'in_out.asm'
section .data
	msg1 db 'Введите a: ',0h
	msg2 db "Ответ: ",0h
	msg3 db 'Введите x: ',0h
section .bss
	min resb 10
	x resb 10
	a resb 10
section .text
	global _start
_start:
; ---------- Вывод сообщения 'Введите a: '
	mov eax,msg1
	call sprint
; ---------- Ввод 'A'
	mov ecx,a
	mov edx,10
	call sread
	; ---------- Преобразование 'a' из символа в число
	mov eax,a
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [a],eax ; запись преобразованного числа в 'a'
	
; ---------- Вывод сообщения 'Введите x: '
	mov eax,msg3
	call sprint
; ---------- Ввод 'x'
	mov ecx,x
	mov edx,10
	call sread
	
	; ---------- Преобразование 'x' из символа в число
	mov eax,x
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [x],eax ; запись преобразованного числа в 'x'
	
	
	
; ---------- Сравниваем 'a' и 'x' (как символы)
	mov ecx,[x]
	cmp [a],ecx; Сравниваем 'C' и 'A'
	je check_B; если 'a=x', то переход на метку 'check_a'
	
	mov eax,[x]; иначе 'ecx = C' a+x
	mov ecx,[a]
	add eax,ecx;
	mov [min],eax ; 'min = C'
	jmp fin
	
; ----------Преобразование 'min(A,C)' из символа в число
check_B:
	mov eax,[a]
	mov ecx,6
	mul ecx
	mov [min],eax;
		

	; ----------Вывод результата
fin:
	mov eax, msg2
	call sprint ; Вывод сообщения 'Наибольшее число: '
	mov eax,[min]
	call iprintLF; Вывод 'min(A,B,C)'
	call quit; Выход

	
	
