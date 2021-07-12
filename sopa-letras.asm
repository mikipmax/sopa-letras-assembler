;Juego de Sopa de letras
;Descripicion: Este programa contempla el uso de los siguiente:
;* Manejo de variables de tipo db (8 bits) consultar informacion para el informe
;* Manejo de arrays
;* Manejo de contadores, banderas y variables auxiliares para controlar flujo del algoritmo
;* Maneja lectura por consola
;* Maneja opciones de pantalla, como cambio de color de fondo o limpieza de pantalla
;* Menejo de macros y etiquetas, no fue necesario usar procedimientos, era mejor usar macros ya que estas solo se ejecutan cuando se les llama, mientras que un procedimineto se ejecuta directamente
;* Manejo de pilas push y pop para respaldar valores de los registros de proposito generar y evitar bugs dentro del flujo del programa
;* Maneja ciclos, como el loop y el salto por etiquetas
;* Maneja tipos de validaciones para solo letras o solo numeros
;* Maneja muchas comparaciones y jumpers, que simulan el uso de if en lenguajes de alto nivel

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
indice_tipo_matriz db ?;Para saber si es la sopa de letras es la 1 o la 2

;---------------------------------- CADA VARIABLE REPRESENTA UNA SOPA DE LETRAS ----------------------------------------------------

sopa_animales1: db 10,13,"P C R O P T G O O P A S T G L",13,10,"D G G A P S E N N E N A O A A",13,10,"L R A N O A C L U N P I A E O",13,10,"O L A A E O B A M O O F G P R",13,10,"U O P R O G E A I B O R O N R",13,10,"L O E R N N O H O O O I O R T",13,10,"U O R O A S N P O G N A S L A",13,10, "L P R G O P U S L R G L P C G",13,10,"O N O A O G R E S A S E S L S",13,10,"R G A L S A A P O N T C A E C",13,10,"C R G P O D D L A G A R T O I",13,10, "J G G A A A O T A E T O A N A",13,10,"O T E T A E A R I L R L S O P",13,10,"O E E S R L A U C R C O R D O",13,10,"S D S G P E A G A T O A O M A",13,10,"$"
sopa_animales2: db 10,13,"C L L A M A M S Q O U C T E E", 13,10, "E L I J C Y M E E A O P Y O O", 13,10,"L C R A A D L N O A A A C S E", 13,10,"Z A E A C O O U T O U C E E O", 13,10,"U N M O B J A Y E N A C A V I", 13,10,"U O E P L E N C A U C U U O D", 13,10,"I E C E N N A N L N G D E A A", 13,10,"C C L O S O S U N P S Y S U V", 13,10,"A A N A I C S O E E O U U U A", 13,10,"J C S U A S L A D A N C O L M", 13,10,"A A D A O A U T A A I O I O O", 13,10,"C M R V P O U A U O R S P T S", 13,10,"M A A C Y C E T C E C A R I Y", 13,10,"O D N L A O M C T U T T R Y S", 13,10,"E E O E R C C F O O C P A T O", 13,10,"$"
sopa_vehiculos1: db 13,10,"D O T R E N E A D N F A F U E", 13,10,"S E L N D A I S B U T N S U B", 13,10,"A T H I A N A T A J A A N E N", 13,10,"U D F O N O E N A U E E U O N", 13,10,"L F U A N N U O V N I R A T L", 13,10,"E Y A R O R G A E S P T T N S", 13,10,"O E E I Y B R V E S O P A M E", 13,10,"L A M I T A N U G O N O E A I", 13,10,"N A M I A I S T O E E I M B C", 13,10,"C E A L U U E N T O E R O T S", 13,10,"D A S C T A M P E B T R U N N", 13,10,"R T C T O E N C N T R U E S O", 13,10,"N I D U N O A T E N O G R U F", 13,10,"B O I M I E B O A Q N E O F U", 13,10,"E C A M I O N E T A S A O U N", 13,10,"$"
sopa_vehiculos2: db 13,10, "E A I O R B L U O R M N E R T", 13,10,"M O C E U R P P N N E D E R D", 13,10,"R R M O E R T F M R T E S E E", 13,10,"E C I S E U E A A T R P I E Y", 13,10,"O R E N I T D M S S O O O O E", 13,10,"R R N T N O C M M R A R O T O", 13,10,"O E A C R N E G E R G F O C E", 13,10,"E B A A E O C A A R O E N C B", 13,10,"O N A M N B O T O E M D N O U", 13,10,"N A S I O R C F I S P E A S E", 13,10,"C N R O A A A M E N M P E U R", 13,10,"O L I N L A E R O E R S T B C", 13,10,"B E N E C O E R A G N C R F I", 13,10,"T L T T N E F U R G O N E T A", 13,10,"E M T A E B E C S M E I C C O", 13,10,"$"
sopa_lenguajes1: db 13,10, "A A D R N M S M A T L A B O M", 13,10,"P A D D T I A A A G A V A H S", 13,10,"O O S A P J N O T S A I T O T", 13,10,"A R J A V A J A T L A E N N P", 13,10,"H I H M N T E P L T A A E E E", 13,10,"Y Y T N G O Y E Q A A B O P G", 13,10,"Q A P Y B T T J A A E P H S E", 13,10,"O A N T H C P A R X R O N L B", 13,10,"E E A O M E T F C P C G R I O", 13,10,"E V C V T L M A Q O M A H B O", 13,10,"M A P O D H R H B T O G J D O", 13,10,"O A E I G A P O D A Z A Q C H", 13,10,"P Y T H O N A E G D G R S T P", 13,10,"T N E G A J R T U D H O G P H", 13,10,"H A Y O L D P N V C C P G T P", 13,10,"$"
sopa_lenguajes2: db 13,10, "E A M R P H P Y A J P H L L O", 13,10,"N H E H I T R A V A H N T O O", 13,10,"P A L V I A L P N V R R U H H", 13,10,"N A I V R B S Y I A T L A C S", 13,10,"G O C S A H E H P S T P T R E", 13,10,"O O P L A O S T M C T S A A P", 13,10,"H P T A P R P L E R R V A A Y", 13,10,"O A I R L S O A N I S S B H T", 13,10,"Z P S R T O P U R P L B N O H", 13,10,"U A L U C R N E D T R V A A O", 13,10,"P T T A I S M H A I M A G A N", 13,10,"A P T N C A A M O L G V P A N", 13,10,"A O N C J A O V M F V E P P T", 13,10,"R G D S T V P J A H O C G D T", 13,10,"M A T L A B V V A J P D H O N", 13,10,"$"

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

