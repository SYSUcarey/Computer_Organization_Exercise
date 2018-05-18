;++++++++++++++++++++++++++++++++++++++++++++++++
; @author: SYSUcarey
; @date: 2018-05-03
; An easy calculator
;++++++++++++++++++++++++++++++++++++++++++++++++
DATA SEGMENT
   TIPS1 DB 0DH,0AH,'Input the first 3-bit number:',0DH,0AH,'$'
   TIPS2 DB 0DH,0AH,'Input the second 3-bit number:',0DH,0AH,'$'
   TIPS3 DB 0DH,0AH,'Input the operator:    (+-*/)',0DH,0AH,'$'
   TIPS4 DB 0DH,0AH,'The result are:    (decimal,hexa,binary)',0DH,0AH,'$'
   TIPS5 DB 0DH,0AH,'OVERFLOW!',0DH,0AH,'$'
   STRING1 DB 0DH,0AH,3 DUP ('$'),0DH,0AH,'$'
   STRING2 DB 0DH,0AH,3 DUP ('$'),0DH,0AH,'$'
   NUM1 DW 1 
   NUM2 DW 1 
   NUM3 DW 1
   RESULT1 DB 0DH,0AH,5 DUP ('$'),0DH,0AH,'$'
   RESULT2 DB 0DH,0AH,4 DUP ('$'),'H',0DH,0AH,'$'
   RESULT3 DB 0DH,0AH,16 DUP ('$'),'B',0DH,0AH,'$'
DATA ENDS

CODE SEGMENT
   ASSUME CS:CODE,DS:DATA
BEGIN:
   MOV AX,DATA
   MOV DS,AX
   MOV ES,AX
MAIN:
   MOV DX,OFFSET TIPS1					;提示输入第一个数
   MOV AH,09H
   INT 21H
   LEA DI,STRING1+2						;输入第一个数（5bit），并存进STRING1
   CALL INPUT
   MOV DX,OFFSET TIPS2					;提示输入第二个数
   MOV AH,09H
   INT 21H
   LEA DI,STRING2+2						;输入第二个数（5bit），并存进STRING2
   CALL INPUT
   LEA SI,STRING1+2						;STRING1转成真正的数，并存进NUM1(小端)
   CALL STRTONUMBER
   MOV AX,BX
   LEA DI,NUM1
   STOSW
   LEA SI,STRING2+2						;STRING2转成真正的数，并存进NUM2（小端）
   CALL STRTONUMBER
   MOV AX,BX
   LEA DI,NUM2
   STOSW
   LEA SI,NUM1							;取出NUM1放进BX中
   LODSW
   MOV BX,AX							
   LEA SI,NUM2							;取出NUM2放进CX中
   LODSW
   MOV CX,AX
   MOV DX,OFFSET TIPS3					;提示输入运算符
   MOV AH,09H
   INT 21H
   MOV AH,01H							;输入运算符
   INT 21H
   CMP AL,'+'							;根据运算符进行运算(BX)OP(CX)，结果存入NUM3
   JZ ADDNUM
   CMP AL,'-'
   JZ SUBNUM
   CMP AL,'*'
   JZ MULNUM
   CMP AL,'/'
   JZ DIVNUM
CONTINUE:
   CALL DECIMAL
   CALL BINARY
   CALL HEXA
   CALL SHOW
   MOV AH,4CH
   INT 21H
   
INPUT:									;输入第一个数
   MOV CX,3
AG:
   MOV AH,01H						
   INT 21H
   STOSB
   LOOP AG
   RET

STRTONUMBER:							;把SI指向的5位STR转成真正的数字存进BL中
   MOV CX,3
   MOV BX,0
AG2:
   MOV AX,BX
   MOV BL,10
   MUL BL
   MOV BX,AX
   MOV AH, 0
   LODSB
   SUB AL,'0'
   ADD BX,AX
   LOOP AG2
   RET

ADDNUM:
   ADD BX,CX
   LEA DI,NUM3
   MOV AX,BX
   STOSW
   JMP CONTINUE

SUBNUM:
   SUB BX,CX
   JS INVALIDEND
   LEA DI,NUM3
   MOV AX,BX
   STOSW
   JMP CONTINUE
   
MULNUM:
   MOV AX,BX
   MUL CX
   JO INVALIDEND
   LEA DI,NUM3
   STOSW
   JMP CONTINUE

INVALIDEND:
   LEA DX,TIPS5
   MOV AH,09H
   INT 21H
   MOV AH,4CH
   INT 21H
   
DIVNUM:
   MOV DX,0
   MOV AX,BX
   DIV CX
   LEA DI,NUM3
   STOSW
   JMP CONTINUE
   
DECIMAL:
   LEA SI,NUM3
   LODSW
   MOV CX,5
   MOV BX,10
AG3:
   MOV DX,0
   DIV BX
   PUSH DX
   LOOP AG3
   MOV CX,5
   LEA DI,RESULT1+2
AG4:
   POP AX
   ADD AL,'0'
   STOSB
   LOOP AG4
   RET
   
BINARY:
   LEA SI,NUM3
   LODSW
   MOV CX,16
   MOV BX,2
AG5:
   MOV DX,0
   DIV BX
   PUSH DX
   LOOP AG5
   MOV CX,16
   LEA DI,RESULT3+2
AG6:
   POP AX
   ADD AL,'0'
   STOSB
   LOOP AG6
   RET
   
HEXA:
   LEA SI,NUM3
   LODSW
   MOV CX,4
   MOV BX,16
AG7:
   MOV DX,0
   DIV BX
   PUSH DX
   LOOP AG7
   MOV CX,4
   LEA DI,RESULT2+2
AG8:
   POP AX
   CMP AL,9
   JBE NEXT
   ADD AL,'A'-10-'0'
NEXT:
   ADD AL,'0'
   STOSB
   LOOP AG8
   RET
   
SHOW:
   LEA DX,TIPS4					
   MOV AH,09H
   INT 21H
   LEA DX,RESULT1						
   MOV AH,09H
   INT 21H
   LEA DX,RESULT2
   MOV AH,09H
   INT 21H
   LEA DX,RESULT3
   MOV AH,09H
   INT 21H
   RET
   

CODE ENDS
  END BEGIN
  