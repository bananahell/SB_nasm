; nasm -felf64 10substr.asm -o ./obj/10substr.o && gcc ./obj/10substr.o -o ./exe/10substr.exe && ./exe/10substr.exe

extern printf
global main

; Desse jeito ficamos com duas macros que funcionam, ambas com valor 2, nao
; importando a ordem em que elas sao chamadas
%define aliceborges 'alice borges'
%define alicelima 'alice lima'
%define alicegabriele 'alice gabriele'
%define aliceverso(x) alice%+ x

section .text
main:
;;;;;;;;;;;;;;;Usando as macros;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1              ; codigo do syscall para escrita
  mov rdi, 1              ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, macros_string  ; endereco da string output
  mov rdx, 8              ; numero de bytes
  syscall

  %define name aliceverso(lima)
  %substr surnameFirstLetter name 7
  mov rdi, printf_format
  mov rsi, surnameFirstLetter
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;Usando as expansoes;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1                 ; codigo do syscall para escrita
  mov rdi, 1                 ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, expansoes_string  ; endereco da string output
  mov rdx, 12                ; numero de bytes
  syscall

  %define surnameFirstLetter2 'l'
  mov rdi, printf_format
  mov rsi, surnameFirstLetter2
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 60  ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  macros_string: db "macros:", 10
  expansoes_string: db 10, "expansoes:", 10
