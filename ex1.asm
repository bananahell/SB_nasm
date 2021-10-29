extern printf
global main

%define a(x) 1+b(x)
%define b(x) 2*x

section .text
main:
  mov rdi, printf_format
  mov rsi, a(25)
  mov rax, 0
  call printf WRT ..plt

  mov rax, 60  ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
