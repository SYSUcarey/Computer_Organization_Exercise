;++++++++++++++++++++++++++++++++++++++++++++++++
; @author: SYSUcarey
; @date: 2018-05-03
; Return the odd check bit 0 or 1 
; 	for the ASCII of the character you input.
;++++++++++++++++++++++++++++++++++++++++++++++++
DATA SEGMENT
   TIPS DB 'Enter one character:',0DH,0AH,'$'
   TIPS2 DB 'The odd check bit for the ASCII of character is:',0DH,0AH,'$'
DATA ENDS
CODE SEGMENT
   ASSUME CS:CODE,DS:DATA
BEGIN:
   MOV AX,DATA
   MOV DS,AX
   MOV DX,OFFSET TIPS
   MOV AH,09H
   INT 21H  			;output the tips
   MOV AH,01H			
   INT 21H				;input a character
   MOV BL,AL
   MOV DL,0AH			;new line
   MOV AH,02H
   INT 21H
   MOV CX,8				;judge 8 times for every bits
   MOV BH,30H			;30H->'0'
AGAIN:
   MOV AL,BL
   SHL BL,1				;left shift
   AND AL,80H			;AND 10000000B
   JNZ CHANGE			;Not zero for changing result, 0 for not
   LOOP AGAIN
   JMP SHOW
CHANGE:
   CMP BH,30H
   JZ CHANGE0TO1
   MOV BH,30H			;result: '1' -> '0'
   ADD CX,-1	
   JMP AGAIN
CHANGE0TO1:
   MOV BH,31H			;result: '0' -> '1'
   ADD CX,-1		
   JMP AGAIN
SHOW:
   MOV DX,OFFSET TIPS2	;show the result
   MOV AH,09H
   INT 21H
   MOV DL,BH
   MOV AH,02H
   INT 21H
   MOV AH,4CH
   INT 21H
CODE ENDS
   END BEGIN
   
   
