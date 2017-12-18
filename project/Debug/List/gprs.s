///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\gprs.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\gprs.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\gprs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN etimer_set
        EXTERN log_out
        EXTERN printf
        EXTERN process_alloc_event
        EXTERN process_current
        EXTERN process_exit
        EXTERN process_post
        EXTERN process_start
        EXTERN sim800_cmd_ate0
        EXTERN sim800_cmd_cifsr
        EXTERN sim800_cmd_ciicr
        EXTERN sim800_cmd_ciphead
        EXTERN sim800_cmd_cipstart
        EXTERN sim800_cmd_cstt
        EXTERN sim800_init
        EXTERN sim800_power_off
        EXTERN sim800_power_on
        EXTERN sim800_send
        EXTERN sim800_set_parent

        PUBLIC gprs_close
        PUBLIC gprs_communication_process
        PUBLIC gprs_connect
        PUBLIC gprs_event_closed
        PUBLIC gprs_event_connect
        PUBLIC gprs_event_disconnect
        PUBLIC gprs_event_recv
        PUBLIC gprs_event_sent
        PUBLIC gprs_init
        PUBLIC gprs_open
        PUBLIC gprs_process
        PUBLIC gprs_send
        PUBLIC gprs_set_parent_process


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
callbacks:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gprs_parent_process:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gprs_connect_status:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gprs_domain:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gprs_port:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gprs_event_sent:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gprs_event_recv:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gprs_event_connect:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gprs_event_disconnect:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gprs_event_closed:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
gprs_communication_process:
        DATA
        DC32 0H, ?_0, process_thread_gprs_communication_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_gprs_communication_process:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+1
        LDRH     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??process_thread_gprs_communication_process_0
        CMP      R1,#+53
        BEQ.N    ??process_thread_gprs_communication_process_1
        CMP      R1,#+55
        BEQ.N    ??process_thread_gprs_communication_process_2
        CMP      R1,#+56
        BEQ.N    ??process_thread_gprs_communication_process_3
        CMP      R1,#+57
        BEQ.W    ??process_thread_gprs_communication_process_4
        CMP      R1,#+58
        BEQ.W    ??process_thread_gprs_communication_process_5
        CMP      R1,#+59
        BEQ.W    ??process_thread_gprs_communication_process_6
        CMP      R1,#+60
        BEQ.W    ??process_thread_gprs_communication_process_7
        CMP      R1,#+61
        BEQ.W    ??process_thread_gprs_communication_process_8
        CMP      R1,#+62
        BEQ.W    ??process_thread_gprs_communication_process_9
        CMP      R1,#+63
        BEQ.W    ??process_thread_gprs_communication_process_10
        CMP      R1,#+64
        BEQ.W    ??process_thread_gprs_communication_process_11
        CMP      R1,#+65
        BEQ.W    ??process_thread_gprs_communication_process_12
        CMP      R1,#+69
        BEQ.W    ??process_thread_gprs_communication_process_13
        CMP      R1,#+84
        BEQ.W    ??process_thread_gprs_communication_process_14
        CMP      R1,#+92
        BEQ.W    ??process_thread_gprs_communication_process_15
        CMP      R1,#+128
        BEQ.N    ??process_thread_gprs_communication_process_16
        CMP      R1,#+130
        BEQ.W    ??process_thread_gprs_communication_process_17
        B.N      ??process_thread_gprs_communication_process_18
??process_thread_gprs_communication_process_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BNE.N    ??process_thread_gprs_communication_process_19
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       sim800_set_parent
??process_thread_gprs_communication_process_19:
??process_thread_gprs_communication_process_20:
        BL       sim800_power_on
        MOVS     R0,#+0
        MOVS     R1,#+53
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_21
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+94
        BEQ.N    ??process_thread_gprs_communication_process_22
??process_thread_gprs_communication_process_21:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_22:
        MOVW     R1,#+5000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+55
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_25
??process_thread_gprs_communication_process_24:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_25:
        BL       sim800_cmd_ate0
        MOV      R1,#+1000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+56
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_26
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BEQ.N    ??process_thread_gprs_communication_process_27
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BEQ.N    ??process_thread_gprs_communication_process_27
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_27
??process_thread_gprs_communication_process_26:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_27:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BNE.N    ??process_thread_gprs_communication_process_28
        LDR.W    R0,??DataTable6_2
        BL       printf
??process_thread_gprs_communication_process_28:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BNE.N    ??process_thread_gprs_communication_process_29
        LDR.W    R0,??DataTable6_3
        BL       printf
