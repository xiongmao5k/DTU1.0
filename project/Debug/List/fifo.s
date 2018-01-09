///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:40
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\tools\fifo.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\tools\fifo.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\fifo.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy

        PUBLIC fifo_clean
        PUBLIC fifo_get_avlid
        PUBLIC fifo_get_length
        PUBLIC fifo_init
        PUBLIC fifo_peek
        PUBLIC fifo_pop
        PUBLIC fifo_pop_byte
        PUBLIC fifo_push
        PUBLIC fifo_push_byte


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_init:
        MOVS     R3,R0
        STR      R1,[R3, #+0]
        STR      R2,[R3, #+12]
        MOVS     R0,#+0
        STR      R0,[R3, #+8]
        LDR      R0,[R3, #+8]
        STR      R0,[R3, #+4]
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_get_length:
        LDR      R1,[R0, #+4]
        LDR      R2,[R0, #+12]
        ADDS     R1,R2,R1
        LDR      R2,[R0, #+8]
        SUBS     R1,R1,R2
        LDR      R0,[R0, #+12]
        UDIV     R2,R1,R0
        MLS      R0,R0,R2,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_get_avlid:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       fifo_get_length
        LDR      R1,[R4, #+12]
        SUBS     R0,R1,R0
        SUBS     R0,R0,#+1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_push_byte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       fifo_get_avlid
        CMP      R0,#+0
        BNE.N    ??fifo_push_byte_0
        MOVS     R0,#+0
        B.N      ??fifo_push_byte_1
??fifo_push_byte_0:
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+4]
        STRB     R5,[R1, R0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+12]
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STR      R0,[R4, #+4]
        MOVS     R0,#+1
??fifo_push_byte_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_pop_byte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       fifo_get_length
        CMP      R0,#+0
        BNE.N    ??fifo_pop_byte_0
        MOVS     R0,#+0
        B.N      ??fifo_pop_byte_1
??fifo_pop_byte_0:
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+8]
        LDRB     R0,[R1, R0]
        STRB     R0,[R5, #+0]
        LDR      R0,[R4, #+8]
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+12]
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STR      R0,[R4, #+8]
        MOVS     R0,#+1
??fifo_pop_byte_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_push:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
        MOVS     R0,R4
        BL       fifo_get_length
        MOVS     R6,R0
        CMP      R7,R6
        BCC.N    ??fifo_push_0
??fifo_push_1:
        MOVS     R7,R6
??fifo_push_0:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+4]
        SUBS     R0,R0,R1
        MOVS     R6,R0
        CMP      R6,R7
        BCS.N    ??fifo_push_2
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+4]
        ADDS     R8,R1,R0
        MOVS     R2,R6
        MOVS     R1,R5
        MOV      R0,R8
        BL       __aeabi_memcpy
        SUBS     R8,R7,R6
        ADDS     R9,R6,R5
        LDR      R10,[R4, #+0]
        MOV      R2,R8
        MOV      R1,R9
        MOV      R0,R10
        BL       __aeabi_memcpy
        B.N      ??fifo_push_3
??fifo_push_2:
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+4]
        ADDS     R8,R1,R0
        MOVS     R2,R7
        MOVS     R1,R5
        MOV      R0,R8
        BL       __aeabi_memcpy
??fifo_push_3:
        LDR      R0,[R4, #+4]
        ADDS     R0,R7,R0
        LDR      R1,[R4, #+12]
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STR      R0,[R4, #+4]
        MOVS     R0,R7
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_pop:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,R2
        MOVS     R0,R4
        BL       fifo_get_length
        MOVS     R5,R0
        CMP      R6,R5
        BCC.N    ??fifo_pop_0
??fifo_pop_1:
        MOVS     R6,R5
??fifo_pop_0:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        SUBS     R0,R0,R1
        MOVS     R5,R0
        CMP      R5,R6
        BCS.N    ??fifo_pop_2
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+8]
        ADDS     R8,R1,R0
        MOVS     R2,R5
        MOV      R1,R8
        MOVS     R0,R7
        BL       __aeabi_memcpy
        SUBS     R9,R6,R5
        LDR      R10,[R4, #+0]
        ADDS     R11,R5,R7
        MOV      R2,R9
        MOV      R1,R10
        MOV      R0,R11
        BL       __aeabi_memcpy
        B.N      ??fifo_pop_3
??fifo_pop_2:
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+8]
        ADDS     R8,R1,R0
        MOVS     R2,R6
        MOV      R1,R8
        MOVS     R0,R7
        BL       __aeabi_memcpy
??fifo_pop_3:
        LDR      R0,[R4, #+8]
        ADDS     R0,R6,R0
        LDR      R1,[R4, #+12]
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STR      R0,[R4, #+8]
        MOVS     R0,R6
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_peek:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,R2
        MOVS     R0,R4
        BL       fifo_get_length
        MOVS     R5,R0
        CMP      R6,R5
        BCC.N    ??fifo_peek_0
??fifo_peek_1:
        MOVS     R6,R5
??fifo_peek_0:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        SUBS     R0,R0,R1
        MOVS     R5,R0
        CMP      R5,R6
        BCS.N    ??fifo_peek_2
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+8]
        ADDS     R8,R1,R0
        MOVS     R2,R5
        MOV      R1,R8
        MOVS     R0,R7
        BL       __aeabi_memcpy
        SUBS     R9,R6,R5
        LDR      R10,[R4, #+0]
        ADDS     R11,R5,R7
        MOV      R2,R9
        MOV      R1,R10
        MOV      R0,R11
        BL       __aeabi_memcpy
        B.N      ??fifo_peek_3
??fifo_peek_2:
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+8]
        ADDS     R8,R1,R0
        MOVS     R2,R6
        MOV      R1,R8
        MOVS     R0,R7
        BL       __aeabi_memcpy
??fifo_peek_3:
        MOVS     R0,R6
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fifo_clean:
        MOVS     R1,R0
        MOVS     R0,#+0
        STR      R0,[R1, #+8]
        LDR      R0,[R1, #+8]
        STR      R0,[R1, #+4]
        MOVS     R0,#+0
        BX       LR               ;; return

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
// 504 bytes in section .text
// 
// 504 bytes of CODE memory
//
//Errors: none
//Warnings: none
