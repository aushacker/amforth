; ( -- ) System
; R( -- )
; application specific turnkey action
VE_APPLTURNKEY:
    .dw $ff0b
    .db "applturnkey",0
    .dw VE_HEAD
    .set VE_HEAD = VE_APPLTURNKEY
XT_APPLTURNKEY:
    .dw DO_COLON
PFA_APPLTURNKEY:
    .dw XT_USART

.if WANT_INTERRUPTS == 1
    .dw XT_INTON
.endif
    .dw XT_DOT_VER
    .dw XT_EXIT
