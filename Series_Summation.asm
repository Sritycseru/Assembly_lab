.model small
.stack 100h
.data 
    msg1 db 'Enter the input:$'
    msg2 db 'Output:$'
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
    inc n
    mul n
    div d
    mov bl,al 
    
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2 
    mov dl,13
    int 21h
    
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
    

        
end main