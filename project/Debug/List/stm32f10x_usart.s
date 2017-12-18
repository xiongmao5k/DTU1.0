///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:27
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_usart.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_usart.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_usart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_ClockStructInit
        PUBLIC USART_Cmd
        PUBLIC USART_DMACmd
        PUBLIC USART_DeInit
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_LINBreakDetectLengthConfig
        PUBLIC USART_LINCmd
        PUBLIC USART_OneBitMethodCmd
        PUBLIC USART_OverSampling8Cmd
        PUBLIC USART_ReceiveData
        PUBLIC USART_ReceiverWakeUpCmd
        PUBLIC USART_SendBreak
        PUBLIC USART_SendData
        PUBLIC USART_SetAddress
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_StructInit
        PUBLIC USART_WakeUpConfig


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable1  ;; 0x40013800
        CMP      R0,R1
        BNE.N    ??USART_DeInit_0
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_0:
        LDR.N    R1,??DataTable1_1  ;; 0x40004400
        CMP      R0,R1
        BNE.N    ??USART_DeInit_2
        MOVS     R1,#+1
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_2:
        LDR.N    R1,??DataTable1_2  ;; 0x40004800
        CMP      R0,R1
        BNE.N    ??USART_DeInit_3
        MOVS     R1,#+1
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_3:
        LDR.N    R1,??DataTable1_3  ;; 0x40004c00
        CMP      R0,R1
        BNE.N    ??USART_DeInit_4
        MOVS     R1,#+1
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_4:
        LDR.N    R1,??DataTable1_4  ;; 0x40005000
        CMP      R0,R1
        BNE.N    ??USART_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
