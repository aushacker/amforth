
ARM_CONSTANT "NVIC_ST_CTRL_R", NVIC_ST_CTRL_R, 0xE000E010
ARM_CONSTANT "NVIC_ST_RELOAD_R", NVIC_ST_RELOAD_R, 0xE000E014
ARM_CONSTANT "NVIC_ST_CURRENT_R", NVIC_ST_CURRENT_R, 0xE000E018

ARM_COLON "delay-init", DELAY_INIT
    @ Disable SysTick during setup
    .word XT_ZERO, XT_NVIC_ST_CTRL_R, XT_STORE

    @ Maximum reload value for 24 bit timer
    .word XT_DOLITERAL, 0x00FFFFFF, XT_NVIC_ST_RELOAD_R, XT_STORE

    @ Any write to current clears it
    .word XT_ZERO, XT_NVIC_ST_CURRENT_R, XT_STORE

    @ Enable SysTick with PIOSC/4 = 4MHz clock
    .word XT_ONE, XT_NVIC_ST_CTRL_R, XT_STORE
.word XT_EXIT

ARM_COLON "delay-ticks", DELAY_TICKS
@ ( n -- )  Tick = 1/4MHz = 250 ns
    .word XT_DOLITERAL, 8, XT_LSHIFT
    .word XT_NVIC_ST_CURRENT_R, XT_FETCH, XT_DOLITERAL, 8, XT_LSHIFT
DELAY_TICKS_LOOP:
      .word XT_PAUSE, XT_2DUP
      .word XT_NVIC_ST_CURRENT_R, XT_FETCH, XT_DOLITERAL, 8, XT_LSHIFT
      .word XT_MINUS, XT_ULESS, XT_DOCONDBRANCH, DELAY_TICKS_LOOP
    .word XT_2DROP
.word XT_EXIT


COLON "us", US
    .word XT_DOLITERAL, 4, XT_STAR, XT_DELAY_TICKS, XT_EXIT

COLON "ms", MS
    .word XT_ZERO
    .word XT_QDOCHECK,XT_DOCONDBRANCH,MS_LEAVE, XT_DODO
MS_LOOP:
       .word XT_DOLITERAL, 4000, XT_DELAY_TICKS, XT_DOLOOP, MS_LOOP
MS_LEAVE:
    .word XT_EXIT
