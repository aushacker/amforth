
CODEWORD "up@", UP_FETCH
    savetos
    mv x3, x18
    NEXT

CODEWORD "up!", UP_STORE
    mv x18,x3
    loadtos
    NEXT

