[bits 64]

section .rodata
  bufsize dw 4096
  filename db "string.txt",0
  mess db "Number of lines in a file : "
  mess_len db 28
  chars dq 0
section .bss
  buf resb 4096
  fd resd 1

section .text
  global _start


_start:
  mov rax, 2 ; setting syscall to open
  mov rdi, filename ;setting filename to filename 
  mov rsi, 0 ;setting flag to read only
  mov rdx, 0777 ;setting mode to rwxrwxrwx
  syscall

  mov qword [chars], 0 
read_again:
  push rax  
  mov [fd], rax
  mov rdi, [fd] 
  mov rax, 0
  mov rsi, buf 
  mov rdx, bufsize
  syscall
  
  cmp rax,0
  je end
  
  mov r10, buf
  mov r9, rax
single:
  inc r11
  inc r10
  dec r9
  cmp r9,0
  ja single 
  pop rax
  jmp read_again

end:
  mov rax, 1
  mov rdi, 1
  mov rsi, mess
  mov rdx, 28
  syscall
 
print_int:
  mov rdx, 0 
  mov rcx, 10
  div rcx
  push rax
  add rdx, 48

  stop:
  mov rax, 1
  mov rdi, 1
  mov rsi, rdx
  mov rdx, 1
  syscall
  pop rax
  cmp rax,0
  jne print_int

exit:
  ;closing the file
  mov rax, 3
  mov rdi, [fd]
  syscall
  ;exiting with 0
  mov rax, 60
  mov rdi, 0
  syscall
