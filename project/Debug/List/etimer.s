///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:21
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\sys\etimer.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\sys\etimer.c -D STM32F10X_MD
//        -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\etimer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN clock_time
        EXTERN process_current
        EXTERN process_poll
        EXTERN process_post
        EXTERN timer_expired
        EXTERN timer_reset
        EXTERN timer_restart
        EXTERN timer_set

        PUBLIC etimer_adjust
        PUBLIC etimer_expiration_time
        PUBLIC etimer_expired
        PUBLIC etimer_next_expiration_time
        PUBLIC etimer_pending
        PUBLIC etimer_process
        PUBLIC etimer_request_poll
        PUBLIC etimer_reset
        PUBLIC etimer_restart
        PUBLIC etimer_set
        PUBLIC etimer_start_time
        PUBLIC etimer_stop


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timerlist:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
next_expiration:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
etimer_process:
        DATA
        DC32 0H, ?_0, process_thread_etimer_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
update_time:
        PUSH     {R4-R6,LR}
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??update_time_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STR      R0,[R1, #+0]
        B.N      ??update_time_1
??update_time_0:
        BL       clock_time
        MOVS     R5,R0
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
        LDR      R0,[R6, #+0]
        LDR      R1,[R6, #+4]
        ADDS     R0,R1,R0
        SUBS     R0,R0,R5
        MOVS     R4,R0
        LDR      R6,[R6, #+8]
??update_time_2:
        CMP      R6,#+0
        BEQ.N    ??update_time_3
        LDR      R0,[R6, #+0]
        LDR      R1,[R6, #+4]
        ADDS     R0,R1,R0
        SUBS     R0,R0,R5
        CMP      R0,R4
        BCS.N    ??update_time_4
        LDR      R0,[R6, #+0]
        LDR      R1,[R6, #+4]
        ADDS     R0,R1,R0
        SUBS     R0,R0,R5
        MOVS     R4,R0
??update_time_4:
        LDR      R6,[R6, #+8]
        B.N      ??update_time_2
??update_time_3:
        ADDS     R0,R4,R5
        LDR.N    R1,??DataTable6_1
        STR      R0,[R1, #+0]
??update_time_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_etimer_process:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_etimer_process_0
        CMP      R0,#+89
        BEQ.N    ??process_thread_etimer_process_1
        B.N      ??process_thread_etimer_process_2
??process_thread_etimer_process_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6
        STR      R0,[R1, #+0]
??process_thread_etimer_process_3:
        MOVS     R1,#+0
        MOVS     R0,#+89
        STRH     R0,[R4, #+0]
??process_thread_etimer_process_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??process_thread_etimer_process_4
        MOVS     R0,#+1
        B.N      ??process_thread_etimer_process_5
??process_thread_etimer_process_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+135
        BNE.N    ??process_thread_etimer_process_6
        MOVS     R0,R6
??process_thread_etimer_process_7:
        LDR.N    R1,??DataTable6
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??process_thread_etimer_process_8
        LDR.N    R1,??DataTable6
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+12]
        CMP      R1,R0
        BNE.N    ??process_thread_etimer_process_8
        LDR.N    R1,??DataTable6
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+8]
        LDR.N    R2,??DataTable6
        STR      R1,[R2, #+0]
        B.N      ??process_thread_etimer_process_7
??process_thread_etimer_process_8:
        LDR.N    R1,??DataTable6
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??process_thread_etimer_process_9
        LDR.N    R1,??DataTable6
        LDR      R1,[R1, #+0]
        MOVS     R7,R1
??process_thread_etimer_process_10:
        LDR      R1,[R7, #+8]
        CMP      R1,#+0
        BEQ.N    ??process_thread_etimer_process_9
        LDR      R1,[R7, #+8]
        LDR      R1,[R1, #+12]
        CMP      R1,R0
        BNE.N    ??process_thread_etimer_process_11
        LDR      R1,[R7, #+8]
        LDR      R1,[R1, #+8]
        STR      R1,[R7, #+8]
        B.N      ??process_thread_etimer_process_10
??process_thread_etimer_process_11:
        LDR      R7,[R7, #+8]
        B.N      ??process_thread_etimer_process_10
??process_thread_etimer_process_9:
        B.N      ??process_thread_etimer_process_3
??process_thread_etimer_process_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+130
        BNE.N    ??process_thread_etimer_process_3
??process_thread_etimer_process_12:
        MOVS     R0,#+0
        MOV      R8,R0
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        MOVS     R7,R0
??process_thread_etimer_process_13:
        CMP      R7,#+0
        BEQ.N    ??process_thread_etimer_process_3
        MOVS     R0,R7
        BL       timer_expired
        CMP      R0,#+0
        BEQ.N    ??process_thread_etimer_process_14
        MOVS     R2,R7
        MOVS     R1,#+136
        LDR      R0,[R7, #+12]
        BL       process_post
        CMP      R0,#+0
        BNE.N    ??process_thread_etimer_process_15
        MOVS     R0,#+0
        STR      R0,[R7, #+12]
        CMP      R8,#+0
        BEQ.N    ??process_thread_etimer_process_16
        LDR      R0,[R7, #+8]
        STR      R0,[R8, #+8]
        B.N      ??process_thread_etimer_process_17
??process_thread_etimer_process_16:
        LDR      R0,[R7, #+8]
        LDR.N    R1,??DataTable6
        STR      R0,[R1, #+0]
??process_thread_etimer_process_17:
        MOVS     R0,#+0
        STR      R0,[R7, #+8]
        BL       update_time
        B.N      ??process_thread_etimer_process_12
??process_thread_etimer_process_15:
        BL       etimer_request_poll
??process_thread_etimer_process_14:
        MOV      R8,R7
        LDR      R7,[R7, #+8]
        B.N      ??process_thread_etimer_process_13
??process_thread_etimer_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_etimer_process_5:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_request_poll:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable6_2
        BL       process_poll
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
add_timer:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        BL       etimer_request_poll
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BEQ.N    ??add_timer_0
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        MOVS     R5,R0
??add_timer_1:
        CMP      R5,#+0
        BEQ.N    ??add_timer_0
        CMP      R5,R4
        BNE.N    ??add_timer_2
        LDR.N    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+12]
        BL       update_time
        B.N      ??add_timer_3
??add_timer_2:
        LDR      R5,[R5, #+8]
        B.N      ??add_timer_1
??add_timer_0:
        LDR.N    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+12]
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+8]
        LDR.N    R0,??DataTable6
        STR      R4,[R0, #+0]
        BL       update_time
??add_timer_3:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_set:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       timer_set
        MOVS     R0,R4
        BL       add_timer
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_reset:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       timer_reset
        MOVS     R0,R4
        BL       add_timer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_restart:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       timer_restart
        MOVS     R0,R4
        BL       add_timer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_adjust:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+0]
        ADDS     R0,R5,R0
        STR      R0,[R4, #+0]
        BL       update_time
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_expired:
        LDR      R0,[R0, #+12]
        CMP      R0,#+0
        BNE.N    ??etimer_expired_0
        MOVS     R0,#+1
        B.N      ??etimer_expired_1
??etimer_expired_0:
        MOVS     R0,#+0
??etimer_expired_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_expiration_time:
        LDR      R1,[R0, #+0]
        LDR      R0,[R0, #+4]
        ADDS     R0,R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_start_time:
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_pending:
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??etimer_pending_0
        MOVS     R0,#+1
        B.N      ??etimer_pending_1
??etimer_pending_0:
        MOVS     R0,#+0
??etimer_pending_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_next_expiration_time:
        PUSH     {R7,LR}
        BL       etimer_pending
        CMP      R0,#+0
        BEQ.N    ??etimer_next_expiration_time_0
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        B.N      ??etimer_next_expiration_time_1
??etimer_next_expiration_time_0:
        MOVS     R0,#+0
??etimer_next_expiration_time_1:
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_stop:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BNE.N    ??etimer_stop_0
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable6
        STR      R0,[R1, #+0]
        BL       update_time
        B.N      ??etimer_stop_1
??etimer_stop_0:
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        MOVS     R5,R0
??etimer_stop_2:
        CMP      R5,#+0
        BEQ.N    ??etimer_stop_3
        LDR      R0,[R5, #+8]
        CMP      R0,R4
        BEQ.N    ??etimer_stop_3
        LDR      R5,[R5, #+8]
        B.N      ??etimer_stop_2
??etimer_stop_3:
        CMP      R5,#+0
        BEQ.N    ??etimer_stop_1
        LDR      R0,[R4, #+8]
        STR      R0,[R5, #+8]
        BL       update_time
??etimer_stop_1:
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     timerlist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     next_expiration

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     etimer_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     process_current

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
        DC8 "Event timer"

        END
// 
//   8 bytes in section .bss
//  16 bytes in section .data
//  12 bytes in section .rodata
// 612 bytes in section .text
// 
// 612 bytes of CODE  memory
//  12 bytes of CONST memory
//  24 bytes of DATA  memory
//
//Errors: none
//Warnings: none