??process_thread_gprs_communication_process_30:
        BL       sim800_power_off
        MOVS     R0,#+0
        MOVS     R1,#+128
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_16:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_31
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+95
        BEQ.W    ??process_thread_gprs_communication_process_32
??process_thread_gprs_communication_process_31:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_29:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.N    ??process_thread_gprs_communication_process_33
        LDR.W    R0,??DataTable6_4
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_33:
        MOV      R1,#+2000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+57
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_34
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_35
??process_thread_gprs_communication_process_34:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_35:
        LDR.W    R0,??DataTable6_5
        BL       sim800_cmd_cstt
        MOV      R1,#+1000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+58
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_36
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BEQ.N    ??process_thread_gprs_communication_process_37
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BEQ.N    ??process_thread_gprs_communication_process_37
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_37
??process_thread_gprs_communication_process_36:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_37:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BNE.N    ??process_thread_gprs_communication_process_38
        LDR.W    R0,??DataTable6_6
        BL       printf
??process_thread_gprs_communication_process_38:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BNE.N    ??process_thread_gprs_communication_process_39
        LDR.W    R0,??DataTable6_7
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_39:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.N    ??process_thread_gprs_communication_process_40
        LDR.W    R0,??DataTable6_8
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_40:
        MOV      R1,#+1000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+59
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_41
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_42
??process_thread_gprs_communication_process_41:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_42:
        BL       sim800_cmd_ciicr
        MOVW     R1,#+30000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+60
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_43
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BEQ.N    ??process_thread_gprs_communication_process_44
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BEQ.N    ??process_thread_gprs_communication_process_44
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_44
??process_thread_gprs_communication_process_43:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_44:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BNE.N    ??process_thread_gprs_communication_process_45
        LDR.W    R0,??DataTable6_9
        BL       printf
??process_thread_gprs_communication_process_45:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BNE.N    ??process_thread_gprs_communication_process_46
        LDR.W    R0,??DataTable6_10
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_46:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.N    ??process_thread_gprs_communication_process_47
        LDR.W    R0,??DataTable6_11
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_47:
        MOV      R1,#+1000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+61
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_48
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_49
??process_thread_gprs_communication_process_48:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_49:
        BL       sim800_cmd_cifsr
        MOVW     R1,#+30000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+62
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_50
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+86
        BEQ.N    ??process_thread_gprs_communication_process_51
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BEQ.N    ??process_thread_gprs_communication_process_51
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_51
??process_thread_gprs_communication_process_50:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_51:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+86
        BNE.N    ??process_thread_gprs_communication_process_52
        LDR.W    R0,??DataTable6_12
        BL       printf
??process_thread_gprs_communication_process_52:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BNE.N    ??process_thread_gprs_communication_process_53
        LDR.W    R0,??DataTable6_13
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_53:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.N    ??process_thread_gprs_communication_process_54
        LDR.W    R0,??DataTable6_14
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_54:
        MOV      R1,#+1000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+63
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_55
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_56
??process_thread_gprs_communication_process_55:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_56:
        BL       sim800_cmd_ciphead
        MOV      R1,#+1000
        LDR.W    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+64
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_11:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_57
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BEQ.N    ??process_thread_gprs_communication_process_58
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BEQ.N    ??process_thread_gprs_communication_process_58
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_58
??process_thread_gprs_communication_process_57:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_58:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BNE.N    ??process_thread_gprs_communication_process_59
        LDR.W    R0,??DataTable6_15
        BL       printf
??process_thread_gprs_communication_process_59:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BNE.N    ??process_thread_gprs_communication_process_60
        LDR.W    R0,??DataTable6_16
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_60:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.N    ??process_thread_gprs_communication_process_61
        LDR.W    R0,??DataTable6_17
        BL       printf
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_61:
        MOV      R1,#+1000
        LDR.N    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+65
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_62
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_63
??process_thread_gprs_communication_process_62:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_63:
??process_thread_gprs_communication_process_64:
        LDR.W    R0,??DataTable6_18
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        BL       sim800_cmd_cipstart
        MOVW     R1,#+30000
        LDR.N    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+69
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_13:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_65
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BEQ.N    ??process_thread_gprs_communication_process_66
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BEQ.N    ??process_thread_gprs_communication_process_66
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_66
??process_thread_gprs_communication_process_65:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_66:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+80
        BNE.N    ??process_thread_gprs_communication_process_67
        LDR.N    R0,??DataTable6_20
        BL       printf
