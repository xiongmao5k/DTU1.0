///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\battery.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\battery.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\battery.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Cmd
        EXTERN ADC_GetCalibrationStatus
        EXTERN ADC_GetConversionValue
        EXTERN ADC_GetFlagStatus
        EXTERN ADC_GetResetCalibrationStatus
        EXTERN ADC_Init
        EXTERN ADC_RegularChannelConfig
        EXTERN ADC_ResetCalibration
        EXTERN ADC_SoftwareStartConvCmd
        EXTERN ADC_StartCalibration
        EXTERN ADC_StructInit
        EXTERN GPIO_Init
        EXTERN RCC_ADCCLKConfig
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_ui2d
        EXTERN deviceid_read
        EXTERN gpio_get_pin
        EXTERN rtc_get_time
        EXTERN senif_power_close
        EXTERN senif_power_open
        EXTERN sprintf
        EXTERN strlen

        PUBLIC battery_check_power
        PUBLIC battery_init
        PUBLIC battery_read


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
adc_init:
        PUSH     {LR}
        SUB      SP,SP,#+28
        MOVS     R1,#+1
        MOV      R0,#+512
        BL       RCC_APB2PeriphClockCmd
        MOV      R0,#+32768
        BL       RCC_ADCCLKConfig
        MOVS     R0,#+0
        STRB     R0,[SP, #+3]
        MOVS     R0,#+2
        STRH     R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+2]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4  ;; 0x40010c00
        BL       GPIO_Init
        ADD      R0,SP,#+4
        BL       ADC_StructInit
        MOVS     R0,#+1
        STRB     R0,[SP, #+20]
        MOVS     R0,#+917504
        STR      R0,[SP, #+12]
        ADD      R1,SP,#+4
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_Cmd
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_ResetCalibration
??adc_init_0:
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_GetResetCalibrationStatus
        CMP      R0,#+0
        BNE.N    ??adc_init_0
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_StartCalibration
??adc_init_1:
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_GetCalibrationStatus
        CMP      R0,#+0
        BNE.N    ??adc_init_1
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+9
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_RegularChannelConfig
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
adc_read:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_SoftwareStartConvCmd
??adc_read_0:
        MOVS     R1,#+2
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??adc_read_0
        LDR.N    R0,??DataTable4_1  ;; 0x40012400
        BL       ADC_GetConversionValue
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
charg_state:
        PUSH     {R7,LR}
        MOVS     R0,#+12
        BL       gpio_get_pin
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
simple_delay:
        SUB      SP,SP,#+4
        LDR.N    R0,??DataTable4_2  ;; 0x186a0
        STR      R0,[SP, #+0]
??simple_delay_0:
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??simple_delay_0
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
battery_check_power:
        PUSH     {R4-R6,LR}
        MOVS     R0,#+0
        BL       senif_power_open
        BL       simple_delay
        BL       adc_read
        MOVS     R4,R0
        MOVS     R0,#+0
        BL       senif_power_close
        MOVS     R0,#+2
        BL       senif_power_open
        BL       simple_delay
        BL       adc_read
        MOVS     R5,R0
        MOVS     R0,#+2
        BL       senif_power_close
        MOVS     R0,#+4
        BL       senif_power_open
        BL       simple_delay
        BL       adc_read
        MOVS     R6,R0
        MOVS     R0,#+4
        BL       senif_power_close
        CMP      R4,#+700
        BCS.N    ??battery_check_power_0
        CMP      R6,#+700
        BCS.N    ??battery_check_power_0
        MOVW     R0,#+2340
        CMP      R5,R0
        BCS.N    ??battery_check_power_1
        MOVS     R0,#+0
        B.N      ??battery_check_power_2
??battery_check_power_1:
        MOVS     R0,#+1
        B.N      ??battery_check_power_2
??battery_check_power_0:
        MOVW     R0,#+2340
        CMP      R4,R0
        BCC.N    ??battery_check_power_3
        MOVW     R0,#+2340
        CMP      R5,R0
        BCC.N    ??battery_check_power_3
        MOVW     R0,#+2340
        CMP      R6,R0
        BCS.N    ??battery_check_power_4
??battery_check_power_3:
        MOVS     R0,#+0
        B.N      ??battery_check_power_2
??battery_check_power_4:
        MOVS     R0,#+1
??battery_check_power_2:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
battery_read:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+44
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        BL       senif_power_open
        BL       simple_delay
        BL       adc_read
        STR      R0,[SP, #+40]
        BL       charg_state
        MOV      R10,R0
        MOVS     R0,#+0
        BL       senif_power_close
        MOVS     R0,#+2
        BL       senif_power_open
        BL       simple_delay
        BL       adc_read
        STR      R0,[SP, #+36]
        BL       charg_state
        MOV      R9,R0
        MOVS     R0,#+2
        BL       senif_power_close
        MOVS     R0,#+4
        BL       senif_power_open
        BL       simple_delay
        BL       adc_read
        MOV      R11,R0
        BL       charg_state
        MOV      R8,R0
        MOVS     R0,#+4
        BL       senif_power_close
        BL       rtc_get_time
        MOVS     R6,R0
        BL       deviceid_read
        MOVS     R7,R0
        STR      R8,[SP, #+32]
        STR      R9,[SP, #+28]
        STR      R10,[SP, #+24]
        MOV      R0,R11
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable4_3  ;; 0x40166666
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_4  ;; 0x40b00000
        BL       __aeabi_ddiv
        STRD     R0,R1,[SP, #+16]
        LDR      R0,[SP, #+36]
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable4_3  ;; 0x40166666
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_4  ;; 0x40b00000
        BL       __aeabi_ddiv
        STRD     R0,R1,[SP, #+8]
        LDR      R0,[SP, #+40]
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable4_3  ;; 0x40166666
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_4  ;; 0x40b00000
        BL       __aeabi_ddiv
        STRD     R0,R1,[SP, #+0]
        MOVS     R3,R6
        MOVS     R2,R7
        LDR.N    R1,??DataTable4_5
        MOVS     R0,R4
        BL       sprintf
        MOVS     R0,R4
        BL       strlen
        ADD      SP,SP,#+44
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
battery_init:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        STRB     R0,[SP, #+2]
        MOVS     R0,#+40
        STRB     R0,[SP, #+3]
        MOV      R0,#+4096
        STRH     R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_6  ;; 0x40010800
        BL       GPIO_Init
        BL       adc_init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40166666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40b00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40010800

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
        DC8 "%u|%d|%.2lf|%.2lf|%.2lf|%d|%d|%d"
        DC8 0, 0, 0

        END
// 
//  36 bytes in section .rodata
// 608 bytes in section .text
// 
// 608 bytes of CODE  memory
//  36 bytes of CONST memory
//
//Errors: none
//Warnings: none
