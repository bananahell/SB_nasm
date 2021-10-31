extern printf
global main

%define domult(x) x * x
%define domult(x, y) y * x

section .text
main:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Usando as macros
  mov rax, 1  ; system call for write
  mov rdi, 1  ; file handle 1 is stdout
  mov rsi, macros_string  ; address of string to output
  mov rdx, 8  ; number of bytes
  syscall

  mov rdi, printf_format
  mov rsi, domult(8)
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, domult(8, 2)
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Usando as expansoes
  mov rax, 1  ; system call for write
  mov rdi, 1  ; file handle 1 is stdout
  mov rsi, expansoes_string  ; address of string to output
  mov rdx, 12  ; number of bytes
  syscall

  mov rdi, printf_format
  mov rsi, 8 * 8
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, 2 * 8
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov rax, 60  ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  macros_string: db "macros:", 10
  expansoes_string: db 10, "expansoes:", 10
