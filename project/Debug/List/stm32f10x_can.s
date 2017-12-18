///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_can.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_can.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_can.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC CAN_CancelTransmit
        PUBLIC CAN_ClearFlag
        PUBLIC CAN_ClearITPendingBit
        PUBLIC CAN_DBGFreeze
        PUBLIC CAN_DeInit
        PUBLIC CAN_FIFORelease
        PUBLIC CAN_FilterInit
        PUBLIC CAN_GetFlagStatus
        PUBLIC CAN_GetITStatus
        PUBLIC CAN_GetLSBTransmitErrorCounter
        PUBLIC CAN_GetLastErrorCode
        PUBLIC CAN_GetReceiveErrorCounter
        PUBLIC CAN_ITConfig
        PUBLIC CAN_Init
        PUBLIC CAN_MessagePending
        PUBLIC CAN_OperatingModeRequest
        PUBLIC CAN_Receive
        PUBLIC CAN_SlaveStartBank
        PUBLIC CAN_Sleep
        PUBLIC CAN_StructInit
        PUBLIC CAN_TTComModeCmd
        PUBLIC CAN_Transmit
        PUBLIC CAN_TransmitStatus
        PUBLIC CAN_WakeUp


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_DeInit:
        PUSH     {R7,LR}
        LDR.W    R1,??DataTable6  ;; 0x40006400
        CMP      R0,R1
        BNE.N    ??CAN_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+33554432
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+33554432
        BL       RCC_APB1PeriphResetCmd
        B.N      ??CAN_DeInit_1
??CAN_DeInit_0:
        MOVS     R1,#+1
        MOVS     R0,#+67108864
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+67108864
        BL       RCC_APB1PeriphResetCmd
