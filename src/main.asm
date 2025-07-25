org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
  jmp main

set_video_mode:
    mov ax, 0x03     
    int 0x10         
    ret

puts:
  push si
  push ax

.loop:
  lodsb 
  or al, al 
  jz .done

  mov ah, 0x0e
  mov bh, 0
  int 0x10

  jmp .loop

.done:
  pop ax
  pop si
  ret


main:
  cli 
  xor ax, ax 
  mov ds, ax
  mov es, ax
  mov ss, ax 
  mov sp, 0x7C00 
  sti

  call set_video_mode

  mov si, msg_hello
  call puts
  mov si, msg_second
  call puts
  
  hlt

.halt:
  jmp .halt

msg_hello: db 'DevourOS', ENDL, 0
msg_second: db 'Dolbik', ENDL, 0 

times 510-($-$$) db 0
dw 0AA55h