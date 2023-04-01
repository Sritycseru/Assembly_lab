.model small
.stack 100h
.data 
    msg1 db 'Enter the input(1-3):$'
    msg2 db 'Factorial:$'
    n db ?
    d db 2
.code
main proc 
    mov ax,@data
    mov ds,AX
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48 
    
    mov n,al
    mov al,1
    
    fact:
    cmp n,1
    je output
    mul n
    dec n 
    jmp fact
    
    
    output:
    mov bl,al
    call new
    mov ah,9
    lea dx,msg2
    int 21h
    add bl,48
    mov ah,2
    mov dl,bl
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
        

    new proc
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2 
    mov dl,13
    int 21h
    ret   
    new endp

        
end main