///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\cpu\crc.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\crc.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\crc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN CRC_ResetDR
        EXTERN RCC_AHBPeriphClockCmd

        PUBLIC crc32_calc
        PUBLIC crc_calc
        PUBLIC crc_init


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
crc_init:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+64
        BL       RCC_AHBPeriphClockCmd
        BL       CRC_ResetDR
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
swapBinaryArray:
        B.N      ??swapBinaryArray_0
??swapBinaryArray_1:
        LDRB     R2,[R0, #+0]
        ANDS     R2,R2,#0x55
        LDRB     R3,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+1
        ANDS     R3,R3,#0x55
        ORRS     R2,R3,R2, LSL #+1
        STRB     R2,[R0, #+0]
        LDRB     R2,[R0, #+0]
        ANDS     R2,R2,#0x33
        LDRB     R3,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+2
        ANDS     R3,R3,#0x33
        ORRS     R2,R3,R2, LSL #+2
        STRB     R2,[R0, #+0]
        LDRB     R2,[R0, #+0]
        LDRB     R3,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+4
        ORRS     R2,R3,R2, LSL #+4
        STRB     R2,[R0, #+0]
        ADDS     R0,R0,#+1
??swapBinaryArray_0:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        CMP      R2,#+0
        BNE.N    ??swapBinaryArray_1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
crc_calc:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
        LSRS     R4,R7,#+2
        MOVS     R0,#+4
        UDIV     R5,R7,R0
        MLS      R5,R5,R0,R7
        MOVS     R0,#+0
        BL       CRC_ResetDR
        MOVS     R1,R7
        MOVS     R0,R6
        BL       swapBinaryArray
        B.N      ??crc_calc_0
??crc_calc_1:
        LDR      R0,[R6, #+0]
        LDR      R1,[R6, #+0]
        LSRS     R1,R1,#+8
        ANDS     R1,R1,#0xFF00
        ORRS     R0,R1,R0, LSR #+24
        LDR      R1,[R6, #+0]
        LSLS     R1,R1,#+8
        ANDS     R1,R1,#0xFF0000
        ORRS     R0,R1,R0
        LDR      R1,[R6, #+0]
        ORRS     R0,R0,R1, LSL #+24
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        ADDS     R6,R6,#+4
??crc_calc_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE.N    ??crc_calc_1
        CMP      R5,#+0
        BEQ.N    ??crc_calc_2
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        LSLS     R2,R5,#+3
        LSLS     R1,R1,R2
        SUBS     R1,R1,#+1
        ANDS     R0,R1,R0
        LDR      R1,[R6, #+0]
        MOVS     R2,#+1
        LSLS     R3,R5,#+3
        LSLS     R2,R2,R3
        SUBS     R2,R2,#+1
        ANDS     R1,R2,R1
        LSRS     R1,R1,#+8
        ANDS     R1,R1,#0xFF00
        ORRS     R0,R1,R0, LSR #+24
        LDR      R1,[R6, #+0]
        MOVS     R2,#+1
        LSLS     R3,R5,#+3
        LSLS     R2,R2,R3
        SUBS     R2,R2,#+1
        ANDS     R1,R2,R1
        LSLS     R1,R1,#+8
        ANDS     R1,R1,#0xFF0000
        ORRS     R0,R1,R0
        LDR      R1,[R6, #+0]
        MOVS     R2,#+1
        LSLS     R3,R5,#+3
        LSLS     R2,R2,R3
        SUBS     R2,R2,#+1
        ANDS     R1,R2,R1
        ORRS     R0,R0,R1, LSL #+24
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
??crc_calc_2:
        LDR.N    R0,??DataTable1  ;; 0x40023000
        LDR      R0,[R0, #+0]
        ANDS     R1,R0,#0x55555555
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x55555555
        ORRS     R0,R0,R1, LSL #+1
        ANDS     R1,R0,#0x33333333
        LSRS     R0,R0,#+2
        ANDS     R0,R0,#0x33333333
        ORRS     R0,R0,R1, LSL #+2
        ANDS     R1,R0,#0xF0F0F0F
        LSRS     R0,R0,#+4
        ANDS     R0,R0,#0xF0F0F0F
        ORRS     R0,R0,R1, LSL #+4
        ANDS     R1,R0,#0xFF00FF
        LSRS     R0,R0,#+8
        ANDS     R0,R0,#0xFF00FF
        ORRS     R0,R0,R1, LSL #+8
        RORS     R0,R0,#+16
        MOVS     R1,#-1
        EORS     R0,R1,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
refin:
        ANDS     R1,R0,#0x55555555
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x55555555
        ORRS     R0,R0,R1, LSL #+1
        ANDS     R1,R0,#0x33333333
        LSRS     R0,R0,#+2
        ANDS     R0,R0,#0x33333333
        ORRS     R0,R0,R1, LSL #+2
        ANDS     R1,R0,#0xF0F0F0F
        LSRS     R0,R0,#+4
        ANDS     R0,R0,#0xF0F0F0F
        ORRS     R0,R0,R1, LSL #+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
refout:
        ANDS     R1,R0,#0x55555555
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x55555555
        ORRS     R0,R0,R1, LSL #+1
        ANDS     R1,R0,#0x33333333
        LSRS     R0,R0,#+2
        ANDS     R0,R0,#0x33333333
        ORRS     R0,R0,R1, LSL #+2
        ANDS     R1,R0,#0xF0F0F0F
        LSRS     R0,R0,#+4
        ANDS     R0,R0,#0xF0F0F0F
        ORRS     R0,R0,R1, LSL #+4
        ANDS     R1,R0,#0xFF00FF
        LSRS     R0,R0,#+8
        ANDS     R0,R0,#0xFF00FF
        ORRS     R0,R0,R1, LSL #+8
        RORS     R0,R0,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
crc32_calc:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R0,#+4
        UDIV     R7,R1,R0
        MLS      R7,R7,R0,R1
        LSRS     R4,R1,#+2
        MOVS     R6,#+0
        MOVS     R0,#+0
        BL       CRC_ResetDR
        CMP      R7,#+0
        BEQ.N    ??crc32_calc_0
        CMP      R7,#+2
        BEQ.N    ??crc32_calc_1
        BCC.N    ??crc32_calc_2
        CMP      R7,#+3
        BEQ.N    ??crc32_calc_3
        B.N      ??crc32_calc_4
??crc32_calc_0:
        MOVS     R6,R5
        B.N      ??crc32_calc_5
??crc32_calc_2:
        LDR.N    R0,??DataTable1_1  ;; 0x6aa59e9d
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        LDRB     R0,[R5, #+0]
        BL       refin
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        ADDS     R6,R5,#+1
        B.N      ??crc32_calc_5
??crc32_calc_1:
        LDR.N    R0,??DataTable1_2  ;; 0x9746cd0a
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        LDRB     R0,[R5, #+0]
        LDRB     R1,[R5, #+1]
        ORRS     R0,R1,R0, LSL #+8
        BL       refin
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        ADDS     R6,R5,#+2
        B.N      ??crc32_calc_5
??crc32_calc_3:
        LDR.N    R0,??DataTable1_3  ;; 0xcc6021d0
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        LDRB     R0,[R5, #+0]
        LDRB     R1,[R5, #+1]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R5, #+2]
        ORRS     R0,R1,R0
        BL       refin
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        ADDS     R6,R5,#+3
        B.N      ??crc32_calc_5
??crc32_calc_6:
        LDR      R0,[R6, #+0]
        LDR      R1,[R6, #+0]
        LSRS     R1,R1,#+8
        ANDS     R1,R1,#0xFF00
        ORRS     R0,R1,R0, LSR #+24
        LDR      R1,[R6, #+0]
        LSLS     R1,R1,#+8
        ANDS     R1,R1,#0xFF0000
        ORRS     R0,R1,R0
        LDR      R1,[R6, #+0]
        ORRS     R0,R0,R1, LSL #+24
        BL       refin
        LDR.N    R1,??DataTable1  ;; 0x40023000
        STR      R0,[R1, #+0]
        ADDS     R6,R6,#+4
??crc32_calc_5:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE.N    ??crc32_calc_6
??crc32_calc_4:
        LDR.N    R0,??DataTable1  ;; 0x40023000
        LDR      R0,[R0, #+0]
        BL       refout
        MVNS     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40023000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x6aa59e9d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x9746cd0a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xcc6021d0

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
// 620 bytes in section .text
// 
// 620 bytes of CODE memory
//
//Errors: none
//Warnings: none
