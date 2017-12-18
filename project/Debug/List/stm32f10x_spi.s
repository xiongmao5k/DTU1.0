///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:26
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_spi.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_spi.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_spi.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC I2S_Cmd
        PUBLIC I2S_Init
        PUBLIC I2S_StructInit
        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRC
        PUBLIC SPI_Cmd
        PUBLIC SPI_DataSizeConfig
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_I2S_ClearFlag
        PUBLIC SPI_I2S_ClearITPendingBit
        PUBLIC SPI_I2S_DMACmd
        PUBLIC SPI_I2S_DeInit
        PUBLIC SPI_I2S_GetFlagStatus
        PUBLIC SPI_I2S_GetITStatus
        PUBLIC SPI_I2S_ITConfig
        PUBLIC SPI_I2S_ReceiveData
        PUBLIC SPI_I2S_SendData
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareConfig
        PUBLIC SPI_SSOutputCmd
        PUBLIC SPI_StructInit
        PUBLIC SPI_TransmitCRC


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable1  ;; 0x40013000
        CMP      R0,R1
        BNE.N    ??SPI_I2S_DeInit_0
        MOVS     R1,#+1
        MOV      R0,#+4096
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+4096
        BL       RCC_APB2PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_1
??SPI_I2S_DeInit_0:
        LDR.N    R1,??DataTable1_1  ;; 0x40003800
        CMP      R0,R1
        BNE.N    ??SPI_I2S_DeInit_2
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB1PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_1
??SPI_I2S_DeInit_2:
        LDR.N    R1,??DataTable1_2  ;; 0x40003c00
        CMP      R0,R1
        BNE.N    ??SPI_I2S_DeInit_1
        MOVS     R1,#+1
        MOV      R0,#+32768
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+32768
        BL       RCC_APB1PeriphResetCmd
