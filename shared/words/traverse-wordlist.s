
COLON "traverse-wordlist",TRAVERSEWORDLIST

PFA_TRAVERSEWORDLIST1:
    .word XT_DUP
    .word XT_DOCONDBRANCH,PFA_TRAVERSEWORDLIST2
    .word XT_2DUP
    .word XT_2TO_R
    .word XT_SWAP
    .word XT_EXECUTE
    .word XT_2R_FROM
    .word XT_ROT
    .word XT_DOCONDBRANCH,PFA_TRAVERSEWORDLIST2
    .word XT_NFA2LFA
    .word XT_FETCH
    .word XT_DOBRANCH,PFA_TRAVERSEWORDLIST1
PFA_TRAVERSEWORDLIST2:
    .word XT_2DROP
    .word XT_EXIT
