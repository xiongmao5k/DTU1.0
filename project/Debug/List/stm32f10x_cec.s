///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_cec.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_cec.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_cec.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC CEC_ClearFlag
        PUBLIC CEC_ClearITPendingBit
        PUBLIC CEC_Cmd
        PUBLIC CEC_DeInit
        PUBLIC CEC_EndOfMessageCmd
        PUBLIC CEC_GetFlagStatus
        PUBLIC CEC_GetITStatus
        PUBLIC CEC_ITConfig
        PUBLIC CEC_Init
        PUBLIC CEC_OwnAddressConfig
        PUBLIC CEC_ReceiveDataByte
        PUBLIC CEC_SendDataByte
        PUBLIC CEC_SetPrescaler
        PUBLIC CEC_StartOfMessage


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1073741824
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1073741824
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_Init:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable12  ;; 0x40007800
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0xF3
        LDRH     R2,[R0, #+0]
        LDRH     R0,[R0, #+2]
        ORRS     R0,R0,R2
        ORRS     R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable12  ;; 0x40007800
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_Cmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_1  ;; 0x420f0000
        STR      R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??CEC_Cmd_0
??CEC_Cmd_1:
        LDR.N    R0,??DataTable12  ;; 0x40007800
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BMI.N    ??CEC_Cmd_1
??CEC_Cmd_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ITConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_2  ;; 0x420f0004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_OwnAddressConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_3  ;; 0x40007804
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_SetPrescaler:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable12_4  ;; 0x40007808
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_SendDataByte:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_5  ;; 0x40007814
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ReceiveDataByte:
        LDR.N    R0,??DataTable12_6  ;; 0x40007818
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_StartOfMessage:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable12_7  ;; 0x420f0200
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_EndOfMessageCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_8  ;; 0x420f0204
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_GetFlagStatus:
        MOVS     R1,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        LDR.N    R2,??DataTable12  ;; 0x40007800
        LSRS     R1,R0,#+28
        LSLS     R0,R0,#+8        ;; ZeroExtS R0,R0,#+8,#+8
        LSRS     R0,R0,#+8
        CMP      R1,#+0
        BEQ.N    ??CEC_GetFlagStatus_0
        LSRS     R0,R0,#+16
        ADDS     R2,R2,#+12
        B.N      ??CEC_GetFlagStatus_1
??CEC_GetFlagStatus_0:
        ADDS     R2,R2,#+16
??CEC_GetFlagStatus_1:
        LDR      R1,[R2, #+0]
        TST      R1,R0
        BEQ.N    ??CEC_GetFlagStatus_2
        MOVS     R1,#+1
        B.N      ??CEC_GetFlagStatus_3
??CEC_GetFlagStatus_2:
        MOVS     R1,#+0
??CEC_GetFlagStatus_3:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ClearFlag:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable12_9  ;; 0x40007810
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x2
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        MVNS     R0,R0
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        ORRS     R0,R1,R0
        ANDS     R0,R0,R2
        LDR.N    R1,??DataTable12_9  ;; 0x40007810
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_GetITStatus:
        MOVS     R1,#+0
        MOVS     R1,#+0
        LDR.N    R1,??DataTable12  ;; 0x40007800
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x2
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R2,R0
        BEQ.N    ??CEC_GetITStatus_0
        CMP      R1,#+0
        BEQ.N    ??CEC_GetITStatus_0
        MOVS     R1,#+1
        B.N      ??CEC_GetITStatus_1
??CEC_GetITStatus_0:
        MOVS     R1,#+0
??CEC_GetITStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ClearITPendingBit:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable12_9  ;; 0x40007810
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x2
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MVNS     R0,R0
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        ORRS     R0,R1,R0
        ANDS     R0,R0,R2
        LDR.N    R1,??DataTable12_9  ;; 0x40007810
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x40007800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x420f0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x420f0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x40007804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x40007808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x40007814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x40007818

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x420f0200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     0x420f0204

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     0x40007810

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
// 312 bytes in section .text
// 
// 312 bytes of CODE memory
//
//Errors: none
//Warnings: none
