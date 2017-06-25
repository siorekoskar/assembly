.type fun, @function
.global fun
.text

# rax

# rdi - liczba 64 bitowa
# rsi - operacja
# rdx - ostatni bit rozny od 0
# rcx - liczba bitow rownych 1
# r8  - iter
# r9  -
# r10 - czy juz sprawdzono bit
# r11 - maska

fun:
  and $0, (%rdx)
  and $0, (%rcx)
  and $0, %r8
  mov $-1, %r8
  and $0, %r9
  and $0, %r11
  and $0, %r10
  mov %rdi, %r11

start:
  inc %r8

  cmp $64, %r8
  je end

checkAddBit:
  and $0, %r9
  mov %r11, %r9
  and $1, %r9

  cmpb $1, %r9b
  je addBit

  shr %r11
  
  jmp start

addBit:
  incl (%rcx)
  shr %r11
  mov %r8d, (%rdx)

  jmp start

end:
  mov $0, %rax
  ret