??process_thread_gprs_communication_process_67:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+81
        BNE.N    ??process_thread_gprs_communication_process_68
        LDR.N    R0,??DataTable6_21
        BL       printf
        ADR.N    R0,??DataTable1  ;; 0x37, 0x0A, 0x00, 0x00
        BL       log_out
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_68:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.N    ??process_thread_gprs_communication_process_69
        LDR.N    R0,??DataTable6_22
        BL       printf
        ADR.N    R0,??DataTable2  ;; 0x38, 0x0A, 0x00, 0x00
        BL       log_out
        B.N      ??process_thread_gprs_communication_process_30
??process_thread_gprs_communication_process_69:
        MOVW     R1,#+30000
        LDR.N    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+84
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_14:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_70
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+87
        BEQ.N    ??process_thread_gprs_communication_process_71
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_71
??process_thread_gprs_communication_process_70:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_71:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+87
        BNE.N    ??process_thread_gprs_communication_process_72
        LDR.N    R0,??DataTable6_23
        BL       printf
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_24
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_73
        MOVS     R2,#+0
        LDR.N    R0,??DataTable6_26
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       process_post
??process_thread_gprs_communication_process_73:
        MOVS     R0,#+0
        MOVS     R1,#+92
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_15:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??process_thread_gprs_communication_process_74
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_74:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+89
        BNE.N    ??process_thread_gprs_communication_process_75
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_75
        MOVS     R2,R6
        LDR.N    R0,??DataTable6_27
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       process_post
??process_thread_gprs_communication_process_75:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+88
        BEQ.N    ??process_thread_gprs_communication_process_76
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+92
        BNE.N    ??process_thread_gprs_communication_process_77
??process_thread_gprs_communication_process_76:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_24
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_78
        MOVS     R2,#+0
        LDR.N    R0,??DataTable6_28
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       process_post
??process_thread_gprs_communication_process_78:
        B.N      ??process_thread_gprs_communication_process_64
