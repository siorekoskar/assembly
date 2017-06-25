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
  je end

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

end:
  pop %rcx
  pop %rdx
  mov %r10, (%rcx)
  mov %r11, (%rdx)
  mov $0, %rax
  ret
