extern _printf
extern _scanf
section .data
	msg1 db "Input number to change: ",0
	msg2 db "In binary is: ",0
	msg8 db 10,"In octal is: ",0
	msg16 db 10,"In hexadecimal is: ",0 
	formatin db "%d",0
	
	formatout db "%d",10,0
	forstring db "%c",0
	int_1: times 4 dd 0
    ;    int_1 dd 123
	num dd 2
	octal dd 8
	hexa dd 16
	num2 dd 0
	num3 dd 0

section .bss
	res resb 1
	res1 resb 1
section .text
	global _main
	_main:
    
		
		push ebx
		push ecx
		
		push msg1
		call _printf
		add esp,4
		
		push int_1
		push formatin
		call _scanf
		add esp,8	
ver2:		
		mov ebx,[num3]
		xor edx,edx
		mov eax,[int_1]
		mov ecx,[num]  		
		div ecx
		mov [num2],eax
		push edx
		inc ebx
		
	lv1:	
		xor eax,eax
		xor edx,edx
		mov eax,[num2]
		mov ecx,[num]		
		div ecx
		
		mov [num2],eax
		
		push edx
		inc ebx
		xor eax,eax
		mov eax,[num2]
		
		cmp eax,0
		je pr
		jmp lv1
	pr:	
		push msg2
		call _printf
		add esp,4
	pr1:
		push formatin
		call _printf
		pop eax
		pop eax
		
		dec ebx
		cmp ebx,0
		jne pr1
		add esp,4
		xor ebx,ebx
ver8:
		push msg8
		call _printf
		add esp,4
		xor edx,edx
		mov ebx,0
		mov eax,[int_1]
		mov ecx,[octal]
		div ecx
		mov [num2],eax
		push edx
		inc ebx
		
	l8:
		xor eax,eax
		xor edx,edx
		mov eax,[num2]
		mov ecx,[octal]
		div ecx
		mov [num2],eax
		push edx
		inc ebx
		xor eax,eax
		mov eax,[num2]
		cmp eax,0
		je finish8
		jmp l8
		
	finish8:
		push formatin
		call _printf
		pop edx
		pop edx
		dec ebx
		cmp ebx,0 
		jne finish8
		add esp,4
ver16:
		push msg16
		call _printf
		add esp,4
		xor ebx,ebx
		xor edx,edx
		mov ebx,0
		mov eax,[int_1]
		mov ecx,[hexa]
		div ecx
		mov [num2],eax
		cmp edx,10
        jne checkB
        mov edx,'A'
        jmp next
    checkB:  cmp edx,11
        jne checkC
        mov edx,'B'
        jmp next
    checkC:   cmp edx,12
        jne checkD 
        mov edx,'C'
        jmp next
	checkD:   cmp edx,13
        jne checkE 
        mov edx,'D'
        jmp next
    checkE:   cmp edx,14
        jne checkF 
        mov edx,'E'
        jmp next
    checkF: cmp edx,15
		jne outof
		mov edx,'F'
    next:    
		push edx
	    push forstring
        inc ebx
        jmp l16
	outof: 	
		push edx
		push formatin
		inc ebx
        
        mov eax,[num2]
        cmp eax,0
		je finish16
	l16:
		xor eax,eax
		xor edx,edx
		mov eax,[num2]
		mov ecx,[hexa]
		div ecx
		mov [num2],eax
	
        cmp edx,10
        jne checkB
        mov edx,'A'
        jmp next
                
	finish16:
		
		call _printf
		pop ecx
		pop ecx
		dec ebx
		cmp ebx,0
		jne finish16
        ;add esp,8
		ret
