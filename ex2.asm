extern printf
global main

%define a(x) 1+b(x)
%define b(x) 2*x

%idefine alice 1
%idefine AlIcE 2

section .text
main:
  mov rdi, printf_format
  mov rsi, a(8)
  mov rax, 0
  call printf WRT ..plt

  mov rsi, alice
  mov rax, 0
  call printf WRT ..plt

  mov rsi, AlIcE
  mov rax, 0
  call printf WRT ..plt

  mov rax, 60 ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
