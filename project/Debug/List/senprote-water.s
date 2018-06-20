///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       20/Apr/2018  14:09:44
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senprote-water.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\senproto\senprote-water.c -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\senprote-water.s
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

        PUBLIC water_parse
        PUBLIC water_prepare
        PUBLIC water_senproto


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "%d|%d|%d"
        DC8 0, 0, 0

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

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint16_t crc16(uint8_t *, uint16_t)
crc16:
        PUSH     {R4,R5}
        MOVS     R2,R0
        MOVS     R0,#+255
        MOVS     R3,#+255
??crc16_0:
        MOVS     R5,R1
        SUBS     R1,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??crc16_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R5,[R2, #+0]
        EORS     R5,R5,R0
        MOVS     R4,R5
        ADDS     R2,R2,#+1
        LDR.N    R5,??DataTable2
        LDRB     R5,[R4, R5]
        EORS     R5,R5,R3
        MOVS     R0,R5
        LDR.N    R5,??DataTable2_1
        LDRB     R5,[R4, R5]
        MOVS     R3,R5
        B.N      ??crc16_0
??crc16_1:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R0,R0,R3, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
address_backup:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
water_prepare:
        PUSH     {R1-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R2,#+512
        MOVS     R1,R4
        ADD      R0,SP,#+0
        BL       framebuff_init
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+3
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+0
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+2
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+0
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+2
        ADD      R0,SP,#+0
        BL       framebuff_push_u8
        MOVS     R1,#+6
        LDR      R0,[SP, #+0]
        BL       crc16
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADD      R0,SP,#+0
        BL       framebuff_push_u16
        LDR.N    R0,??DataTable2_2
        STRB     R5,[R0, #+0]
        ADD      R0,SP,#+0
        BL       framebuff_length
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
water_parse:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+28
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        CMP      R7,#+9
        BCS.N    ??water_parse_0
        MOVS     R0,#+0
        B.N      ??water_parse_1
??water_parse_0:
        MOV      R11,R6
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+7]
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+6]
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+5]
        ADDS     R11,R11,#+1
        LDRB     R0,[SP, #+5]
        CMP      R0,#+4
        BNE.N    ??water_parse_2
        LDRB     R0,[SP, #+7]
        LDR.N    R1,??DataTable2_2
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??water_parse_2
        LDRB     R0,[SP, #+6]
        CMP      R0,#+3
        BEQ.N    ??water_parse_3
??water_parse_2:
        MOVS     R0,#+1
        B.N      ??water_parse_1
??water_parse_3:
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+4]
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        MOV      R8,R0
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        MOV      R9,R0
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        MOV      R10,R0
        ADDS     R11,R11,#+1
        LDRB     R0,[SP, #+4]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LSLS     R1,R8,#+16
        ORRS     R0,R1,R0, LSL #+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ORRS     R0,R0,R9, LSL #+8
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ORRS     R0,R10,R0
        STR      R0,[SP, #+20]
        LDRB     R0,[SP, #+7]
        STRB     R0,[SP, #+12]
        LDRB     R0,[SP, #+6]
        STRB     R0,[SP, #+13]
        LDRB     R0,[SP, #+5]
        STRB     R0,[SP, #+14]
        LDRB     R0,[SP, #+4]
        STRB     R0,[SP, #+15]
        STRB     R8,[SP, #+16]
        STRB     R9,[SP, #+17]
        STRB     R10,[SP, #+18]
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+9]
        ADDS     R11,R11,#+1
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+8]
        ADDS     R11,R11,#+1
        LDRB     R0,[SP, #+8]
        LDRB     R1,[SP, #+9]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[SP, #+10]
        LDRH     R0,[SP, #+10]
        STR      R0,[SP, #+0]
        MOVS     R1,#+7
        ADD      R0,SP,#+12
        BL       crc16
        LDR      R1,[SP, #+0]
        CMP      R1,R0
        BEQ.N    ??water_parse_4
        MOVS     R0,#+1
        B.N      ??water_parse_1
??water_parse_4:
        BL       rtc_get_time
        LDR      R1,[SP, #+20]
        STR      R1,[SP, #+0]
        MOVS     R3,R0
        MOVS     R2,R4
        LDR.N    R1,??DataTable2_3
        MOVS     R0,R5
        BL       sprintf
        MOVS     R0,R5
        BL       strlen
??water_parse_1:
        ADD      SP,SP,#+28
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
water_senproto:
        DATA
        DC32 water_prepare, water_parse

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
// 524 bytes in section .rodata
// 480 bytes in section .text
// 
// 480 bytes of CODE  memory
// 524 bytes of CONST memory
//   9 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
