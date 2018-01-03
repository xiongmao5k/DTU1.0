///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senif.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senif.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\senif.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN gpio_set_as_output
        EXTERN gpio_set_pin
        EXTERN usart_stream_init
        EXTERN usart_stream_read
        EXTERN usart_stream_write

        PUBLIC senif_close
        PUBLIC senif_init
        PUBLIC senif_open
        PUBLIC senif_power_close
        PUBLIC senif_power_open
        PUBLIC senif_read
        PUBLIC senif_write
        PUBLIC senif_write_byte


        SECTION `.data`:DATA:REORDER:NOROOT(2)
power_ctrl1:
        DATA
        DC32 0, 20, 11

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// static __absolute struct power_ctrl_struct power_ctrl2
power_ctrl2:
        DATA
        DC32 0, 17, 18

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// static __absolute struct power_ctrl_struct power_ctrl3
power_ctrl3:
        DATA
        DC32 0, 14, 15

        SECTION `.data`:DATA:REORDER:NOROOT(2)
sensor_interfaces:
        DATA
        DC32 0, 19, 13, power_ctrl1, 0, 19, 13, power_ctrl1, 0, 16, 13
        DC32 power_ctrl2, 0, 16, 13, power_ctrl2, 0, 2, 13, power_ctrl3, 0, 2
        DC32 13, power_ctrl3

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
power_ctrl_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+4]
        BL       gpio_set_as_output
        LDR      R0,[R4, #+8]
        BL       gpio_set_as_output
        MOVS     R1,#+0
        LDR      R0,[R4, #+8]
        BL       gpio_set_pin
        MOVS     R1,#+0
        LDR      R0,[R4, #+4]
        BL       gpio_set_pin
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_init:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        CMP      R4,#+6
        BCS.N    ??senif_init_0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R5,R0
        LDR      R0,[R5, #+0]
        BL       usart_stream_init
        LDR      R0,[R5, #+4]
        BL       gpio_set_as_output
        LDR      R0,[R5, #+8]
        BL       gpio_set_as_output
        LDR      R0,[R5, #+12]
        BL       power_ctrl_init
        MOVS     R1,#+0
        LDR      R0,[R5, #+4]
        BL       gpio_set_pin
        MOVS     R1,#+0
        LDR      R0,[R5, #+8]
        BL       gpio_set_pin
??senif_init_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_power_open:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        CMP      R4,#+6
        BCS.N    ??senif_power_open_0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R5,R0
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??senif_power_open_1
        MOVS     R1,#+1
        LDR      R0,[R5, #+4]
        BL       gpio_set_pin
??senif_power_open_1:
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,[R5, #+12]
        STR      R0,[R1, #+0]
??senif_power_open_0:
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_power_close:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        CMP      R4,#+6
        BCS.N    ??senif_power_close_0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R5,R0
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,[R5, #+12]
        STR      R0,[R1, #+0]
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??senif_power_close_0
        MOVS     R1,#+0
        LDR      R0,[R5, #+4]
        BL       gpio_set_pin
??senif_power_close_0:
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_open:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        ANDS     R6,R4,#0x1
        CMP      R4,#+6
        BCS.N    ??senif_open_0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R5,R0
        CMP      R6,#+0
        BNE.N    ??senif_open_1
        MOVS     R1,#+0
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+8]
        BL       gpio_set_pin
        MOVS     R1,#+1
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+4]
        BL       gpio_set_pin
        B.N      ??senif_open_0
??senif_open_1:
        MOVS     R1,#+0
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+4]
        BL       gpio_set_pin
        MOVS     R1,#+1
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+8]
        BL       gpio_set_pin
??senif_open_0:
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_close:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        CMP      R4,#+6
        BCS.N    ??senif_close_0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R5,R0
        MOVS     R1,#+0
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+8]
        BL       gpio_set_pin
        MOVS     R1,#+0
        LDR      R0,[R5, #+12]
        LDR      R0,[R0, #+4]
        BL       gpio_set_pin
??senif_close_0:
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_write_byte:
        PUSH     {R0,R1,R4-R6,LR}
        MOVS     R4,R0
        CMP      R4,#+6
        BCS.N    ??senif_write_byte_0
        MOVS     R6,#+0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R5,R0
        MOVS     R1,#+1
        LDR      R0,[R5, #+8]
        BL       gpio_set_pin
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        LDR      R0,[R5, #+0]
        BL       usart_stream_write
        MOVS     R6,R0
        MOVS     R1,#+0
        LDR      R0,[R5, #+8]
        BL       gpio_set_pin
        MOVS     R0,R6
        B.N      ??senif_write_byte_1
??senif_write_byte_0:
        MOVS     R0,#+0
??senif_write_byte_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_write:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        CMP      R4,#+6
        BCS.N    ??senif_write_0
        MOVS     R8,#+0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R7,R0
        MOVS     R1,#+1
        LDR      R0,[R7, #+8]
        BL       gpio_set_pin
        MOVS     R2,R6
        MOVS     R1,R5
        LDR      R0,[R7, #+0]
        BL       usart_stream_write
        MOV      R8,R0
        MOVS     R1,#+0
        LDR      R0,[R7, #+8]
        BL       gpio_set_pin
        MOV      R0,R8
        B.N      ??senif_write_1
??senif_write_0:
        MOVS     R0,#+0
??senif_write_1:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senif_read:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        CMP      R4,#+6
        BCS.N    ??senif_read_0
        LDR.N    R0,??DataTable7
        ADDS     R0,R0,R4, LSL #+4
        MOVS     R7,R0
        MOVS     R2,R6
        MOVS     R1,R5
        LDR      R0,[R7, #+0]
        BL       usart_stream_read
        B.N      ??senif_read_1
??senif_read_0:
        MOVS     R0,#+0
??senif_read_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     sensor_interfaces

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
// 132 bytes in section .data
// 456 bytes in section .text
// 
// 456 bytes of CODE memory
// 132 bytes of DATA memory
//
//Errors: none
//Warnings: none
