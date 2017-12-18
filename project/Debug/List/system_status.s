///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:27
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\system_status.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\system_status.c -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\system_status.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN IWDG_Enable
        EXTERN IWDG_ReloadCounter
        EXTERN IWDG_SetPrescaler
        EXTERN IWDG_SetReload
        EXTERN IWDG_WriteAccessCmd
        EXTERN etimer_set
        EXTERN gpio_set_as_output
        EXTERN gpio_set_pin
        EXTERN process_current
        EXTERN process_post
        EXTERN process_start
        EXTERN rtc_wakeup_after_second
        EXTERN timer_expired
        EXTERN timer_set

        PUBLIC system_monit_process
        PUBLIC system_status_init
        PUBLIC system_status_process


        SECTION `.data`:DATA:REORDER:NOROOT(2)
system_status_process:
        DATA
        DC32 0H, ?_0, process_thread_system_status_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_system_status_process:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+1
        LDRH     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??process_thread_system_status_process_0
        CMP      R1,#+24
        BEQ.N    ??process_thread_system_status_process_1
        CMP      R1,#+27
        BEQ.N    ??process_thread_system_status_process_2
        B.N      ??process_thread_system_status_process_3
??process_thread_system_status_process_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BNE.N    ??process_thread_system_status_process_4
        MOVS     R0,#+7
        BL       gpio_set_as_output
??process_thread_system_status_process_4:
        MOVS     R1,#+1
        MOVS     R0,#+7
        BL       gpio_set_pin
        MOVS     R1,#+100
        LDR.N    R0,??DataTable2
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+24
        STRH     R1,[R4, #+0]
??process_thread_system_status_process_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_system_status_process_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_system_status_process_6
??process_thread_system_status_process_5:
        MOVS     R0,#+1
        B.N      ??process_thread_system_status_process_7
??process_thread_system_status_process_6:
        MOVS     R1,#+0
        MOVS     R0,#+7
        BL       gpio_set_pin
        MOV      R1,#+800
        LDR.N    R0,??DataTable2
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+27
        STRH     R1,[R4, #+0]
??process_thread_system_status_process_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_system_status_process_8
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_system_status_process_9
??process_thread_system_status_process_8:
        MOVS     R0,#+1
        B.N      ??process_thread_system_status_process_7
??process_thread_system_status_process_9:
        B.N      ??process_thread_system_status_process_4
??process_thread_system_status_process_3:
        MOVS     R0,#+0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_system_status_process_7:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??et:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
system_monit_process:
        DATA
        DC32 0H, ?_1, process_thread_system_monit_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_system_monit_process:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+1
        LDRH     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??process_thread_system_monit_process_0
        CMP      R1,#+48
        BEQ.N    ??process_thread_system_monit_process_1
        B.N      ??process_thread_system_monit_process_2
??process_thread_system_monit_process_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BNE.N    ??process_thread_system_monit_process_3
        MOVW     R0,#+21845
        BL       IWDG_WriteAccessCmd
        MOVS     R0,#+2
        BL       IWDG_SetPrescaler
        MOVW     R0,#+4095
        BL       IWDG_SetReload
        BL       IWDG_ReloadCounter
        BL       IWDG_Enable
??process_thread_system_monit_process_3:
        LDR.N    R1,??DataTable2_1  ;; 0x493e0
        LDR.N    R0,??DataTable2_2
        BL       timer_set
??process_thread_system_monit_process_4:
        MOVS     R2,#+0
        MOVS     R1,#+133
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       process_post
        MOVS     R0,#+0
        MOVS     R1,#+48
        STRH     R1,[R4, #+0]
??process_thread_system_monit_process_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_system_monit_process_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+133
        BEQ.N    ??process_thread_system_monit_process_6
??process_thread_system_monit_process_5:
        MOVS     R0,#+1
        B.N      ??process_thread_system_monit_process_7
??process_thread_system_monit_process_6:
        BL       IWDG_ReloadCounter
        LDR.N    R0,??DataTable2_2
        BL       timer_expired
        CMP      R0,#+0
        BEQ.N    ??process_thread_system_monit_process_4
        MOVS     R0,#+5
        BL       rtc_wakeup_after_second
        B.N      ??process_thread_system_monit_process_4
??process_thread_system_monit_process_2:
        MOVS     R0,#+0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_system_monit_process_7:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??tm:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
system_status_init:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_4
        BL       process_start
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_5
        BL       process_start
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ??et

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x493e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ??tm

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     process_current

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     system_status_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     system_monit_process

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
        DC8 "system status process"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "system monit process"
        DC8 0, 0, 0

        END
// 
//  24 bytes in section .bss
//  32 bytes in section .data
//  48 bytes in section .rodata
// 300 bytes in section .text
// 
// 300 bytes of CODE  memory
//  48 bytes of CONST memory
//  56 bytes of DATA  memory
//
//Errors: none
//Warnings: none