??process_thread_gprs_communication_process_77:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+90
        BNE.N    ??process_thread_gprs_communication_process_73
        LDR.N    R0,??DataTable6_29
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_79
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R1,#+0
        MOVS     R1,R6
        LDR      R0,[R1, #+0]
        LDR      R1,[R1, #+4]
        LDR.N    R2,??DataTable6_29
        LDR      R2,[R2, #+0]
        LDR      R2,[R2, #+0]
        BLX      R2
??process_thread_gprs_communication_process_79:
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_73
        MOVS     R2,R6
        LDR.N    R0,??DataTable6_30
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       process_post
        B.N      ??process_thread_gprs_communication_process_73
??process_thread_gprs_communication_process_72:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BNE.W    ??process_thread_gprs_communication_process_30
        LDR.N    R0,??DataTable6_31
        BL       printf
        B.N      ??process_thread_gprs_communication_process_64
??process_thread_gprs_communication_process_32:
        MOV      R1,#+1000
        LDR.N    R0,??DataTable6_1
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+130
        STRH     R1,[R4, #+0]
??process_thread_gprs_communication_process_17:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_communication_process_80
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_communication_process_81
??process_thread_gprs_communication_process_80:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_communication_process_23
??process_thread_gprs_communication_process_81:
        B.N      ??process_thread_gprs_communication_process_20
??process_thread_gprs_communication_process_18:
        MOVS     R0,#+0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_gprs_communication_process_23:
        POP      {R4-R6,PC}       ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??et_proc:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
gprs_process:
        DATA
        DC32 0H, ?_1, process_thread_gprs_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_gprs_process:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+1
        LDRH     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??process_thread_gprs_process_0
        CMP      R1,#+148
        BEQ.N    ??process_thread_gprs_process_1
        CMP      R1,#+158
        BEQ.N    ??process_thread_gprs_process_2
        CMP      R1,#+160
        BEQ.N    ??process_thread_gprs_process_3
        B.N      ??process_thread_gprs_process_4
??process_thread_gprs_process_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BNE.N    ??process_thread_gprs_process_5
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_19
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_18
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_24
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       sim800_set_parent
??process_thread_gprs_process_5:
        MOVS     R0,#+0
        MOVS     R1,#+148
        STRH     R1,[R4, #+0]
??process_thread_gprs_process_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??process_thread_gprs_process_6
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_process_7
??process_thread_gprs_process_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??process_thread_gprs_process_8
        MOVS     R1,#+0
        LDR.N    R0,??DataTable6_32
        BL       process_start
??process_thread_gprs_process_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??process_thread_gprs_process_5
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_24
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable6_32
        BL       process_exit
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       sim800_set_parent
        MOVW     R1,#+3000
        LDR.N    R0,??DataTable6_33
        BL       etimer_set
        MOVS     R0,#+0
        MOVS     R1,#+158
        STRH     R1,[R4, #+0]
??process_thread_gprs_process_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_process_9
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_gprs_process_10
??process_thread_gprs_process_9:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_process_7
??process_thread_gprs_process_10:
        BL       sim800_power_off
        MOVS     R0,#+0
        MOVS     R1,#+160
        STRH     R1,[R4, #+0]
??process_thread_gprs_process_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_process_11
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+95
        BEQ.N    ??process_thread_gprs_process_12
??process_thread_gprs_process_11:
        MOVS     R0,#+1
        B.N      ??process_thread_gprs_process_7
??process_thread_gprs_process_12:
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_gprs_process_5
        MOVS     R2,#+0
        LDR.N    R0,??DataTable6_34
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       process_post
        B.N      ??process_thread_gprs_process_5
??process_thread_gprs_process_4:
        MOVS     R0,#+0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_gprs_process_7:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC8      0x37, 0x0A, 0x00, 0x00

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??et:
        DS8 16

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gprs_init:
        PUSH     {R7,LR}
        LDR.N    R2,??DataTable6_25
        STR      R0,[R2, #+0]
        LDR.N    R0,??DataTable6_29
        STR      R1,[R0, #+0]
        BL       process_alloc_event
        LDR.N    R1,??DataTable6_26
        STRB     R0,[R1, #+0]
        BL       process_alloc_event
        LDR.N    R1,??DataTable6_28
        STRB     R0,[R1, #+0]
        BL       process_alloc_event
        LDR.N    R1,??DataTable6_30
        STRB     R0,[R1, #+0]
        BL       process_alloc_event
        LDR.N    R1,??DataTable6_27
        STRB     R0,[R1, #+0]
        BL       process_alloc_event
        LDR.N    R1,??DataTable6_34
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        BL       sim800_init
        MOVS     R1,#+0
        LDR.N    R0,??DataTable6_35
        BL       process_start
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC8      0x38, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gprs_set_parent_process:
        LDR.N    R1,??DataTable6_25
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gprs_send:
        PUSH     {R4,LR}
        MOVS     R4,R1
        MOVS     R1,R4
        BL       sim800_send
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gprs_connect:
        LDR.N    R0,??DataTable6_24
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gprs_open:
        PUSH     {R7,LR}
        LDR.N    R2,??DataTable6_19
        STR      R0,[R2, #+0]
        LDR.N    R0,??DataTable6_18
        STR      R1,[R0, #+0]
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable6_35
        BL       process_post
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gprs_close:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_19
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_18
        STR      R0,[R1, #+0]
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable6_35
        BL       process_post
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     process_current

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     ??et_proc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     ?_15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     ?_16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     gprs_port

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     gprs_domain

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     ?_18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     ?_19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     ?_21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     ?_23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     gprs_connect_status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_25:
        DC32     gprs_parent_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_26:
        DC32     gprs_event_connect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_27:
        DC32     gprs_event_sent

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_28:
        DC32     gprs_event_disconnect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_29:
        DC32     callbacks

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_30:
        DC32     gprs_event_recv

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_31:
        DC32     ?_24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_32:
        DC32     gprs_communication_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_33:
        DC32     ??et

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_34:
        DC32     gprs_event_closed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_35:
        DC32     gprs_process

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "gprs_communication process"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "gprs proc"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "GPRS: ate0 success.\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "GPRS: ate0 fail.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "GPRS: ate0 timeouted.\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "cnnet"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "GPRS: cstt success.\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "GPRS: cstt fail.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "GPRS: cstt timeouted.\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "GPRS: ciicr success.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 "GPRS: ciicr fail.\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "GPRS: ciicr timeouted.\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 "GPRS: cifsr success.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "GPRS: cifsr fail.\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "GPRS: cifsr timeouted.\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "GPRS: ciphead success.\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_16:
        DATA
        DC8 "GPRS: ciphead fail.\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_17:
        DATA
        DC8 "GPRS: ciphead timeouted.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_18:
        DATA
        DC8 "GPRS: cipstart success.\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_19:
        DATA
        DC8 "GPRS: cipstart fail.\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "7\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_21:
        DATA
        DC8 "GPRS: cipstart timeouted.\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "8\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_23:
        DATA
        DC8 "GPRS: connect success.\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_24:
        DATA
        DC8 "GPRS: TCP connect timeout.\012"

        END
// 
//    57 bytes in section .bss
//    32 bytes in section .data
//   536 bytes in section .rodata
// 1 760 bytes in section .text
// 
// 1 760 bytes of CODE  memory
//   536 bytes of CONST memory
//    89 bytes of DATA  memory
//
//Errors: none
//Warnings: none
