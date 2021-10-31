; nasm -felf64 01define.asm -o ./obj/01define.o && gcc ./obj/01define.o -o ./exe/01define.exe && ./exe/01define.exe

extern printf
global main

%define a(x) 1 + b(x)
%define b(x) 2 * x

section .text
main:
;;;;;;;;;;;;;;;Usando as macros;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1              ; codigo do syscall para escrita
  mov rdi, 1              ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, macros_string  ; endereco da string output
  mov rdx, 8              ; numero de bytes
  syscall

  mov rdi, printf_format  ; arg do printf para printar int
  mov rsi, a(25)          ; Aqui expande o a() e o b()!!!
  mov rax, 0              ; prepara para fazer um printf
  call printf WRT ..plt   ; printf sem o tal do PIE, sei la

;;;;;;;;;;;;;;;Usando as expansoes;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1                 ; codigo do syscall para escrita
  mov rdi, 1                 ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, expansoes_string  ; endereco da string output
  mov rdx, 12                ; numero de bytes
  syscall

  mov rdi, printf_format  ; arg do printf para printar int
  mov rsi, 1 + 2 * 25     ; Expansao explicita!!!
  mov rax, 0              ; prepara para fazer um printf
  call printf WRT ..plt   ; printf sem o tal do PIE, sei la

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 60  ; prepara para dar um exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  macros_string: db "macros:", 10
  expansoes_string: db 10, "expansoes:", 10
