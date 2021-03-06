.type fun, @function
.global fun
.text

# rax

# rdi - liczba 64 bitowa
# rsi - operacja
# rdx - ostatni bit rozny od 0
# rcx - liczba bitow rownych 1
# r8  - iter
# r9  - maska1
# r10 - suma
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
  push %r12
  and $0, %r12
  mov $1, %r12

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

  and $0, %r9
  mov %r8, %r9
  inc %r9

  cmp $1, %esi
  je sumuj

  cmp $2, %esi
  je mnoz

  jmp raxik

sumuj:
  add %r9d, %r10d
  jmp start

mnoz:
  imul %r9d, %r12d
  mov %r12, %r10
  jmp start

raxik:
  and $0, %r10
  jmp start

end:
  pop %r12
  and $0, %rax
  mov %r10, %rax
  ret
