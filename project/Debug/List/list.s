///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\lib\list.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\lib\list.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\list.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC list_add
        PUBLIC list_chop
        PUBLIC list_copy
        PUBLIC list_head
        PUBLIC list_init
        PUBLIC list_insert
        PUBLIC list_item_next
        PUBLIC list_length
        PUBLIC list_pop
        PUBLIC list_push
        PUBLIC list_remove
        PUBLIC list_tail


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_init:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_head:
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_copy:
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_tail:
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE.N    ??list_tail_0
        MOVS     R0,#+0
        B.N      ??list_tail_1
??list_tail_0:
        LDR      R0,[R0, #+0]
        B.N      ??list_tail_2
??list_tail_3:
        LDR      R0,[R0, #+0]
??list_tail_2:
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE.N    ??list_tail_3
??list_tail_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_add:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       list_remove
        MOVS     R0,#+0
        STR      R0,[R5, #+0]
        MOVS     R0,R4
        BL       list_tail
        CMP      R0,#+0
        BNE.N    ??list_add_0
        STR      R5,[R4, #+0]
        B.N      ??list_add_1
??list_add_0:
        STR      R5,[R0, #+0]
??list_add_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_push:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       list_remove
        LDR      R0,[R4, #+0]
        STR      R0,[R5, #+0]
        STR      R5,[R4, #+0]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_chop:
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE.N    ??list_chop_0
        MOVS     R0,#+0
        B.N      ??list_chop_1
??list_chop_0:
        LDR      R1,[R0, #+0]
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??list_chop_2
        LDR      R1,[R0, #+0]
        MOVS     R2,#+0
        STR      R2,[R0, #+0]
        MOVS     R0,R1
        B.N      ??list_chop_1
??list_chop_2:
        LDR      R1,[R0, #+0]
        B.N      ??list_chop_3
??list_chop_4:
        LDR      R1,[R1, #+0]
??list_chop_3:
        LDR      R0,[R1, #+0]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??list_chop_4
        LDR      R0,[R1, #+0]
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
??list_chop_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_pop:
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??list_pop_0
        LDR      R2,[R0, #+0]
        LDR      R2,[R2, #+0]
        STR      R2,[R0, #+0]
??list_pop_0:
        MOVS     R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_remove:
        LDR      R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??list_remove_0
??list_remove_1:
        MOVS     R3,#+0
        LDR      R2,[R0, #+0]
        B.N      ??list_remove_2
??list_remove_3:
        MOVS     R3,R2
        LDR      R2,[R2, #+0]
??list_remove_2:
        CMP      R2,#+0
        BEQ.N    ??list_remove_4
        CMP      R2,R1
        BNE.N    ??list_remove_3
        CMP      R3,#+0
        BNE.N    ??list_remove_5
        LDR      R1,[R2, #+0]
        STR      R1,[R0, #+0]
        B.N      ??list_remove_6
??list_remove_5:
        LDR      R0,[R2, #+0]
        STR      R0,[R3, #+0]
??list_remove_6:
        MOVS     R0,#+0
        STR      R0,[R2, #+0]
        B.N      ??list_remove_0
??list_remove_4:
??list_remove_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_length:
        MOVS     R1,#+0
        LDR      R0,[R0, #+0]
        B.N      ??list_length_0
??list_length_1:
        ADDS     R1,R1,#+1
        LDR      R0,[R0, #+0]
??list_length_0:
        CMP      R0,#+0
        BNE.N    ??list_length_1
        MOVS     R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_insert:
        PUSH     {R7,LR}
        CMP      R1,#+0
        BNE.N    ??list_insert_0
        MOVS     R1,R2
        BL       list_push
        B.N      ??list_insert_1
??list_insert_0:
        LDR      R0,[R1, #+0]
        STR      R0,[R2, #+0]
        STR      R2,[R1, #+0]
??list_insert_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_item_next:
        CMP      R0,#+0
        BNE.N    ??list_item_next_0
        MOVS     R0,#+0
        B.N      ??list_item_next_1
??list_item_next_0:
        LDR      R0,[R0, #+0]
??list_item_next_1:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 264 bytes in section .text
// 
// 264 bytes of CODE memory
//
//Errors: none
//Warnings: none
