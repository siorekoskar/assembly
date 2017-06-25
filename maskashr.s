.type encode1, @function
.global encode1
.text

# rax

# rdi - buf
# rsi - mask
# rdx - op
# rcx - character
# r8  - iterator po buf
# r9  - ilosc numerow
# r10
# r11 - tmp mask

encode1:

setup:
  mov $-1, %r8
  mov $-1, %r9
  // mov $0, %r10
  // mov $0, %r11

selectOp:
  cmp $0, %edx
  je end

  cmp $1, %edx
  je operation1


# #############################################
# OPERATION 1

# rdi - buf
# rsi - mask
# rdx - op
# rcx - ile bitow przesunac
# r8  - iterator po buf
# r9  - ilosc numerow
# r10 - ilosc do shiftu
# r11 - tmp mask

operation1:
  mov %rsi, %r11
  jmp loopOp1

loopOp1:
  inc %r8

  cmpb $0, (%rdi, %r8, 1)
  je endString

  cmpb $'a', (%rdi, %r8, 1)
  jl checkMask

  inc %r9
  push (%rdi, %r8, 1)

  jmp loopOp1

checkMask:
  mov %rsi, %r11
  mov $0, %rcx
  mov $0, %r10
  mov $48, %r10
  mov (%rdi, %r8, 1), %rcx

  sub %r10, %rcx

  shr %cl, %r11
  and $1, %r11

  cmp $1, %r11b
  je maskSet

  inc %r9
  push (%rdi, %r8, 1)

  jmp loopOp1

maskSet:
  jmp loopOp1

endString:
  push $0
  inc %r9
  # mov $0, %rdi

popBack:
  cmp $-1, %r9b
  je end

  pop %r10
  mov %r10b, (%rdi, %r9, 1)

dec:
  dec %r9
  jmp popBack
# #############################################


end:
  mov $0, %rax
  mov %rdi, %rax
  ret
