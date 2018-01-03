///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:22
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\sys\process.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\sys\process.c -D STM32F10X_MD
//        -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\process.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC process_alloc_event
        PUBLIC process_current
        PUBLIC process_exit
        PUBLIC process_init
        PUBLIC process_is_running
        PUBLIC process_list
        PUBLIC process_nevents
        PUBLIC process_poll
        PUBLIC process_post
        PUBLIC process_post_synch
        PUBLIC process_run
        PUBLIC process_start


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
process_list:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
process_current:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
lastevent:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
nevents:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
fevent:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
events:
        DS8 384

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
poll_requested:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_alloc_event:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.W    R2,??DataTable12
        STRB     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_start:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
??process_start_0:
        CMP      R6,R4
        BEQ.N    ??process_start_1
        CMP      R6,#+0
        BEQ.N    ??process_start_1
        LDR      R6,[R6, #+0]
        B.N      ??process_start_0
??process_start_1:
        CMP      R6,R4
        BEQ.N    ??process_start_2
??process_start_3:
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+0]
        LDR.N    R0,??DataTable12_1
        STR      R4,[R0, #+0]
        MOVS     R0,#+1
        STRB     R0,[R4, #+14]
        MOVS     R0,#+0
        STRH     R0,[R4, #+12]
        MOVS     R2,R5
        MOVS     R1,#+129
        MOVS     R0,R4
        BL       process_post_synch
??process_start_2:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
exit_process:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable12_2
        LDR      R7,[R0, #+0]
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
??exit_process_0:
        CMP      R6,R4
        BEQ.N    ??exit_process_1
        CMP      R6,#+0
        BEQ.N    ??exit_process_1
        LDR      R6,[R6, #+0]
        B.N      ??exit_process_0
??exit_process_1:
        CMP      R6,#+0
        BEQ.N    ??exit_process_2
??exit_process_3:
        MOVS     R0,R4
        BL       process_is_running
        CMP      R0,#+0
        BEQ.N    ??exit_process_4
        MOVS     R0,#+0
        STRB     R0,[R4, #+14]
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
??exit_process_5:
        CMP      R6,#+0
        BEQ.N    ??exit_process_6
        CMP      R4,R6
        BEQ.N    ??exit_process_7
        MOVS     R2,R4
        MOVS     R1,#+135
        MOVS     R0,R6
        BL       call_process
??exit_process_7:
        LDR      R6,[R6, #+0]
        B.N      ??exit_process_5
??exit_process_6:
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??exit_process_4
        CMP      R4,R5
        BEQ.N    ??exit_process_4
        LDR.N    R0,??DataTable12_2
        STR      R4,[R0, #+0]
        MOVS     R2,#+0
        MOVS     R1,#+131
        ADDS     R0,R4,#+12
        LDR      R3,[R4, #+8]
        BLX      R3
??exit_process_4:
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BNE.N    ??exit_process_8
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, #+0]
        B.N      ??exit_process_9
??exit_process_8:
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
??exit_process_10:
        CMP      R6,#+0
        BEQ.N    ??exit_process_9
        LDR      R0,[R6, #+0]
        CMP      R0,R4
        BNE.N    ??exit_process_11
        LDR      R0,[R4, #+0]
        STR      R0,[R6, #+0]
        B.N      ??exit_process_9
??exit_process_11:
        LDR      R6,[R6, #+0]
        B.N      ??exit_process_10
??exit_process_9:
        LDR.N    R0,??DataTable12_2
        STR      R7,[R0, #+0]
??exit_process_2:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
call_process:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDRB     R0,[R4, #+14]
        LSLS     R0,R0,#+31
        BPL.N    ??call_process_0
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??call_process_0
        LDR.N    R0,??DataTable12_2
        STR      R4,[R0, #+0]
        MOVS     R0,#+2
        STRB     R0,[R4, #+14]
        MOVS     R2,R6
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+12
        LDR      R3,[R4, #+8]
        BLX      R3
        MOVS     R7,R0
        CMP      R7,#+2
        BEQ.N    ??call_process_1
        CMP      R7,#+3
        BEQ.N    ??call_process_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+131
        BNE.N    ??call_process_2
??call_process_1:
        MOVS     R1,R4
        MOVS     R0,R4
        BL       exit_process
        B.N      ??call_process_0
??call_process_2:
        MOVS     R0,#+1
        STRB     R0,[R4, #+14]
??call_process_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_exit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable12_2
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
        BL       exit_process
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_init:
        MOVS     R0,#+138
        LDR.N    R1,??DataTable12
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable12_3
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable12_4
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_1
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_2
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
do_poll:
        PUSH     {R4,LR}
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_5
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
??do_poll_0:
        CMP      R4,#+0
        BEQ.N    ??do_poll_1
        LDRB     R0,[R4, #+15]
        CMP      R0,#+0
        BEQ.N    ??do_poll_2
        MOVS     R0,#+1
        STRB     R0,[R4, #+14]
        MOVS     R0,#+0
        STRB     R0,[R4, #+15]
        MOVS     R2,#+0
        MOVS     R1,#+130
        MOVS     R0,R4
        BL       call_process
??do_poll_2:
        LDR      R4,[R4, #+0]
        B.N      ??do_poll_0
??do_poll_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
do_event:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??do_event_0
        LDR.N    R0,??DataTable12_6
        LDR.N    R1,??DataTable12_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+12
        MLA      R0,R2,R1,R0
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable12_7
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable12_6
        LDR.N    R1,??DataTable12_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+12
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable12_8
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable12_6
        LDR.N    R1,??DataTable12_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+12
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable12_9
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable12_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+32
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??DataTable12_3
        STRB     R2,[R0, #+0]
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable12_4
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??do_event_1
        LDR.N    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_10
        STR      R0,[R1, #+0]
??do_event_2:
        LDR.N    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??do_event_0
        LDR.N    R0,??DataTable12_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??do_event_3
        BL       do_poll
??do_event_3:
        LDR.N    R0,??DataTable12_8
        LDR      R2,[R0, #+0]
        LDR.N    R0,??DataTable12_7
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        BL       call_process
        LDR.N    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_10
        STR      R0,[R1, #+0]
        B.N      ??do_event_2
??do_event_1:
        LDR.N    R0,??DataTable12_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+129
        BNE.N    ??do_event_4
        MOVS     R0,#+1
        LDR.N    R1,??DataTable12_9
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+14]
??do_event_4:
        LDR.N    R0,??DataTable12_8
        LDR      R2,[R0, #+0]
        LDR.N    R0,??DataTable12_7
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        BL       call_process
??do_event_0:
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ev:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??data:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??receiver:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??p:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_run:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable12_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_run_0
        BL       do_poll
??process_run_0:
        BL       do_event
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable12_5
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_nevents:
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable12_5
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_post:
        PUSH     {R4,R5}
        MOVS     R3,R0
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+32
        BNE.N    ??process_post_0
        MOVS     R0,#+1
        B.N      ??process_post_1
??process_post_0:
        LDR.N    R0,??DataTable12_3
        LDRB     R0,[R0, #+0]
        LDR.N    R4,??DataTable12_4
        LDRB     R4,[R4, #+0]
        ADDS     R0,R4,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R4,#+32
        SDIV     R5,R0,R4
        MLS      R5,R5,R4,R0
        LDR.N    R0,??DataTable12_11
        STRB     R5,[R0, #+0]
        LDR.N    R0,??DataTable12_6
        LDR.N    R4,??DataTable12_11
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+12
        MLA      R0,R5,R4,R0
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable12_6
        LDR.N    R4,??DataTable12_11
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+12
        MLA      R0,R5,R4,R0
        STR      R2,[R0, #+4]
        LDR.N    R0,??DataTable12_6
        LDR.N    R4,??DataTable12_11
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+12
        MLA      R0,R5,R4,R0
        STR      R3,[R0, #+8]
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R4,??DataTable12_4
        STRB     R0,[R4, #+0]
        MOVS     R0,#+0
??process_post_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??snum:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_post_synch:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR.N    R0,??DataTable12_2
        LDR      R7,[R0, #+0]
        MOVS     R2,R6
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       call_process
        LDR.N    R0,??DataTable12_2
        STR      R7,[R0, #+0]
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_poll:
        CMP      R0,#+0
        BEQ.N    ??process_poll_0
        LDRB     R1,[R0, #+14]
        CMP      R1,#+1
        BEQ.N    ??process_poll_1
        LDRB     R1,[R0, #+14]
        CMP      R1,#+2
        BNE.N    ??process_poll_0
??process_poll_1:
        MOVS     R1,#+1
        STRB     R1,[R0, #+15]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable12_5
        STRB     R1,[R2, #+0]
??process_poll_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     lastevent

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     process_list

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     process_current

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     fevent

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     nevents

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     poll_requested

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     events

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     ??ev

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     ??data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     ??receiver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     ??p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     ??snum

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_is_running:
        LDRB     R0,[R0, #+14]
        CMP      R0,#+0
        BEQ.N    ??process_is_running_0
        MOVS     R0,#+1
        B.N      ??process_is_running_1
??process_is_running_0:
        MOVS     R0,#+0
??process_is_running_1:
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
// 410 bytes in section .bss
// 860 bytes in section .text
// 
// 860 bytes of CODE memory
// 410 bytes of DATA memory
//
//Errors: none
//Warnings: none
