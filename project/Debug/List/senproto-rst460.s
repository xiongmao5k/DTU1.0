///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       30/Mar/2018  16:20:30
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senproto-rst460.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senproto-rst460.c -D
//        STM32F10X_MD -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\senproto-rst460.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN framebuff_init
        EXTERN framebuff_length
        EXTERN framebuff_push_u8
        EXTERN rtc_get_time
        EXTERN sprintf
        EXTERN strlen

        PUBLIC checksum_calc
        PUBLIC rst460_parse
        PUBLIC rst460_prepare
        PUBLIC rst460_senproto


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
address_backup:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rst460_prepare:
        PUSH     {R1-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R2,#+512
        MOVS     R1,R4
        ADD      R0,SP,#+0
        BL       framebuff_init
        MOVS     R1,#+204
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+128
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+0
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R0,R5
        SUBS     R1,R0,#+128
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        LDR.N    R0,??DataTable1
        STRB     R5,[R0, #+0]
        ADD      R0,SP,#+0
        BL       framebuff_length
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
checksum_calc:
        PUSH     {R4}
        MOVS     R2,R0
        MOVS     R3,R2
        MOVS     R0,#+0
??checksum_calc_0:
        MOVS     R4,R1
        SUBS     R1,R4,#+1
        CMP      R4,#+0
        BEQ.N    ??checksum_calc_1
        LDRB     R4,[R3, #+0]
        ADDS     R0,R4,R0
        ADDS     R3,R3,#+1
        B.N      ??checksum_calc_0
??checksum_calc_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rst460_parse:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        CMP      R7,#+17
        BCS.N    ??rst460_parse_0
        MOVS     R0,#+0
        B.N      ??rst460_parse_1
??rst460_parse_0:
        MOV      R10,R6
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+16]
        ADDS     R10,R10,#+1
        LDRB     R0,[SP, #+16]
        CMP      R0,#+204
        BEQ.N    ??rst460_parse_2
        MOVS     R0,#+1
        B.N      ??rst460_parse_1
??rst460_parse_2:
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+15]
        ADDS     R10,R10,#+1
        LDRB     R0,[SP, #+15]
        LDR.N    R1,??DataTable1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BEQ.N    ??rst460_parse_3
        MOVS     R0,#+1
        B.N      ??rst460_parse_1
??rst460_parse_3:
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+14]
        ADDS     R10,R10,#+1
        LDRB     R0,[SP, #+14]
        CMP      R0,#+112
        BEQ.N    ??rst460_parse_4
        MOVS     R0,#+1
        B.N      ??rst460_parse_1
??rst460_parse_4:
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+13]
        ADDS     R10,R10,#+1
        LDRB     R0,[SP, #+13]
        CMP      R0,#+12
        BEQ.N    ??rst460_parse_5
        MOVS     R0,#+1
        B.N      ??rst460_parse_1
??rst460_parse_5:
        LDR      R0,[R10, #+0]
        MOV      R8,R0
        ADDS     R10,R10,#+4
        ANDS     R0,R8,#0xFF00FF
        LSLS     R0,R0,#+8
        ORRS     R0,R0,R8, LSR #+8
        UBFX     R1,R8,#+8,#+8
        ORRS     R1,R1,R8, LSL #+8
        LSLS     R1,R1,#+16
        ORRS     R8,R1,R0, LSR #+16
        LDR      R0,[R10, #+0]
        MOV      R9,R0
        ADDS     R10,R10,#+4
        ANDS     R0,R9,#0xFF00FF
        LSLS     R0,R0,#+8
        ORRS     R0,R0,R9, LSR #+8
        UBFX     R1,R9,#+8,#+8
        ORRS     R1,R1,R9, LSL #+8
        LSLS     R1,R1,#+16
        ORRS     R9,R1,R0, LSR #+16
        LDR      R0,[R10, #+0]
        MOV      R11,R0
        ADDS     R10,R10,#+4
        ANDS     R0,R11,#0xFF00FF
        LSLS     R0,R0,#+8
        ORRS     R0,R0,R11, LSR #+8
        UBFX     R1,R11,#+8,#+8
        ORRS     R1,R1,R11, LSL #+8
        LSLS     R1,R1,#+16
        ORRS     R11,R1,R0, LSR #+16
        LDRB     R0,[R10, #+0]
        STRB     R0,[SP, #+12]
        ADDS     R10,R10,#+1
        MOVS     R1,#+15
        ADDS     R0,R6,#+1
        BL       checksum_calc
        LDRB     R1,[SP, #+12]
        CMP      R0,R1
        BEQ.N    ??rst460_parse_6
        MOVS     R0,#+1
        B.N      ??rst460_parse_1
??rst460_parse_6:
        BL       rtc_get_time
        STR      R11,[SP, #+8]
        STR      R9,[SP, #+4]
        STR      R8,[SP, #+0]
        MOVS     R3,R0
        MOVS     R2,R4
        LDR.N    R1,??DataTable1_1
        MOVS     R0,R5
        BL       sprintf
        MOVS     R0,R5
        BL       strlen
??rst460_parse_1:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     address_backup

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ?_0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
rst460_senproto:
        DATA
        DC32 rst460_prepare, rst460_parse

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
        DC8 "%d|%d|%d|%d|%d"
        DC8 0

        END
// 
//   1 byte  in section .bss
//   8 bytes in section .data
//  16 bytes in section .rodata
// 414 bytes in section .text
// 
// 414 bytes of CODE  memory
//  16 bytes of CONST memory
//   9 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
