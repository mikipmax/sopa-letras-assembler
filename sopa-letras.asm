
.model tiny
.data 

;---------------------------------------------- MENSAJES QUE SE MOSTRARA AL USUARIO -----------------------------------------------
msg_iguales: db 13,10,"Acierto",13,10,"$"
msg_menu: db "Bienvenido al Juego de Sopa de Letras",10,13,"Elija una tematica (1, 2, 3, o 4):",10,13,'1) Animales',10,13,'2) Vehiculos de transporte',10,13,'3) Lenguajes de programacion',10,13,'4) Salir',10,13,"$"
msg_submenu: db 10,13,'1) Digitar una palabra',10,13,'2) Rendirse',10,13,"$"
msg_opcion_valida: db 10,13,'Elija una opcion Valida',13,10,"$"
msg_digitar_palabra: db 10,13,"Digitar la palabra encontrada",13,10,"$"
msg_solo_letras: db "Solo se puede ingresar letras",13,10,"$"
msg_gano: db "Felicidades ha ganado el juego",10,13,"$" 
msg_elegir_tipo: db 10,13,"Elija el tipo 1 o 2",10,13,"$"
;-----------------------------------------------------------------------------------------------------------------------------------  
vec db 12 dup(' '), '$' ;Vector que representara la palabra ingresa por el usuario  
indice_submenu db ? ;Para manejar saltos al submenu
indice_tipo_matriz db ?;  
;---------------------------------- CADA VARIABLE REPRESENTA UNA SOPA DE LETRAS ----------------------------------------------------
sopa_animales1: db 10,13,"P C R O P T G O D S T O S G L",13,10,"D G G A P S E N N E N A O A A",13,10,"L R A N O A C L U N P I A E O",13,10,"O L A A E O B A M O O F G P R",13,10,"U O P R O G E A I B O R O N R",13,10,"L O E R N N O H O O O I O R T",13,10,"U O R O A S N P O G N A S L A",13,10, "L P R G O P U S L R G L P C G",13,10,"O N O A O G R E S A S E S L S",13,10,"R G A L S A A P O N T C A E C",13,10,"C R G P O D D L A G A R T O I",13,10, "J G G A A A O T A E T O A N A",13,10,"O T E T A E A R I L R L S O P",13,10,"O E E S R L A U C R C O R D O",13,10,"S D S G P E A G A T O A O M A",13,10,"$"
sopa_animales2: db 10,13,"C L L A M A M S Q O U C T E E", 13,10, "E L I J C Y M E E A O P Y O O", 13,10,"L C R A A D L N O A A A C S E", 13,10,"Z A E A C O O U T O U C E E O", 13,10,"U N M O B J A Y E N A C A V I", 13,10,"U O E P L E N C A U C U U O D", 13,10,"I E C E N N A N L N G D E A A", 13,10,"C C L O S O S U N P S Y S U V", 13,10,"A A N A I C S O E E O U U U A", 13,10,"J C S U A S L A D A N C O L M", 13,10,"A A D A O A U T A A I O I O O", 13,10,"C M R V P O U A U O R S P T S", 13,10,"M A A C Y C E T C E C A R I Y", 13,10,"O D N L A O M C T U T T R Y S", 13,10,"E E O E R C C F O O C M C P L", 13,10,"$"
sopa_vehiculos1: db 13,10,"D O S M D O E A D N F A F U E", 13,10,"S E L N D A I S A U T N S U B", 13,10,"A T H I A N A T A N A A N E N", 13,10,"U D F O N O E N A U E E U O N", 13,10,"L F U A N N U O V N I R A T L", 13,10,"E Y A R O R G A E S P T T N S", 13,10,"O E E I Y B R V E S O P A M E", 13,10,"L A M I T A N U G O N O E A I", 13,10,"N A M I A I S T O E E I M B C", 13,10,"C E A L U U E N T O E R O T S", 13,10,"D A S C T A M P E B T R U N N", 13,10,"R T C T O E N C N T R U E S O", 13,10,"N I D U N O A T E N O G R U F", 13,10,"B O I M I E B O A Q N E O F U", 13,10,"E B O E C N E M Z L S A O U N", 13,10,"$"
sopa_vehiculos2: db 13,10,"E O S M D O E A D N F A F U E", 13,10,"S E L N D A I S A U T N S U B", 13,10,"A T H I A N A T A N A A N E N", 13,10,"U D F O N O E N A U E E U O N", 13,10,"L F U A N N U O V N I R A T L", 13,10,"E Y A R O R G A E S P T T N S", 13,10,"O E E I Y B R V E S O P A M E", 13,10,"L A M I T A N U G O N O E A I", 13,10,"N A M I A I S T O E E I M B C", 13,10,"C E A L U U E N T O E R O T S", 13,10,"D A S C T A M P E B T R U N N", 13,10,"R T C T O E N C N T R U E S O", 13,10,"N I D U N O A T E N O G R U F", 13,10,"B O I M I E B O A Q N E O F U", 13,10,"E B O E C N E M Z L S A O U N", 13,10,"$"
sopa_lenguajes1: db 13,10,"F O S M D O E A D N F A F U E", 13,10,"S E L N D A I S A U T N S U B", 13,10,"A T H I A N A T A N A A N E N", 13,10,"U D F O N O E N A U E E U O N", 13,10,"L F U A N N U O V N I R A T L", 13,10,"E Y A R O R G A E S P T T N S", 13,10,"O E E I Y B R V E S O P A M E", 13,10,"L A M I T A N U G O N O E A I", 13,10,"N A M I A I S T O E E I M B C", 13,10,"C E A L U U E N T O E R O T S", 13,10,"D A S C T A M P E B T R U N N", 13,10,"R T C T O E N C N T R U E S O", 13,10,"N I D U N O A T E N O G R U F", 13,10,"B O I M I E B O A Q N E O F U", 13,10,"E B O E C N E M Z L S A O U N", 13,10,"$"
sopa_lenguajes2: db 13,10,"J O S M D O E A D N F A F U E", 13,10,"S E L N D A I S A U T N S U B", 13,10,"A T H I A N A T A N A A N E N", 13,10,"U D F O N O E N A U E E U O N", 13,10,"L F U A N N U O V N I R A T L", 13,10,"E Y A R O R G A E S P T T N S", 13,10,"O E E I Y B R V E S O P A M E", 13,10,"L A M I T A N U G O N O E A I", 13,10,"N A M I A I S T O E E I M B C", 13,10,"C E A L U U E N T O E R O T S", 13,10,"D A S C T A M P E B T R U N N", 13,10,"R T C T O E N C N T R U E S O", 13,10,"N I D U N O A T E N O G R U F", 13,10,"B O I M I E B O A Q N E O F U", 13,10,"E B O E C N E M Z L S A O U N", 13,10,"$"

