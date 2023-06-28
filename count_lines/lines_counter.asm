[bits 64]

section .rodata
  hell db "Hello World",10
  bufsize dw 1024
  filename db "string.txt",0

section .bss
  buf resb 1024
  fd resd 1
section .text
  global _start


_start:
  mov rax, 2 ; setting syscall to open
  mov rdi, filename ;setting filename to filename 
  mov rsi, 0 ;setting flag to read only
  mov rdx, 0777 ;setting mode to rwxrwxrwx
  syscall
 
  push rax
read_again:
  push rax
  mov rdi,rax 
  mov rax, 0
  mov rsi, buf 
  mov rdx, bufsize
  syscall
   
  cmp rax, 0
  je end 

  mov rax, 1 
  mov rdi, 1
  mov rsi, buf
  mov rdx, bufsize
  syscall
  pop rax
  jmp end

end:
  mov rax, 3
  pop rdi
  syscall

  mov rax, 60
  mov rdi, 0
  syscall