??SPI_I2S_DeInit_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Init:
        PUSH     {R4}
        MOVS     R2,#+0
        LDRH     R2,[R0, #+0]
        ANDS     R2,R2,#0x3040
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+6]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+8]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+10]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+12]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+14]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+28]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+28]
        LDRH     R1,[R1, #+16]
        STRH     R1,[R0, #+16]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Init:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R0,#+2
        MOVS     R1,#+0
        MOVS     R7,#+1
        MOVS     R0,#+0
        MOVS     R0,#+0
        LDRH     R0,[R4, #+28]
        MOVW     R1,#+61504
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+28]
        MOVS     R0,#+2
        STRH     R0,[R4, #+32]
        LDRH     R6,[R4, #+28]
        LDR      R0,[R5, #+8]
        CMP      R0,#+2
        BNE.N    ??I2S_Init_0
        MOVS     R1,#+0
        MOVS     R0,#+2
        B.N      ??I2S_Init_1
??I2S_Init_0:
        LDRH     R0,[R5, #+4]
        CMP      R0,#+0
        BNE.N    ??I2S_Init_2
        MOVS     R7,#+1
        B.N      ??I2S_Init_3
??I2S_Init_2:
        MOVS     R7,#+2
??I2S_Init_3:
        LDR.N    R0,??DataTable1_1  ;; 0x40003800
        CMP      R4,R0
        BNE.N    ??I2S_Init_4
        MOVS     R0,#+131072
        B.N      ??I2S_Init_5
??I2S_Init_4:
        MOVS     R0,#+262144
??I2S_Init_5:
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR      R0,[SP, #+0]
        LDRH     R1,[R5, #+6]
        CMP      R1,#+512
        BNE.N    ??I2S_Init_6
        LSRS     R0,R0,#+8
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDR      R1,[R5, #+8]
        UDIV     R0,R0,R1
        ADDS     R0,R0,#+5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??I2S_Init_7
??I2S_Init_6:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSLS     R1,R7,#+5
        UDIV     R0,R0,R1
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDR      R1,[R5, #+8]
        UDIV     R0,R0,R1
        ADDS     R0,R0,#+5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
??I2S_Init_7:
        MOVS     R1,#+10
        UDIV     R0,R0,R1
        ANDS     R1,R0,#0x1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R0,R0,R1
        LSRS     R0,R0,#+1
        LSLS     R1,R1,#+8
??I2S_Init_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        SUBS     R2,R0,#+2
        CMP      R2,#+254
        BCC.N    ??I2S_Init_8
        MOVS     R0,#+2
        MOVS     R1,#+0
??I2S_Init_8:
        LDRH     R2,[R5, #+6]
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
        STRH     R0,[R4, #+32]
        LDRH     R0,[R5, #+0]
        LDRH     R1,[R5, #+2]
        LDRH     R2,[R5, #+4]
        LDRH     R3,[R5, #+12]
        ORRS     R2,R3,R2
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
        ORRS     R0,R0,#0x800
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+28]
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40003c00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
        MOVS     R1,#+7
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+2
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_Cmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x40
        STRH     R1,[R0, #+0]
        B.N      ??SPI_Cmd_1
??SPI_Cmd_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65471
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??SPI_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2S_Cmd_0
        LDRH     R1,[R0, #+28]
        ORRS     R1,R1,#0x400
        STRH     R1,[R0, #+28]
        B.N      ??I2S_Cmd_1
??I2S_Cmd_0:
        LDRH     R1,[R0, #+28]
        MOVW     R2,#+64511
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+28]
??I2S_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ITConfig:
        MOVS     R3,#+0
        MOVS     R3,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R3,R1,#+4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R1,#+1
        LSLS     R3,R1,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SPI_I2S_ITConfig_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R3,R1
        STRH     R1,[R0, #+4]
        B.N      ??SPI_I2S_ITConfig_1
??SPI_I2S_ITConfig_0:
        LDRH     R1,[R0, #+4]
        BICS     R1,R1,R3
        STRH     R1,[R0, #+4]
??SPI_I2S_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SPI_I2S_DMACmd_0
        LDRH     R2,[R0, #+4]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+4]
        B.N      ??SPI_I2S_DMACmd_1
??SPI_I2S_DMACmd_0:
        LDRH     R2,[R0, #+4]
        BICS     R1,R2,R1
        STRH     R1,[R0, #+4]
??SPI_I2S_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_SendData:
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ReceiveData:
        LDRH     R0,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_NSSInternalSoftwareConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R2,#+65279
        CMP      R1,R2
        BEQ.N    ??SPI_NSSInternalSoftwareConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x100
        STRH     R1,[R0, #+0]
        B.N      ??SPI_NSSInternalSoftwareConfig_1
??SPI_NSSInternalSoftwareConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65279
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??SPI_NSSInternalSoftwareConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_SSOutputCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_SSOutputCmd_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x4
        STRH     R1,[R0, #+4]
        B.N      ??SPI_SSOutputCmd_1
??SPI_SSOutputCmd_0:
        LDRH     R1,[R0, #+4]
        MOVW     R2,#+65531
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+4]
??SPI_SSOutputCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_DataSizeConfig:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_TransmitCRC:
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_CalculateCRC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_CalculateCRC_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x2000
        STRH     R1,[R0, #+0]
        B.N      ??SPI_CalculateCRC_1
??SPI_CalculateCRC_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+57343
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??SPI_CalculateCRC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRC:
        MOVS     R2,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BEQ.N    ??SPI_GetCRC_0
        LDRH     R2,[R0, #+24]
        B.N      ??SPI_GetCRC_1
??SPI_GetCRC_0:
        LDRH     R2,[R0, #+20]
??SPI_GetCRC_1:
        MOVS     R0,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRCPolynomial:
        LDRH     R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_BiDirectionalLineConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+16384
        BNE.N    ??SPI_BiDirectionalLineConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x4000
        STRH     R1,[R0, #+0]
        B.N      ??SPI_BiDirectionalLineConfig_1
??SPI_BiDirectionalLineConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+49151
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??SPI_BiDirectionalLineConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetFlagStatus:
        MOVS     R2,#+0
        LDRH     R0,[R0, #+8]
        TST      R0,R1
        BEQ.N    ??SPI_I2S_GetFlagStatus_0
        MOVS     R2,#+1
        B.N      ??SPI_I2S_GetFlagStatus_1
??SPI_I2S_GetFlagStatus_0:
        MOVS     R2,#+0
??SPI_I2S_GetFlagStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STRH     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetITStatus:
        MOVS     R2,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R3,#+0
        MOVS     R2,#+1
        ANDS     R3,R1,#0xF
        LSLS     R2,R2,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R3,R1,#+4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R1,#+1
        LSLS     R3,R1,R3
        LDRH     R1,[R0, #+4]
        ANDS     R3,R3,R1
        LDRH     R0,[R0, #+8]
        TST      R0,R2
        BEQ.N    ??SPI_I2S_GetITStatus_0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BEQ.N    ??SPI_I2S_GetITStatus_0
        MOVS     R2,#+1
        B.N      ??SPI_I2S_GetITStatus_1
??SPI_I2S_GetITStatus_0:
        MOVS     R2,#+0
??SPI_I2S_GetITStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearITPendingBit:
        MOVS     R2,#+0
        MOVS     R2,#+1
        ANDS     R1,R1,#0xF
        LSLS     R2,R2,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MVNS     R1,R2
        STRH     R1,[R0, #+8]
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
// 818 bytes in section .text
// 
// 818 bytes of CODE memory
//
//Errors: none
//Warnings: none