;---------- DECLARACION DE VARIABLES QUE REPRESENTAN LAS PALABRAS CORRESPONDIENTES A LAS SOPAS DE LETRAS ----------------------------------

letra_animal1 db 'gato',8 dup (' '), '$'  
letra_animal2 db 'perro',7 dup (' '), '$'   
letra_animal3 db 'lagarto', 5 dup (' '), '$'
letra_animal4 db 'sapo',8 dup (' '), '$'
letra_animal5 db 'loro',8 dup (' '), '$' 

letra_animal6 db 'llama',7 dup (' '), '$'  
letra_animal7 db 'conejo',6 dup (' '), '$'   
letra_animal8 db 'pato', 8 dup (' '), '$'
letra_animal9 db 'cuy',9 dup (' '), '$'
letra_animal10 db 'vaca',8 dup (' '), '$'

letra_vehiculo1 db 'bus',9 dup (' '), '$'  
letra_vehiculo2 db 'tren',8 dup (' '), '$'   
letra_vehiculo3 db 'camioneta', 3 dup (' '), '$'
letra_vehiculo4 db 'auto',8 dup (' '), '$'
letra_vehiculo5 db 'furgoneta',3 dup (' '), '$'

letra_vehiculo6 db 'metro',7 dup (' '), '$'  
letra_vehiculo7 db 'tren',8 dup (' '), '$'   
letra_vehiculo8 db 'camioneta', 3 dup (' '), '$'
letra_vehiculo9 db 'furgoneta',3 dup (' '), '$'
letra_vehiculo10 db 'camion',6 dup (' '), '$'

