.model small
.stack 100h
.data

  msg1 db 'Enter Numbers:$'
  msg2 db 'Number is prime$' 
  msg3 db 'Number is not prime$'
  n db ? 
  d db 2
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
    sub al,48
    
    mov n,al 
    
    check_prime:
    
    cmp n,2
    jl non_prime 
    
    cmp n,2
    je prime
    
    ;xor ax,ax
    l1:
    mov ah,0
    mov al,n
    div d
    cmp ah,0
    je non_prime
    inc d
                    
    mov bl,d
    cmp bl,n
    je prime
    jmp l1
    
    
      
  non_prime:
  call newline
  mov ah,9
  lea dx,msg3
  int 21h 
  jmp exit
  
  prime: 
  call newline
  mov ah,9
  lea dx,msg2
  int 21h  
  jmp exit
   
    
     
  end_input:  
 
 
 exit:
 mov ah,4ch
 int 21h
    
    
 main endp 

newline proc
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h
    ret
    newline endp

end main


