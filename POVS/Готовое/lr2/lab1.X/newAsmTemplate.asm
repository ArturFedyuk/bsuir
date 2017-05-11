;------------------------------------------------------
; ???????
; ???????????? ?????? #1
;------------------------------------------------------
; ????????? ??????? ???????????? ??????? ? ???????? ??????? ?????
;------------------------------------------------------
#include <pic16f84a.inc>
    PSECT bssASM,class=BANK1,space=1
; ORG 110h
; lookup:
; DS 20h
    
c_adr set 0x30 ; ?????? ???????
v_ptr equ 0x2F ; ??????? ??????? ? ???????
v_max equ 0x2E ; ???????????? ??????? ? ???????
c_num set 0xA ; ?????? ???????
; ???????????? ????????? ? ?????? ??????:
; ????? : ??????
; 0x2E : v_ptr
; 0x2F : v_max
; 0x30 : array[0]
; 0x31 : array[1]
; 0x32 : array[2]
; ...................
; 0x39 : array[9]
BEGIN:
BCF STATUS, 0x5 ; ????? Bank0 ? ?????? ??????
CLRF v_ptr ; v_ptr=0
CLRF v_max ; v_max=0
LOOP1:
MOVF v_ptr ; W=v_ptr ????????
ADDLW c_adr ; W=W+c_addr
MOVWF FSR ; FSR=W, INDF=array[W]
MOVF INDF ; W=INDF ????????????????????
SUBWF v_max ; W=W-v_max
;BTFSC STATUS,0 ; If W < 0 then goto SMALL
;GOTO SKIP
;
; ; Else W >= 0 then W is bigger than v_max
;MOVF v_ptr
;ADDLW c_adr
;MOVWF FSR
;MOVF INDF ; ?????????????
;MOVWF v_max ; v_max=array[v_ptr]
;SKIP:
;INCF v_ptr ; v_ptr=v_ptr+1
;MOVLW c_num ; W=c_num
;SUBWF v_ptr ; W=W-v_ptr
;BTFSS STATUS,0 ; v_ptr > c_num ?
;GOTO LOOP1 ; no
; ; yes
;CLRF v_ptr ; v_ptr=0
;CLRF v_max ; v_max=0
end