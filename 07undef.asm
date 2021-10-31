extern printf
global main

%define conta 9
%undef  conta

section .text
main:
  mov rdi, printf_format

  %ifdef conta
    mov rsi, conta
  %else
    mov rax, 1
    mov rdi, 1
    mov rsi, s
    mov rdx, 29
    syscall

    mov rdi, printf_format
    mov rsi, 5
  %endif
  mov rax, 0
  call printf WRT ..plt

  mov rax, 60  ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  s: db "essa macro nao esta definida", 10

