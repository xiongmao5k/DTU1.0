///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senproto-zbm001.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senproto-zbm001.c -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\senproto-zbm001.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_f2d
        EXTERN framebuff_init
        EXTERN framebuff_length
        EXTERN framebuff_push_u16
        EXTERN framebuff_push_u8
        EXTERN rtc_get_time
        EXTERN sprintf
        EXTERN strlen

        PUBLIC zbm001_parse
        PUBLIC zbm001_prepare
        PUBLIC zbm001_senproto


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "%d|%d|%.3f|%.3f"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// static __absolute unsigned char const table_crc_hi[256]
table_crc_hi:
        DATA
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// static __absolute unsigned char const table_crc_lo[256]
table_crc_lo:
        DATA
        DC8 0, 192, 193, 1, 195, 3, 2, 194, 198, 6, 7, 199, 5, 197, 196, 4, 204
        DC8 12, 13, 205, 15, 207, 206, 14, 10, 202, 203, 11, 201, 9, 8, 200
        DC8 216, 24, 25, 217, 27, 219, 218, 26, 30, 222, 223, 31, 221, 29, 28
        DC8 220, 20, 212, 213, 21, 215, 23, 22, 214, 210, 18, 19, 211, 17, 209
        DC8 208, 16, 240, 48, 49, 241, 51, 243, 242, 50, 54, 246, 247, 55, 245
        DC8 53, 52, 244, 60, 252, 253, 61, 255, 63, 62, 254, 250, 58, 59, 251
        DC8 57, 249, 248, 56, 40, 232, 233, 41, 235, 43, 42, 234, 238, 46, 47
        DC8 239, 45, 237, 236, 44, 228, 36, 37, 229, 39, 231, 230, 38, 34, 226
        DC8 227, 35, 225, 33, 32, 224, 160, 96, 97, 161, 99, 163, 162, 98, 102
        DC8 166, 167, 103, 165, 101, 100, 164, 108, 172, 173, 109, 175, 111
        DC8 110, 174, 170, 106, 107, 171, 105, 169, 168, 104, 120, 184, 185
        DC8 121, 187, 123, 122, 186, 190, 126, 127, 191, 125, 189, 188, 124
        DC8 180, 116, 117, 181, 119, 183, 182, 118, 114, 178, 179, 115, 177
        DC8 113, 112, 176, 80, 144, 145, 81, 147, 83, 82, 146, 150, 86, 87, 151
        DC8 85, 149, 148, 84, 156, 92, 93, 157, 95, 159, 158, 94, 90, 154, 155
        DC8 91, 153, 89, 88, 152, 136, 72, 73, 137, 75, 139, 138, 74, 78, 142
        DC8 143, 79, 141, 77, 76, 140, 68, 132, 133, 69, 135, 71, 70, 134, 130
        DC8 66, 67, 131, 65, 129, 128, 64

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
address_backup:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
zcrc16:
        PUSH     {R4}
        MOVS     R2,#+255
        MOVS     R3,#+255
        B.N      ??zcrc16_0