;---------------------------------------------SECCION DE MACROS----------------------------------------------------------------------------------------------           

leer_caracter macro
                
    MOV AH, 01H       
    INT 21H 
                              
endm 

mostrar_mensaje macro mensaje
    mov dx,mensaje
    mov ah,9
    int 0x21 
endm
 
;Compara la cadena ingresada con una palabra de la sopa de letras        
comparar_cadena_ingresada macro palabra 
     
     mov cx,12
     lea SI,vec
     lea DI,palabra
     repe cmpsb 
       
endm 
 
limpiar_pantalla macro

    pusha
 
    mov ah, 0x00
    mov al, 0x03;Modo de texto 80x25 16 colours 
    int 0x10
    
    popa
  
endm   

pintar_ubicacion_pantalla macro sopa_letras, x, y, x1, y1              
    ;Respaldamos los valores de ax, bx, cx y dx
    pusha
    push bx
    push cx
    push dx 
    
    mov ax, 0600h; funcion para pintar pantalla bajo los parametros que siguen a continuacion
    mov bh, 30h; color del fondo 
    mov ch, y
    mov cl, x
    mov dh, y
    add dh, y1
    mov dl, x  
    add dl, x1
    int 10h
    
    limpiar_pantalla
    mostrar_mensaje sopa_letras
    ;devolvemos el valor de los registros a como estaban antes de ejecutar este macro
    pop dx
    pop cx
    pop bx
    popa
endm 