letra_lenguaje1 db 'matlab',6 dup (' '), '$'  
letra_lenguaje2 db 'java',8 dup (' '), '$'   
letra_lenguaje3 db 'python', 6 dup (' '), '$'
letra_lenguaje4 db 'php',9 dup (' '), '$'
letra_lenguaje5 db 'go',10 dup (' '), '$'
 
; se va a generar otros luego cambiar 
letra_lenguaje6 db 'php',9 dup (' '), '$'  
letra_lenguaje7 db 'go',10 dup (' '), '$'   
letra_lenguaje8 db 'matlab', 6 dup (' '), '$'
letra_lenguaje9 db 'javascript',2 dup (' '), '$'
letra_lenguaje10 db 'python',6 dup (' '), '$'

;------------------------------------------- DECLARACION DE BANDERAS PARA CONTROLAR EL JUEGO ----------------------------------------------
bandera_encontro_animal1 db 0
bandera_encontro_animal2 db 0 
bandera_encontro_animal3 db 0 
bandera_encontro_animal4 db 0 
bandera_encontro_animal5 db 0   

bandera_encontro_vehiculo1 db 0
bandera_encontro_vehiculo2 db 0 
bandera_encontro_vehiculo3 db 0 
bandera_encontro_vehiculo4 db 0 
bandera_encontro_vehiculo5 db 0 

bandera_encontro_lenguaje1 db 0
bandera_encontro_lenguaje2 db 0 
bandera_encontro_lenguaje3 db 0 
bandera_encontro_lenguaje4 db 0 
bandera_encontro_lenguaje5 db 0
;-------------------------------------------------------------------------------------------------------------------------------------------         
.code
    
.startup
;-------------------------------------------------------------------------------------------------------------------------------------------           
leer_caracter macro
                
                MOV AH, 01H       
                INT 21H 
                              
endm 

mostrar_mensaje macro mensaje
mov dx,mensaje
mov ah,9
int 0x21 
endm
         
comparar_cadena_ingresada macro palabra 
     
     mov cx,12
     lea SI,vec
     lea DI,palabra
     repe cmpsb 
      
  
endm 
 
limpiar_pantalla macro

 pusha
  mov ah, 0x00
  mov al, 0x03  ; text mode 80x25 16 colours
  int 0x10
  popa
  
endm  

pintar_ubicacion_pantalla macro sopa_letras, x, y, x1, y1              
 

mov ax, 0600h
mov bh, 30h 
mov ch, y
mov cl, x
mov dh, y
add dh, y1
mov dl, x  
add dl, x1
int 10h

limpiar_pantalla
mostrar_mensaje sopa_letras
endm 


mover_si_di macro

mov al, [di]
mov [si],al
inc si
inc di    
endm  
     
validar_si_gano macro ban1, ban2, ban3, ban4, ban5
 mov ah,0 
             add ah, ban1
             add ah, ban2 
             add ah, ban3
             add ah, ban4 
             add ah, ban5
             cmp ah, 5
             je gano   
             jne submenu   
endm
 
