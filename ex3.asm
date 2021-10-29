extern printf
global main

%define domult(x) x*x
%define domult(x,y) y*x

section .text
main:
  mov rdi, printf_format
  mov rsi, domult(8)
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, domult(8,2)
  mov rax, 0
  call printf WRT ..plt

  mov rax, 60 ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
