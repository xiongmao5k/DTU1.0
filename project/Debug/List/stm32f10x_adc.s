///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:45
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_adc.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_adc.c
//        -D STM32F10X_MD -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_adc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC ADC_AnalogWatchdogCmd
        PUBLIC ADC_AnalogWatchdogSingleChannelConfig
        PUBLIC ADC_AnalogWatchdogThresholdsConfig
        PUBLIC ADC_AutoInjectedConvCmd
        PUBLIC ADC_ClearFlag
        PUBLIC ADC_ClearITPendingBit
        PUBLIC ADC_Cmd
        PUBLIC ADC_DMACmd
        PUBLIC ADC_DeInit
        PUBLIC ADC_DiscModeChannelCountConfig
        PUBLIC ADC_DiscModeCmd
        PUBLIC ADC_ExternalTrigConvCmd
        PUBLIC ADC_ExternalTrigInjectedConvCmd
        PUBLIC ADC_ExternalTrigInjectedConvConfig
        PUBLIC ADC_GetCalibrationStatus
        PUBLIC ADC_GetConversionValue
        PUBLIC ADC_GetDualModeConversionValue
        PUBLIC ADC_GetFlagStatus
        PUBLIC ADC_GetITStatus
        PUBLIC ADC_GetInjectedConversionValue
        PUBLIC ADC_GetResetCalibrationStatus
        PUBLIC ADC_GetSoftwareStartConvStatus
        PUBLIC ADC_GetSoftwareStartInjectedConvCmdStatus
        PUBLIC ADC_ITConfig
        PUBLIC ADC_Init
        PUBLIC ADC_InjectedChannelConfig
        PUBLIC ADC_InjectedDiscModeCmd
        PUBLIC ADC_InjectedSequencerLengthConfig
        PUBLIC ADC_RegularChannelConfig
        PUBLIC ADC_ResetCalibration
        PUBLIC ADC_SetInjectedOffset
        PUBLIC ADC_SoftwareStartConvCmd
        PUBLIC ADC_SoftwareStartInjectedConvCmd
        PUBLIC ADC_StartCalibration
        PUBLIC ADC_StructInit
        PUBLIC ADC_TempSensorVrefintCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable4  ;; 0x40012400
        CMP      R4,R0
        BNE.N    ??ADC_DeInit_0
        MOVS     R1,#+1
        MOV      R0,#+512
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+512
        BL       RCC_APB2PeriphResetCmd
        B.N      ??ADC_DeInit_1
??ADC_DeInit_0:
        LDR.W    R0,??DataTable4_1  ;; 0x40012800
        CMP      R4,R0
        BNE.N    ??ADC_DeInit_2
        MOVS     R1,#+1
        MOV      R0,#+1024
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+1024
        BL       RCC_APB2PeriphResetCmd
        B.N      ??ADC_DeInit_1
??ADC_DeInit_2:
        LDR.W    R0,??DataTable4_2  ;; 0x40013c00
        CMP      R4,R0
        BNE.N    ??ADC_DeInit_1
        MOVS     R1,#+1
        MOV      R0,#+32768
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+32768
        BL       RCC_APB2PeriphResetCmd
