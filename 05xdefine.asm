; nasm -felf64 05xdefine.asm -o ./obj/05xdefine.o && gcc ./obj/05xdefine.o -o ./exe/05xdefine.exe && ./exe/05xdefine.exe

extern printf
global main

section .text
main:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Usando as macros
  mov rax, 1  ; system call for write
  mov rdi, 1  ; file handle 1 is stdout
  mov rsi, macros_string  ; address of string to output
  mov rdx, 8  ; number of bytes
  syscall

  %xdefine isTrue 1
  %xdefine isFalse isTrue
  %xdefine isTrue 0

  mov rdi, printf_format
  mov rsi, isFalse
  mov rax, 0
  call printf WRT ..plt

  %xdefine isTrue 1

  mov rdi, printf_format
  mov rsi, isFalse
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov rax, 60  ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  macros_string: db "macros:", 10
