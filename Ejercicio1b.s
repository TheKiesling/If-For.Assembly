/* --------------------------------------------------------------------------------------
* #      #    #######    ########   #######   #          #######   ##      #    #########
* #     #        #       #          #         #             #      # #     #    #
* #    #         #       #          #         #             #      #  #    #    #
* ####           #       #####      #######   #             #      #   #   #    #    ####
* #    #         #       #                #   #             #      #    #  #    #       #
* #     #        #       #                #   #             #      #     # #    #       #
* #      #    ########   ########   #######   ########   #######   #      ##    #########
* 
* Ejercicio1b.s
 -------------------------------------------------------------------------------------- */
/* --------------------------------------- TEXT --------------------------------------- */
.text
.align 2
.global main
.type main, %function

/* -- Main --*/
main:
    stmfd sp!,{lr}

    @@asignar variables
    ldr r4,=veces
    ldr r5,=cont
    ldr r6,=aumentador
    ldr r4,[r4]
    ldr r5,[r5]
    ldr r6,[r6]

@@ciclo
loop:
    mul r4,r4,r6 @operacion dentro del ciclo
    subs r5,#1 @reducir contador
    beq salir @se cumple la condicion
    bne loop @seguir en el ciclo
    
salir:
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
veces: .word 1
cont: .word 10
aumentador: .word 2

/*-- Mensajes y solicitudes --*/
salida: .asciz "El valor de veces es: %d\n "