??ADC_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR      R4,[R0, #+4]
        MOVS     R3,R4
        LDR.W    R4,??DataTable4_3  ;; 0xfff0feff
        ANDS     R3,R4,R3
        LDR      R4,[R1, #+0]
        LDRB     R5,[R1, #+4]
        ORRS     R4,R4,R5, LSL #+8
        ORRS     R3,R4,R3
        STR      R3,[R0, #+4]
        LDR      R4,[R0, #+8]
        MOVS     R3,R4
        LDR.W    R4,??DataTable4_4  ;; 0xfff1f7fd
        ANDS     R3,R4,R3
        LDR      R4,[R1, #+12]
        LDR      R5,[R1, #+8]
        ORRS     R4,R5,R4
        LDRB     R5,[R1, #+5]
        ORRS     R4,R4,R5, LSL #+1
        ORRS     R3,R4,R3
        STR      R3,[R0, #+8]
        LDR      R4,[R0, #+44]
        MOVS     R3,R4
        BICS     R3,R3,#0xF00000
        LDRB     R4,[R1, #+16]
        SUBS     R4,R4,#+1
        ORRS     R2,R4,R2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ORRS     R3,R3,R2, LSL #+20
        STR      R3,[R0, #+44]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+1
        STRB     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_Cmd_0
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,#0x1
        STR      R2,[R0, #+8]
        B.N      ??ADC_Cmd_1
??ADC_Cmd_0:
        LDR      R2,[R0, #+8]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+1
        STR      R2,[R0, #+8]
??ADC_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DMACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_DMACmd_0
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,#0x100
        STR      R2,[R0, #+8]
        B.N      ??ADC_DMACmd_1
??ADC_DMACmd_0:
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0x100
        STR      R2,[R0, #+8]
??ADC_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ITConfig:
        PUSH     {R4}
        MOVS     R3,#+0
        MOVS     R4,R1
        MOVS     R3,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADC_ITConfig_0
        LDR      R4,[R0, #+4]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ORRS     R4,R3,R4
        STR      R4,[R0, #+4]
        B.N      ??ADC_ITConfig_1
??ADC_ITConfig_0:
        LDR      R4,[R0, #+4]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        BICS     R4,R4,R3
        STR      R4,[R0, #+4]
??ADC_ITConfig_1:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ResetCalibration:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x8
        STR      R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetResetCalibrationStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,[R1, #+8]
        LSLS     R2,R2,#+28
        BPL.N    ??ADC_GetResetCalibrationStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??ADC_GetResetCalibrationStatus_1
??ADC_GetResetCalibrationStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??ADC_GetResetCalibrationStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_StartCalibration:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x4
        STR      R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetCalibrationStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,[R1, #+8]
        LSLS     R2,R2,#+29
        BPL.N    ??ADC_GetCalibrationStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??ADC_GetCalibrationStatus_1
??ADC_GetCalibrationStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??ADC_GetCalibrationStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_SoftwareStartConvCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_SoftwareStartConvCmd_0
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,#0x500000
        STR      R2,[R0, #+8]
        B.N      ??ADC_SoftwareStartConvCmd_1
??ADC_SoftwareStartConvCmd_0:
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0x500000
        STR      R2,[R0, #+8]
??ADC_SoftwareStartConvCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetSoftwareStartConvStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,[R1, #+8]
        LSLS     R2,R2,#+9
        BPL.N    ??ADC_GetSoftwareStartConvStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??ADC_GetSoftwareStartConvStatus_1
??ADC_GetSoftwareStartConvStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??ADC_GetSoftwareStartConvStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DiscModeChannelCountConfig:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR      R4,[R0, #+4]
        MOVS     R2,R4
        BICS     R2,R2,#0xE000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R4,R1,#+1
        MOVS     R3,R4
        ORRS     R2,R2,R3, LSL #+13
        STR      R2,[R0, #+4]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DiscModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_DiscModeCmd_0
        LDR      R2,[R0, #+4]
        ORRS     R2,R2,#0x800
        STR      R2,[R0, #+4]
        B.N      ??ADC_DiscModeCmd_1
??ADC_DiscModeCmd_0:
        LDR      R2,[R0, #+4]
        BICS     R2,R2,#0x800
        STR      R2,[R0, #+4]
??ADC_DiscModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_RegularChannelConfig:
        PUSH     {R4-R7}
        MOVS     R5,#+0
        MOVS     R4,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BLT.N    ??ADC_RegularChannelConfig_0
        LDR      R6,[R0, #+12]
        MOVS     R5,R6
        MOVS     R6,#+7
        SUBS     R7,R1,#+10
        MOVS     R12,#+3
        MUL      R7,R12,R7
        LSLS     R6,R6,R7
        MOVS     R4,R6
        BICS     R5,R5,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R6,R1,#+10
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R6,R3,R6
        MOVS     R4,R6
        ORRS     R5,R4,R5
        STR      R5,[R0, #+12]
        B.N      ??ADC_RegularChannelConfig_1
??ADC_RegularChannelConfig_0:
        LDR      R6,[R0, #+16]
        MOVS     R5,R6
        MOVS     R6,#+7
        MOVS     R7,#+3
        MUL      R7,R7,R1
        LSLS     R6,R6,R7
        MOVS     R4,R6
        BICS     R5,R5,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R6,#+3
        MUL      R6,R6,R1
        LSLS     R6,R3,R6
        MOVS     R4,R6
        ORRS     R5,R4,R5
        STR      R5,[R0, #+16]
??ADC_RegularChannelConfig_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+7
        BGE.N    ??ADC_RegularChannelConfig_2
        LDR      R6,[R0, #+52]
        MOVS     R5,R6
        MOVS     R6,#+31
        SUBS     R7,R2,#+1
        MOVS     R12,#+5
        MUL      R7,R12,R7
        LSLS     R6,R6,R7
        MOVS     R4,R6
        BICS     R5,R5,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R6,R2,#+1
        MOVS     R7,#+5
        MULS     R6,R7,R6
        LSLS     R6,R1,R6
        MOVS     R4,R6
        ORRS     R5,R4,R5
        STR      R5,[R0, #+52]
        B.N      ??ADC_RegularChannelConfig_3
??ADC_RegularChannelConfig_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+13
        BGE.N    ??ADC_RegularChannelConfig_4
        LDR      R6,[R0, #+48]
        MOVS     R5,R6
        MOVS     R6,#+31
        SUBS     R7,R2,#+7
        MOVS     R12,#+5
        MUL      R7,R12,R7
        LSLS     R6,R6,R7
        MOVS     R4,R6
        BICS     R5,R5,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R6,R2,#+7
        MOVS     R7,#+5
        MULS     R6,R7,R6
        LSLS     R6,R1,R6
        MOVS     R4,R6
        ORRS     R5,R4,R5
        STR      R5,[R0, #+48]
        B.N      ??ADC_RegularChannelConfig_3
??ADC_RegularChannelConfig_4:
        LDR      R6,[R0, #+44]
        MOVS     R5,R6
        MOVS     R6,#+31
        SUBS     R7,R2,#+13
        MOVS     R12,#+5
        MUL      R7,R12,R7
        LSLS     R6,R6,R7
        MOVS     R4,R6
        BICS     R5,R5,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R6,R2,#+13
        MOVS     R7,#+5
        MULS     R6,R7,R6
        LSLS     R6,R1,R6
        MOVS     R4,R6
        ORRS     R5,R4,R5
        STR      R5,[R0, #+44]
??ADC_RegularChannelConfig_3:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ExternalTrigConvCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_ExternalTrigConvCmd_0
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,#0x100000
        STR      R2,[R0, #+8]
        B.N      ??ADC_ExternalTrigConvCmd_1
??ADC_ExternalTrigConvCmd_0:
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0x100000
        STR      R2,[R0, #+8]
??ADC_ExternalTrigConvCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetConversionValue:
        LDR      R0,[R0, #+76]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetDualModeConversionValue:
        LDR.N    R0,??DataTable4_5  ;; 0x4001244c
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AutoInjectedConvCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_AutoInjectedConvCmd_0
        LDR      R2,[R0, #+4]
        ORRS     R2,R2,#0x400
        STR      R2,[R0, #+4]
        B.N      ??ADC_AutoInjectedConvCmd_1
??ADC_AutoInjectedConvCmd_0:
        LDR      R2,[R0, #+4]
        BICS     R2,R2,#0x400
        STR      R2,[R0, #+4]
??ADC_AutoInjectedConvCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_InjectedDiscModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_InjectedDiscModeCmd_0
        LDR      R2,[R0, #+4]
        ORRS     R2,R2,#0x1000
        STR      R2,[R0, #+4]
        B.N      ??ADC_InjectedDiscModeCmd_1
??ADC_InjectedDiscModeCmd_0:
        LDR      R2,[R0, #+4]
        BICS     R2,R2,#0x1000
        STR      R2,[R0, #+4]
??ADC_InjectedDiscModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ExternalTrigInjectedConvConfig:
        MOVS     R2,#+0
        LDR      R3,[R0, #+8]
        MOVS     R2,R3
        BICS     R2,R2,#0x7000
        ORRS     R2,R1,R2
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ExternalTrigInjectedConvCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_ExternalTrigInjectedConvCmd_0
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,#0x8000
        STR      R2,[R0, #+8]
        B.N      ??ADC_ExternalTrigInjectedConvCmd_1
??ADC_ExternalTrigInjectedConvCmd_0:
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0x8000
        STR      R2,[R0, #+8]
??ADC_ExternalTrigInjectedConvCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_SoftwareStartInjectedConvCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_SoftwareStartInjectedConvCmd_0
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,#0x208000
        STR      R2,[R0, #+8]
        B.N      ??ADC_SoftwareStartInjectedConvCmd_1
??ADC_SoftwareStartInjectedConvCmd_0:
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0x208000
        STR      R2,[R0, #+8]
??ADC_SoftwareStartInjectedConvCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetSoftwareStartInjectedConvCmdStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,[R1, #+8]
        LSLS     R2,R2,#+10
        BPL.N    ??ADC_GetSoftwareStartInjectedConvCmdStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??ADC_GetSoftwareStartInjectedConvCmdStatus_1
??ADC_GetSoftwareStartInjectedConvCmdStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??ADC_GetSoftwareStartInjectedConvCmdStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_InjectedChannelConfig:
        PUSH     {R4-R7,LR}
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BLT.N    ??ADC_InjectedChannelConfig_0
        LDR      R7,[R0, #+12]
        MOVS     R6,R7
        MOVS     R7,#+7
        SUBS     R12,R1,#+10
        MOVS     LR,#+3
        MUL      R12,LR,R12
        LSLS     R7,R7,R12
        MOVS     R4,R7
        BICS     R6,R6,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R7,R1,#+10
        MOVS     R12,#+3
        MUL      R7,R12,R7
        LSLS     R7,R3,R7
        MOVS     R4,R7
        ORRS     R6,R4,R6
        STR      R6,[R0, #+12]
        B.N      ??ADC_InjectedChannelConfig_1
??ADC_InjectedChannelConfig_0:
        LDR      R7,[R0, #+16]
        MOVS     R6,R7
        MOVS     R7,#+7
        MOVS     R12,#+3
        MUL      R12,R12,R1
        LSLS     R7,R7,R12
        MOVS     R4,R7
        BICS     R6,R6,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R7,#+3
        MUL      R7,R7,R1
        LSLS     R7,R3,R7
        MOVS     R4,R7
        ORRS     R6,R4,R6
        STR      R6,[R0, #+16]
??ADC_InjectedChannelConfig_1:
        LDR      R7,[R0, #+56]
        MOVS     R6,R7
        UBFX     R7,R6,#+20,#+2
        MOVS     R5,R7
        MOVS     R7,#+31
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R12,R2,#+3
        SUBS     R12,R12,R5
        SUBS     R12,R12,#+1
        MOVS     LR,#+5
        MUL      R12,LR,R12
        LSLS     R7,R7,R12
        MOVS     R4,R7
        BICS     R6,R6,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R7,R2,#+3
        SUBS     R7,R7,R5
        SUBS     R7,R7,#+1
        MOVS     R12,#+5
        MUL      R7,R12,R7
        LSLS     R7,R1,R7
        MOVS     R4,R7
        ORRS     R6,R4,R6
        STR      R6,[R0, #+56]
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_InjectedSequencerLengthConfig:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR      R4,[R0, #+56]
        MOVS     R2,R4
        BICS     R2,R2,#0x300000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R4,R1,#+1
        MOVS     R3,R4
        ORRS     R2,R2,R3, LSL #+20
        STR      R2,[R0, #+56]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_SetInjectedOffset:
        SUB      SP,SP,#+4
        MOVS     R3,#+0
        STR      R3,[SP, #+0]
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R1,R3
        STR      R3,[SP, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR      R3,[SP, #+0]
        STR      R2,[R3, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetInjectedConversionValue:
        SUB      SP,SP,#+4
        MOVS     R2,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        STR      R2,[SP, #+0]
        LDR      R0,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R1,#+40
        ADDS     R0,R3,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogCmd:
        MOVS     R2,#+0
        LDR      R3,[R0, #+4]
        MOVS     R2,R3
        LDR.N    R3,??DataTable4_6  ;; 0xff3ffdff
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogThresholdsConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+36]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogSingleChannelConfig:
        MOVS     R2,#+0
        LDR      R3,[R0, #+4]
        MOVS     R2,R3
        LSRS     R2,R2,#+5
        LSLS     R2,R2,#+5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_TempSensorVrefintCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??ADC_TempSensorVrefintCmd_0
        LDR.N    R1,??DataTable4_7  ;; 0x40012408
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x800000
        LDR.N    R2,??DataTable4_7  ;; 0x40012408
        STR      R1,[R2, #+0]
        B.N      ??ADC_TempSensorVrefintCmd_1
??ADC_TempSensorVrefintCmd_0:
        LDR.N    R1,??DataTable4_7  ;; 0x40012408
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x800000
        LDR.N    R2,??DataTable4_7  ;; 0x40012408
        STR      R1,[R2, #+0]
??ADC_TempSensorVrefintCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40012800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40013c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0xfff0feff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0xfff1f7fd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x4001244c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0xff3ffdff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40012408

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetFlagStatus:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R3,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        TST      R3,R1
        BEQ.N    ??ADC_GetFlagStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??ADC_GetFlagStatus_1
??ADC_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??ADC_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ClearFlag:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MVNS     R2,R1
        STR      R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetITStatus:
        PUSH     {R4-R6}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R5,R1,#+8
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R3,R5
        LDR      R5,[R2, #+4]
        MOVS     R6,R1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ANDS     R5,R6,R5
        MOVS     R4,R5
        LDR      R5,[R2, #+0]
        TST      R5,R3
        BEQ.N    ??ADC_GetITStatus_0
        CMP      R4,#+0
        BEQ.N    ??ADC_GetITStatus_0
        MOVS     R5,#+1
        MOVS     R0,R5
        B.N      ??ADC_GetITStatus_1
??ADC_GetITStatus_0:
        MOVS     R5,#+0
        MOVS     R0,R5
??ADC_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ClearITPendingBit:
        MOVS     R2,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R3,R1,#+8
        MOVS     R2,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MVNS     R3,R2
        STR      R3,[R0, #+0]
        BX       LR               ;; return

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
// 1 362 bytes in section .text
// 
// 1 362 bytes of CODE memory
//
//Errors: none
//Warnings: none
