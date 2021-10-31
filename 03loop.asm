; nasm -felf64 03loop.asm -o ./obj/03loop.o && gcc ./obj/03loop.o -o ./exe/03loop.exe && ./exe/03loop.exe

extern printf
global main

; nasm nao aceita referencia circular, que seria essa recursao aqui
; e entao ele da um erro esperando algo a mais, o que simplesmente quebra
; entao eh, esse programa esta aqui para mostrar que nao roda
%define a(x) x + a(x-1)

section .text
main:
;;;;;;;;;;;;;;;Usando as macros;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 1              ; codigo do syscall para escrita
  mov rdi, 1              ; 1 aqui eh o "arquivo" stdout para o syscall
  mov rsi, macros_string  ; endereco da string output
  mov rdx, 8              ; numero de bytes
  syscall

  mov rdi, printf_format  ; arg do printf para printar int
  mov rsi, a(25)          ; Aqui expandiria o a() para mov rsi, 25 + a(24)...
                          ; mas ele nem deixa, dando um erro
  mov rax, 0              ; prepara para fazer um printf
  call printf WRT ..plt   ; printf sem o tal do PIE, sei la

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  mov rax, 60  ; prepara para dar um exit
  syscall

section .data
  printf_format: db '%d', 10, 0
  macros_string: db "macros:", 10
