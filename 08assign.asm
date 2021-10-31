; nasm -felf64 08assign.asm -o ./obj/08assign.o && gcc ./obj/08assign.o -o ./exe/08assign.exe && ./exe/08assign.exe

extern printf
global main

section .text
main:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%assign i 25
%rep 25
  mov rdi, printf_format  ; arg do printf para printar int
  mov rsi, i              ; int para printar
  mov rax, 0              ; prepara para fazer um printf
  call printf WRT ..plt
  %assign i i+i-1           ; incrementa i
%endrep

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 60  ; prepara para dar um exit
  syscall

section .data
  printf_format: db '%d', 10, 0
