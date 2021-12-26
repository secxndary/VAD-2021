.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outnum PROTO : DWORD

 outstr PROTO : DWORD

 strcopy PROTO : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 sdword 200
		LTRL2 sdword 100
		LTRL3 byte 'Lenght + 5:          ', 0
		LTRL4 byte 'String copy:         ', 0
		LTRL5 sdword 10
		LTRL6 sdword 3
		LTRL7 byte '10 module 3:         ', 0
		LTRL8 byte 'VAD-2021', 0
		LTRL9 byte 'Course Project Test', 0
		LTRL10 byte '70', 0
		LTRL11 byte 'Cycle:               ', 0
		LTRL12 sdword 125
		LTRL13 sdword 1
		LTRL14 byte '; ', 0
		LTRL15 byte 'Number after cycle:  ', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		stringsk sdword 0
		stringskk sdword 0
		stringsstr dword ?
		mainx sdword 0
		mainy sdword 0
		mainstrx dword ?
		mainstry dword ?
		mainstrz dword ?
		mainab sdword 0
.code

;------------- strings --------------
strings PROC,
	stringsa : dword, stringsb : dword  
; -------- save registers -------
push ebx
push edx
; -------------------------------
push LTRL1

pop ebx
mov stringsk, ebx

push LTRL2

pop ebx
mov stringskk, ebx

push stringskk
push stringsk
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov stringskk, ebx


push stringskk
call outnum


push offset LTRL3
call outstr


push stringsk
call outnum

push offset newline
call outstr


push stringsb
push offset buffer
call strcopy
mov stringsstr, eax

push offset LTRL4
call outstr


push stringsstr
call outstr

push offset newline
call outstr

; ------ restore registers ------
pop edx
pop ebx
; -------------------------------
ret
strings ENDP
;---------------


;------------- MAIN --------------
main PROC
push LTRL5

pop ebx
mov mainx, ebx

push LTRL6

pop ebx
mov mainy, ebx

push mainx
push mainy
pop ebx 
mov edx, 0 
pop eax 
idiv ebx 
push edx 
mov eax, edx

pop ebx
mov mainx, ebx


push offset LTRL7
call outstr


push mainx
call outnum

push offset newline
call outstr

mov mainstrx, offset LTRL8
mov mainstry, offset LTRL9
mov mainstrz, offset LTRL10

push mainstry
push mainstrx
call strings


push offset LTRL11
call outstr

push LTRL12

pop ebx
mov mainab, ebx

mov edx, mainab
cmp edx, LTRL13

jg cycle1
jmp cyclenext1
cycle1:

push mainab
call outnum


push offset LTRL14
call outstr

push mainab
push LTRL6
pop ebx
pop eax
cdq
idiv ebx
push eax

pop ebx
mov mainab, ebx

mov edx, mainab
cmp edx, LTRL13

jg cycle1
cyclenext1:
push offset newline
call outstr


push offset LTRL15
call outstr


push mainab
call outnum

push offset newline
call outstr

push 0
call ExitProcess
main ENDP
end main
