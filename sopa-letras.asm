include 'emu8086.inc'
.model tiny
.data 
vec db 50 dup(' '), '$'  ;Vector que representara la palabra ingresa por el usuario
.code
    
.startup

leer_caracter macro
                MOV AH, 01H       
                INT 21H 
                printn  ''
                
endm 


mostrar_mensaje_error macro mensaje
            printn ""
            printn mensaje
endm
         

 menu:
                printn  "Bienvenido al Juego de Sopa de Letras"        
                printn  "Elija una tematica  (1, 2, 3, o 4):" 
                printn  '1) Animales'
                printn  '2) Vehiculos de transporte'
                printn  '3) Lenguajes de programacion'
                printn  '4) Salir'
                 
               
                
                leer_caracter
                
               
                 ;hay que respaldar al para luego regresar al menu
                CMP AL, '1'                   
                JE   submenu
                 
                CMP AL, '2'                   
                JE  submenu
                 
                CMP AL, '3'                   
                JE  submenu
                 
                CMP AL, '4'                   
                JE  salir 
                
                JMP error_menu
                

      
                 
                 
                 
                 
                            submenu:
            printn '1) Digitar una palabra'
            printn '2) Rendirse'
            leer_caracter

            CMP AL,'1'
            JE sopa_letras
            CMP AL, '2'
            je salir
            mostrar_mensaje_error 'Elija una opcion Valida'
            jmp submenu

        sopa_letras:

            lea si,vec  ;Cargamos en el registro si al primer vector
            printn 'Digitar la palabra encontrada'
            pedir_letra:
            mov ah,01h  ;Pedimos caracter por caracter
            int 21h

            ;Le permite al usuario presionar enter para continuar con el flujo del juego
            cmp al,0dh
            je continuacion

            ;Verificamos que solo ingrese numeros
            cmp al,'A'
            jb error_submenu
            cmp al,'z'
            ja error_submenu

            ;Para convertir a minuscula lo que el usuario digite
            cmp al, 'a'
            jae  continuacion
            add al, 020h

        continuacion:

            mov [si],al  ;Se guarda en el registro indexado al vector
            inc si

            cmp al,0dh  ;Se cicla hasta que se digite un Enter
            ja pedir_letra
            jb pedir_letra
             

            
            
            JE salir 
                 
                error_menu:
                 mostrar_mensaje_error 'Elija una opcion valida'
                    
                 JMP menu   
                     
                 error_submenu:
                 mostrar_mensaje_error "Solo se puede ingresar letras"
                 jmp sopa_letras   
                         
                 salir:
                    
                     MOV AL, 0       
                     MOV AH, 4CH
                     INT 21H 
                          
end


