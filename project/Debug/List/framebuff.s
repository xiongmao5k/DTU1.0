///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\tools\framebuff.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\tools\framebuff.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\framebuff.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memmove

        PUBLIC framebuff_alloc
        PUBLIC framebuff_avlid
        PUBLIC framebuff_clean
        PUBLIC framebuff_datptr
        PUBLIC framebuff_init
        PUBLIC framebuff_length
        PUBLIC framebuff_pop
        PUBLIC framebuff_push
        PUBLIC framebuff_push_byte
        PUBLIC framebuff_push_double
        PUBLIC framebuff_push_float
        PUBLIC framebuff_push_s16
        PUBLIC framebuff_push_s32
        PUBLIC framebuff_push_s8
        PUBLIC framebuff_push_u16
        PUBLIC framebuff_push_u32
        PUBLIC framebuff_push_u8
        PUBLIC framebuff_remove


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_init:
        STR      R1,[R0, #+4]
        LDR      R3,[R0, #+4]
        STR      R3,[R0, #+0]
        LDR      R3,[R0, #+0]
        ADDS     R3,R2,R3
        STR      R3,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_length:
        LDR      R1,[R0, #+4]
        LDR      R0,[R0, #+0]
        SUBS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_avlid:
        LDR      R1,[R0, #+8]
        LDR      R0,[R0, #+4]
        SUBS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_push:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R7,R0
        CMP      R7,R6
        BCS.N    ??framebuff_push_0
        MOVS     R6,R7
        B.N      ??framebuff_push_1
??framebuff_push_0:
??framebuff_push_1:
        LDR      R8,[R4, #+4]
        MOVS     R2,R6
        MOVS     R1,R5
        MOV      R0,R8
        BL       __aeabi_memcpy
        LDR      R0,[R4, #+4]
        ADDS     R0,R6,R0
        STR      R0,[R4, #+4]
        MOVS     R0,R6
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_pop:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
        MOVS     R0,R4
        BL       framebuff_length
        MOVS     R6,R0
        CMP      R7,R6
        BCC.N    ??framebuff_pop_0
??framebuff_pop_1:
        MOVS     R7,R6
??framebuff_pop_0:
        LDR      R8,[R4, #+0]
        MOVS     R2,R7
        MOV      R1,R8
        MOVS     R0,R5
        BL       __aeabi_memcpy
        CMP      R7,R6
        BNE.N    ??framebuff_pop_2
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+4]
        B.N      ??framebuff_pop_3
??framebuff_pop_2:
        SUBS     R8,R6,R7
        LDR      R0,[R4, #+0]
        ADDS     R9,R7,R0
        LDR      R10,[R4, #+0]
        MOV      R2,R8
        MOV      R1,R9
        MOV      R0,R10
        BL       __aeabi_memmove
        LDR      R0,[R4, #+4]
        SUBS     R0,R0,R7
        STR      R0,[R4, #+4]
??framebuff_pop_3:
        MOVS     R0,R7
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_clean:
        LDR      R1,[R0, #+0]
        STR      R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_datptr:
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_remove:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R0,R4
        BL       framebuff_length
        MOVS     R5,R0
        CMP      R6,R5
        BCC.N    ??framebuff_remove_0
??framebuff_remove_1:
        MOVS     R6,R5
??framebuff_remove_0:
        CMP      R5,R6
        BNE.N    ??framebuff_remove_2
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+4]
        B.N      ??framebuff_remove_3
??framebuff_remove_2:
        SUBS     R7,R5,R6
        LDR      R0,[R4, #+0]
        ADDS     R8,R6,R0
        LDR      R9,[R4, #+0]
        MOVS     R2,R7
        MOV      R1,R8
        MOV      R0,R9
        BL       __aeabi_memmove
        LDR      R0,[R4, #+4]
        SUBS     R0,R0,R6
        STR      R0,[R4, #+4]
??framebuff_remove_3:
        MOVS     R0,R6
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_push_byte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R1,R0
        CMP      R1,#+0
        BEQ.N    ??framebuff_push_byte_0
        LDR      R0,[R4, #+4]
        ADDS     R2,R0,#+1
        STR      R2,[R4, #+4]
        STRB     R5,[R0, #+0]
        MOVS     R0,#+1
        B.N      ??framebuff_push_byte_1
??framebuff_push_byte_0:
        MOVS     R0,#+0
??framebuff_push_byte_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_push_u8:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+0
        BEQ.N    ??framebuff_push_u8_0
        LDR      R0,[R4, #+4]
        STRB     R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+4]
        MOVS     R0,#+1
        B.N      ??framebuff_push_u8_1
??framebuff_push_u8_0:
        MOVS     R0,#+0
??framebuff_push_u8_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_u16(framebuff_t *, uint16_t)
framebuff_push_u16:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+2
        BCC.N    ??framebuff_push_u16_0
        LDR      R0,[R4, #+4]
        STRH     R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+2
        STR      R0,[R4, #+4]
        MOVS     R0,#+2
        B.N      ??framebuff_push_u16_1
??framebuff_push_u16_0:
        MOVS     R0,#+0
??framebuff_push_u16_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_u32(framebuff_t *, uint32_t)
framebuff_push_u32:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+4
        BCC.N    ??framebuff_push_u32_0
        LDR      R0,[R4, #+4]
        STR      R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+4]
        MOVS     R0,#+4
        B.N      ??framebuff_push_u32_1
??framebuff_push_u32_0:
        MOVS     R0,#+0
??framebuff_push_u32_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_s8(framebuff_t *, int8_t)
framebuff_push_s8:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+0
        BEQ.N    ??framebuff_push_s8_0
        LDR      R0,[R4, #+4]
        STRB     R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+4]
        MOVS     R0,#+1
        B.N      ??framebuff_push_s8_1
??framebuff_push_s8_0:
        MOVS     R0,#+0
??framebuff_push_s8_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_s16(framebuff_t *, int16_t)
framebuff_push_s16:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+2
        BCC.N    ??framebuff_push_s16_0
        LDR      R0,[R4, #+4]
        STRH     R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+2
        STR      R0,[R4, #+4]
        MOVS     R0,#+2
        B.N      ??framebuff_push_s16_1
??framebuff_push_s16_0:
        MOVS     R0,#+0
??framebuff_push_s16_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_s32(framebuff_t *, int32_t)
framebuff_push_s32:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+4
        BCC.N    ??framebuff_push_s32_0
        LDR      R0,[R4, #+4]
        STR      R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+4]
        MOVS     R0,#+4
        B.N      ??framebuff_push_s32_1
??framebuff_push_s32_0:
        MOVS     R0,#+0
??framebuff_push_s32_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_float(framebuff_t *, float)
framebuff_push_float:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R6,R0
        CMP      R6,#+4
        BCC.N    ??framebuff_push_float_0
        LDR      R0,[R4, #+4]
        STR      R5,[R0, #+0]
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+4]
        MOVS     R0,#+4
        B.N      ??framebuff_push_float_1
??framebuff_push_float_0:
        MOVS     R0,#+0
??framebuff_push_float_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp int framebuff_push_double(framebuff_t *, double)
framebuff_push_double:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R4,R2
        MOVS     R5,R3
        MOVS     R0,R6
        BL       framebuff_avlid
        MOVS     R7,R0
        CMP      R7,#+8
        BCC.N    ??framebuff_push_double_0
        LDR      R0,[R6, #+4]
        STRD     R4,R5,[R0, #+0]
        LDR      R0,[R6, #+4]
        ADDS     R0,R0,#+8
        STR      R0,[R6, #+4]
        MOVS     R0,#+8
        B.N      ??framebuff_push_double_1
??framebuff_push_double_0:
        MOVS     R0,#+0
??framebuff_push_double_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
framebuff_alloc:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       framebuff_avlid
        MOVS     R1,R0
        CMP      R1,R5
        BCS.N    ??framebuff_alloc_0
        MOVS     R0,#+0
        B.N      ??framebuff_alloc_1
??framebuff_alloc_0:
        LDR      R0,[R4, #+4]
        ADDS     R0,R5,R0
        STR      R0,[R4, #+4]
        MOVS     R0,R5
??framebuff_alloc_1:
        POP      {R1,R4,R5,PC}    ;; return

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