??zcrc16_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R4,[R0, #+0]
        EORS     R4,R4,R2
        ADDS     R0,R0,#+1
        LDR.N    R2,??DataTable2
        LDRB     R2,[R4, R2]
        EORS     R2,R2,R3
        LDR.N    R3,??DataTable2_1
        LDRB     R3,[R4, R3]
??zcrc16_0:
        MOVS     R4,R1
        SUBS     R1,R4,#+1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BNE.N    ??zcrc16_1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ORRS     R0,R3,R2, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
zbm001_prepare:
        PUSH     {R4,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R1
        MOV      R2,#+512
        MOVS     R1,R0
        ADD      R0,SP,#+0
        BL       framebuff_init
        MOVS     R1,#+165
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+165
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+153
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+0
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+1
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+1
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+0
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+8
        LDR      R0,[SP, #+0]
        BL       zcrc16
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADD      R0,SP,#+0
        BL       framebuff_push_u16
        LDR.N    R0,??DataTable2_2
        STRB     R4,[R0, #+0]
        ADD      R0,SP,#+0
        BL       framebuff_length
        ADD      SP,SP,#+16
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
zbm001_parse:
        PUSH     {R0,R1,R4-R11,LR}
        SUB      SP,SP,#+44
        CMP      R3,#+19
        BCS.N    ??zbm001_parse_0
        MOVS     R0,#+0
        B.N      ??zbm001_parse_1
??zbm001_parse_0:
        LDRB     R11,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R1,[R2, #+0]
        STRB     R1,[SP, #+4]
        ADDS     R2,R2,#+1
        LDRB     R1,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R3,[R2, #+0]
        STRB     R3,[SP, #+3]
        ADDS     R2,R2,#+1
        LDRB     R3,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R4,[R2, #+0]
        STRB     R4,[SP, #+2]
        ADDS     R2,R2,#+1
        LDRB     R4,[R2, #+0]
        STRB     R4,[SP, #+1]
        ADDS     R2,R2,#+1
        LDRB     R4,[R2, #+0]
        STRB     R4,[SP, #+0]
        ADDS     R2,R2,#+1
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+165
        BNE.N    ??zbm001_parse_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+165
        BNE.N    ??zbm001_parse_2
        LDR.N    R4,??DataTable2_2
        LDRB     R4,[R4, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,R4
        BNE.N    ??zbm001_parse_2
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BEQ.N    ??zbm001_parse_3
??zbm001_parse_2:
        MOVS     R0,#+1
        B.N      ??zbm001_parse_1
??zbm001_parse_3:
        LDRB     R5,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R6,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R7,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R12,[R2, #+0]
        ADDS     R2,R2,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R4,R6,#+16
        ORRS     R4,R4,R5, LSL #+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ORRS     R4,R4,R7, LSL #+8
        UXTB     R12,R12          ;; ZeroExt  R12,R12,#+24,#+24
        ORRS     LR,R12,R4
        STR      LR,[SP, #+36]
        LDRB     LR,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R8,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R9,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R10,[R2, #+0]
        ADDS     R2,R2,#+1
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LSLS     R4,R8,#+16
        ORRS     R4,R4,LR, LSL #+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ORRS     R4,R4,R9, LSL #+8
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ORRS     R4,R10,R4
        STRB     R11,[SP, #+16]
        STRB     R0,[SP, #+17]
        LDRB     R11,[SP, #+4]
        STRB     R11,[SP, #+18]
        STRB     R1,[SP, #+19]
        LDRB     R1,[SP, #+3]
        STRB     R1,[SP, #+20]
        STRB     R3,[SP, #+21]
        LDRB     R1,[SP, #+2]
        STRB     R1,[SP, #+22]
        LDRB     R1,[SP, #+1]
        STRB     R1,[SP, #+23]
        LDRB     R1,[SP, #+0]
        STRB     R1,[SP, #+24]
        STRB     R5,[SP, #+25]
        STRB     R6,[SP, #+26]
        STRB     R7,[SP, #+27]
        STRB     R12,[SP, #+28]
        STRB     LR,[SP, #+29]
        STRB     R8,[SP, #+30]
        STRB     R9,[SP, #+31]
        STRB     R10,[SP, #+32]
        LDRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRB     R1,[R2, #+0]
        ADDS     R2,R2,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R5,R0,R1, LSL #+8
        MOVS     R1,#+17
        ADD      R0,SP,#+16
        BL       zcrc16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BEQ.N    ??zbm001_parse_4
        MOVS     R0,#+1
        B.N      ??zbm001_parse_1
??zbm001_parse_4:
        BL       rtc_get_time
        MOVS     R5,R0
        MOVS     R0,R4
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+8]
        LDR      R0,[SP, #+36]
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        MOVS     R3,R5
        LDR      R2,[SP, #+44]
        LDR.N    R1,??DataTable2_3
        LDR      R0,[SP, #+48]
        BL       sprintf
        LDR      R0,[SP, #+48]
        BL       strlen
??zbm001_parse_1:
        ADD      SP,SP,#+52
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     table_crc_hi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     table_crc_lo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     address_backup

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ?_0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
zbm001_senproto:
        DATA
        DC32 zbm001_prepare, zbm001_parse

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
//   1 byte  in section .bss
//   8 bytes in section .data
// 528 bytes in section .rodata
// 564 bytes in section .text
// 
// 564 bytes of CODE  memory
// 528 bytes of CONST memory
//   9 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
