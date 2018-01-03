///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:30
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\cpu\usart.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\usart.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -On --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\usart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN USART_Cmd
        EXTERN USART_GetFlagStatus
        EXTERN USART_ITConfig
        EXTERN USART_Init
        EXTERN USART_ReceiveData
        EXTERN USART_SendData
        EXTERN USART_StructInit
        EXTERN printf

        PUBLIC USART1_IRQHandler
        PUBLIC USART2_IRQHandler
        PUBLIC usart2_rx_data_buffer
        PUBLIC usart2_rx_ringbuf
        PUBLIC usart_configure
        PUBLIC usart_init
        PUBLIC usart_write
        PUBLIC usart_write8


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
usart1_input_fun:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
usart2_input_fun:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
usart2_rx_ringbuf:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
usart2_rx_data_buffer:
        DS8 512

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_init:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R0,#+1792
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ.N    ??usart_init_0
        CMP      R0,#+2
        BEQ.N    ??usart_init_1
        B.N      ??usart_init_2
??usart_init_0:
        LDR.N    R0,??DataTable5
        STR      R5,[R0, #+0]
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphClockCmd
        MOV      R0,#+512
        STRH     R0,[SP, #+0]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        MOVS     R0,#+1
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable5_1  ;; 0x40010800
        BL       GPIO_Init
        MOV      R0,#+1024
        STRH     R0,[SP, #+0]
        MOVS     R0,#+72
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable5_1  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+37
        STRB     R0,[SP, #+4]
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        MOVS     R6,R0
        B.N      ??usart_init_3
??usart_init_1:
        LDR.N    R0,??DataTable5_3
        STR      R5,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+4
        STRH     R0,[SP, #+0]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        MOVS     R0,#+1
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable5_1  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+8
        STRH     R0,[SP, #+0]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable5_1  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+38
        STRB     R0,[SP, #+4]
        LDR.N    R0,??DataTable5_4  ;; 0x40004400
        MOVS     R6,R0
        B.N      ??usart_init_3
??usart_init_2:
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        MOVS     R6,R0
??usart_init_3:
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
        MOVS     R0,#+1
        STRB     R0,[SP, #+7]
        ADD      R0,SP,#+4
        BL       NVIC_Init
        ADD      R0,SP,#+8
        BL       USART_StructInit
        ADD      R1,SP,#+8
        MOVS     R0,R6
        BL       USART_Init
        MOVS     R2,#+1
        MOVW     R1,#+1317
        MOVS     R0,R6
        BL       USART_ITConfig
        MOVS     R1,#+1
        MOVS     R0,R6
        BL       USART_Cmd
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_configure:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOV      R8,R4
        MOV      R9,R5
        MOV      R10,R6
        MOV      R11,R7
        ADD      R0,SP,#+0
        BL       USART_StructInit
        CMP      R10,#+8
        BNE.N    ??usart_configure_0
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        B.N      ??usart_configure_1
??usart_configure_0:
        MOV      R0,#+4096
        STRH     R0,[SP, #+4]
??usart_configure_1:
        CMP      R11,#+1
        BNE.N    ??usart_configure_2
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        B.N      ??usart_configure_3
??usart_configure_2:
        MOV      R0,#+8192
        STRH     R0,[SP, #+6]
??usart_configure_3:
        STR      R9,[SP, #+0]
        CMP      R8,#+1
        BNE.N    ??usart_configure_4
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        BL       USART_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        BL       USART_Cmd
        B.N      ??usart_configure_5
??usart_configure_4:
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable5_4  ;; 0x40004400
        BL       USART_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable5_4  ;; 0x40004400
        BL       USART_Cmd
??usart_configure_5:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_write8:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ.N    ??usart_write8_0
        CMP      R0,#+2
        BEQ.N    ??usart_write8_1
        B.N      ??usart_write8_2
??usart_write8_0:
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        MOVS     R6,R0
        B.N      ??usart_write8_3
??usart_write8_1:
        LDR.N    R0,??DataTable5_4  ;; 0x40004400
        MOVS     R6,R0
        B.N      ??usart_write8_3
??usart_write8_2:
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        MOVS     R6,R0
??usart_write8_3:
        MOVS     R1,#+128
        MOVS     R0,R6
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??usart_write8_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        BL       USART_SendData
??usart_write8_4:
        MOVS     R1,#+64
        MOVS     R0,R6
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??usart_write8_4
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_write:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R5
        MOV      R8,R6
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ.N    ??usart_write_0
        CMP      R0,#+2
        BEQ.N    ??usart_write_1
        B.N      ??usart_write_2
??usart_write_0:
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        MOV      R9,R0
        B.N      ??usart_write_3
??usart_write_1:
        LDR.N    R0,??DataTable5_4  ;; 0x40004400
        MOV      R9,R0
        B.N      ??usart_write_3
??usart_write_2:
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        MOV      R9,R0
??usart_write_3:
        MOV      R0,R8
        SUBS     R8,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??usart_write_4
        LDRB     R1,[R7, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R9
        BL       USART_SendData
        ADDS     R7,R7,#+1
??usart_write_5:
        MOVS     R1,#+128
        MOV      R0,R9
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BNE.N    ??usart_write_3
        B.N      ??usart_write_5
??usart_write_4:
        MOVS     R1,#+64
        MOV      R0,R9
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??usart_write_4
        MOVS     R0,R6
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_IRQHandler:
        PUSH     {R4,LR}
        MOVS     R1,#+32
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        BL       USART_GetFlagStatus
        CMP      R0,#+1
        BNE.N    ??USART1_IRQHandler_0
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        BL       USART_ReceiveData
        MOVS     R4,R0
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        BLX      R1
??USART1_IRQHandler_0:
        MOVS     R1,#+4
        LDR.N    R0,??DataTable5_2  ;; 0x40013800
        BL       USART_GetFlagStatus
        CMP      R0,#+1
        BNE.N    ??USART1_IRQHandler_1
        LDR.N    R0,??DataTable5_5
        BL       printf
??USART1_IRQHandler_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART2_IRQHandler:
        PUSH     {R4,LR}
        LDR.N    R0,??DataTable5_4  ;; 0x40004400
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??USART2_IRQHandler_0
        LDR.N    R0,??DataTable5_6  ;; 0x40004404
        LDRH     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,R0
        LDR.N    R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??USART2_IRQHandler_0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5_3
        LDR      R1,[R1, #+0]
        BLX      R1
??USART2_IRQHandler_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     usart1_input_fun

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     usart2_input_fun

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40004404

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "UART1 NE\012"
        DC8 0, 0

        END
// 
// 528 bytes in section .bss
//  12 bytes in section .rodata
// 654 bytes in section .text
// 
// 654 bytes of CODE  memory
//  12 bytes of CONST memory
// 528 bytes of DATA  memory
//
//Errors: none
//Warnings: none