pintar_ubicacion_diagonal_pantalla macro sopa_letras, x, y, z              
    ;Respaldamos ax, bx, cx, dx
    pusha
    push bx
    push cx
    push dx
    
    mov ax, 0600h
    mov bh, 30h 
    mov ch, y
    mov cl, x
    mov dh, y
    mov dl, x 
    
    ;Para ir pintando palabras en diagonal dentro de la sopa letras
    mov bl, 0; contador auxiliar
    
    mover:
    int 10h
    inc bl
    add ch, 1; incremento 1 en y
    add cl, 2; incremento 2 en x, esto es por el espacio extra
    add dh, 1
    add dl, 2
    cmp bl, z; este valor es el numero en vertical al cual debe llegar la palabra resaltada
    jne mover 
    limpiar_pantalla
    mostrar_mensaje sopa_letras  
    ;Devolvemos los valores de ax, bx, cx, dx a su valor original
    pop dx
    pop cx
    pop bx
    popa
endm 

mover_si_di macro
     
    ;Sirve para ir copiando caracter a caracter de una palabra a otra
    mov al, [di]
    mov [si],al
    inc si
    inc di
        
endm  
     
validar_si_gano macro ban1, ban2, ban3, ban4, ban5
    
    ; se suma todas las banderas y si da 5 es porque ya ha encontrado las 5 palabras
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
     
    ;Controla el flujo del submenu para animales     
    mostrar_mensaje msg_elegir_tipo 
    leer_caracter
            
    cmp al, '1'                   
    je   opcion_default_animales
     
    cmp al, '2'                   
    je  cambiar_matriz_animales_1_a_2
    
    jmp submenu_animales; en caso que digite algo distinto de 1 o 2
    
    opcion_default_animales:  
    mov indice_tipo_matriz, '1';Con esto que la matriz es de tipo 1
    limpiar_pantalla
    mostrar_mensaje sopa_animales1;Se imprime en pantalla la sopa de letras
    je submenu
    
    ;En caso que sea de tipo 2, copiamos los elementos de cada palabra de la sopa de letras 2 a la 1
    cambiar_matriz_animales_1_a_2:
    mov indice_tipo_matriz, '2'
    limpiar_pantalla
    mostrar_mensaje sopa_animales2
    
    ;Hay que recordar que son 5 palabras, por eso existe una copia de elementos por cada palabra
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

;Este tiene la misma logica que el macro anterior
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

;Este tiene la misma logica que el macro anterior     
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

;------------------------------------------------SECCION DEL MENU PRINCIPAL-------------------------------------------------------------------------------------------       
menu:
    mostrar_mensaje msg_menu
    
    leer_caracter
    
    CMP AL, '1'                   
    JE   submenu_animales
    
    CMP AL, '2'                   
    JE  submenu_vehiculos
    
    CMP AL, '3'                   
    JE  submenu_lenguajes
    
    CMP AL, '4'                   
    JE  salir 
    
    JMP error_menu
                