??CAN_DeInit_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_Init:
        MOVS     R2,#+0
        MOVS     R2,#+0
        LDR      R3,[R0, #+0]
        BICS     R3,R3,#0x2
        STR      R3,[R0, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,#0x1
        STR      R3,[R0, #+0]
        B.N      ??CAN_Init_0
??CAN_Init_1:
        ADDS     R2,R2,#+1
??CAN_Init_0:
        LDR      R3,[R0, #+4]
        LSLS     R3,R3,#+31
        BMI.N    ??CAN_Init_2
        MOVW     R3,#+65535
        CMP      R2,R3
        BNE.N    ??CAN_Init_1
??CAN_Init_2:
        LDR      R2,[R0, #+4]
        LSLS     R2,R2,#+31
        BMI.N    ??CAN_Init_3
        MOVS     R2,#+0
        B.N      ??CAN_Init_4
??CAN_Init_3:
        LDRB     R2,[R1, #+6]
        CMP      R2,#+1
        BNE.N    ??CAN_Init_5
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x80
        STR      R2,[R0, #+0]
        B.N      ??CAN_Init_6
??CAN_Init_5:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x80
        STR      R2,[R0, #+0]
??CAN_Init_6:
        LDRB     R2,[R1, #+7]
        CMP      R2,#+1
        BNE.N    ??CAN_Init_7
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x40
        STR      R2,[R0, #+0]
        B.N      ??CAN_Init_8
??CAN_Init_7:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x40
        STR      R2,[R0, #+0]
??CAN_Init_8:
        LDRB     R2,[R1, #+8]
        CMP      R2,#+1
        BNE.N    ??CAN_Init_9
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x20
        STR      R2,[R0, #+0]
        B.N      ??CAN_Init_10
??CAN_Init_9:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x20
        STR      R2,[R0, #+0]
??CAN_Init_10:
        LDRB     R2,[R1, #+9]
        CMP      R2,#+1
        BNE.N    ??CAN_Init_11
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x10
        STR      R2,[R0, #+0]
        B.N      ??CAN_Init_12
??CAN_Init_11:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x10
        STR      R2,[R0, #+0]
??CAN_Init_12:
        LDRB     R2,[R1, #+10]
        CMP      R2,#+1
        BNE.N    ??CAN_Init_13
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x8
        STR      R2,[R0, #+0]
        B.N      ??CAN_Init_14
??CAN_Init_13:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x8
        STR      R2,[R0, #+0]
??CAN_Init_14:
        LDRB     R2,[R1, #+11]
        CMP      R2,#+1
        BNE.N    ??CAN_Init_15
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x4
        STR      R2,[R0, #+0]
        B.N      ??CAN_Init_16
??CAN_Init_15:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x4
        STR      R2,[R0, #+0]
??CAN_Init_16:
        LDRB     R2,[R1, #+2]
        LDRB     R3,[R1, #+3]
        LSLS     R3,R3,#+24
        ORRS     R2,R3,R2, LSL #+30
        LDRB     R3,[R1, #+4]
        ORRS     R2,R2,R3, LSL #+16
        LDRB     R3,[R1, #+5]
        ORRS     R2,R2,R3, LSL #+20
        LDRH     R1,[R1, #+0]
        SUBS     R1,R1,#+1
        ORRS     R1,R1,R2
        STR      R1,[R0, #+28]
        LDR      R1,[R0, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+0]
        MOVS     R2,#+0
        B.N      ??CAN_Init_17
??CAN_Init_18:
        ADDS     R2,R2,#+1
??CAN_Init_17:
        LDR      R1,[R0, #+4]
        LSLS     R1,R1,#+31
        BPL.N    ??CAN_Init_19
        MOVW     R1,#+65535
        CMP      R2,R1
        BNE.N    ??CAN_Init_18
??CAN_Init_19:
        LDR      R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??CAN_Init_20
        MOVS     R2,#+0
        B.N      ??CAN_Init_4
??CAN_Init_20:
        MOVS     R2,#+1
??CAN_Init_4:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_FilterInit:
        PUSH     {R4}
        MOVS     R1,#+0
        MOVS     R1,#+1
        LDRB     R2,[R0, #+10]
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable6_1  ;; 0x40006600
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1
        LDR.W    R3,??DataTable6_1  ;; 0x40006600
        STR      R2,[R3, #+0]
        LDR.W    R2,??DataTable6_2  ;; 0x4000661c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.W    R3,??DataTable6_2  ;; 0x4000661c
        STR      R2,[R3, #+0]
        LDRB     R2,[R0, #+12]
        CMP      R2,#+0
        BNE.N    ??CAN_FilterInit_0
        LDR.W    R2,??DataTable6_3  ;; 0x4000660c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.W    R3,??DataTable6_3  ;; 0x4000660c
        STR      R2,[R3, #+0]
        LDRH     R2,[R0, #+6]
        LDRH     R3,[R0, #+2]
        ORRS     R2,R3,R2, LSL #+16
        LDR.W    R3,??DataTable6_4  ;; 0x40006640
        LDRB     R4,[R0, #+10]
        STR      R2,[R3, R4, LSL #+3]
        LDR.W    R2,??DataTable6_4  ;; 0x40006640
        LDRB     R3,[R0, #+10]
        ADDS     R2,R2,R3, LSL #+3
        LDRH     R3,[R0, #+4]
        LDRH     R4,[R0, #+0]
        ORRS     R3,R4,R3, LSL #+16
        STR      R3,[R2, #+4]
??CAN_FilterInit_0:
        LDRB     R2,[R0, #+12]
        CMP      R2,#+1
        BNE.N    ??CAN_FilterInit_1
        LDR.W    R2,??DataTable6_3  ;; 0x4000660c
        LDR      R2,[R2, #+0]
        ORRS     R2,R1,R2
        LDR.W    R3,??DataTable6_3  ;; 0x4000660c
        STR      R2,[R3, #+0]
        LDRH     R2,[R0, #+0]
        LDRH     R3,[R0, #+2]
        ORRS     R2,R3,R2, LSL #+16
        LDR.W    R3,??DataTable6_4  ;; 0x40006640
        LDRB     R4,[R0, #+10]
        STR      R2,[R3, R4, LSL #+3]
        LDR.W    R2,??DataTable6_4  ;; 0x40006640
        LDRB     R3,[R0, #+10]
        ADDS     R2,R2,R3, LSL #+3
        LDRH     R3,[R0, #+4]
        LDRH     R4,[R0, #+6]
        ORRS     R3,R4,R3, LSL #+16
        STR      R3,[R2, #+4]
??CAN_FilterInit_1:
        LDRB     R2,[R0, #+11]
        CMP      R2,#+0
        BNE.N    ??CAN_FilterInit_2
        LDR.W    R2,??DataTable6_5  ;; 0x40006604
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.W    R3,??DataTable6_5  ;; 0x40006604
        STR      R2,[R3, #+0]
        B.N      ??CAN_FilterInit_3
??CAN_FilterInit_2:
        LDR.W    R2,??DataTable6_5  ;; 0x40006604
        LDR      R2,[R2, #+0]
        ORRS     R2,R1,R2
        LDR.W    R3,??DataTable6_5  ;; 0x40006604
        STR      R2,[R3, #+0]
??CAN_FilterInit_3:
        LDRH     R2,[R0, #+8]
        CMP      R2,#+0
        BNE.N    ??CAN_FilterInit_4
        LDR.W    R2,??DataTable6_6  ;; 0x40006614
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.W    R3,??DataTable6_6  ;; 0x40006614
        STR      R2,[R3, #+0]
??CAN_FilterInit_4:
        LDRH     R2,[R0, #+8]
        CMP      R2,#+1
        BNE.N    ??CAN_FilterInit_5
        LDR.W    R2,??DataTable6_6  ;; 0x40006614
        LDR      R2,[R2, #+0]
        ORRS     R2,R1,R2
        LDR.W    R3,??DataTable6_6  ;; 0x40006614
        STR      R2,[R3, #+0]
??CAN_FilterInit_5:
        LDRB     R0,[R0, #+13]
        CMP      R0,#+1
        BNE.N    ??CAN_FilterInit_6
        LDR.W    R0,??DataTable6_2  ;; 0x4000661c
        LDR      R0,[R0, #+0]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable6_2  ;; 0x4000661c
        STR      R0,[R1, #+0]
??CAN_FilterInit_6:
        LDR.W    R0,??DataTable6_1  ;; 0x40006600
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable6_1  ;; 0x40006600
        STR      R0,[R1, #+0]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_StructInit:
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        MOVS     R1,#+0
        STRB     R1,[R0, #+7]
        MOVS     R1,#+0
        STRB     R1,[R0, #+8]
        MOVS     R1,#+0
        STRB     R1,[R0, #+9]
        MOVS     R1,#+0
        STRB     R1,[R0, #+10]
        MOVS     R1,#+0
        STRB     R1,[R0, #+11]
        MOVS     R1,#+0
        STRB     R1,[R0, #+2]
        MOVS     R1,#+0
        STRB     R1,[R0, #+3]
        MOVS     R1,#+3
        STRB     R1,[R0, #+4]
        MOVS     R1,#+2
        STRB     R1,[R0, #+5]
        MOVS     R1,#+1
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_SlaveStartBank:
        LDR.W    R1,??DataTable6_1  ;; 0x40006600
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.W    R2,??DataTable6_1  ;; 0x40006600
        STR      R1,[R2, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x40006600
        LDR      R1,[R1, #+0]
        LDR.W    R2,??DataTable6_7  ;; 0xffffc0f1
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable6_1  ;; 0x40006600
        STR      R1,[R2, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x40006600
        LDR      R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R0,R1,R0, LSL #+8
        LDR.W    R1,??DataTable6_1  ;; 0x40006600
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable6_1  ;; 0x40006600
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable6_1  ;; 0x40006600
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_DBGFreeze:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??CAN_DBGFreeze_0
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0x10000
        STR      R1,[R0, #+0]
        B.N      ??CAN_DBGFreeze_1
??CAN_DBGFreeze_0:
        LDR      R1,[R0, #+0]
        BICS     R1,R1,#0x10000
        STR      R1,[R0, #+0]
??CAN_DBGFreeze_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_TTComModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??CAN_TTComModeCmd_0
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0x80
        STR      R1,[R0, #+0]
        LDR      R1,[R0, #+388]
        ORRS     R1,R1,#0x100
        STR      R1,[R0, #+388]
        LDR      R1,[R0, #+404]
        ORRS     R1,R1,#0x100
        STR      R1,[R0, #+404]
        LDR      R1,[R0, #+420]
        ORRS     R1,R1,#0x100
        STR      R1,[R0, #+420]
        B.N      ??CAN_TTComModeCmd_1
??CAN_TTComModeCmd_0:
        LDR      R1,[R0, #+0]
        BICS     R1,R1,#0x80
        STR      R1,[R0, #+0]
        LDR      R1,[R0, #+388]
        BICS     R1,R1,#0x100
        STR      R1,[R0, #+388]
        LDR      R1,[R0, #+404]
        BICS     R1,R1,#0x100
        STR      R1,[R0, #+404]
        LDR      R1,[R0, #+420]
        BICS     R1,R1,#0x100
        STR      R1,[R0, #+420]
??CAN_TTComModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_Transmit:
        PUSH     {R4,R5}
        MOVS     R2,#+0
        LDR      R2,[R0, #+8]
        LSLS     R2,R2,#+5
        BPL.N    ??CAN_Transmit_0
        MOVS     R2,#+0
        B.N      ??CAN_Transmit_1
??CAN_Transmit_0:
        LDR      R2,[R0, #+8]
        LSLS     R2,R2,#+4
        BPL.N    ??CAN_Transmit_2
        MOVS     R2,#+1
        B.N      ??CAN_Transmit_1
??CAN_Transmit_2:
        LDR      R2,[R0, #+8]
        LSLS     R2,R2,#+3
        BPL.N    ??CAN_Transmit_3
        MOVS     R2,#+2
        B.N      ??CAN_Transmit_1
??CAN_Transmit_3:
        MOVS     R2,#+4
??CAN_Transmit_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+4
        BEQ.N    ??CAN_Transmit_4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+4
        LDR      R3,[R3, #+384]
        ANDS     R3,R3,#0x1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R0,R2, LSL #+4
        STR      R3,[R4, #+384]
        LDRB     R3,[R1, #+8]
        CMP      R3,#+0
        BNE.N    ??CAN_Transmit_5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+4
        LDR      R3,[R3, #+384]
        LDR      R4,[R1, #+0]
        LDRB     R5,[R1, #+9]
        ORRS     R4,R5,R4, LSL #+21
        ORRS     R3,R4,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R0,R2, LSL #+4
        STR      R3,[R4, #+384]
        B.N      ??CAN_Transmit_6
??CAN_Transmit_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+4
        LDR      R3,[R3, #+384]
        LDR      R4,[R1, #+4]
        LDRB     R5,[R1, #+8]
        ORRS     R4,R5,R4, LSL #+3
        LDRB     R5,[R1, #+9]
        ORRS     R4,R5,R4
        ORRS     R3,R4,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R0,R2, LSL #+4
        STR      R3,[R4, #+384]
??CAN_Transmit_6:
        LDRB     R3,[R1, #+10]
        ANDS     R3,R3,#0xF
        STRB     R3,[R1, #+10]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+4
        LDR      R3,[R3, #+388]
        LSRS     R3,R3,#+4
        LSLS     R3,R3,#+4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R0,R2, LSL #+4
        STR      R3,[R4, #+388]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+4
        LDR      R3,[R3, #+388]
        LDRB     R4,[R1, #+10]
        ORRS     R3,R4,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R0,R2, LSL #+4
        STR      R3,[R4, #+388]
        LDRB     R3,[R1, #+14]
        LDRB     R4,[R1, #+13]
        LSLS     R4,R4,#+16
        ORRS     R3,R4,R3, LSL #+24
        LDRB     R4,[R1, #+12]
        ORRS     R3,R3,R4, LSL #+8
        LDRB     R4,[R1, #+11]
        ORRS     R3,R4,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R0,R2, LSL #+4
        STR      R3,[R4, #+392]
        LDRB     R3,[R1, #+18]
        LDRB     R4,[R1, #+17]
        LSLS     R4,R4,#+16
        ORRS     R3,R4,R3, LSL #+24
        LDRB     R4,[R1, #+16]
        ORRS     R3,R3,R4, LSL #+8
        LDRB     R1,[R1, #+15]
        ORRS     R1,R1,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+4
        STR      R1,[R3, #+396]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R1,R0,R2, LSL #+4
        LDR      R1,[R1, #+384]
        ORRS     R1,R1,#0x1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R0,R0,R2, LSL #+4
        STR      R1,[R0, #+384]
??CAN_Transmit_4:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_TransmitStatus:
        MOVS     R2,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??CAN_TransmitStatus_0
        CMP      R1,#+2
        BEQ.N    ??CAN_TransmitStatus_1
        BCC.N    ??CAN_TransmitStatus_2
        B.N      ??CAN_TransmitStatus_3
??CAN_TransmitStatus_0:
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable6_8  ;; 0x4000003
        ANDS     R2,R1,R0
        B.N      ??CAN_TransmitStatus_4
??CAN_TransmitStatus_2:
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable6_9  ;; 0x8000300
        ANDS     R2,R1,R0
        B.N      ??CAN_TransmitStatus_4
??CAN_TransmitStatus_1:
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable6_10  ;; 0x10030000
        ANDS     R2,R1,R0
        B.N      ??CAN_TransmitStatus_4
??CAN_TransmitStatus_3:
        MOVS     R2,#+0
??CAN_TransmitStatus_4:
        CMP      R2,#+0
        BEQ.N    ??CAN_TransmitStatus_5
        LDR.W    R0,??DataTable6_11  ;; 0x4000001
        SUBS     R2,R2,R0
        BEQ.N    ??CAN_TransmitStatus_6
        SUBS     R2,R2,#+2
        BEQ.N    ??CAN_TransmitStatus_7
        LDR.W    R0,??DataTable6_12  ;; 0x40000fd
        SUBS     R2,R2,R0
        BEQ.N    ??CAN_TransmitStatus_8
        MOV      R0,#+512
        SUBS     R2,R2,R0
        BEQ.N    ??CAN_TransmitStatus_9
        LDR.W    R0,??DataTable6_13  ;; 0x800fd00
        SUBS     R2,R2,R0
        BEQ.N    ??CAN_TransmitStatus_10
        MOVS     R0,#+131072
        SUBS     R2,R2,R0
        BEQ.N    ??CAN_TransmitStatus_11
        B.N      ??CAN_TransmitStatus_12
??CAN_TransmitStatus_5:
        MOVS     R2,#+2
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_6:
        MOVS     R2,#+0
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_8:
        MOVS     R2,#+0
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_10:
        MOVS     R2,#+0
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_7:
        MOVS     R2,#+1
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_9:
        MOVS     R2,#+1
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_11:
        MOVS     R2,#+1
        B.N      ??CAN_TransmitStatus_13
??CAN_TransmitStatus_12:
        MOVS     R2,#+0
??CAN_TransmitStatus_13:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_CancelTransmit:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??CAN_CancelTransmit_0
        CMP      R1,#+2
        BEQ.N    ??CAN_CancelTransmit_1
        BCC.N    ??CAN_CancelTransmit_2
        B.N      ??CAN_CancelTransmit_3
??CAN_CancelTransmit_0:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x80
        STR      R1,[R0, #+8]
        B.N      ??CAN_CancelTransmit_4
??CAN_CancelTransmit_2:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x8000
        STR      R1,[R0, #+8]
        B.N      ??CAN_CancelTransmit_4
??CAN_CancelTransmit_1:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x800000
        STR      R1,[R0, #+8]
        B.N      ??CAN_CancelTransmit_4
??CAN_CancelTransmit_3:
??CAN_CancelTransmit_4:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_Receive:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+432]
        ANDS     R3,R3,#0x4
        STRB     R3,[R2, #+8]
        LDRB     R3,[R2, #+8]
        CMP      R3,#+0
        BNE.N    ??CAN_Receive_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+432]
        LSRS     R3,R3,#+21
        STR      R3,[R2, #+0]
        B.N      ??CAN_Receive_1
??CAN_Receive_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+432]
        LSRS     R3,R3,#+3
        STR      R3,[R2, #+4]
??CAN_Receive_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+432]
        ANDS     R3,R3,#0x2
        STRB     R3,[R2, #+9]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+436]
        ANDS     R3,R3,#0xF
        STRB     R3,[R2, #+10]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+436]
        LSRS     R3,R3,#+8
        STRB     R3,[R2, #+19]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+440]
        STRB     R3,[R2, #+11]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+440]
        LSRS     R3,R3,#+8
        STRB     R3,[R2, #+12]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+440]
        LSRS     R3,R3,#+16
        STRB     R3,[R2, #+13]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+440]
        LSRS     R3,R3,#+24
        STRB     R3,[R2, #+14]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+444]
        STRB     R3,[R2, #+15]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+444]
        LSRS     R3,R3,#+8
        STRB     R3,[R2, #+16]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+444]
        LSRS     R3,R3,#+16
        STRB     R3,[R2, #+17]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R0,R1, LSL #+4
        LDR      R3,[R3, #+444]
        LSRS     R3,R3,#+24
        STRB     R3,[R2, #+18]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CAN_Receive_2
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x20
        STR      R1,[R0, #+12]
        B.N      ??CAN_Receive_3
??CAN_Receive_2:
        LDR      R1,[R0, #+16]
        ORRS     R1,R1,#0x20
        STR      R1,[R0, #+16]
??CAN_Receive_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_FIFORelease:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CAN_FIFORelease_0
        LDR      R1,[R0, #+12]
        ORRS     R1,R1,#0x20
        STR      R1,[R0, #+12]
        B.N      ??CAN_FIFORelease_1
??CAN_FIFORelease_0:
        LDR      R1,[R0, #+16]
        ORRS     R1,R1,#0x20
        STR      R1,[R0, #+16]
??CAN_FIFORelease_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_MessagePending:
        MOVS     R2,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CAN_MessagePending_0
        LDR      R0,[R0, #+12]
        ANDS     R2,R0,#0x3
        B.N      ??CAN_MessagePending_1
??CAN_MessagePending_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??CAN_MessagePending_2
        LDR      R0,[R0, #+16]
        ANDS     R2,R0,#0x3
        B.N      ??CAN_MessagePending_1
??CAN_MessagePending_2:
        MOVS     R2,#+0
??CAN_MessagePending_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_OperatingModeRequest:
        MOVS     R2,R1
        MOVS     R1,#+0
        MOVW     R1,#+65535
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??CAN_OperatingModeRequest_0
        LDR      R2,[R0, #+0]
        BICS     R2,R2,#0x2
        ORRS     R2,R2,#0x1
        STR      R2,[R0, #+0]
        B.N      ??CAN_OperatingModeRequest_1
??CAN_OperatingModeRequest_2:
        SUBS     R1,R1,#+1
??CAN_OperatingModeRequest_1:
        LDR      R2,[R0, #+4]
        ANDS     R2,R2,#0x3
        CMP      R2,#+1
        BEQ.N    ??CAN_OperatingModeRequest_3
        CMP      R1,#+0
        BNE.N    ??CAN_OperatingModeRequest_2
??CAN_OperatingModeRequest_3:
        LDR      R0,[R0, #+4]
        ANDS     R0,R0,#0x3
        CMP      R0,#+1
        BEQ.N    ??CAN_OperatingModeRequest_4
        MOVS     R1,#+0
        B.N      ??CAN_OperatingModeRequest_5
??CAN_OperatingModeRequest_4:
        MOVS     R1,#+1
        B.N      ??CAN_OperatingModeRequest_5
??CAN_OperatingModeRequest_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??CAN_OperatingModeRequest_6
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,#+2
        LSLS     R2,R2,#+2
        STR      R2,[R0, #+0]
        B.N      ??CAN_OperatingModeRequest_7
??CAN_OperatingModeRequest_8:
        SUBS     R1,R1,#+1
??CAN_OperatingModeRequest_7:
        LDR      R2,[R0, #+4]
        TST      R2,#0x3
        BEQ.N    ??CAN_OperatingModeRequest_9
        CMP      R1,#+0
        BNE.N    ??CAN_OperatingModeRequest_8
??CAN_OperatingModeRequest_9:
        LDR      R0,[R0, #+4]
        TST      R0,#0x3
        BEQ.N    ??CAN_OperatingModeRequest_10
        MOVS     R1,#+0
        B.N      ??CAN_OperatingModeRequest_5
??CAN_OperatingModeRequest_10:
        MOVS     R1,#+1
        B.N      ??CAN_OperatingModeRequest_5
??CAN_OperatingModeRequest_6:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+2
        BNE.N    ??CAN_OperatingModeRequest_11
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+1
        ORRS     R2,R2,#0x2
        STR      R2,[R0, #+0]
        B.N      ??CAN_OperatingModeRequest_12
??CAN_OperatingModeRequest_13:
        SUBS     R1,R1,#+1
??CAN_OperatingModeRequest_12:
        LDR      R2,[R0, #+4]
        ANDS     R2,R2,#0x3
        CMP      R2,#+2
        BEQ.N    ??CAN_OperatingModeRequest_14
        CMP      R1,#+0
        BNE.N    ??CAN_OperatingModeRequest_13
??CAN_OperatingModeRequest_14:
        LDR      R0,[R0, #+4]
        ANDS     R0,R0,#0x3
        CMP      R0,#+2
        BEQ.N    ??CAN_OperatingModeRequest_15
        MOVS     R1,#+0
        B.N      ??CAN_OperatingModeRequest_5
??CAN_OperatingModeRequest_15:
        MOVS     R1,#+1
        B.N      ??CAN_OperatingModeRequest_5
??CAN_OperatingModeRequest_11:
        MOVS     R1,#+0
??CAN_OperatingModeRequest_5:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_Sleep:
        MOVS     R1,#+0
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+1
        ORRS     R2,R2,#0x2
        STR      R2,[R0, #+0]
        LDR      R0,[R0, #+4]
        ANDS     R0,R0,#0x3
        CMP      R0,#+2
        BNE.N    ??CAN_Sleep_0
        MOVS     R1,#+1
??CAN_Sleep_0:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_WakeUp:
        MOVW     R2,#+65535
        MOVS     R1,#+0
        LDR      R3,[R0, #+0]
        BICS     R3,R3,#0x2
        STR      R3,[R0, #+0]
        B.N      ??CAN_WakeUp_0
??CAN_WakeUp_1:
        SUBS     R2,R2,#+1
??CAN_WakeUp_0:
        LDR      R3,[R0, #+4]
        LSLS     R3,R3,#+30
        BPL.N    ??CAN_WakeUp_2
        CMP      R2,#+0
        BNE.N    ??CAN_WakeUp_1
??CAN_WakeUp_2:
        LDR      R0,[R0, #+4]
        LSLS     R0,R0,#+30
        BMI.N    ??CAN_WakeUp_3
        MOVS     R1,#+1
??CAN_WakeUp_3:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_GetLastErrorCode:
        MOVS     R1,#+0
        LDR      R0,[R0, #+24]
        ANDS     R1,R0,#0x70
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_GetReceiveErrorCounter:
        MOVS     R1,#+0
        LDR      R0,[R0, #+24]
        LSRS     R1,R0,#+24
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_GetLSBTransmitErrorCounter:
        MOVS     R1,#+0
        LDR      R0,[R0, #+24]
        LSRS     R1,R0,#+16
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_ITConfig:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??CAN_ITConfig_0
        LDR      R2,[R0, #+20]
        ORRS     R1,R1,R2
        STR      R1,[R0, #+20]
        B.N      ??CAN_ITConfig_1
??CAN_ITConfig_0:
        LDR      R2,[R0, #+20]
        BICS     R1,R2,R1
        STR      R1,[R0, #+20]
??CAN_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_GetFlagStatus:
        MOVS     R2,#+0
        TST      R1,#0xF00000
        BEQ.N    ??CAN_GetFlagStatus_0
        LDR      R0,[R0, #+24]
        ANDS     R0,R1,R0
        LSLS     R0,R0,#+12
        BEQ.N    ??CAN_GetFlagStatus_1
        MOVS     R2,#+1
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_1:
        MOVS     R2,#+0
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_0:
        LSLS     R2,R1,#+7
        BPL.N    ??CAN_GetFlagStatus_3
        LDR      R0,[R0, #+4]
        ANDS     R0,R1,R0
        LSLS     R0,R0,#+12
        BEQ.N    ??CAN_GetFlagStatus_4
        MOVS     R2,#+1
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_4:
        MOVS     R2,#+0
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_3:
        LSLS     R2,R1,#+4
        BPL.N    ??CAN_GetFlagStatus_5
        LDR      R0,[R0, #+8]
        ANDS     R0,R1,R0
        LSLS     R0,R0,#+12
        BEQ.N    ??CAN_GetFlagStatus_6
        MOVS     R2,#+1
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_6:
        MOVS     R2,#+0
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_5:
        LSLS     R2,R1,#+6
        BPL.N    ??CAN_GetFlagStatus_7
        LDR      R0,[R0, #+12]
        ANDS     R0,R1,R0
        LSLS     R0,R0,#+12
        BEQ.N    ??CAN_GetFlagStatus_8
        MOVS     R2,#+1
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_8:
        MOVS     R2,#+0
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_7:
        LDR      R0,[R0, #+16]
        ANDS     R0,R1,R0
        LSLS     R0,R0,#+12
        BEQ.N    ??CAN_GetFlagStatus_9
        MOVS     R2,#+1
        B.N      ??CAN_GetFlagStatus_2
??CAN_GetFlagStatus_9:
        MOVS     R2,#+0
??CAN_GetFlagStatus_2:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_ClearFlag:
        MOVS     R2,#+0
        LDR.N    R2,??DataTable6_14  ;; 0x30f00070
        CMP      R1,R2
        BNE.N    ??CAN_ClearFlag_0
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        B.N      ??CAN_ClearFlag_1
??CAN_ClearFlag_0:
        LSLS     R2,R1,#+12       ;; ZeroExtS R2,R1,#+12,#+12
        LSRS     R2,R2,#+12
        LSLS     R3,R1,#+6
        BPL.N    ??CAN_ClearFlag_2
        STR      R2,[R0, #+12]
        B.N      ??CAN_ClearFlag_1
??CAN_ClearFlag_2:
        LSLS     R3,R1,#+5
        BPL.N    ??CAN_ClearFlag_3
        STR      R2,[R0, #+16]
        B.N      ??CAN_ClearFlag_1
??CAN_ClearFlag_3:
        LSLS     R1,R1,#+4
        BPL.N    ??CAN_ClearFlag_4
        STR      R2,[R0, #+8]
        B.N      ??CAN_ClearFlag_1
??CAN_ClearFlag_4:
        STR      R2,[R0, #+4]
??CAN_ClearFlag_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_GetITStatus:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        LDR      R2,[R0, #+20]
        TST      R2,R1
        BEQ.N    ??CAN_GetITStatus_0
        CMP      R1,#+1
        BEQ.N    ??CAN_GetITStatus_1
        CMP      R1,#+2
        BEQ.N    ??CAN_GetITStatus_2
        CMP      R1,#+4
        BEQ.N    ??CAN_GetITStatus_3
        CMP      R1,#+8
        BEQ.N    ??CAN_GetITStatus_4
        CMP      R1,#+16
        BEQ.N    ??CAN_GetITStatus_5
        CMP      R1,#+32
        BEQ.N    ??CAN_GetITStatus_6
        CMP      R1,#+64
        BEQ.N    ??CAN_GetITStatus_7
        CMP      R1,#+256
        BEQ.N    ??CAN_GetITStatus_8
        CMP      R1,#+512
        BEQ.N    ??CAN_GetITStatus_9
        CMP      R1,#+1024
        BEQ.N    ??CAN_GetITStatus_10
        CMP      R1,#+2048
        BEQ.N    ??CAN_GetITStatus_11
        CMP      R1,#+32768
        BEQ.N    ??CAN_GetITStatus_12
        CMP      R1,#+65536
        BEQ.N    ??CAN_GetITStatus_13
        CMP      R1,#+131072
        BEQ.N    ??CAN_GetITStatus_14
        B.N      ??CAN_GetITStatus_15
??CAN_GetITStatus_1:
        LDR.N    R1,??DataTable6_15  ;; 0x10101
        LDR      R0,[R0, #+8]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_2:
        MOVS     R1,#+3
        LDR      R0,[R0, #+12]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_3:
        MOVS     R1,#+8
        LDR      R0,[R0, #+12]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_4:
        MOVS     R1,#+16
        LDR      R0,[R0, #+12]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_5:
        MOVS     R1,#+3
        LDR      R0,[R0, #+16]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_6:
        MOVS     R1,#+8
        LDR      R0,[R0, #+16]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_7:
        MOVS     R1,#+16
        LDR      R0,[R0, #+16]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_13:
        MOVS     R1,#+8
        LDR      R0,[R0, #+4]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_14:
        MOVS     R1,#+16
        LDR      R0,[R0, #+4]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_8:
        MOVS     R1,#+1
        LDR      R0,[R0, #+24]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_9:
        MOVS     R1,#+2
        LDR      R0,[R0, #+24]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_10:
        MOVS     R1,#+4
        LDR      R0,[R0, #+24]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_11:
        MOVS     R1,#+112
        LDR      R0,[R0, #+24]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_12:
        MOVS     R1,#+4
        LDR      R0,[R0, #+4]
        BL       CheckITStatus
        MOVS     R2,R0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_15:
        MOVS     R2,#+0
        B.N      ??CAN_GetITStatus_16
??CAN_GetITStatus_0:
        MOVS     R2,#+0
??CAN_GetITStatus_16:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CAN_ClearITPendingBit:
        CMP      R1,#+1
        BEQ.N    ??CAN_ClearITPendingBit_0
        CMP      R1,#+4
        BEQ.N    ??CAN_ClearITPendingBit_1
        CMP      R1,#+8
        BEQ.N    ??CAN_ClearITPendingBit_2
        CMP      R1,#+32
        BEQ.N    ??CAN_ClearITPendingBit_3
        CMP      R1,#+64
        BEQ.N    ??CAN_ClearITPendingBit_4
        CMP      R1,#+256
        BEQ.N    ??CAN_ClearITPendingBit_5
        CMP      R1,#+512
        BEQ.N    ??CAN_ClearITPendingBit_6
        CMP      R1,#+1024
        BEQ.N    ??CAN_ClearITPendingBit_7
        CMP      R1,#+2048
        BEQ.N    ??CAN_ClearITPendingBit_8
        CMP      R1,#+32768
        BEQ.N    ??CAN_ClearITPendingBit_9
        CMP      R1,#+65536
        BEQ.N    ??CAN_ClearITPendingBit_10
        CMP      R1,#+131072
        BEQ.N    ??CAN_ClearITPendingBit_11
        B.N      ??CAN_ClearITPendingBit_12
??CAN_ClearITPendingBit_0:
        LDR.N    R1,??DataTable6_15  ;; 0x10101
        STR      R1,[R0, #+8]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_1:
        MOVS     R1,#+8
        STR      R1,[R0, #+12]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_2:
        MOVS     R1,#+16
        STR      R1,[R0, #+12]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_3:
        MOVS     R1,#+8
        STR      R1,[R0, #+16]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_4:
        MOVS     R1,#+16
        STR      R1,[R0, #+16]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_10:
        MOVS     R1,#+8
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_11:
        MOVS     R1,#+16
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_5:
        MOVS     R1,#+4
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_6:
        MOVS     R1,#+4
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_7:
        MOVS     R1,#+4
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_8:
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        MOVS     R1,#+4
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_9:
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        MOVS     R1,#+4
        STR      R1,[R0, #+4]
        B.N      ??CAN_ClearITPendingBit_13
??CAN_ClearITPendingBit_12:
??CAN_ClearITPendingBit_13:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40006400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40006600

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x4000661c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x4000660c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x40006640

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x40006604

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x40006614

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0xffffc0f1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x4000003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x8000300

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x10030000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x4000001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     0x40000fd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     0x800fd00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     0x30f00070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     0x10101

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CheckITStatus:
        MOVS     R2,#+0
        TST      R0,R1
        BEQ.N    ??CheckITStatus_0
        MOVS     R2,#+1
        B.N      ??CheckITStatus_1
??CheckITStatus_0:
        MOVS     R2,#+0
??CheckITStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
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
// 2 548 bytes in section .text
// 
// 2 548 bytes of CODE memory
//
//Errors: none
//Warnings: none
