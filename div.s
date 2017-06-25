.type check_div, @function
.global check_div
.text

# rax

# rdi -
# rsi -
# rdx -
# rcx -
# r8  -
# r9  -
# r10 -
# r11 - maska

check_div:
  and $0, %r8
  and $0, %r9
  and $0, %r10
  and $0, %r11
  and $0, %rcx
  and $0, %rax

check_c:
  cmp $0, %rdx
  jne set_bits

check_div2:
  and $0, %rdx
  mov %rdi, %rax
  div %rsi
  cmp $0, %rdx
  je podzielne

  jmp niepodzielne

podzielne:
  mov $1, %rax
  ret

niepodzielne:
  mov $0, %rax
  ret

set_bits:
  mov $64, %r8

start_loop:
  cmp $0, %r8
  je end

  and $0, %rax
  and $0, %rdx
  mov %rdi, %rax

  div %r8

  shl %r11

  cmp $0, %rdx
  je setOne

  dec %r8
  jmp start_loop

setOne:
  dec %r8
  or $1, %r11
  jmp start_loop

end:
  and $0, %rax
  mov %r11, %rax
  ret
