;++++++++++++++++++++++++++++++++++++++++++++++++
; @author: SYSUcarey
; @date: 2018-05-03
; Converts all the letters of string 'AstudentCAREY' 
; 	to highercase letters.
;++++++++++++++++++++++++++++++++++++++++++++++++
DATA SEGMENT
   SOURCE DB 'AstudentCAREY',0DH,0AH,'$'
   COUNT EQU $-SOURCE-1
DATA ENDS
EXTRA SEGMENT
   DEST DB COUNT DUP (?),'$'
EXTRA ENDS
CODE SEGMENT
   ASSUME CS:CODE,DS:DATA,ES:EXTRA
BEGIN:
   MOV AX,DATA
   MOV DS,AX
   MOV AX,EXTRA
   MOV ES,AX
   MOV CX,COUNT
   LEA SI,SOURCE
   LEA DI,DEST
AG:							
   LODSB					;Capitalize the letters
   AND AL,0DFH
   STOSB
   LOOP AG					
   MOV DX,OFFSET SOURCE		;show the string before and after
   MOV AH,09H
   INT 21H
   MOV AX,EXTRA
   MOV DS,AX
   MOV DX,OFFSET DEST
   MOV AH,09H
   INT 21H
   MOV AH,4CH
   INT 21H
CODE ENDS
  END BEGIN
