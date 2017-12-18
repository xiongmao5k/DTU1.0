///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:21
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\cpu\gpio.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\gpio.c -D STM32F10X_MD -D
//        USE_STDPERIPH_DRIVER -lb
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\ --diag_suppress
//        Pa050 -o D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M3 -e --fpu=None
//        --dlib_config D:\software\IAR\arm\INC\c\DLib_Config_Normal.h -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\Libraries\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x\
//        -I D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\sys\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\lib\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\cfs\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\senproto\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\tools\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\spiffs\src\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_WriteBit
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd

        PUBLIC gpio_get_pin
        PUBLIC gpio_init
        PUBLIC gpio_set_as_input
        PUBLIC gpio_set_as_output
        PUBLIC gpio_set_pin
        PUBLIC gpiocfg


        SECTION `.data`:DATA:REORDER:NOROOT(2)
gpiocfg:
        DATA
        DC32 40010800H, 4, 40010800H, 8, 40011000H, 8192, 40010800H, 2
        DC32 40010800H, 1, 40010800H, 128, 40010800H, 16, 40010C00H, 1
        DC32 40010800H, 32, 40011400H, 1, 40010800H, 64, 40010800H, 32768
        DC32 40010800H, 4096, 40010800H, 2048, 40010C00H, 512, 40010C00H, 256
        DC32 40010C00H, 128, 40010C00H, 64, 40010C00H, 32, 40010C00H, 16
        DC32 40010C00H, 8, 40010C00H, 2048

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gpio_set_as_output:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        CMP      R0,#+22
        BCS.N    ??gpio_set_as_output_0
        LDR.N    R1,??DataTable3
        ADDS     R2,R1,R0, LSL #+3
        LDR      R0,[R2, #+4]
        STRH     R0,[SP, #+0]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+2
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR      R0,[R2, #+0]
        BL       GPIO_Init
??gpio_set_as_output_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gpio_set_as_input:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        CMP      R0,#+22
        BCS.N    ??gpio_set_as_input_0
        LDR.N    R1,??DataTable3
        ADDS     R2,R1,R0, LSL #+3
        LDR      R0,[R2, #+4]
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        MOVS     R0,#+2
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR      R0,[R2, #+0]
        BL       GPIO_Init
??gpio_set_as_input_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gpio_set_pin:
        PUSH     {R7,LR}
        MOVS     R3,#+0
        CMP      R0,#+22
        BCS.N    ??gpio_set_pin_0
        LDR.N    R2,??DataTable3
        ADDS     R3,R2,R0, LSL #+3
        CMP      R1,#+1
        BNE.N    ??gpio_set_pin_1
        MOVS     R2,#+1
        LDR      R1,[R3, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R0,[R3, #+0]
        BL       GPIO_WriteBit
        B.N      ??gpio_set_pin_0
??gpio_set_pin_1:
        MOVS     R2,#+0
        LDR      R1,[R3, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R0,[R3, #+0]
        BL       GPIO_WriteBit
??gpio_set_pin_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gpio_get_pin:
        PUSH     {R7,LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        CMP      R1,#+22
        BCS.N    ??gpio_get_pin_0
        LDR.N    R0,??DataTable3
        ADDS     R2,R0,R1, LSL #+3
        LDR      R1,[R2, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R0,[R2, #+0]
        BL       GPIO_ReadInputDataBit
??gpio_get_pin_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     gpiocfg

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gpio_init:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB2PeriphClockCmd
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 176 bytes in section .data
// 196 bytes in section .text
// 
// 196 bytes of CODE memory
// 176 bytes of DATA memory
//
//Errors: none
//Warnings: none
