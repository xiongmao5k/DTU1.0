///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\cpu\rtc.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\rtc.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\rtc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BKP_ClearFlag
        EXTERN BKP_ReadBackupRegister
        EXTERN BKP_WriteBackupRegister
        EXTERN PWR_BackupAccessCmd
        EXTERN PWR_ClearFlag
        EXTERN PWR_EnterSTANDBYMode
        EXTERN PWR_GetFlagStatus
        EXTERN RCC_GetFlagStatus
        EXTERN RCC_LSEConfig
        EXTERN RCC_RTCCLKCmd
        EXTERN RCC_RTCCLKConfig
        EXTERN RTC_ClearFlag
        EXTERN RTC_GetCounter
        EXTERN RTC_GetFlagStatus
        EXTERN RTC_ITConfig
        EXTERN RTC_SetAlarm
        EXTERN RTC_SetCounter
        EXTERN RTC_SetPrescaler
        EXTERN RTC_WaitForLastTask
        EXTERN RTC_WaitForSynchro
        EXTERN gpio_set_pin

        PUBLIC RTCAlarm_IRQHandler
        PUBLIC rtc_get_time
        PUBLIC rtc_init
        PUBLIC rtc_set_alarm
        PUBLIC rtc_set_time
        PUBLIC rtc_wakeup_after_second
        PUBLIC rtc_wakeup_at_second


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtc_init:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        MOVS     R0,#+1
        BL       PWR_BackupAccessCmd
        BL       BKP_ClearFlag
        MOVS     R0,#+4
        BL       BKP_ReadBackupRegister
        MOVS     R4,R0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+1
        BNE.N    ??rtc_init_0
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       BKP_WriteBackupRegister
        BL       PWR_EnterSTANDBYMode
??rtc_init_0:
        MOVS     R0,#+2
        BL       PWR_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??rtc_init_1
        MOVS     R0,#+2
        BL       PWR_ClearFlag
        BL       RTC_WaitForSynchro
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RTC_ITConfig
        BL       RTC_WaitForLastTask
        B.N      ??rtc_init_2
??rtc_init_1:
        MOVS     R0,#+1
        BL       RCC_LSEConfig
??rtc_init_3:
        MOVS     R0,#+65
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??rtc_init_3
        MOV      R0,#+256
        BL       RCC_RTCCLKConfig
        MOVS     R0,#+1
        BL       RCC_RTCCLKCmd
        BL       RTC_WaitForSynchro
        MOVW     R0,#+32767
        BL       RTC_SetPrescaler
        BL       RTC_WaitForLastTask
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RTC_ITConfig
        BL       RTC_WaitForLastTask
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       gpio_set_pin
??rtc_init_2:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtc_set_time:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       RTC_SetCounter
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtc_get_time:
        PUSH     {R7,LR}
        BL       RTC_GetCounter
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtc_set_alarm:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       RTC_SetAlarm
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtc_wakeup_after_second:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+1
        BL       RTC_ClearFlag
??rtc_wakeup_after_second_0:
        MOVS     R0,#+1
        BL       RTC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??rtc_wakeup_after_second_0
        BL       RTC_GetCounter
        ADDS     R0,R4,R0
        BL       RTC_SetAlarm
        BL       RTC_WaitForLastTask
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       BKP_WriteBackupRegister
        BL       PWR_EnterSTANDBYMode
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtc_wakeup_at_second:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+1
        BL       RTC_ClearFlag
??rtc_wakeup_at_second_0:
        MOVS     R0,#+1
        BL       RTC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??rtc_wakeup_at_second_0
        BL       RTC_GetCounter
        MOVS     R5,R0
        ADDS     R0,R5,#+3
        CMP      R4,R0
        BCS.N    ??rtc_wakeup_at_second_1
        ADDS     R0,R5,#+300
        MOVS     R4,R0
??rtc_wakeup_at_second_1:
        MOVS     R0,R4
        BL       RTC_SetAlarm
        BL       RTC_WaitForLastTask
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       BKP_WriteBackupRegister
        BL       PWR_EnterSTANDBYMode
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTCAlarm_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R0,#+2
        BL       RTC_ClearFlag
        POP      {R0,PC}          ;; return

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
// 296 bytes in section .text
// 
// 296 bytes of CODE memory
//
//Errors: none
//Warnings: none