??USART_DeInit_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Init:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R1,#+0
        MOVS     R6,#+0
        LDRH     R0,[R5, #+12]
        CMP      R0,#+0
??USART_Init_0:
        MOVS     R6,R4
        LDRH     R0,[R4, #+16]
        MOVW     R1,#+53247
        ANDS     R0,R1,R0
        LDRH     R1,[R5, #+6]
        ORRS     R0,R1,R0
        STRH     R0,[R4, #+16]
        LDRH     R0,[R4, #+12]
        MOVW     R1,#+59891
        ANDS     R0,R1,R0
        LDRH     R1,[R5, #+4]
        LDRH     R2,[R5, #+8]
        ORRS     R1,R2,R1
        LDRH     R2,[R5, #+10]
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
        STRH     R0,[R4, #+12]
        LDRH     R0,[R4, #+20]
        MOVW     R1,#+64767
        ANDS     R0,R1,R0
        LDRH     R1,[R5, #+12]
        ORRS     R0,R1,R0
        STRH     R0,[R4, #+20]
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR.N    R0,??DataTable1  ;; 0x40013800
        CMP      R6,R0
        BNE.N    ??USART_Init_1
        LDR      R0,[SP, #+12]
        B.N      ??USART_Init_2
??USART_Init_1:
        LDR      R0,[SP, #+8]
??USART_Init_2:
        LDRH     R1,[R4, #+12]
        LSLS     R1,R1,#+16
        BPL.N    ??USART_Init_3
        MOVS     R1,#+25
        MULS     R0,R1,R0
        LDR      R1,[R5, #+0]
        LSLS     R1,R1,#+1
        UDIV     R1,R0,R1
        B.N      ??USART_Init_4
??USART_Init_3:
        MOVS     R1,#+25
        MULS     R0,R1,R0
        LDR      R1,[R5, #+0]
        LSLS     R1,R1,#+2
        UDIV     R1,R0,R1
??USART_Init_4:
        MOVS     R0,#+100
        UDIV     R0,R1,R0
        LSLS     R0,R0,#+4
        LSRS     R2,R0,#+4
        MOVS     R3,#+100
        MLS      R1,R3,R2,R1
        LDRH     R2,[R4, #+12]
        LSLS     R2,R2,#+16
        BPL.N    ??USART_Init_5
        LSLS     R1,R1,#+3
        ADDS     R1,R1,#+50
        MOVS     R2,#+100
        UDIV     R1,R1,R2
        ANDS     R1,R1,#0x7
        ORRS     R0,R1,R0
        B.N      ??USART_Init_6
??USART_Init_5:
        LSLS     R1,R1,#+4
        ADDS     R1,R1,#+50
        MOVS     R2,#+100
        UDIV     R1,R1,R2
        ANDS     R1,R1,#0xF
        ORRS     R0,R1,R0
??USART_Init_6:
        STRH     R0,[R4, #+8]
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40004800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x40004c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40005000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_StructInit:
        MOV      R1,#+9600
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+12
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClockInit:
        PUSH     {R4}
        MOVS     R2,#+0
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+61695
        ANDS     R2,R3,R2
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R1,[R1, #+6]
        ORRS     R1,R1,R3
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+16]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClockStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_Cmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x2000
        STRH     R1,[R0, #+12]
        B.N      ??USART_Cmd_1
??USART_Cmd_0:
        LDRH     R1,[R0, #+12]
        MOVW     R2,#+57343
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+12]
??USART_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ITConfig:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R3,#+2410
        CMP      R1,R3
??USART_ITConfig_0:
        MOVS     R5,R0
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R4,R1,#0x1F
        MOVS     R0,#+1
        LSLS     R4,R0,R4
        CMP      R3,#+1
        BNE.N    ??USART_ITConfig_1
        ADDS     R5,R5,#+12
        B.N      ??USART_ITConfig_2
??USART_ITConfig_1:
        CMP      R3,#+2
        BNE.N    ??USART_ITConfig_3
        ADDS     R5,R5,#+16
        B.N      ??USART_ITConfig_2
??USART_ITConfig_3:
        ADDS     R5,R5,#+20
??USART_ITConfig_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_ITConfig_4
        LDR      R0,[R5, #+0]
        ORRS     R0,R4,R0
        STR      R0,[R5, #+0]
        B.N      ??USART_ITConfig_5
??USART_ITConfig_4:
        LDR      R0,[R5, #+0]
        BICS     R0,R0,R4
        STR      R0,[R5, #+0]
??USART_ITConfig_5:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_DMACmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+20]
        B.N      ??USART_DMACmd_1
??USART_DMACmd_0:
        LDRH     R2,[R0, #+20]
        BICS     R1,R2,R1
        STRH     R1,[R0, #+20]
??USART_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetAddress:
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+65520
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+16]
        LDRH     R2,[R0, #+16]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_WakeUpConfig:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
        LDRH     R2,[R0, #+12]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiverWakeUpCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_ReceiverWakeUpCmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x2
        STRH     R1,[R0, #+12]
        B.N      ??USART_ReceiverWakeUpCmd_1
??USART_ReceiverWakeUpCmd_0:
        LDRH     R1,[R0, #+12]
        MOVW     R2,#+65533
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+12]
??USART_ReceiverWakeUpCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINBreakDetectLengthConfig:
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+65503
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+16]
        LDRH     R2,[R0, #+16]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_LINCmd_0
        LDRH     R1,[R0, #+16]
        ORRS     R1,R1,#0x4000
        STRH     R1,[R0, #+16]
        B.N      ??USART_LINCmd_1
??USART_LINCmd_0:
        LDRH     R1,[R0, #+16]
        MOVW     R2,#+49151
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+16]
??USART_LINCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SendData:
        LSLS     R1,R1,#+23       ;; ZeroExtS R1,R1,#+23,#+23
        LSRS     R1,R1,#+23
        STRH     R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiveData:
        LDRH     R0,[R0, #+4]
        LSLS     R0,R0,#+23       ;; ZeroExtS R0,R0,#+23,#+23
        LSRS     R0,R0,#+23
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SendBreak:
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetGuardTime:
        LDRH     R2,[R0, #+24]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetPrescaler:
        LDRH     R2,[R0, #+24]
        ANDS     R2,R2,#0xFF00
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x20
        STRH     R1,[R0, #+20]
        B.N      ??USART_SmartCardCmd_1
??USART_SmartCardCmd_0:
        LDRH     R1,[R0, #+20]
        MOVW     R2,#+65503
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+20]
??USART_SmartCardCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardNACKCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardNACKCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x10
        STRH     R1,[R0, #+20]
        B.N      ??USART_SmartCardNACKCmd_1
??USART_SmartCardNACKCmd_0:
        LDRH     R1,[R0, #+20]
        MOVW     R2,#+65519
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+20]
??USART_SmartCardNACKCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_HalfDuplexCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_HalfDuplexCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x8
        STRH     R1,[R0, #+20]
        B.N      ??USART_HalfDuplexCmd_1
??USART_HalfDuplexCmd_0:
        LDRH     R1,[R0, #+20]
        MOVW     R2,#+65527
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+20]
??USART_HalfDuplexCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OverSampling8Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_OverSampling8Cmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x8000
        STRH     R1,[R0, #+12]
        B.N      ??USART_OverSampling8Cmd_1
??USART_OverSampling8Cmd_0:
        LDRH     R1,[R0, #+12]
        LSLS     R1,R1,#+17       ;; ZeroExtS R1,R1,#+17,#+17
        LSRS     R1,R1,#+17
        STRH     R1,[R0, #+12]
??USART_OverSampling8Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OneBitMethodCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_OneBitMethodCmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+20]
        B.N      ??USART_OneBitMethodCmd_1
??USART_OneBitMethodCmd_0:
        LDRH     R1,[R0, #+20]
        MOVW     R2,#+63487
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+20]
??USART_OneBitMethodCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDAConfig:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
        LDRH     R2,[R0, #+20]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_IrDACmd_0
        LDRH     R1,[R0, #+20]
        ORRS     R1,R1,#0x2
        STRH     R1,[R0, #+20]
        B.N      ??USART_IrDACmd_1
??USART_IrDACmd_0:
        LDRH     R1,[R0, #+20]
        MOVW     R2,#+65533
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+20]
??USART_IrDACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetFlagStatus:
        MOVS     R2,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+512
??USART_GetFlagStatus_0:
        LDRH     R0,[R0, #+0]
        TST      R0,R1
        BEQ.N    ??USART_GetFlagStatus_1
        MOVS     R2,#+1
        B.N      ??USART_GetFlagStatus_2
??USART_GetFlagStatus_1:
        MOVS     R2,#+0
??USART_GetFlagStatus_2:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R2,R1,#+22
??USART_ClearFlag_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetITStatus:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R2,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R2,#+2410
        CMP      R1,R2
??USART_GetITStatus_0:
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R3,R1,#0x1F
        MOVS     R4,#+1
        LSLS     R3,R4,R3
        CMP      R2,#+1
        BNE.N    ??USART_GetITStatus_1
        LDRH     R2,[R0, #+12]
        ANDS     R3,R2,R3
        B.N      ??USART_GetITStatus_2
??USART_GetITStatus_1:
        CMP      R2,#+2
        BNE.N    ??USART_GetITStatus_3
        LDRH     R2,[R0, #+16]
        ANDS     R3,R2,R3
        B.N      ??USART_GetITStatus_2
??USART_GetITStatus_3:
        LDRH     R2,[R0, #+20]
        ANDS     R3,R2,R3
??USART_GetITStatus_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R2,R1,#+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+1
        LSLS     R2,R1,R2
        LDRH     R0,[R0, #+0]
        ANDS     R2,R0,R2
        CMP      R3,#+0
        BEQ.N    ??USART_GetITStatus_4
        CMP      R2,#+0
        BEQ.N    ??USART_GetITStatus_4
        MOVS     R2,#+1
        B.N      ??USART_GetITStatus_5
??USART_GetITStatus_4:
        MOVS     R2,#+0
??USART_GetITStatus_5:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearITPendingBit:
        MOVS     R2,#+0
        MOVS     R2,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R2,#+2410
        CMP      R1,R2
??USART_ClearITPendingBit_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R2,R1,#+8
        MOVS     R1,#+1
        LSLS     R2,R1,R2
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MVNS     R1,R2
        STRH     R1,[R0, #+0]
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
// 1 088 bytes in section .text
// 
// 1 088 bytes of CODE memory
//
//Errors: none
//Warnings: none
