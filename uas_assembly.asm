.model small
.stack 100h
.data
    result dw 0
    pesan db "Hasil: $"
    newline db 13, 10, "$"

.code main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 121
    mov bx, 30
    mul bx
    
    add ax, 10
    sub ax, 4
    
    mov result, ax
    
;Konversi
    lea si, result
    mov ax, result
    call print_number
    
    lea dx, newline
    mov ah, 9
    int 21h
    
    mov ah, 4Ch
    int 21h
    endp

print_number proc
    push ax
    mov cx, 0

convert_loop:
    xor dx, dx
    mov bx, 10
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_loop
    
;cetak angka
    lea dx, pesan
    mov ah, 9
    int 21h

print_digits:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop print_digits
    
    ret print_number
    endp