sub_sub_menu_animales macro 
         
         mostrar_mensaje msg_elegir_tipo 
         leer_caracter
            
             cmp al, '1'                   
             je   opcion_default_animales
                 
             cmp al, '2'                   
             je  cambiar_matriz_animales_1_a_2
             
             jmp submenu_animales
             
             opcion_default_animales:  
             mov indice_tipo_matriz, '1'
             limpiar_pantalla
             mostrar_mensaje sopa_animales1
             je submenu
             
             cambiar_matriz_animales_1_a_2:
             mov indice_tipo_matriz, '2'
             limpiar_pantalla
             mostrar_mensaje sopa_animales2
             
             mov cx,12
             lea si, letra_animal1
             lea di, letra_animal6
             mueve_palabra_animal_6_a_1: 
             mover_si_di  
             loop mueve_palabra_animal_6_a_1  
             
             mov cx,12
             lea si, letra_animal2
             lea di, letra_animal7
             mueve_palabra_animal_7_a_2: 
             mover_si_di  
             loop mueve_palabra_animal_7_a_2  
             
             mov cx,12
             lea si, letra_animal3
             lea di, letra_animal8
             mueve_palabra_animal_8_a_3: 
             mover_si_di  
             loop mueve_palabra_animal_8_a_3
             
             mov cx,12
             lea si, letra_animal4
             lea di, letra_animal9
             mueve_palabra_animal_9_a_4: 
             mover_si_di  
             loop mueve_palabra_animal_9_a_4
             
             mov cx,12
             lea si, letra_animal5
             lea di, letra_animal10
             mueve_palabra_animal_10_a_5: 
             mover_si_di  
             loop mueve_palabra_animal_10_a_5
endm

sub_sub_menu_vehiculos macro
         mostrar_mensaje msg_elegir_tipo 
         leer_caracter
            
             cmp al, '1'                   
             je   opcion_default_vehiculos
                     
             cmp al, '2'                   
             je  cambiar_matriz_vehiculos_1_a_2
             
             jmp submenu_vehiculos
             
             opcion_default_vehiculos:
             mov indice_tipo_matriz, '1' 
             limpiar_pantalla
             mostrar_mensaje sopa_vehiculos1
             je submenu
             
             cambiar_matriz_vehiculos_1_a_2:
             mov indice_tipo_matriz, '2'
             limpiar_pantalla
             
             mostrar_mensaje sopa_vehiculos2
             mov cx,12
             lea si, letra_vehiculo1
             lea di, letra_vehiculo6
             mueve_palabra_vehiculo_6_a_1: 
             mover_si_di  
             loop mueve_palabra_vehiculo_6_a_1  
             
             mov cx,12
             lea si, letra_vehiculo2
             lea di, letra_vehiculo7
             mueve_palabra_vehiculo_7_a_2: 
             mover_si_di  
             loop mueve_palabra_vehiculo_7_a_2  
             
             mov cx,12
             lea si, letra_vehiculo3
             lea di, letra_vehiculo8
             mueve_palabra_vehiculo_8_a_3: 
             mover_si_di  
             loop mueve_palabra_vehiculo_8_a_3
             
             mov cx,12
             lea si, letra_vehiculo4
             lea di, letra_vehiculo9
             mueve_palabra_vehiculo_9_a_4: 
             mover_si_di  
             loop mueve_palabra_vehiculo_9_a_4
             
             mov cx,12
             lea si, letra_vehiculo5
             lea di, letra_vehiculo10
             mueve_palabra_vehiculo_10_a_5: 
             mover_si_di  
             loop mueve_palabra_vehiculo_10_a_5
 endm
       
