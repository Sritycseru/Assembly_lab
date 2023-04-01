.model small
.stack 100h
.data 
    msg1 db 'Enter the first string:$'
    msg2 db 'Enter the second string:$' 
    msg3 db 'Substring is found$'
    msg4 db 'Substring is not found$'
    str1 db 100 dup ('$')
    str2 db 100 dup ('$')   
   
.code
main proc 
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
    mov si,0 
    
    input1:
    mov ah,1
    int 21h 
    cmp al,13 
    je end_input1
    mov str1[si],al
    inc si 
    jmp input1  
    
    end_input1:
    
             
    call new
             
    mov ah,9
    lea dx,msg2
    int 21h 
    
    mov si,0  
    
    input2:
    mov ah,1
    int 21h 
    cmp al,13 
    je end_input2
    mov str2[si],al
    inc si 
    jmp input2
 
    end_input2:
    
    mov si,0 
    
    lebel:
    push si
    mov di,0 
        check: 
        mov bh,str1[si]
        mov bl,str2[di] 
        inc si
        inc di
        cmp bh,bl
        jne update 
        cmp str2[si],'$'
        je found
        jmp check
    cmp str1[di],'$'
    je notfound
        
   update: 
   pop si
   inc si
   jmp lebel 
   
   found: 
   call new
   mov ah,9
   lea dx,msg3
   int 21h
   jmp exit 
   
   notfound: 
   call new
   mov ah,9
   lea dx,msg4
   int 21h
    
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