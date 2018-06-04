;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 编写一个运用用户软中断处理的程序
; 自定义用户类型号为60H的用户软中断处理 
; 使得调用INT 60H的中断处理，输出学号姓名
; @authoruthor: SYSUcarey
; @date: 2018-06-04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DATA SEGMENT
   STRING DB '16340015 CHENBINBIN',0DH,0AH,'$'
DATA ENDS

CODE SEGMENT
   ASSUME CS:CODE,DS:DATA
BEGIN:
   MOV AX,DATA
   MOV DS,AX
   ;压栈保护DS
   PUSH DS			
   ; 调用功能号AH=25H系统调用，装填中断指针，有两个入口参数
   ; 1.AL=要设置向量的中断类型号，这里为60H 
   ; 2.DS:DX=中断子程序的入口地址，这里为SHOW子程序的入口地址
   ; DX 装进 [60H*4,60H*4+1], DS 装进 [60H*4+2,60H*4+3]   
   ;将SHOW子程序段值放进DS
   MOV AX,SEG SHOW				
   MOV DS,AX
   ;将SHOW子程序偏移量放进DX
   MOV DX,OFFSET SHOW			
   ;设置系统调用功能号AH=25H
   MOV AH,25H				
   ;设置装填中断类型号AL=60H   
   MOV AL,60H					
   INT 21H	
   ;调用60H用户软中断处理
   INT 60H
   ;恢复现场
   POP DS
   ;结束程序
   MOV AH,4CH
   INT 21H
;子程序段
SHOW:
   MOV AX,DATA
   MOV DS,AX
   ;显示字符串STRING："16340015 CHENBINBIN",0DH,0AH
   LEA DX,STRING
   MOV AH,9
   INT 21H
CODE ENDS
   END BEGIN
