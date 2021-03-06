# -----------------------------------------------------------------------------
# Memory map for Flash and RAM
# -----------------------------------------------------------------------------

.equ RamStart, 0x80000000 # Start of RAM          Porting: Change this !
.equ RamEnd,   0x80004000 # End   of RAM.  16 kb. Porting: Change this !

.equ FlashStart, 0x20400000 # Start of Flash          Porting: Change this !
.equ FlashEnd,   0x20410000 # End   of Flash.  64 kb. Porting: Change this !

.equ datastack_size, 128  # (32*cellsize)
.equ returnstack_size, 128 # 32*cellsize
.equ refill_buf_size, 96
.equ appl_userarea_size, 2*cellsize
.equ leavestack_size, 8*cellsize

.equ WANT_IGNORECASE, 1

# -----------------------------------------------------------------------------
# Core start
# -----------------------------------------------------------------------------

.include "amforth.s"
