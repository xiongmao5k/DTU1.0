///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       21/Nov/2017  15:02:07
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senproto-lis326h.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senproto-lis326h.c -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\senproto-lis326h.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN framebuff_init
        EXTERN framebuff_length
        EXTERN framebuff_push_u16
        EXTERN framebuff_push_u8
        EXTERN rtc_get_time
        EXTERN sprintf
        EXTERN strlen

        PUBLIC lis326h_parse
        PUBLIC lis326h_prepare
        PUBLIC lis326h_senproto


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
address_backup:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
checksum_calc:
        MOVS     R2,#+0
        B.N      ??checksum_calc_0
??checksum_calc_1:
        LDRB     R3,[R0, #+0]
        ADDS     R2,R3,R2
        ADDS     R0,R0,#+1
??checksum_calc_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        CMP      R3,#+0
        BNE.N    ??checksum_calc_1
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
lis326h_prepare:
        PUSH     {R1-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2
        STRB     R5,[R0, #+0]
        MOV      R2,#+512
        MOVS     R1,R4
        ADD      R0,SP,#+0
        BL       framebuff_init
        MOVS     R1,#+119
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+4
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+4
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+3
        ADDS     R0,R4,#+1
        BL       checksum_calc
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADD      R0,SP,#+0
        BL       framebuff_push_u16
        ADD      R0,SP,#+0
        BL       framebuff_length
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sendat_append:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R2,#+0
        B.N      ??sendat_append_0
??sendat_append_1:
        ADDS     R0,R0,#+1
??sendat_append_0:
        LDRB     R3,[R0, #+0]
        CMP      R3,#+0
        BNE.N    ??sendat_append_1
        LDRB     R3,[R1, #+0]
        ANDS     R3,R3,#0xF
        CMP      R3,#+0
        BNE.N    ??sendat_append_2
        MOVS     R3,#+10
        LDRB     R4,[R1, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R4,R4,#+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MLA      R2,R3,R2,R4
        MOVS     R3,#+10
        LDRB     R4,[R1, #+1]
        ANDS     R4,R4,#0xF
        MLA      R2,R3,R2,R4
        MOVS     R3,#+10
        LDRB     R4,[R1, #+1]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R4,R4,#+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MLA      R2,R3,R2,R4
        LDRB     R3,[R1, #+2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STR      R3,[SP, #+0]
        LDRB     R1,[R1, #+2]
        ANDS     R3,R1,#0xF
        LDR.N    R1,??DataTable2_1
        BL       sprintf
        B.N      ??sendat_append_3
??sendat_append_2:
        LDRB     R3,[R1, #+2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STR      R3,[SP, #+0]
        LDRB     R1,[R1, #+2]
        ANDS     R3,R1,#0xF
        LDR.N    R1,??DataTable2_2
        BL       sprintf
??sendat_append_3:
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
lis326h_parse:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        CMP      R3,#+14
        BCS.N    ??lis326h_parse_0
        MOVS     R0,#+0
        B.N      ??lis326h_parse_1
??lis326h_parse_0:
        LDRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R1,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R3,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R6,[R2, #+0]
        ADDS     R2,R2,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+119
        BNE.N    ??lis326h_parse_2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+13
        BNE.N    ??lis326h_parse_2
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,R0
        BNE.N    ??lis326h_parse_2
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+132
        BEQ.N    ??lis326h_parse_3
??lis326h_parse_2:
        MOVS     R0,#+1
        B.N      ??lis326h_parse_1
??lis326h_parse_3:
        MOVS     R7,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R1,R2
        LDRB     R6,[R2, #+0]
        ADDS     R2,R2,#+1
        MOVS     R1,#+12
        ADDS     R0,R7,#+1
        BL       checksum_calc
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R0,R6
        BNE.N    ??lis326h_parse_4
        MOVS     R0,#+1
        B.N      ??lis326h_parse_1
??lis326h_parse_4:
        BL       rtc_get_time
        MOVS     R3,R0
        MOVS     R2,R4
        LDR.N    R1,??DataTable2_3
        MOVS     R0,R5
        BL       sprintf
        MOVS     R1,R7
        MOVS     R0,R5
        BL       sendat_append
        ADDS     R1,R7,#+3
        MOVS     R0,R5
        BL       sendat_append
        ADDS     R1,R7,#+6
        MOVS     R0,R5
        BL       sendat_append
        MOVS     R0,R5
        BL       strlen
??lis326h_parse_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     address_backup

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ?_2

        SECTION `.data`:DATA:REORDER:NOROOT(2)
lis326h_senproto:
        DATA
        DC32 lis326h_prepare, lis326h_parse

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
        DC8 "|%d.%d%d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "|-%d.%d%d"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "%d|%d"
        DC8 0, 0

        END
// 
//   1 byte  in section .bss
//   8 bytes in section .data
//  32 bytes in section .rodata
// 376 bytes in section .text
// 
// 376 bytes of CODE  memory
//  32 bytes of CONST memory
//   9 bytes of DATA  memory
//
//Errors: none
//Warnings: 5
