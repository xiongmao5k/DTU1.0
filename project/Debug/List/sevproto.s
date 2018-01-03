///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:24
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\sevproto.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\sevproto.c -D STM32F10X_MD -D
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
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\sevproto.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN crc32_calc
        EXTERN framebuff_clean
        EXTERN framebuff_datptr
        EXTERN framebuff_length
        EXTERN framebuff_push
        EXTERN framebuff_push_u16
        EXTERN framebuff_push_u32
        EXTERN framebuff_push_u8

        PUBLIC sevproto_check
        PUBLIC sevproto_error
        PUBLIC sevproto_init
        PUBLIC sevproto_prepare


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
__seq:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
__error:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sevproto_init:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sevproto_check:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        STR      R4,[SP, #+4]
        MOV      R10,R4
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+1]
        ADDS     R10,R10,#+1
        LDRB     R0,[SP, #+1]
        CMP      R0,#+126
        BEQ.N    ??sevproto_check_0
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        B.N      ??sevproto_check_1
??sevproto_check_0:
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+0]
        ADDS     R10,R10,#+1
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable3_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ.N    ??sevproto_check_2
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        B.N      ??sevproto_check_1
??sevproto_check_2:
        LDRH     R0,[R10, #+0]
        MOVS     R7,R0
        ADDS     R10,R10,#+2
        MOV      R9,R10
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R10,R7,R10
        LDR      R0,[R10, #+0]
        MOV      R8,R0
        ADDS     R10,R10,#+4
        LDRB     R0,[R10, #+0]
        MOVS     R6,R0
        ADDS     R10,R10,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+10
        BEQ.N    ??sevproto_check_3
        MOVS     R0,#+4
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        B.N      ??sevproto_check_1
??sevproto_check_3:
        LSRS     R0,R8,#+8
        ANDS     R0,R0,#0xFF00
        ORRS     R0,R0,R8, LSR #+24
        LSLS     R1,R8,#+8
        ANDS     R1,R1,#0xFF0000
        ORRS     R0,R1,R0
        ORRS     R11,R0,R8, LSL #+24
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R1,R7,#+3
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        BL       crc32_calc
        CMP      R11,R0
        BEQ.N    ??sevproto_check_4
        MOVS     R0,#+3
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        B.N      ??sevproto_check_1
??sevproto_check_4:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOV      R0,R9
??sevproto_check_1:
        POP      {R1-R11,PC}      ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
framebuffer_sevproto_prepare_buff_data_buffer:
        DS8 512

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// static __absolute framebuff_t sevproto_prepare_buff
sevproto_prepare_buff:
        DATA
        DC32 framebuffer_sevproto_prepare_buff_data_buffer
        DC32 framebuffer_sevproto_prepare_buff_data_buffer
        DC32 framebuffer_sevproto_prepare_buff_data_buffer + 200H

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sevproto_prepare:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R8,#+0
        LDR.N    R0,??DataTable3_2
        BL       framebuff_clean
        LDR.N    R0,??DataTable3_2
        BL       framebuff_datptr
        MOV      R8,R0
        MOVS     R1,#+126
        LDR.N    R0,??DataTable3_2
        BL       framebuff_push_u8
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_1
        LDR      R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_2
        BL       framebuff_push_u8
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable3_2
        BL       framebuff_push_u16
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_2
        BL       framebuff_push
        ADDS     R1,R5,#+3
        ADDS     R0,R8,#+1
        BL       crc32_calc
        MOVS     R7,R0
        MOVS     R1,R7
        LDR.N    R0,??DataTable3_2
        BL       framebuff_push_u32
        MOVS     R1,#+10
        LDR.N    R0,??DataTable3_2
        BL       framebuff_push_u8
        LDR.N    R0,??DataTable3_2
        BL       framebuff_length
        STR      R0,[R6, #+0]
        MOV      R0,R8
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sevproto_error:
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     __error

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     __seq

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     sevproto_prepare_buff

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
// 520 bytes in section .bss
//  12 bytes in section .data
// 350 bytes in section .text
// 
// 350 bytes of CODE memory
// 532 bytes of DATA memory
//
//Errors: none
//Warnings: none
