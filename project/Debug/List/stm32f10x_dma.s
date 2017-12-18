///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_dma.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_dma.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_dma.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC DMA_ClearFlag
        PUBLIC DMA_ClearITPendingBit
        PUBLIC DMA_Cmd
        PUBLIC DMA_DeInit
        PUBLIC DMA_GetCurrDataCounter
        PUBLIC DMA_GetFlagStatus
        PUBLIC DMA_GetITStatus
        PUBLIC DMA_ITConfig
        PUBLIC DMA_Init
        PUBLIC DMA_SetCurrDataCounter
        PUBLIC DMA_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_DeInit:
        LDR      R1,[R0, #+0]
        MOVW     R2,#+65534
        ANDS     R1,R2,R1
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        LDR.N    R1,??DataTable4  ;; 0x40020008
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_0
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_0:
        LDR.N    R1,??DataTable4_2  ;; 0x4002001c
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_2
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF0
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_2:
        LDR.N    R1,??DataTable4_3  ;; 0x40020030
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_3
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF00
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_3:
        LDR.N    R1,??DataTable4_4  ;; 0x40020044
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_4
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF000
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_4:
        LDR.N    R1,??DataTable4_5  ;; 0x40020058
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_5
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF0000
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_5:
        LDR.N    R1,??DataTable4_6  ;; 0x4002006c
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_6
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF00000
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_6:
        LDR.N    R1,??DataTable4_7  ;; 0x40020080
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_7
        LDR.N    R0,??DataTable4_1  ;; 0x40020004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF000000
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_7:
        LDR.N    R1,??DataTable4_8  ;; 0x40020408
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_8
        LDR.N    R0,??DataTable4_9  ;; 0x40020404
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_8:
        LDR.N    R1,??DataTable4_10  ;; 0x4002041c
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_9
        LDR.N    R0,??DataTable4_9  ;; 0x40020404
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF0
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_9:
        LDR.N    R1,??DataTable4_11  ;; 0x40020430
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_10
        LDR.N    R0,??DataTable4_9  ;; 0x40020404
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF00
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_10:
        LDR.N    R1,??DataTable4_12  ;; 0x40020444
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_11
        LDR.N    R0,??DataTable4_9  ;; 0x40020404
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF000
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
        B.N      ??DMA_DeInit_1
??DMA_DeInit_11:
        LDR.N    R1,??DataTable4_13  ;; 0x40020458
        CMP      R0,R1
        BNE.N    ??DMA_DeInit_1
        LDR.N    R0,??DataTable4_9  ;; 0x40020404
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF0000
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
??DMA_DeInit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_Init:
        PUSH     {R4}
        MOVS     R2,#+0
        LDR      R2,[R0, #+0]
        BFC      R2,#+4,#+11
        LDR      R3,[R1, #+8]
        LDR      R4,[R1, #+32]
        ORRS     R3,R4,R3
        LDR      R4,[R1, #+16]
        ORRS     R3,R4,R3
        LDR      R4,[R1, #+20]
        ORRS     R3,R4,R3
        LDR      R4,[R1, #+24]
        ORRS     R3,R4,R3
        LDR      R4,[R1, #+28]
        ORRS     R3,R4,R3
        LDR      R4,[R1, #+36]
        ORRS     R3,R4,R3
        LDR      R4,[R1, #+40]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
        STR      R2,[R0, #+0]
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+4]
        LDR      R2,[R1, #+0]
        STR      R2,[R0, #+8]
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+12]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        MOVS     R1,#+0
        STR      R1,[R0, #+28]
        MOVS     R1,#+0
        STR      R1,[R0, #+32]
        MOVS     R1,#+0
        STR      R1,[R0, #+36]
        MOVS     R1,#+0
        STR      R1,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??DMA_Cmd_0
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0x1
        STR      R1,[R0, #+0]
        B.N      ??DMA_Cmd_1
??DMA_Cmd_0:
        LDR      R1,[R0, #+0]
        MOVW     R2,#+65534
        ANDS     R1,R2,R1
        STR      R1,[R0, #+0]
??DMA_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ITConfig:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??DMA_ITConfig_0
        LDR      R2,[R0, #+0]
        ORRS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??DMA_ITConfig_1
??DMA_ITConfig_0:
        LDR      R2,[R0, #+0]
        BICS     R1,R2,R1
        STR      R1,[R0, #+0]
??DMA_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_SetCurrDataCounter:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetCurrDataCounter:
        LDR      R0,[R0, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetFlagStatus:
        MOVS     R1,#+0
        MOVS     R1,#+0
        LSLS     R1,R0,#+3
        BPL.N    ??DMA_GetFlagStatus_0
        LDR.N    R1,??DataTable4_14  ;; 0x40020400
        LDR      R1,[R1, #+0]
        B.N      ??DMA_GetFlagStatus_1
??DMA_GetFlagStatus_0:
        LDR.N    R1,??DataTable4_15  ;; 0x40020000
        LDR      R1,[R1, #+0]
??DMA_GetFlagStatus_1:
        TST      R1,R0
        BEQ.N    ??DMA_GetFlagStatus_2
        MOVS     R1,#+1
        B.N      ??DMA_GetFlagStatus_3
??DMA_GetFlagStatus_2:
        MOVS     R1,#+0
??DMA_GetFlagStatus_3:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ClearFlag:
        LSLS     R1,R0,#+3
        BPL.N    ??DMA_ClearFlag_0
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
        B.N      ??DMA_ClearFlag_1
??DMA_ClearFlag_0:
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
??DMA_ClearFlag_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetITStatus:
        MOVS     R1,#+0
        MOVS     R1,#+0
        LSLS     R1,R0,#+3
        BPL.N    ??DMA_GetITStatus_0
        LDR.N    R1,??DataTable4_14  ;; 0x40020400
        LDR      R1,[R1, #+0]
        B.N      ??DMA_GetITStatus_1
??DMA_GetITStatus_0:
        LDR.N    R1,??DataTable4_15  ;; 0x40020000
        LDR      R1,[R1, #+0]
??DMA_GetITStatus_1:
        TST      R1,R0
        BEQ.N    ??DMA_GetITStatus_2
        MOVS     R1,#+1
        B.N      ??DMA_GetITStatus_3
??DMA_GetITStatus_2:
        MOVS     R1,#+0
??DMA_GetITStatus_3:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ClearITPendingBit:
        LSLS     R1,R0,#+3
        BPL.N    ??DMA_ClearITPendingBit_0
        LDR.N    R1,??DataTable4_9  ;; 0x40020404
        STR      R0,[R1, #+0]
        B.N      ??DMA_ClearITPendingBit_1
??DMA_ClearITPendingBit_0:
        LDR.N    R1,??DataTable4_1  ;; 0x40020004
        STR      R0,[R1, #+0]
??DMA_ClearITPendingBit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4002001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40020030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40020044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40020058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x4002006c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40020080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x40020408

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x40020404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x4002041c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x40020430

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     0x40020444

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0x40020458

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     0x40020000

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
// 600 bytes in section .text
// 
// 600 bytes of CODE memory
//
//Errors: none
//Warnings: none