sub_sub_menu_lenguajes macro
         mostrar_mensaje msg_elegir_tipo 
         leer_caracter
            
             cmp al, '1'                   
             je   opcion_default_lenguajes
                 
             cmp al, '2'                   
             je  cambiar_matriz_lenguajes_1_a_2
             
             jmp submenu_lenguajes
             
             opcion_default_lenguajes:
             mov indice_tipo_matriz, '1'
             limpiar_pantalla
             mostrar_mensaje sopa_lenguajes1
             je submenu 
             
             cambiar_matriz_lenguajes_1_a_2: 
             mov indice_tipo_matriz, '2'
             limpiar_pantalla
             
             mostrar_mensaje sopa_lenguajes2
             mov cx,12
             lea si, letra_lenguaje1
             lea di, letra_lenguaje6
             mueve_palabra_lenguaje_6_a_1: 
             mover_si_di  
             loop mueve_palabra_lenguaje_6_a_1  
             
             mov cx,12
             lea si, letra_lenguaje2
             lea di, letra_lenguaje7
             mueve_palabra_lenguaje_7_a_2: 
             mover_si_di  
             loop mueve_palabra_lenguaje_7_a_2  
             
             mov cx,12
             lea si, letra_lenguaje3
             lea di, letra_lenguaje8
             mueve_palabra_lenguaje_8_a_3: 
             mover_si_di  
             loop mueve_palabra_lenguaje_8_a_3
             
             mov cx,12
             lea si, letra_lenguaje4
             lea di, letra_lenguaje9
             mueve_palabra_lenguaje_9_a_4: 
             mover_si_di  
             loop mueve_palabra_lenguaje_9_a_4
             
             mov cx,12
             lea si, letra_lenguaje5
             lea di, letra_lenguaje10
             mueve_palabra_lenguaje_10_a_5: 
             mover_si_di  
             loop mueve_palabra_lenguaje_10_a_5
 endm       
;-------------------------------------------------------------------------------------------------------------------------------------------       
 menu:
                mostrar_mensaje msg_menu
                 
               
                leer_caracter
                
               
                ;hay que respaldar al para luego regresar al menu
                CMP AL, '1'                   
                JE   submenu_animales
                 
                CMP AL, '2'                   
                JE  submenu_vehiculos
                 
                CMP AL, '3'                   
                JE  submenu_lenguajes
                 
                CMP AL, '4'                   
                JE  salir 
                
                JMP error_menu
                

;-------------------------------------------------------------------------------------------------------------------------------------------      
                 
             submenu_animales:
             mov indice_submenu, '1' 
             
             
             sub_sub_menu_animales
          
             jmp submenu 
             
             continuacion_sub_animales: 
          
             comparar_cadena_ingresada letra_animal1  
             jne siguiente_animal2 
             mostrar_mensaje msg_iguales
             mov bandera_encontro_animal1, 1h
             cmp indice_tipo_matriz, '1'
             jne sopa_animales_tipo2 
             pintar_ubicacion_pantalla sopa_animales1, 14,15,6,0
             jmp validacion_animal1
             sopa_animales_tipo2:
             pintar_ubicacion_pantalla sopa_animales2, 4,5,0,4
             validacion_animal1:
             validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5  
             
             siguiente_animal2: 
             comparar_cadena_ingresada letra_animal2
             jne siguiente_animal3   
             mostrar_mensaje msg_iguales
             mov bandera_encontro_animal2, 1
             pintar_ubicacion_pantalla sopa_animales1, 4,5,0,4
             validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5   
             
             siguiente_animal3:
             comparar_cadena_ingresada letra_animal3
             jne siguiente_animal4   
             mostrar_mensaje msg_iguales
             mov bandera_encontro_animal3, 1h
             validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5  
              
             siguiente_animal4:
             comparar_cadena_ingresada letra_animal4
             jne siguiente_animal5  
             mostrar_mensaje msg_iguales
             mov bandera_encontro_animal4, 1h
             validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5  
             
             siguiente_animal5:
             comparar_cadena_ingresada letra_animal5
             jne submenu  
             mostrar_mensaje msg_iguales
             mov bandera_encontro_animal5, 1h
             validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5    

;-------------------------------------------------------------------------------------------------------------------------------------------
             submenu_vehiculos:
             mov indice_submenu, '2' 
             
             sub_sub_menu_vehiculos
          
             jmp submenu 
             
             continuacion_sub_vehiculos: 
             
             comparar_cadena_ingresada letra_vehiculo1  
              
             jne siguiente_vehiculo2 
             mostrar_mensaje msg_iguales
             mov bandera_encontro_vehiculo1, 1h
             validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5 
             
             siguiente_vehiculo2: 
             comparar_cadena_ingresada letra_vehiculo2
             jne siguiente_vehiculo3   
             mostrar_mensaje msg_iguales
             mov bandera_encontro_vehiculo2, 1h
             validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5   
             
             siguiente_vehiculo3:
             comparar_cadena_ingresada letra_vehiculo3
             jne siguiente_vehiculo4   
             mostrar_mensaje msg_iguales
             mov bandera_encontro_vehiculo3, 1h
             validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5  
              
             siguiente_vehiculo4:
             comparar_cadena_ingresada letra_vehiculo4
             jne siguiente_vehiculo5  
             mostrar_mensaje msg_iguales
             mov bandera_encontro_vehiculo4, 1h
             validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5 
             
             siguiente_vehiculo5:
             comparar_cadena_ingresada letra_vehiculo5
             jne submenu  
             mostrar_mensaje msg_iguales
             mov bandera_encontro_vehiculo5, 1h
             validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5    
             
            

