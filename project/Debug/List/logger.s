///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\logger.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\logger.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\logger.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __iar_vla_alloc2
        EXTERN __iar_vla_dealloc2
        EXTERN dl_SPIFFS_close
        EXTERN dl_SPIFFS_lseek
        EXTERN dl_SPIFFS_open
        EXTERN dl_SPIFFS_read
        EXTERN dl_SPIFFS_write
        EXTERN senif_close
        EXTERN senif_open
        EXTERN senif_power_close
        EXTERN senif_power_open
        EXTERN senif_write
        EXTERN sprintf
        EXTERN strlen
        EXTERN xFs

        PUBLIC log_out
        PUBLIC log_print


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
log_out:
        PUSH     {R1-R3}
        PUSH     {R3-R8,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       strlen
        ADDS     R0,R0,#+64
        BL       __iar_vla_alloc2
        MOVS     R6,R0
        MOVS     R0,#+0
        MOV      R8,R0
        ADD      R0,SP,#+28
        MOVS     R5,R0
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R6
        BL       sprintf
        MOVS     R7,R0
        MOVS     R3,#+0
        MOVS     R2,#+20
        LDR.N    R1,??DataTable1
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_open
        MOV      R8,R0
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BPL.N    ??log_out_0
        MOVS     R0,R6
        BL       __iar_vla_dealloc2
        B.N      ??log_out_1
??log_out_0:
        MOVS     R3,#+2
        MOVS     R2,#+0
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        MOV      R1,R8
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_lseek
        MOVS     R3,R7
        MOVS     R2,R6
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        MOV      R1,R8
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_write
        CMP      R0,R7
        BEQ.N    ??log_out_2
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        MOV      R1,R8
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_close
        MOVS     R0,R6
        BL       __iar_vla_dealloc2
        B.N      ??log_out_1
??log_out_2:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        MOV      R1,R8
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_close
        MOVS     R0,R6
        BL       __iar_vla_dealloc2
??log_out_1:
        POP      {R0,R4-R8}
        LDR      PC,[SP], #+16    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
log_print:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+132
        MOVS     R0,#+2
        BL       senif_power_open
        MOVS     R0,#+2
        BL       senif_open
        MOVS     R3,#+0
        MOVS     R2,#+8
        LDR.N    R1,??DataTable1
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_open
        MOVS     R4,R0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BMI.N    ??log_print_0
??log_print_1:
        MOVS     R3,#+128
        ADD      R2,SP,#+0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_read
        MOVS     R5,R0
        CMP      R0,#+1
        BLT.N    ??log_print_2
        MOVS     R2,R5
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       senif_write
        CMP      R5,#+128
        BEQ.N    ??log_print_1
??log_print_2:
        MOVS     R0,#+2
        BL       senif_close
        MOVS     R0,#+2
        BL       senif_power_close
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable1_1
        BL       dl_SPIFFS_close
??log_print_0:
        ADD      SP,SP,#+132
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     xFs

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
        DC8 "logfile.txt"

        END
// 
//  12 bytes in section .rodata
// 260 bytes in section .text
// 
// 260 bytes of CODE  memory
//  12 bytes of CONST memory
//
//Errors: none
//Warnings: 8
