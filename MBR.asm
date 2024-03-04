[org 0x7C00]

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov bx, 0x1000
    int 0x13

    jc DISK_ERROR
    jmp 0x1000:0000

DISK_ERROR:
    cli
    hlt
    jmp $

times 510 - ($ - $$) db 0
dw 0xAA55
