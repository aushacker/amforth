
\ use " as string delimiters. Everything
\ between two " is a string. It replaces
\ the forth command s" completly
\ instead of s" foo" use "foo". The space
\ after s" is no longer needed, instead it
\ a part of the string. s" foo" and " foo"
\ differ with the leading space in the latter

\ strings live as long as the SOURCE is
\ unchanged! Compilation is done to the
\ flash if called in compile state.
\ postponing a compiled string is not yet
\ supported.

\ #require recognizer.frt

' noop 
:noname postpone sliteral ;
:noname -48 throw ; rectype: rectype-string

: rec-string ( addr len -- addr' len' rectype-string | rectype-null )
  over c@ [char] " <> if 2drop rectype-null exit then
  negate 1+ >in +! drop \ reset parse area to SOURCE
  [char] " parse  \ get trailing delimiter
  -1 /string
  rectype-string
;
