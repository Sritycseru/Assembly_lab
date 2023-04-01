.model small
.stack 100h
.data 
    msg1 db 'Enter the Number(0-9):$'
    msg2 db 'Number is Even.$'  
    msg3 db 'Number is Odd.$'
    n db ?

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
    and n,1 ;n r binary value 1 er sathe logical and korbe.
    call new
    cmp n,1;logicL and er value jodi 1 hoy tahole number ta odd
    je odd 
    
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
        
   
    odd:
    mov ah,9
    lea dx,msg3
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