;-------------------------------------MANEJA LA LOGICA DEL JUEGO PARA ANIMALES------------------------------------------------------------------------------------------------------      
                 
    submenu_animales:
    mov indice_submenu, '1' 
   
    sub_sub_menu_animales
    
    jmp submenu 
    
    continuacion_sub_animales: 
     
    ;Por cada palabra de la sopa de letra la compara con la que ingresa el usuario
    ;En lenguaje de alto nivel lo que sigue representa un switch en ensamblador
    ;En donde el switch evalua a la palabra que ingresa el usuario
    
    ;case (palabra1)
    comparar_cadena_ingresada letra_animal1  
    jne siguiente_animal2;Si no acierta va al siguiente bloque de codigo "siguiente_animal2 
    mostrar_mensaje msg_iguales
    mov bandera_encontro_animal1,1h;Si acierta se activa esta bandera
    cmp indice_tipo_matriz, '1';Verificamos el tipo de matriz 1 o 2
    jne sopa_animales_tipo2_palabra_1; salta si es de tipo 2 
    pintar_ubicacion_pantalla sopa_animales1, 14,15,6,0; pinta la palabra encontrada en la sopa de letras tipo 1
    jmp validacion_animal1
    sopa_animales_tipo2_palabra_1:
    pintar_ubicacion_pantalla sopa_animales2, 2,1,8,0; pinta la palabra encontrada en la sopa de letras tipo 2
    validacion_animal1:
    ;Cada que acierta se debe validar cuanto es la suma de las 5 banderas para saber si ya gano el usuario
    validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5  
    ;Nota: Lo que sigue a continuacion es la misma logica solo que para las otras 4 palabras de la sopa de letras
    
    ;case (palabra2)
    siguiente_animal2:
    comparar_cadena_ingresada letra_animal2
    jne siguiente_animal3   
    mostrar_mensaje msg_iguales
    mov bandera_encontro_animal2, 1
    cmp indice_tipo_matriz, '1'
    jne sopa_animales_tipo2_palabra_2 
    pintar_ubicacion_pantalla sopa_animales1, 4,5,0,4
    jmp validacion_animal2
    sopa_animales_tipo2_palabra_2:
    pintar_ubicacion_pantalla sopa_animales2, 10,4,0,5
    validacion_animal2:
    validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5   
    
    ;case (palabra3)
    siguiente_animal3:
    comparar_cadena_ingresada letra_animal3
    jne siguiente_animal4   
    mostrar_mensaje msg_iguales
    mov bandera_encontro_animal3, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_animales_tipo2_palabra_3 
    pintar_ubicacion_pantalla sopa_animales1, 14,11,12 ,0 
    jmp validacion_animal3
    sopa_animales_tipo2_palabra_3:
    pintar_ubicacion_pantalla sopa_animales2, 22,15,6,0
    validacion_animal3:
    validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5  
    
    ;case (palabra4)
    siguiente_animal4:
    comparar_cadena_ingresada letra_animal4
    jne siguiente_animal5  
    mostrar_mensaje msg_iguales
    mov bandera_encontro_animal4, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_animales_tipo2_palabra_4 
    pintar_ubicacion_pantalla sopa_animales1, 16,1,6,0
    jmp validacion_animal4
    sopa_animales_tipo2_palabra_4:
    pintar_ubicacion_pantalla sopa_animales2, 22,8,0,2
    validacion_animal4:
    validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5  
    
    ;case (palabra5)
    siguiente_animal5: 
    comparar_cadena_ingresada letra_animal5
    jne submenu  
    mostrar_mensaje msg_iguales
    mov bandera_encontro_animal5, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_animales_tipo2_palabra_5 
    pintar_ubicacion_diagonal_pantalla sopa_animales1, 20,4,4
    jmp validacion_animal5
    sopa_animales_tipo2_palabra_5:
    pintar_ubicacion_pantalla sopa_animales2, 20,5,6,0
    validacion_animal5:
    validar_si_gano bandera_encontro_animal1, bandera_encontro_animal2,bandera_encontro_animal3, bandera_encontro_animal4, bandera_encontro_animal5    
    
    ;------------------------------------------MANEJA LA LOGICA DEL JUEGO PARA VEHICULOS-------------------------------------------------------------------------------------------------
    
    ;Esta seccion lleva la misma logica que la anterior
    submenu_vehiculos:
    mov indice_submenu, '2' 
    
    sub_sub_menu_vehiculos
    
    jmp submenu 
    
    continuacion_sub_vehiculos: 
    
    comparar_cadena_ingresada letra_vehiculo1  
    jne siguiente_vehiculo2 
    mostrar_mensaje msg_iguales
    mov bandera_encontro_vehiculo1, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_vehiculos_tipo2_palabra_1 
    pintar_ubicacion_pantalla sopa_vehiculos1,24,2,4,0
    jmp validacion_vehiculo1
    sopa_vehiculos_tipo2_palabra_1:
    pintar_ubicacion_pantalla sopa_vehiculos2, 20,1,0,4
    validacion_vehiculo1:
    validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5 
    
    siguiente_vehiculo2: 
    comparar_cadena_ingresada letra_vehiculo2
    jne siguiente_vehiculo3   
    mostrar_mensaje msg_iguales
    mov bandera_encontro_vehiculo2, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_vehiculos_tipo2_palabra_2 
    pintar_ubicacion_pantalla sopa_vehiculos1,4,1,6,0
    jmp validacion_vehiculo2
    sopa_vehiculos_tipo2_palabra_2:
    pintar_ubicacion_pantalla sopa_vehiculos2,22,1,6,0 
    validacion_vehiculo2:
    validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5   
    
    siguiente_vehiculo3:
    comparar_cadena_ingresada letra_vehiculo3
    jne siguiente_vehiculo4   
    mostrar_mensaje msg_iguales
    mov bandera_encontro_vehiculo3, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_vehiculos_tipo2_palabra_3 
    pintar_ubicacion_pantalla sopa_vehiculos1,2,15,16,0
    jmp validacion_vehiculo3
    sopa_vehiculos_tipo2_palabra_3:
    pintar_ubicacion_pantalla sopa_vehiculos2, 6,7,0,8
    validacion_vehiculo3:
    validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5  
    
    siguiente_vehiculo4:
    comparar_cadena_ingresada letra_vehiculo4
    jne siguiente_vehiculo5  
    mostrar_mensaje msg_iguales
    mov bandera_encontro_vehiculo4, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_vehiculos_tipo2_palabra_4 
    pintar_ubicacion_pantalla sopa_vehiculos1,8,9,0,3
    jmp validacion_vehiculo4
    sopa_vehiculos_tipo2_palabra_4:
    pintar_ubicacion_pantalla sopa_vehiculos2, 12,14,16,0
    validacion_vehiculo4:
    validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5 
    
    siguiente_vehiculo5:
    comparar_cadena_ingresada letra_vehiculo5
    jne submenu  
    mostrar_mensaje msg_iguales
    mov bandera_encontro_vehiculo5, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_vehiculos_tipo2_palabra_5 
    pintar_ubicacion_pantalla sopa_vehiculos1, 12,13,16,0
    jmp validacion_vehiculo5
    sopa_vehiculos_tipo2_palabra_5:
    pintar_ubicacion_pantalla sopa_vehiculos2, 6,7,0,5
    validacion_vehiculo5:
    validar_si_gano bandera_encontro_vehiculo1, bandera_encontro_vehiculo2,bandera_encontro_vehiculo3, bandera_encontro_vehiculo4, bandera_encontro_vehiculo5    
    
