///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       05/Jun/2018  16:33:00
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\configure.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\configure.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\configure.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN dl_SPIFFS_close
        EXTERN dl_SPIFFS_creat
        EXTERN dl_SPIFFS_open
        EXTERN dl_SPIFFS_read
        EXTERN dl_SPIFFS_remove
        EXTERN dl_SPIFFS_rename
        EXTERN dl_SPIFFS_write
        EXTERN xFs

        PUBLIC configure_read
        PUBLIC configure_update_apply
        PUBLIC configure_update_check
        PUBLIC configure_update_init
        PUBLIC configure_update_push


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
configure_read:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R3,#+0
        MOVS     R2,#+24
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_open
        MOVS     R5,R0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BMI.N    ??configure_read_0
??configure_read_1:
        MOVS     R3,#+63
        MOVS     R2,R4
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_read
        CMP      R0,#+63
        BNE.N    ??configure_read_0
??configure_read_2:
        LDRB     R0,[R4, #+62]
        MOVS     R1,#+13
        MULS     R0,R1,R0
        MOVS     R6,R0
        MOVS     R3,R6
        ADDS     R2,R4,#+63
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_read
        CMP      R0,R6
        BNE.N    ??configure_read_0
??configure_read_3:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??configure_read_4
??configure_read_0:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??configure_read_4:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
configure_update_init:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDR.N    R1,??DataTable3_2
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_remove
        MOVS     R2,#+0
        LDR.N    R1,??DataTable3_2
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_creat
        CMP      R0,#+0
        BEQ.N    ??configure_update_init_0
        MOVS     R0,#+0
        B.N      ??configure_update_init_1
??configure_update_init_0:
        MOVS     R0,#+1
??configure_update_init_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
configure_update_push:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R3,#+0
        MOVS     R2,#+26
        LDR.N    R1,??DataTable3_2
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_open
        MOVS     R6,R0
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BPL.N    ??configure_update_push_0
        MOVS     R0,#+0
        B.N      ??configure_update_push_1
??configure_update_push_0:
        MOVS     R3,R5
        MOVS     R2,R4
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R1,R6
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_write
        CMP      R0,R5
        BEQ.N    ??configure_update_push_2
        MOVS     R0,#+0
        B.N      ??configure_update_push_1
??configure_update_push_2:
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R1,R6
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
??configure_update_push_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
configure_update_check:
        MOVS     R0,#+1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
configure_update_apply:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_remove
        LDR.N    R2,??DataTable3
        LDR.N    R1,??DataTable3_2
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_rename
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     xFs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     ?_1

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
        DC8 "RUHR_DTU_CONFIG"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "RUHR_DTU_CONFIG_NEW"

        END
// 
//  36 bytes in section .rodata
// 250 bytes in section .text
// 
// 250 bytes of CODE  memory
//  36 bytes of CONST memory
//
//Errors: none
//Warnings: 18
