COLON "quit", QUIT

    .word XT_LP0,XT_LP,XT_STORE
#    .dw XT_SP0
#    .dw XT_SP_STORE
#    .dw XT_RP0
#    .dw XT_RP_STORE
    .word XT_LBRACKET

PFA_QUIT2:
    .word XT_STATE, XT_FETCH,XT_ZEROEQUAL
    .word XT_DOCONDBRANCH, PFA_QUIT4
    .word XT_PROMPTREADY
PFA_QUIT4:
    .word XT_REFILL
    .word XT_PROMPTINPUT
    .word XT_DOCONDBRANCH,PFA_QUIT3
    .word XT_DOLITERAL
    .word XT_INTERPRET
    .word XT_CATCH
    .word XT_QDUP
    .word XT_DOCONDBRANCH,PFA_QUIT3
	.word XT_DUP
	.word XT_DOLITERAL, -2, XT_LESS
	.word XT_DOCONDBRANCH, PFA_QUIT5
	.word XT_PROMPTERROR
PFA_QUIT5:
	.word XT_DOBRANCH, PFA_QUIT
PFA_QUIT3:
    .word XT_PROMPTOK
    .word XT_DOBRANCH,PFA_QUIT2

