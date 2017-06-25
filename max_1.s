.type max_1_ind, @function
.global max_1_ind
.text

# rax

# rdi - tablica
# rsi - ilosc liczb
# rdx - licznik parzystych
# rcx - licznik ujemnych
# r8  -
# r9  - 2
# r10 - licnzik ujemnych
# r11 - licznik parzystych

max_1_ind:
  and $0, %r8
  mov $-1, %r8
  and $0, %r9
  mov $2, %r9
  and $0, %r10
  and $0, %r11
  and $0, %rax
  push %rdx
  push %rcx
  and $0, %rdx
  and $0, %rcx


start:
  inc %r8

  cmp %rsi, %r8
  je checkOnes

  and $0, %rax
  and $0, %rdx

  mov (%rdi, %r8, 8), %rax

  div %r9

  cmp $0, %rdx
  je dodaj_parz

  cmp $0, (%rdi, %r8, 8)
  jl dodaj_ujem

  jmp start

dodaj_parz:
  inc %r11

  cmp $0, (%rdi, %r8, 8)
  jl dodaj_ujem

  jmp start

dodaj_ujem:
  inc %r10
  jmp start


# ###########################################
checkOnes:
  and $0, %r8
  mov $-1, %r8
  and $0, %rdx
  and $0, %rcx
  and $0, %r9
  push %r10
  push %r11
  push %r12
  push %r13
  and $0, %r13
  and $0, %r10
  and $0, %r11
  and $0, %r12
  mov $64, %r12

# rdx - obecna
# rcx - najwieksza ilosc 1
# r8  - iterator
# r9  - najwiekszy index
# r10 - maska
# r11 - obecna ilosc 1

loop:
  inc %r8
  cmp %r8, %rsi
  je end

  mov (%rdi, %r8, 8), %rdx

  and $0, %r12
  mov $64, %r12
  and $0, %r11
  and $0, %r13

  jmp loop2

loop2:
  dec %r12
  cmp $-1, %r12
  je checkBest

  mov %rdx, %r13

  and $1, %r13
  cmp $1, %r13b
  je addOne

  shr %rdx

  jmp loop2

addOne:
  inc %r11
  shr %rdx
  jmp loop2

checkBest:
  cmp %r11, %rcx
  jg loop

  mov %r11, %rcx
  mov %r8, %r9

  jmp loop


# ###########################################

end:
  pop %r13
  pop %r12
  pop %r11
  pop %r10
  pop %rcx
  pop %rdx
  mov %r10, (%rcx)
  mov %r11, (%rdx)
  mov %r9, %rax
  ret
