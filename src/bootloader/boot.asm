org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

; FAT12 header
jmp short start
nop

bdb_oem:                      db 'MSWIN4.1' ; 8 bytes
bdb_bytes_per_sectorL:        dw 512
bdb_sectors_per_cluster:      db 1 
bdb_reserved_sectors:         dw 1 
bdb_fat_count:                db 2
bdb_dir_entries_count:        dw 0E0h
bdb_total_sectors:            dw 2880 
bdb_media_descriptor_type:    db 0F0h
bdb_sectors_per_fat:          dw 9
bdb_sectors_per_track:        dw 18
bdb_heads:                    dw 2 
bdb_hidden_sectors:           dd 0 
bdb_large_sector_count:       dd 0 

ebr_drive_number:             db 0
                              db 0 
ebr_signature:                db 29h 
ebr_volume_id:                db 12h, 34h, 56h, 78h 
ebr_volume_label:             db 'DevourOS'
ebr_system_id:                db 'FAT12   '

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
