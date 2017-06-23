.type encode1, @function
.global encode1
.text

# rax

# rdi - tablica buf
# rsi --maska
# rdx
# rcx - iterator miejsca
# r8  - 0
# r9  - iterator tablicy buf
# r10 - fromstackpoper
# r11 - temporary mask

encode1:
    mov $0, %r9
    mov $0, %r8
    mov $0, %rax
    mov $-1, %rcx
    mov $0, %r10
    mov %rsi, %r11

    cmp $0, %rdx
    je op0

    cmp $1, %rdx
    je op1

op0:
    mov %rdi, %rax
    jmp end0

op1:
  cmpb $0, (%rdi, %r9, 1)
  je zakonczZerem

  cmpb $'a', (%rdi, %r9, 1)
  jl usunZnak

pushonstack:
  push (%rdi, %r9, 1)
  inc %r9
  inc %rcx
  jmp op1

;  przesuwa obecny znak do r10
usunZnak:
  mov (%rdi, %r9, 1), %r10b
  add $48, %r8

; przesuwa maske az dojdzie do bitu wlasciwego liczbie
shifting:
  cmp %r8b, %r10b
  je checkOne

  inc %r8
  shr %r11
  jmp shifting

; sprawdza czy maska dla tej liczby jest na 1
checkOne:
  and $1, %r11
  cmp $1, %r11b
  je finalize

  mov $0, %r10
  mov $0, %r8
  mov %rsi, %r11
  jmp pushonstack

; jak jest na 1 to wyzeruj wszystko i po prostu zinkrementuj iterator
finalize:
  mov $0, %r10
  mov $0, %r8
  mov %rsi, %r11

  inc %r9
  jmp op1

; dodaj znak konca wyrazu
zakonczZerem:
  push $0
  inc %rcx
  mov $0, %rax
  mov $0, %rax

popfromstack:
  cmp $0, %rcx
  je end

  mov $0, %r10
  pop %r10
  mov %r10b, (%rdi, %rcx, 1)

  dec %rcx
  jmp popfromstack

end:
  pop %r10
  mov %r10b, (%rdi, %r8, 1)
  mov %rdi, %rax
  jmp endafter

end0:
  mov %rdi, %rax

endafter:
  ret
