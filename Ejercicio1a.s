/* --------------------------------------------------------------------------------------
* #      #    #######    ########   #######   #          #######   ##      #    #########
* #     #        #       #          #         #             #      # #     #    #
* #    #         #       #          #         #             #      #  #    #    #
* ####           #       #####      #######   #             #      #   #   #    #    ####
* #    #         #       #                #   #             #      #    #  #    #       #
* #     #        #       #                #   #             #      #     # #    #       #
* #      #    ########   ########   #######   ########   #######   #      ##    #########
* 
* Ejercicio1a.s
 -------------------------------------------------------------------------------------- */
/* --------------------------------------- TEXT --------------------------------------- */
.text
.align 2
.global main
.type main, %function

/* -- Main --*/
main:
    stmfd sp!,{lr}

    @@pedir datos
    ldr r0,=ingreso
	bl puts
	ldr r0,=entrada
	ldr r1,=maximo
	bl scanf

    @@asignar variables
    ldr r4,=bandera
    ldr r5,=maximo
    ldr r4,[r4]
    ldr r5,[r5]


    cmp r5,#61 @@if
    addgt r4,#2 @true
    addle r4,#1 @false

    @@print
    ldr r0,=salida
    mov r1,r4
    bl printf

    @@salida segura
    mov r0, #0
    mov r3, #0
    ldmfd sp!, {lr}
    bx lr

/* --------------------------------------- DATA --------------------------------------- */
.data
.align 2

/*-- Variables --*/
bandera: .word 0
maximo: .word 0

/*-- Mensajes y solicitudes --*/
ingreso: .asciz "Ingrese su nota maxima obtenida en examenes cortos: "
entrada: .asciz " %d"
salida: .asciz "El valor de la bandera es: %d\n "
