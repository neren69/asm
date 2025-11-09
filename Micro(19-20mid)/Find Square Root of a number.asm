.MODEL SMALL
.STACK 100H
.DATA 
MSG2 DB "SQUARE ROOT IS: $" 
NUM  DB  8
SQR  DB ?
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

 
;------square-root code-----------
MOV AL,NUM ;mov the number into AX  
MOV BL, 0  ;initialize bx 0   
MOV CL, 0  ;initialize cx 0   

calc_sqr: ;calculate square-root

INC BL  ;increment bx by 1      
ADD CL, BL ;add cx and bx and now cx is 1   
CMP CL, AL ;compare cx and ax,the value of cx is 1 and ax is 64,since cx is less than ax program jumps back to beginning  
JBE calc_sqr  ; loop again and again until cx is less than equal ax
MOV SQR,BL    ;store the value of bx in sqr
    
MOV AH,2
MOV DL,0DH
INT 21H                     
MOV DL,0AH
INT 21H
       
LEA DX,MSG2
MOV AH,9                    
INT 21H         

MOV DL,SQR
ADD DL,48
MOV AH,2                
INT 21H

MOV AH,4CH
INT 21H   

MAIN ENDP
END MAIN