@ -----------------------------------------------------------------------------
  CODEWORD "rp@", RP_FETCH @ ( -- a-addr )
@ -----------------------------------------------------------------------------
  savetos
  mov tos, sp
NEXT
@ -----------------------------------------------------------------------------
  CODEWORD "rp!", RP_STORE @ ( a-addr -- )
@ -----------------------------------------------------------------------------
  mov sp, tos
  ldm psp!, {tos}
NEXT

USER "rp", RP, USER_RP