;------------------------------------------------MANEJA LA LOGICA DEL JUEGO PARA LENGUAJES-------------------------------------------------------------------------------------------             
    
    ;Esta seccion lleva la misma logica que la anterior
    submenu_lenguajes:      
        mov indice_submenu, '3' 
    
    sub_sub_menu_lenguajes
    
    jmp submenu 
    
    continuacion_sub_lenguajes: 
    
    comparar_cadena_ingresada letra_lenguaje1  
    jne siguiente_lenguaje2 
    mostrar_mensaje msg_iguales
    mov bandera_encontro_lenguaje1, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_lenguajes_tipo2_palabra_1 
    pintar_ubicacion_pantalla sopa_lenguajes1, 14,1,10,0
    jmp validacion_lenguaje1
    sopa_lenguajes_tipo2_palabra_1:
    pintar_ubicacion_pantalla sopa_lenguajes2, 8,1,4,0
    validacion_lenguaje1:
    validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5 
    
    siguiente_lenguaje2: 
    comparar_cadena_ingresada letra_lenguaje2
    jne siguiente_lenguaje3   
    mostrar_mensaje msg_iguales
    mov bandera_encontro_lenguaje2, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_lenguajes_tipo2_palabra_2 
    pintar_ubicacion_pantalla sopa_lenguajes1, 4,4,6,0
    jmp validacion_lenguaje2
    sopa_lenguajes_tipo2_palabra_2:
    pintar_ubicacion_pantalla sopa_lenguajes2, 0,5,2,0
    validacion_lenguaje2:
    validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
    
    siguiente_lenguaje3:
    comparar_cadena_ingresada letra_lenguaje3
    jne siguiente_lenguaje4   
    mostrar_mensaje msg_iguales
    mov bandera_encontro_lenguaje3, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_lenguajes_tipo2_palabra_3 
    pintar_ubicacion_pantalla sopa_lenguajes1, 0,13,10,0
    jmp validacion_lenguaje3
    sopa_lenguajes_tipo2_palabra_3:
    pintar_ubicacion_pantalla sopa_lenguajes2, 0,15,10,0
    validacion_lenguaje3:
    validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
    
    siguiente_lenguaje4:
    comparar_cadena_ingresada letra_lenguaje4
    jne siguiente_lenguaje5  
    mostrar_mensaje msg_iguales
    mov bandera_encontro_lenguaje4, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_lenguajes_tipo2_palabra_4 
    pintar_ubicacion_pantalla sopa_lenguajes1, 28,13,0,2
    jmp validacion_lenguaje4
    sopa_lenguajes_tipo2_palabra_4:
    pintar_ubicacion_pantalla sopa_lenguajes2, 18,1,0,9
    validacion_lenguaje4:
    validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
    
    siguiente_lenguaje5:
    comparar_cadena_ingresada letra_lenguaje5
    jne submenu  
    mostrar_mensaje msg_iguales
    mov bandera_encontro_lenguaje5, 1h
    cmp indice_tipo_matriz, '1'
    jne sopa_lenguajes_tipo2_palabra_5 
    pintar_ubicacion_pantalla sopa_lenguajes1, 6,14,0,1
    jmp validacion_lenguaje5
    sopa_lenguajes_tipo2_palabra_5:
    pintar_ubicacion_pantalla sopa_lenguajes2, 28,6,0,5
    validacion_lenguaje5:
    validar_si_gano bandera_encontro_lenguaje1, bandera_encontro_lenguaje2,bandera_encontro_lenguaje3, bandera_encontro_lenguaje4, bandera_encontro_lenguaje5
    
