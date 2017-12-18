///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_cache.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_cache.c -D
//        STM32F10X_MD -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\spiffs_cache.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset

        PUBLIC spiffs_cache_drop_page
        PUBLIC spiffs_cache_fd_release
        PUBLIC spiffs_cache_init
        PUBLIC spiffs_cache_page_allocate_by_fd
        PUBLIC spiffs_cache_page_get_by_fd
        PUBLIC spiffs_phys_rd
        PUBLIC spiffs_phys_wr


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_page_get:
        PUSH     {R4,R5}
        LDR      R2,[R0, #+76]
        LDR      R0,[R2, #+8]
        LDR      R3,[R2, #+12]
        TST      R0,R3
        BNE.N    ??spiffs_cache_page_get_0
        MOVS     R0,#+0
        B.N      ??spiffs_cache_page_get_1
??spiffs_cache_page_get_0:
        MOVS     R3,#+0
        B.N      ??spiffs_cache_page_get_2
??spiffs_cache_page_get_3:
        ADDS     R3,R3,#+1
??spiffs_cache_page_get_2:
        LDRB     R0,[R2, #+0]
        CMP      R3,R0
        BGE.N    ??spiffs_cache_page_get_4
        LDR      R0,[R2, #+16]
        MOVS     R4,#+148
        MLA      R0,R4,R3,R0
        LDR      R4,[R2, #+8]
        MOVS     R5,R4
        LSRS     R5,R5,R3
        LSLS     R4,R5,#+31
        BPL.N    ??spiffs_cache_page_get_3
        LDRB     R4,[R0, #+0]
        LSLS     R4,R4,#+24
        BMI.N    ??spiffs_cache_page_get_3
        LDRH     R4,[R0, #+8]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R4,R1
        BNE.N    ??spiffs_cache_page_get_3
        LDR      R1,[R2, #+4]
        STR      R1,[R0, #+4]
        B.N      ??spiffs_cache_page_get_1
??spiffs_cache_page_get_4:
        MOVS     R0,#+0
??spiffs_cache_page_get_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_page_free:
        PUSH     {R3-R7,LR}
        MOVS     R3,R0
        MOVS     R4,R1
        MOVS     R0,#+0
        LDR      R5,[R3, #+76]
        LDR      R1,[R5, #+16]
        MOVS     R6,#+148
        MLA      R6,R6,R4,R1
        LDR      R1,[R5, #+8]
        MOVS     R7,R1
        LSRS     R7,R7,R4
        LSLS     R1,R7,#+31
        BPL.N    ??spiffs_cache_page_free_0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??spiffs_cache_page_free_1
        LDRB     R1,[R6, #+0]
        ANDS     R1,R1,#0x81
        CMP      R1,#+1
        BNE.N    ??spiffs_cache_page_free_1
        LDR      R0,[R5, #+16]
        MOVS     R1,#+148
        MLA      R0,R1,R4,R0
        ADDS     R2,R0,#+20
        MOVS     R1,#+128
        LDRH     R0,[R6, #+8]
        MOVS     R7,#+128
        MULS     R0,R7,R0
        LDR      R3,[R3, #+4]
        BLX      R3
??spiffs_cache_page_free_1:
        MOVS     R1,#+0
        STRB     R1,[R6, #+0]
        LDR      R1,[R5, #+8]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        BICS     R1,R1,R2
        STR      R1,[R5, #+8]
??spiffs_cache_page_free_0:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_page_remove_oldest:
        PUSH     {R4-R8,LR}
        MOVS     R3,R1
        MOVS     R1,#+0
        LDR      R5,[R0, #+76]
        LDR      R4,[R5, #+8]
        LDR      R6,[R5, #+12]
        ANDS     R4,R6,R4
        LDR      R6,[R5, #+12]
        CMP      R4,R6
        BEQ.N    ??spiffs_cache_page_remove_oldest_0
        MOVS     R0,#+0
        B.N      ??spiffs_cache_page_remove_oldest_1
??spiffs_cache_page_remove_oldest_0:
        MOVS     R4,#-1
        MOVS     R6,#+0
        MOVS     R7,#+0
        B.N      ??spiffs_cache_page_remove_oldest_2
??spiffs_cache_page_remove_oldest_3:
        LDR      R12,[R5, #+16]
        MOVS     LR,#+148
        MLA      R12,LR,R7,R12
        LDR      LR,[R5, #+4]
        LDR      R8,[R12, #+4]
        SUBS     LR,LR,R8
        CMP      R6,LR
        BCS.N    ??spiffs_cache_page_remove_oldest_4
        LDRB     LR,[R12, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     LR,R3,LR
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      LR,R2
        BNE.N    ??spiffs_cache_page_remove_oldest_4
        LDR      R4,[R5, #+4]
        LDR      R6,[R12, #+4]
        SUBS     R6,R4,R6
        MOVS     R4,R7
??spiffs_cache_page_remove_oldest_4:
        ADDS     R7,R7,#+1
??spiffs_cache_page_remove_oldest_2:
        LDRB     R12,[R5, #+0]
        CMP      R7,R12
        BLT.N    ??spiffs_cache_page_remove_oldest_3
        CMP      R4,#+0
        BMI.N    ??spiffs_cache_page_remove_oldest_5
        MOVS     R2,#+1
        MOVS     R1,R4
        BL       spiffs_cache_page_free
        MOVS     R1,R0
??spiffs_cache_page_remove_oldest_5:
        MOVS     R0,R1
??spiffs_cache_page_remove_oldest_1:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_page_allocate:
        PUSH     {R4}
        LDR      R1,[R0, #+76]
        LDR      R0,[R1, #+8]
        CMN      R0,#+1
        BNE.N    ??spiffs_cache_page_allocate_0
        MOVS     R0,#+0
        B.N      ??spiffs_cache_page_allocate_1
??spiffs_cache_page_allocate_0:
        MOVS     R2,#+0
        B.N      ??spiffs_cache_page_allocate_2
??spiffs_cache_page_allocate_3:
        ADDS     R2,R2,#+1
??spiffs_cache_page_allocate_2:
        LDRB     R0,[R1, #+0]
        CMP      R2,R0
        BGE.N    ??spiffs_cache_page_allocate_4
        LDR      R0,[R1, #+8]
        MOVS     R3,R0
        LSRS     R3,R3,R2
        LSLS     R0,R3,#+31
        BMI.N    ??spiffs_cache_page_allocate_3
        LDR      R0,[R1, #+16]
        MOVS     R3,#+148
        MLA      R0,R3,R2,R0
        LDR      R3,[R1, #+8]
        MOVS     R4,#+1
        LSLS     R2,R4,R2
        ORRS     R2,R2,R3
        STR      R2,[R1, #+8]
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+4]
        B.N      ??spiffs_cache_page_allocate_1
??spiffs_cache_page_allocate_4:
        MOVS     R0,#+0
??spiffs_cache_page_allocate_1:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_drop_page:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_cache_page_get
        CMP      R0,#+0
        BEQ.N    ??spiffs_cache_drop_page_0
        MOVS     R2,#+0
        LDRB     R1,[R0, #+1]
        MOVS     R0,R4
        BL       spiffs_cache_page_free
??spiffs_cache_drop_page_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_phys_rd:
        PUSH     {R3-R11,LR}
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R7,R3
        MOVS     R4,#+0
        LDR      R10,[R8, #+76]
        LSRS     R1,R7,#+7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       spiffs_cache_page_get
        MOV      R11,R0
        LDR      R0,[R10, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[R10, #+4]
        LDR      R6,[SP, #+40]
        LDR      R5,[SP, #+44]
        CMP      R11,#+0
        BEQ.N    ??spiffs_phys_rd_0
        LDR      R0,[R8, #+84]
        ADDS     R0,R0,#+1
        STR      R0,[R8, #+84]
        LDR      R0,[R10, #+4]
        STR      R0,[R11, #+4]
        LDR      R0,[R10, #+16]
        LDRB     R1,[R11, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R0,R0,#+20
        MOVS     R1,#+128
        UDIV     R2,R7,R1
        MLS      R2,R2,R1,R7
        ADDS     R1,R2,R0
        MOVS     R2,R6
        MOVS     R0,R5
        BL       __aeabi_memcpy
        B.N      ??spiffs_phys_rd_1
??spiffs_phys_rd_0:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ANDS     R0,R9,#0x3
        CMP      R0,#+1
        BNE.N    ??spiffs_phys_rd_2
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R7
        LDR      R3,[R8, #+0]
        BLX      R3
        B.N      ??spiffs_phys_rd_3
??spiffs_phys_rd_2:
        LDR      R0,[R8, #+88]
        ADDS     R0,R0,#+1
        STR      R0,[R8, #+88]
        MOVS     R2,#+0
        MOVS     R1,#+128
        MOV      R0,R8
        BL       spiffs_cache_page_remove_oldest
        MOVS     R4,R0
        MOV      R0,R8
        BL       spiffs_cache_page_allocate
        MOV      R11,R0
        CMP      R11,#+0
        BEQ.N    ??spiffs_phys_rd_4
        MOVS     R0,#+2
        STRB     R0,[R11, #+0]
        LSRS     R0,R7,#+7
        STRH     R0,[R11, #+8]
        LDR      R0,[R10, #+16]
        LDRB     R1,[R11, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R2,R0,#+20
        MOVS     R1,#+128
        MOVS     R0,#+128
        UDIV     R3,R7,R0
        MLS      R3,R3,R0,R7
        SUBS     R0,R7,R3
        LDR      R3,[R8, #+0]
        BLX      R3
        CMP      R0,#+0
        BEQ.N    ??spiffs_phys_rd_5
        MOVS     R4,R0
??spiffs_phys_rd_5:
        LDR      R0,[R10, #+16]
        LDRB     R1,[R11, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R0,R0,#+20
        MOVS     R1,#+128
        UDIV     R2,R7,R1
        MLS      R2,R2,R1,R7
        ADDS     R1,R2,R0
        MOVS     R2,R6
        MOVS     R0,R5
        BL       __aeabi_memcpy
        B.N      ??spiffs_phys_rd_1
??spiffs_phys_rd_4:
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R7
        LDR      R3,[R8, #+0]
        BLX      R3
        CMP      R0,#+0
        BEQ.N    ??spiffs_phys_rd_1
        MOVS     R4,R0
??spiffs_phys_rd_1:
        MOVS     R0,R4
??spiffs_phys_rd_3:
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_phys_wr:
        PUSH     {R4-R10,LR}
        MOVS     R6,R0
        MOV      R10,R1
        MOVS     R7,R3
        LSRS     R1,R7,#+7
        LDR      R8,[R6, #+76]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        BL       spiffs_cache_page_get
        MOV      R9,R0
        LDR      R4,[SP, #+32]
        LDR      R5,[SP, #+36]
        CMP      R9,#+0
        BEQ.N    ??spiffs_phys_wr_0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ANDS     R0,R10,#0x1C
        CMP      R0,#+24
        BEQ.N    ??spiffs_phys_wr_0
        MOVS     R1,#+28
        TST      R10,R1
        BNE.N    ??spiffs_phys_wr_1
        MOVS     R0,#+3
        TST      R10,R0
        BEQ.N    ??spiffs_phys_wr_1
        MOVS     R2,#+0
        LDRB     R1,[R9, #+1]
        MOVS     R0,R6
        BL       spiffs_cache_page_free
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R7
        LDR      R3,[R6, #+4]
        BLX      R3
        B.N      ??spiffs_phys_wr_2
??spiffs_phys_wr_1:
        LDR      R0,[R8, #+16]
        LDRB     R1,[R9, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R0,R0,#+20
        MOVS     R2,R4
        MOVS     R1,R5
        MOVS     R3,#+128
        UDIV     R12,R7,R3
        MLS      R12,R12,R3,R7
        ADDS     R10,R12,R0
        MOV      R0,R10
        BL       __aeabi_memcpy
        LDR      R0,[R8, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[R8, #+4]
        LDR      R0,[R8, #+4]
        STR      R0,[R9, #+4]
        LDRB     R0,[R9, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_phys_wr_3
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R7
        LDR      R3,[R6, #+4]
        BLX      R3
        B.N      ??spiffs_phys_wr_2
??spiffs_phys_wr_3:
        MOVS     R0,#+0
        B.N      ??spiffs_phys_wr_2
??spiffs_phys_wr_0:
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R7
        LDR      R3,[R6, #+4]
        BLX      R3
??spiffs_phys_wr_2:
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_page_get_by_fd:
        PUSH     {R4,R5}
        LDR      R2,[R0, #+76]
        LDR      R0,[R2, #+8]
        LDR      R3,[R2, #+12]
        TST      R0,R3
        BNE.N    ??spiffs_cache_page_get_by_fd_0
        MOVS     R0,#+0
        B.N      ??spiffs_cache_page_get_by_fd_1
??spiffs_cache_page_get_by_fd_0:
        MOVS     R3,#+0
        B.N      ??spiffs_cache_page_get_by_fd_2
??spiffs_cache_page_get_by_fd_3:
        ADDS     R3,R3,#+1
??spiffs_cache_page_get_by_fd_2:
        LDRB     R0,[R2, #+0]
        CMP      R3,R0
        BGE.N    ??spiffs_cache_page_get_by_fd_4
        LDR      R0,[R2, #+16]
        MOVS     R4,#+148
        MLA      R0,R4,R3,R0
        LDR      R4,[R2, #+8]
        MOVS     R5,R4
        LSRS     R5,R5,R3
        LSLS     R4,R5,#+31
        BPL.N    ??spiffs_cache_page_get_by_fd_3
        LDRB     R4,[R0, #+0]
        LSLS     R4,R4,#+24
        BPL.N    ??spiffs_cache_page_get_by_fd_3
        LDRH     R4,[R0, #+8]
        LDRH     R5,[R1, #+6]
        CMP      R4,R5
        BNE.N    ??spiffs_cache_page_get_by_fd_3
        B.N      ??spiffs_cache_page_get_by_fd_1
??spiffs_cache_page_get_by_fd_4:
        MOVS     R0,#+0
??spiffs_cache_page_get_by_fd_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_page_allocate_by_fd:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R2,#+0
        MOVS     R1,#+128
        MOVS     R0,R4
        BL       spiffs_cache_page_remove_oldest
        MOVS     R0,R4
        BL       spiffs_cache_page_allocate
        CMP      R0,#+0
        BNE.N    ??spiffs_cache_page_allocate_by_fd_0
        MOVS     R0,#+0
        B.N      ??spiffs_cache_page_allocate_by_fd_1
??spiffs_cache_page_allocate_by_fd_0:
        MOVS     R1,#+128
        STRB     R1,[R0, #+0]
        LDRH     R1,[R5, #+6]
        STRH     R1,[R0, #+8]
        STR      R0,[R5, #+32]
??spiffs_cache_page_allocate_by_fd_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_fd_release:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        CMP      R4,#+0
        BEQ.N    ??spiffs_cache_fd_release_0
??spiffs_cache_fd_release_1:
        LDR      R2,[R0, #+44]
        MOVS     R1,#+0
        B.N      ??spiffs_cache_fd_release_2
??spiffs_cache_fd_release_3:
        MOVS     R3,#+48
        MLA      R3,R3,R1,R2
        LDRSH    R5,[R3, #+4]
        CMP      R5,#+0
        BEQ.N    ??spiffs_cache_fd_release_4
        LDR      R5,[R3, #+32]
        CMP      R5,R4
        BNE.N    ??spiffs_cache_fd_release_4
        MOVS     R5,#+0
        STR      R5,[R3, #+32]
??spiffs_cache_fd_release_4:
        ADDS     R1,R1,#+1
??spiffs_cache_fd_release_2:
        LDR      R3,[R0, #+48]
        CMP      R1,R3
        BCC.N    ??spiffs_cache_fd_release_3
        MOVS     R2,#+0
        LDRB     R1,[R4, #+1]
        BL       spiffs_cache_page_free
        MOVS     R0,#+0
        STRH     R0,[R4, #+8]
??spiffs_cache_fd_release_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cache_init:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        LDR      R0,[R4, #+76]
        CMP      R0,#+0
        BEQ.N    ??spiffs_cache_init_0
??spiffs_cache_init_1:
        LDR      R0,[R4, #+80]
        MOVS     R5,#+0
        SUBS     R0,R0,#+20
        MOVS     R1,#+148
        UDIV     R6,R0,R1
        CMP      R6,#+1
        BLT.N    ??spiffs_cache_init_0
??spiffs_cache_init_2:
        MOVS     R0,#+0
        B.N      ??spiffs_cache_init_3
??spiffs_cache_init_4:
        LSLS     R5,R5,#+1
        ORRS     R5,R5,#0x1
        ADDS     R0,R0,#+1
??spiffs_cache_init_3:
        CMP      R0,R6
        BLT.N    ??spiffs_cache_init_4
        MOVS     R1,#+20
        MOVS     R2,#+0
        ADD      R7,SP,#+0
        MOVS     R0,R7
        BL       __aeabi_memset
        STRB     R6,[SP, #+0]
        LDR      R0,[R4, #+76]
        ADDS     R0,R0,#+20
        STR      R0,[SP, #+16]
        MOVS     R0,#-1
        STR      R0,[SP, #+8]
        STR      R5,[SP, #+12]
        MOVS     R2,#+20
        ADD      R1,SP,#+0
        LDR      R5,[R4, #+76]
        MOVS     R0,R5
        BL       __aeabi_memcpy
        LDR      R4,[R4, #+76]
        LDRB     R0,[R4, #+0]
        MOVS     R1,#+148
        MUL      R1,R1,R0
        MOVS     R2,#+0
        LDR      R5,[R4, #+16]
        MOVS     R0,R5
        BL       __aeabi_memset
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+12]
        BICS     R0,R0,R1
        STR      R0,[R4, #+8]
        MOVS     R0,#+0
        B.N      ??spiffs_cache_init_5
??spiffs_cache_init_6:
        LDR      R1,[R4, #+16]
        MOVS     R2,#+148
        MLA      R1,R2,R0,R1
        STRB     R0,[R1, #+1]
        ADDS     R0,R0,#+1
??spiffs_cache_init_5:
        LDRB     R1,[SP, #+0]
        CMP      R0,R1
        BLT.N    ??spiffs_cache_init_6
??spiffs_cache_init_0:
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

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
// 1 154 bytes in section .text
// 
// 1 154 bytes of CODE memory
//
//Errors: none
//Warnings: none
