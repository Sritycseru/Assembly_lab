.model small
.stack 100h
.data 
    msg1 db 'Enter the string:$'
    msg2 db 'Reverse String:$'
    str db 100 dup ('$')  
   
.code
main proc 
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
    mov si,0 
    
    input:
    mov ah,1
    int 21h 
    cmp al,13 
    je end_input
    mov str[si],al
    inc si 
    jmp input 
    
 
    end_input:
    
    call new 
    mov ah,9
    lea dx,msg2
    int 21h
    
    output: 
    cmp si,0
    je exit 
    dec si 
    mov ah,2
    mov dl,str[si] 
    int 21h
    jmp output
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp   

new proc 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    ret
    new endp

        
end main