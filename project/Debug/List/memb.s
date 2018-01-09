///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\lib\memb.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\lib\memb.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\memb.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset

        PUBLIC memb_alloc
        PUBLIC memb_free
        PUBLIC memb_init
        PUBLIC memb_inmemb
        PUBLIC memb_numfree


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_init:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        LDRH     R5,[R4, #+2]
        MOVS     R6,#+0
        LDR      R7,[R4, #+4]
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R7
        BL       __aeabi_memset
        LDRH     R0,[R4, #+0]
        LDRH     R1,[R4, #+2]
        MUL      R7,R1,R0
        MOVS     R8,#+0
        LDR      R9,[R4, #+8]
        MOV      R2,R8
        MOVS     R1,R7
        MOV      R0,R9
        BL       __aeabi_memset
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_alloc:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,R0
??memb_alloc_0:
        LDRH     R0,[R1, #+2]
        CMP      R2,R0
        BGE.N    ??memb_alloc_1
        LDR      R0,[R1, #+4]
        LDRB     R0,[R2, R0]
        CMP      R0,#+0
        BNE.N    ??memb_alloc_2
        LDR      R0,[R1, #+4]
        LDRB     R0,[R2, R0]
        ADDS     R0,R0,#+1
        LDR      R3,[R1, #+4]
        STRB     R0,[R2, R3]
        LDR      R0,[R1, #+8]
        LDRH     R1,[R1, #+0]
        MLA      R0,R1,R2,R0
        B.N      ??memb_alloc_3
??memb_alloc_2:
        ADDS     R2,R2,#+1
        B.N      ??memb_alloc_0
??memb_alloc_1:
        MOVS     R0,#+0
??memb_alloc_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_free:
        PUSH     {R4,R5}
        MOVS     R2,R0
        LDR      R0,[R2, #+8]
        MOVS     R4,R0
        MOVS     R0,#+0
        MOVS     R3,R0
??memb_free_0:
        LDRH     R0,[R2, #+2]
        CMP      R3,R0
        BGE.N    ??memb_free_1
        CMP      R4,R1
        BNE.N    ??memb_free_2
        LDR      R0,[R2, #+4]
        LDRB     R0,[R3, R0]
        CMP      R0,#+0
        BEQ.N    ??memb_free_3
        LDR      R0,[R2, #+4]
        LDRB     R0,[R3, R0]
        SUBS     R0,R0,#+1
        LDR      R5,[R2, #+4]
        STRB     R0,[R3, R5]
??memb_free_3:
        LDR      R0,[R2, #+4]
        LDRB     R0,[R3, R0]
        B.N      ??memb_free_4
??memb_free_2:
        LDRH     R0,[R2, #+0]
        ADDS     R4,R0,R4
        ADDS     R3,R3,#+1
        B.N      ??memb_free_0
??memb_free_1:
        MOVS     R0,#+255
??memb_free_4:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_inmemb:
        LDR      R2,[R0, #+8]
        CMP      R1,R2
        BCC.N    ??memb_inmemb_0
        LDR      R2,[R0, #+8]
        LDRH     R3,[R0, #+2]
        LDRH     R0,[R0, #+0]
        MLA      R0,R0,R3,R2
        CMP      R1,R0
        BCS.N    ??memb_inmemb_0
        MOVS     R0,#+1
        B.N      ??memb_inmemb_1
??memb_inmemb_0:
        MOVS     R0,#+0
??memb_inmemb_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_numfree:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R2,R3
??memb_numfree_0:
        LDRH     R3,[R1, #+2]
        CMP      R2,R3
        BGE.N    ??memb_numfree_1
        LDR      R3,[R1, #+4]
        LDRB     R3,[R2, R3]
        CMP      R3,#+0
        BNE.N    ??memb_numfree_2
        ADDS     R0,R0,#+1
??memb_numfree_2:
        ADDS     R2,R2,#+1
        B.N      ??memb_numfree_0
??memb_numfree_1:
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
// 220 bytes in section .text
// 
// 220 bytes of CODE memory
//
//Errors: none
//Warnings: none