;--------------------------------------------MANEJA EL FLUJO DEL SUBMENU----------------------------------------------------------------------------------------------                       

submenu:

    mostrar_mensaje msg_submenu
    
    leer_caracter
    
    CMP AL,'1'
    JE sopa_letras
    CMP AL,'2'
    je salir
    mostrar_mensaje msg_opcion_valida
    jmp submenu
            
;----------------------------------------MANEJA LA LECTURA DE PALABRAS QUE INGRESA EL USUARIO---------------------------------------------------------------------------------------------------

sopa_letras:
            
    mostrar_mensaje msg_digitar_palabra 
     
    ;Se debe limpiar el vector para cada lectura de palabra
    lea si,vec
    mov cx, 12
    encerar:
    mov [si],020h; llenamos cada posicion de vec con un espacio
    inc si
    loop encerar
    
    ;Leemos caracter a caracter lo que ingresa el usuario
    lea si,vec
    pedir_letra:
    
    leer_caracter
    
    ;Le permite al usuario presionar enter para continuar con el flujo del juego
    cmp al,0dh
    je continuacion_sin_guardar_enter
    
    ;Verificamos que solo ingrese letras del abecedario
    cmp al,'A'
    jb error_submenu  
    cmp al,'z'
    ja error_submenu 
    
    cmp al,05ah  
    je error_submenu
    cmp al,05bh  
    je error_submenu
    cmp al,0ch  
    je error_submenu
    cmp al,05dh  
    je error_submenu
    cmp al,05eh  
    je error_submenu
    cmp al,05fh  
    je error_submenu
    cmp al,060h  
    je error_submenu
    
    
    ;Para convertir a minuscula lo que el usuario digite
    cmp al, 'a'
    jae  continuacion
    add al, 020h; Al sumar esto convertimos de mayuscula a minuscula
    
    continuacion:
    mov [si],al;Se guarda posicion a posicion el caracter que ingresa el usuario en vec
    inc si
    
    continuacion_sin_guardar_enter:
    cmp al,0dh;Se cicla hasta que se digite un Enter
    ja pedir_letra
    jb pedir_letra
     
    ;Para retonar el flujo hacia el submenu desde donde fueron llamados
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
    ;Devuelve el control al S.O
    MOV AL, 0       
    MOV AH, 4CH
    INT 21H 
                          
end


