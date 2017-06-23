.type check_tab, @function
.global check_tab
.text

# rax

# rdi - tablica tab
# rsi - ilosc elem
# rdx - wskaznik na max
# rcx - maksymalna aktualna
# r8  - iterator po tab
# r9  - iterator 2gi
# r10 - aktualna liczba
# r11 - maksymalna ilosc wystapien

check_tab:
  mov $0, %rax
  mov $0, %rcx
  mov $0, %r8
  mov $0, %r9
  mov $0, %r10
  mov $0, %r11

# r8 - iterator
# r9 - aktualny
# r10 - maska1
# r11 - aktualny

start:
  cmp %rcx, %rsi
  je reset
  mov (%rdi, %rcx, 4), %r9d


beforeIter:
  mov $0, %r10
  or $1, %r10

iter1:
  cmp %r8, %r9
  je setmask

  shl %r10
  inc %r8
  jmp iter1

nextone:
  inc %rcx
  jmp start

setmask:
  mov $0, %r8
  or %r10, %rax
  inc %rcx
  jmp start

reset:
  mov $0, %rcx
  mov $0, %r8
  mov $0, %r9
  mov $0, %r10
  mov $0, %r11


# druga czesc


iterate:
  cmp %rsi, %r8
  je putInMax

  mov (%rdi, %r8, 4), %r10

  mov $0, %rcx

  iterate2:
    cmp %r9, %rsi
    je outOfLoop2

    cmp (%rdi, %r9, 4), %r10d
    je addMax

    inc %r9
    jmp iterate2

    addMax:
      inc %rcx
      inc %r9
      jmp iterate2

outOfLoop2:
  inc %r8

  mov $0, %r9

  cmp %r11, %rcx
  jg betterHigher

  jmp iterate

betterHigher:
  mov %rcx, %r11
  jmp iterate

putInMax:
  mov %r11, (%rdx)

elo:
  ret
