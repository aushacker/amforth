
.include "preamble.inc"
APPUSERSIZE equ 8         ; bytes, see uinit.asm
RSTACK_SIZE equ 30        ; cells
PSTACK_SIZE equ 30        ; cells
; following only required for terminal tasks
TIB_SIZE  equ 102         ; bytes (must be even)

F_CPU EQU 8000000
AMFORTH_START equ 0E000h
.set WANT_INTERRUPTS = 0

; now include all and everything

.include "amforth.asm"
.include "drivers/usart_a0.inc"
; .include "drivers/1-wire.asm"
.include "epilogue.asm"
