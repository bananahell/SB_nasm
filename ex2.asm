extern printf
global main

; Desse jeito ficamos com duas macros que funcionam, ambas com valor 2, nao
; importando a ordem em que elas sao chamadas
%define alice 1
%idefine AlIcE 2
%idefine aLiCe 3

; Ja desse jeito o programa quebra falando que AlIcE nao esta definida
; %idefine AlIcE 3
; %define alice 4

section .text
main:
;;;;;;;;;;;;;;;Usando as macros;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1              ; codigo do syscall para escrita
  mov rdi, 1              ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, macros_string  ; endereco da string output
  mov rdx, 8              ; numero de bytes
  syscall

  mov rdi, printf_format
  mov rsi, alice
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, AlIcE
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, aLiCe
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;Usando as expansoes;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1                 ; codigo do syscall para escrita
  mov rdi, 1                 ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, expansoes_string  ; endereco da string output
  mov rdx, 12                ; numero de bytes
  syscall

  mov rdi, printf_format
  mov rsi, 2
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, 2
  mov rax, 0
  call printf WRT ..plt

  mov rdi, printf_format
  mov rsi, 3
  mov rax, 0
  call printf WRT ..plt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 60  ; exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  macros_string: db "macros:", 10
  expansoes_string: db 10, "expansoes:", 10
