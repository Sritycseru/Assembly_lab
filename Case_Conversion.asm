.model small
.stack 100h
.data 
 
   msg1 db 'Enter String:$'
   msg2 db 'Case Conversion:$'
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
     
 
       
     cmp al,'A'
     jl next
     
     cmp al,'z'
     jg next
     
     cmp al,'Z'
     jg check 
     
     jmp change
     
     check: 
     cmp al,'a'
     jl next 
     
     
   change:
      xor al,32  ;case conversion
     
     
     next: 
       
       mov str[si],al 
       inc si
       jmp input
       
     
   end_input: 
     call new
     mov ah,9
     lea dx,msg2
     int 21h
     
     mov ah,9
     lea dx,str
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
            new endp 
        ret
        
         
         
    end main
    