;-------------------------------------------------------------------------------------------------------------------------------------------             
             submenu_lenguajes:      
                    mov indice_submenu, '3' 
             
             sub_sub_menu_lenguajes
          
             jmp submenu 
             
             continuacion_sub_lenguajes: 
             
             comparar_cadena_ingresada letra_lenguaje1  
              
             jne siguiente_lenguaje2 
             mostrar_mensaje msg_iguales
             mov bandera_encontro_lenguaje1, 1h
             validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5 
             
             siguiente_lenguaje2: 
             comparar_cadena_ingresada letra_lenguaje2
             jne siguiente_lenguaje3   
             mostrar_mensaje msg_iguales
             mov bandera_encontro_lenguaje2, 1h
             validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
             
             siguiente_lenguaje3:
             comparar_cadena_ingresada letra_lenguaje3
             jne siguiente_lenguaje4   
             mostrar_mensaje msg_iguales
             mov bandera_encontro_lenguaje3, 1h
             validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
              
             siguiente_lenguaje4:
             comparar_cadena_ingresada letra_lenguaje4
             jne siguiente_lenguaje5  
             mostrar_mensaje msg_iguales
             mov bandera_encontro_lenguaje4, 1h
             validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
             
             siguiente_lenguaje5:
             comparar_cadena_ingresada letra_lenguaje5
             jne submenu  
             mostrar_mensaje msg_iguales
             mov bandera_encontro_lenguaje5, 1h
             validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
              
;-------------------------------------------------------------------------------------------------------------------------------------------                       
        submenu:
            mostrar_mensaje msg_submenu
            
            leer_caracter

            CMP AL,'1'
            JE sopa_letras
            CMP AL, '2'
            je salir
            mostrar_mensaje msg_opcion_valida
            jmp submenu
;-------------------------------------------------------------------------------------------------------------------------------------------
        sopa_letras:
            
           
            mostrar_mensaje msg_digitar_palabra 
             
             lea si,vec 
             ; Se debe limpiar el vector para cada nueva lectura de palabra
             mov cx, 12
             encerar:
                  
              mov [si],020h 
              inc si
              loop encerar
              
            lea si,vec
            pedir_letra:
           
            leer_caracter

            ;Le permite al usuario presionar enter para continuar con el flujo del juego
            cmp al,0dh
            je continuacion_sin_guardar_enter

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
            
            
            continuacion_sin_guardar_enter:
            cmp al,0dh  ;Se cicla hasta que se digite un Enter
            ja pedir_letra
            jb pedir_letra
            
             
            cmp indice_submenu,'1'
            je  continuacion_sub_animales
            cmp indice_submenu,'2'
            je  continuacion_sub_vehiculos
            jmp continuacion_sub_lenguajes 
             
           
            JE salir 
;-------------------------------------------------------------------------------------------------------------------------------------------                 
                error_menu:     
                
                 mostrar_mensaje msg_opcion_valida
                    
                 JMP menu   
                     
                 error_submenu:
                 mostrar_mensaje msg_solo_letras 
                 jmp sopa_letras   
                 
                 gano:
                  mostrar_mensaje msg_gano
                         
                 salir:
                    
                     MOV AL, 0       
                     MOV AH, 4CH
                     INT 21H 
                          
end


