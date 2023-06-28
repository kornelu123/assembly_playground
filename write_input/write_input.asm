[bits 64]

section .bss
  uinput resb 24
  uinput_len equ 24

section .text
  global _start


_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, uinput 
  mov rdx, uinput_len
  syscall

  mov rax, 1 
  mov rdi, 1
  mov rsi, uinput
  mov rdx, uinput_len
  syscall

  mov rax, 60
  mov rdi, 0
  syscall

