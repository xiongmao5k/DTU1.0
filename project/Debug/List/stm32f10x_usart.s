///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:48
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -On --vla
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
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable1  ;; 0x40013800
        CMP      R4,R0
        BNE.N    ??USART_DeInit_0
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_0:
        LDR.N    R0,??DataTable1_1  ;; 0x40004400
        CMP      R4,R0
        BNE.N    ??USART_DeInit_2
        MOVS     R1,#+1
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_2:
        LDR.N    R0,??DataTable1_2  ;; 0x40004800
        CMP      R4,R0
        BNE.N    ??USART_DeInit_3
        MOVS     R1,#+1
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_3:
        LDR.N    R0,??DataTable1_3  ;; 0x40004c00
        CMP      R4,R0
        BNE.N    ??USART_DeInit_4
        MOVS     R1,#+1
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
??USART_DeInit_4:
        LDR.N    R0,??DataTable1_4  ;; 0x40005000
        CMP      R4,R0
        BNE.N    ??USART_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
??USART_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Init:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R8,#+0
        MOVS     R9,#+0
        MOVS     R10,#+0
        LDRH     R0,[R5, #+12]
        CMP      R0,#+0
??USART_Init_0:
        MOV      R10,R4
        LDRH     R0,[R4, #+16]
        MOVS     R6,R0
        MOVW     R0,#+53247
        ANDS     R6,R0,R6
        LDRH     R0,[R5, #+6]
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+16]
        LDRH     R0,[R4, #+12]
        MOVS     R6,R0
        MOVW     R0,#+59891
        ANDS     R6,R0,R6
        LDRH     R0,[R5, #+4]
        LDRH     R1,[R5, #+8]
        ORRS     R0,R1,R0
        LDRH     R1,[R5, #+10]
        ORRS     R0,R1,R0
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+12]
        LDRH     R0,[R4, #+20]
        MOVS     R6,R0
        MOVW     R0,#+64767
        ANDS     R6,R0,R6
        LDRH     R0,[R5, #+12]
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+20]
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR.N    R0,??DataTable1  ;; 0x40013800
        CMP      R10,R0
        BNE.N    ??USART_Init_1
        LDR      R0,[SP, #+12]
        MOVS     R7,R0
        B.N      ??USART_Init_2
??USART_Init_1:
        LDR      R0,[SP, #+8]
        MOVS     R7,R0
??USART_Init_2:
        LDRH     R0,[R4, #+12]
        LSLS     R0,R0,#+16
        BPL.N    ??USART_Init_3
        MOVS     R0,#+25
        MUL      R0,R0,R7
        LDR      R1,[R5, #+0]
        LSLS     R1,R1,#+1
        UDIV     R0,R0,R1
        MOV      R8,R0
        B.N      ??USART_Init_4
??USART_Init_3:
        MOVS     R0,#+25
        MUL      R0,R0,R7
        LDR      R1,[R5, #+0]
        LSLS     R1,R1,#+2
        UDIV     R0,R0,R1
        MOV      R8,R0
??USART_Init_4:
        MOVS     R0,#+100
        UDIV     R0,R8,R0
        LSLS     R0,R0,#+4
        MOVS     R6,R0
        LSRS     R0,R6,#+4
        MOVS     R1,#+100
        MLS      R0,R1,R0,R8
        MOV      R9,R0
        LDRH     R0,[R4, #+12]
        LSLS     R0,R0,#+16
        BPL.N    ??USART_Init_5
        LSLS     R0,R9,#+3
        ADDS     R0,R0,#+50
        MOVS     R1,#+100
        UDIV     R0,R0,R1
        ANDS     R0,R0,#0x7
        ORRS     R6,R0,R6
        B.N      ??USART_Init_6
??USART_Init_5:
        LSLS     R0,R9,#+4
        ADDS     R0,R0,#+50
        MOVS     R1,#+100
        UDIV     R0,R0,R1
        ANDS     R0,R0,#0xF
        ORRS     R6,R0,R6
??USART_Init_6:
        STRH     R6,[R4, #+8]
        ADD      SP,SP,#+24
        POP      {R4-R10,PC}      ;; return

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
        LDRH     R3,[R0, #+16]
        MOVS     R2,R3
        MOVW     R3,#+61695
        ANDS     R2,R3,R2
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+6]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
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
        LDRH     R2,[R0, #+12]
        ORRS     R2,R2,#0x2000
        STRH     R2,[R0, #+12]
        B.N      ??USART_Cmd_1
??USART_Cmd_0:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+57343
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
??USART_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ITConfig:
        PUSH     {R4-R7}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R7,#+2410
        CMP      R1,R7
??USART_ITConfig_0:
        MOVS     R6,R0
        MOVS     R7,R1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSRS     R7,R7,#+5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R3,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R7,R1,#0x1F
        MOVS     R4,R7
        MOVS     R7,#+1
        LSLS     R7,R7,R4
        MOVS     R5,R7
        CMP      R3,#+1
        BNE.N    ??USART_ITConfig_1
        ADDS     R6,R6,#+12
        B.N      ??USART_ITConfig_2
??USART_ITConfig_1:
        CMP      R3,#+2
        BNE.N    ??USART_ITConfig_3
        ADDS     R6,R6,#+16
        B.N      ??USART_ITConfig_2
??USART_ITConfig_3:
        ADDS     R6,R6,#+20
??USART_ITConfig_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_ITConfig_4
        LDR      R7,[R6, #+0]
        ORRS     R7,R5,R7
        STR      R7,[R6, #+0]
        B.N      ??USART_ITConfig_5
??USART_ITConfig_4:
        LDR      R7,[R6, #+0]
        BICS     R7,R7,R5
        STR      R7,[R6, #+0]
??USART_ITConfig_5:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_DMACmd_0
        LDRH     R3,[R0, #+20]
        ORRS     R3,R1,R3
        STRH     R3,[R0, #+20]
        B.N      ??USART_DMACmd_1
??USART_DMACmd_0:
        LDRH     R3,[R0, #+20]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+20]
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
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_WakeUpConfig:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
        LDRH     R2,[R0, #+12]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiverWakeUpCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_ReceiverWakeUpCmd_0
        LDRH     R2,[R0, #+12]
        ORRS     R2,R2,#0x2
        STRH     R2,[R0, #+12]
        B.N      ??USART_ReceiverWakeUpCmd_1
??USART_ReceiverWakeUpCmd_0:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
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
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_LINCmd_0
        LDRH     R2,[R0, #+16]
        ORRS     R2,R2,#0x4000
        STRH     R2,[R0, #+16]
        B.N      ??USART_LINCmd_1
??USART_LINCmd_0:
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+49151
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+16]
??USART_LINCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SendData:
        LSLS     R2,R1,#+23       ;; ZeroExtS R2,R1,#+23,#+23
        LSRS     R2,R2,#+23
        STRH     R2,[R0, #+4]
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
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetPrescaler:
        LDRH     R2,[R0, #+24]
        ANDS     R2,R2,#0xFF00
        STRH     R2,[R0, #+24]
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardCmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x20
        STRH     R2,[R0, #+20]
        B.N      ??USART_SmartCardCmd_1
??USART_SmartCardCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65503
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
??USART_SmartCardCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardNACKCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardNACKCmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x10
        STRH     R2,[R0, #+20]
        B.N      ??USART_SmartCardNACKCmd_1
??USART_SmartCardNACKCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65519
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
??USART_SmartCardNACKCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_HalfDuplexCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_HalfDuplexCmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x8
        STRH     R2,[R0, #+20]
        B.N      ??USART_HalfDuplexCmd_1
??USART_HalfDuplexCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
??USART_HalfDuplexCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OverSampling8Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_OverSampling8Cmd_0
        LDRH     R2,[R0, #+12]
        ORRS     R2,R2,#0x8000
        STRH     R2,[R0, #+12]
        B.N      ??USART_OverSampling8Cmd_1
??USART_OverSampling8Cmd_0:
        LDRH     R2,[R0, #+12]
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
        STRH     R2,[R0, #+12]
??USART_OverSampling8Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OneBitMethodCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_OneBitMethodCmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x800
        STRH     R2,[R0, #+20]
        B.N      ??USART_OneBitMethodCmd_1
??USART_OneBitMethodCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
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
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_IrDACmd_0
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x2
        STRH     R2,[R0, #+20]
        B.N      ??USART_IrDACmd_1
??USART_IrDACmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
??USART_IrDACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetFlagStatus:
        MOVS     R2,R0
        MOVS     R0,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+512
??USART_GetFlagStatus_0:
        LDRH     R3,[R2, #+0]
        TST      R3,R1
        BEQ.N    ??USART_GetFlagStatus_1
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??USART_GetFlagStatus_2
??USART_GetFlagStatus_1:
        MOVS     R3,#+0
        MOVS     R0,R3
??USART_GetFlagStatus_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R2,R1,#+22
??USART_ClearFlag_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R1
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetITStatus:
        PUSH     {R4-R6}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
        MOVS     R0,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R6,#+2410
        CMP      R1,R6
??USART_GetITStatus_0:
        MOVS     R6,R1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R6,R6,#+5
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R4,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R6,R1,#0x1F
        MOVS     R5,R6
        MOVS     R6,#+1
        LSLS     R5,R6,R5
        CMP      R4,#+1
        BNE.N    ??USART_GetITStatus_1
        LDRH     R6,[R2, #+12]
        ANDS     R5,R6,R5
        B.N      ??USART_GetITStatus_2
??USART_GetITStatus_1:
        CMP      R4,#+2
        BNE.N    ??USART_GetITStatus_3
        LDRH     R6,[R2, #+16]
        ANDS     R5,R6,R5
        B.N      ??USART_GetITStatus_2
??USART_GetITStatus_3:
        LDRH     R6,[R2, #+20]
        ANDS     R5,R6,R5
??USART_GetITStatus_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R6,R1,#+8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R3,R6
        MOVS     R6,#+1
        LSLS     R3,R6,R3
        LDRH     R6,[R2, #+0]
        ANDS     R3,R6,R3
        CMP      R5,#+0
        BEQ.N    ??USART_GetITStatus_4
        CMP      R3,#+0
        BEQ.N    ??USART_GetITStatus_4
        MOVS     R6,#+1
        MOVS     R0,R6
        B.N      ??USART_GetITStatus_5
??USART_GetITStatus_4:
        MOVS     R6,#+0
        MOVS     R0,R6
??USART_GetITStatus_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearITPendingBit:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R4,#+2410
        CMP      R1,R4
??USART_ClearITPendingBit_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R4,R1,#+8
        MOVS     R2,R4
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        MOVS     R3,R4
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MVNS     R4,R3
        STRH     R4,[R0, #+0]
        POP      {R4}
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
// 1 150 bytes in section .text
// 
// 1 150 bytes of CODE memory
//
//Errors: none
//Warnings: none
