%include 'in_out.asm'
section .data
	msg1 db 'Введите B: ',0h
	msg2 db "Наименьшее число: ",0h
	msg3 db 'Введите A: ',0h
	msg4 db 'Введите C: ',0h
section .bss
	min resb 10
	B resb 10
	A resb 10
	C resb 10
section .text
	global _start
_start:
; ---------- Вывод сообщения 'Введите A: '
	mov eax,msg3
	call sprint
; ---------- Ввод 'A'
	mov ecx,A
	mov edx,10
	call sread
	; ---------- Преобразование 'a' из символа в число
	mov eax,A
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [A],eax ; запись преобразованного числа в 'B'
	; ---------- Вывод сообщения 'Введите B: '
	mov eax,msg1
	call sprint
; ---------- Ввод 'B'
	mov ecx,B
	mov edx,10
	call sread
	
	; ---------- Преобразование 'b' из символа в число
	mov eax,B
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [B],eax ; запись преобразованного числа в 'B'
; ---------- Вывод сообщения 'Введите C: '
	mov eax,msg4
	call sprint
; ---------- Ввод 'C'
	mov ecx,C
	mov edx,10
	call sread
	; ---------- Преобразование 'C' из символа в число
	mov eax,C
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [C],eax ; запись преобразованного числа в 'B'
; ---------- Записываем 'A' в переменную 'min'
	mov ecx,[A] ; 'ecx = A'
	mov [min],ecx ; 'min = A'
; ---------- Сравниваем 'A' и 'С' (как символы)
	cmp [C],ecx; Сравниваем 'C' и 'A'
	jg check_B; если 'C>A', то переход на метку 'check_B', то есть сравним с б
	mov ecx,[C]; иначе 'ecx = C'
	mov [min],ecx ; 'min = C'
; ----------Преобразование 'min(A,C)' из символа в число
check_B:	
; ---------- Сравниваем 'min(A,C)' и 'B' (как числа)
	mov ecx,[min]
	cmp [B],ecx; Сравниваем 'B' and 'min(A,C)'
	jg fin ; если 'min(A,C)<B', то переход на 'fin',
	mov ecx,[B] ; иначе 'ecx = B'
	mov [min],ecx
	; ----------Вывод результата
fin:
	mov eax, msg2
	call sprint ; Вывод сообщения 'Наибольшее число: '
	mov eax,[min]
	call iprintLF; Вывод 'min(A,B,C)'
	call quit; Выход

	
	
