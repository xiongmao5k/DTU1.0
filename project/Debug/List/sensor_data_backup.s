///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:22
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\sensor_data_backup.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\sensor_data_backup.c -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\sensor_data_backup.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __gmtime32
        EXTERN dl_SPIFFS_close
        EXTERN dl_SPIFFS_info
        EXTERN dl_SPIFFS_lseek
        EXTERN dl_SPIFFS_open
        EXTERN dl_SPIFFS_read
        EXTERN dl_SPIFFS_remove
        EXTERN dl_SPIFFS_stat
        EXTERN dl_SPIFFS_write
        EXTERN rtc_get_time
        EXTERN xFs

        PUBLIC backup_clean
        PUBLIC backup_init
        PUBLIC backup_pop
        PUBLIC backup_push


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
backup_init:
        PUSH     {R4,LR}
        SUB      SP,SP,#+56
        ADD      R2,SP,#+4
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_stat
        CMP      R0,#+0
        BNE.N    ??backup_init_0
        MOVS     R0,#+0
        B.N      ??backup_init_1
??backup_init_0:
        MOVS     R0,#+4
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        MOVS     R3,#+0
        MOVS     R2,#+20
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_open
        MOVS     R4,R0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BPL.N    ??backup_init_2
        MOVS     R0,#+1
        B.N      ??backup_init_1
??backup_init_2:
        MOVS     R3,#+4
        ADD      R2,SP,#+0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_write
        CMP      R0,#+4
        BEQ.N    ??backup_init_3
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_init_1
??backup_init_3:
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??backup_init_1:
        ADD      SP,SP,#+56
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
backup_clean:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+4
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_remove
        MOVS     R3,#+0
        MOVS     R2,#+20
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_open
        MOVS     R4,R0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BPL.N    ??backup_clean_0
        MOVS     R0,#+1
        B.N      ??backup_clean_1
??backup_clean_0:
        MOVS     R3,#+4
        ADD      R2,SP,#+0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_write
        CMP      R0,#+4
        BEQ.N    ??backup_clean_2
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_clean_1
??backup_clean_2:
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??backup_clean_1:
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
backup_check_time:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        BL       rtc_get_time
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+28800
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+0
        BL       __gmtime32
        LDR      R0,[R0, #+8]
        CMP      R5,R0
        BCS.N    ??backup_check_time_0
        SUBS     R0,R0,R5
        B.N      ??backup_check_time_1
??backup_check_time_0:
        SUBS     R0,R5,R0
??backup_check_time_1:
        CMP      R0,R4
        BCS.N    ??backup_check_time_2
        MOVS     R0,#+1
        B.N      ??backup_check_time_3
??backup_check_time_2:
        MOVS     R0,#+0
??backup_check_time_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
backup_pop:
        PUSH     {R2-R6,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+24
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_open
        MOVS     R5,R0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BPL.N    ??backup_pop_0
        MOVS     R0,#+1
        B.N      ??backup_pop_1
??backup_pop_0:
        MOVS     R3,#+4
        ADD      R2,SP,#+4
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_read
        CMP      R0,#+4
        BEQ.N    ??backup_pop_2
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_pop_1
??backup_pop_2:
        MOVS     R3,#+0
        LDR      R2,[SP, #+4]
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_lseek
        MOVS     R3,#+4
        ADD      R2,SP,#+0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_read
        CMP      R0,#+4
        BEQ.N    ??backup_pop_3
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_pop_1
??backup_pop_3:
        LDR      R0,[SP, #+0]
        CMP      R0,R4
        BCS.N    ??backup_pop_4
        LDR      R3,[SP, #+0]
        B.N      ??backup_pop_5
??backup_pop_4:
        MOVS     R3,R4
??backup_pop_5:
        MOVS     R2,R6
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_read
        LDR      R1,[SP, #+0]
        CMP      R1,R4
        BCS.N    ??backup_pop_6
        LDR      R4,[SP, #+0]
        B.N      ??backup_pop_7
??backup_pop_6:
??backup_pop_7:
        CMP      R0,R4
        BEQ.N    ??backup_pop_8
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_pop_1
??backup_pop_8:
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+0]
        ADDS     R1,R1,#+4
        ADDS     R0,R1,R0
        STR      R0,[SP, #+4]
        MOVS     R3,#+0
        MOVS     R2,#+0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_lseek
        MOVS     R3,#+4
        ADD      R2,SP,#+4
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_write
        CMP      R0,#+4
        BEQ.N    ??backup_pop_9
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_pop_1
??backup_pop_9:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??backup_pop_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
backup_push:
        PUSH     {R1,R4,R5,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       backup_check_time
        CMP      R0,#+0
        BEQ.N    ??backup_push_0
        MOVS     R0,#+0
        B.N      ??backup_push_1
??backup_push_0:
        ADD      R2,SP,#+0
        ADD      R1,SP,#+4
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_info
        CMP      R0,#+0
        BEQ.N    ??backup_push_2
        MOVS     R0,#+1
        B.N      ??backup_push_1
??backup_push_2:
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+4096
        BCS.N    ??backup_push_3
        BL       backup_clean
        CMP      R0,#+1
        BNE.N    ??backup_push_3
        MOVS     R0,#+1
        B.N      ??backup_push_1
??backup_push_3:
        MOVS     R3,#+0
        MOVS     R2,#+24
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_open
        MOVS     R5,R0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BPL.N    ??backup_push_4
        MOVS     R0,#+1
        B.N      ??backup_push_1
??backup_push_4:
        MOVS     R3,#+2
        MOVS     R2,#+0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_lseek
        MOVS     R3,#+4
        ADD      R2,SP,#+8
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_write
        CMP      R0,#+4
        BEQ.N    ??backup_push_5
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_push_1
??backup_push_5:
        LDR      R3,[SP, #+8]
        MOVS     R2,R4
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_write
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BEQ.N    ??backup_push_6
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+1
        B.N      ??backup_push_1
??backup_push_6:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        LDR.N    R0,??DataTable3_1
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??backup_push_1:
        POP      {R1-R5,PC}       ;; return

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
        DC8 "RUHR_DTU_DATA_BACKUP_NAME"
        DC8 0, 0

        END
// 
//  28 bytes in section .rodata
// 680 bytes in section .text
// 
// 680 bytes of CODE  memory
//  28 bytes of CONST memory
//
//Errors: none
//Warnings: 36
