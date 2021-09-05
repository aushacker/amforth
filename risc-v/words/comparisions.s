# Comparision operators

# -----------------------------------------------------------------------------
  CODEWORD "0=",ZEROEQUAL 
# ( x -- ? )
# -----------------------------------------------------------------------------
  sltiu x3, x3, 1
  addi x3, x3, -1
  xori x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "0<>", NOTZEROEQUAL # ( x -- ? )
# -----------------------------------------------------------------------------
  sltiu x3, x3, 1
  addi x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "0<", ZEROLESS # ( n -- ? )
# -----------------------------------------------------------------------------
  srai x3, x3, 31
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  ">=", GREATEREQUAL # ( x1 x2 -- ? )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  slt x3, x5, x3
  addi x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "<=", LESSEQUAL # ( x1 x2 -- ? )          
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  slt x3, x3, x5
  addi x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "<", LESS # ( x1 x2 -- ? )
                      # Checks if x2 is less than x1.
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  slt x3, x5, x3
  addi x3, x3, -1
  xori x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  ">", GREATER # ( x1 x2 -- ? )
                      # Checks if x2 is greater than x1.
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  slt x3, x3, x5
  addi x3, x3, -1
  xori x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "u>=", UGREATEREQUAL # ( u1 u2 -- ? )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  sltu x3, x5, x3
  addi x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "u<=", ULESSEQUAL # ( u1 u2 -- ? )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  sltu x3, x3, x5
  addi x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "u<", ULESS # ( u1 u2 -- ? )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  sltu x3, x5, x3
  addi x3, x3, -1
  xori x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "u>", UGREATER # ( u1 u2 -- ? )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  sltu x3, x3, x5
  addi x3, x3, -1
  xori x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "<>", NOTEQUAL # ( x1 x2 -- ? )

                       # Compares the top two stack elements for inequality.
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  xor x3, x3, x5
  sltiu x3, x3, 1
  addi x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "=", EQUAL # ( x1 x2 -- ? )
                      # Compares the top two stack elements for equality.
# -----------------------------------------------------------------------------
equal_einsprung:
  lw x5, 0(x4)
  addi x4, x4, 4
  xor x3, x3, x5
  sltiu x3, x3, 1
  addi x3, x3, -1
  xori x3, x3, -1
  NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "min", MIN # ( x1 x2 -- x3 )
                        # x3 is the lesser of x1 and x2.
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  blt x3, x5, 1f
    mv x3, x5
1:NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "max", MAX # ( x1 x2 -- x3 )
                        # x3 is the greater of x1 and x2.
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  blt x5, x3, 1f
    mv x3, x5
1:NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "umin", UMIN # ( u1 u2 -- u1|u2 )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  bltu x3, x5, 1f
    mv x3, x5
1:NEXT

# -----------------------------------------------------------------------------
  CODEWORD  "umax", UMAX # ( u1 u2 -- u1|u2 )
# -----------------------------------------------------------------------------
  lw x5, 0(x4)
  addi x4, x4, 4
  bltu x5, x3, 1f
    mv x3, x5
1:NEXT