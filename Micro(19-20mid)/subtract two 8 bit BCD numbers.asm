MOV SI,1100H
MOV CL,00H
MOV AX,[SI] ;72,95,93,47
MOV BX,[SI+2]
SUB AL,BL ;subtraction result:DF
DAS   ;DF bcd number:79
MOV DL,AL
MOV AL,AH
SBB AL,BH;subtraction result:4D
DAS  ;4D bcd is=47
MOV DH,AL
JNC jump
INC CL
jump:
MOV [SI+4],DX
MOV [SI+6],CL
HLT