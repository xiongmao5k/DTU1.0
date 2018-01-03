///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\sim800.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\sim800.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\sim800.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN __aeabi_memset
        EXTERN etimer_set
        EXTERN free
        EXTERN gpio_get_pin
        EXTERN gpio_set_as_input
        EXTERN gpio_set_as_output
        EXTERN gpio_set_pin
        EXTERN malloc
        EXTERN memb_alloc
        EXTERN memb_init
        EXTERN process_current
        EXTERN process_post
        EXTERN process_post_synch
        EXTERN process_start
        EXTERN sprintf
        EXTERN sscanf
        EXTERN strlen
        EXTERN usart_configure
        EXTERN usart_stream_byte
        EXTERN usart_stream_init
        EXTERN usart_write

        PUBLIC YYCURSOR
        PUBLIC YYMARKER
        PUBLIC YYSTART
        PUBLIC parse_process
        PUBLIC sim800_cmd_ate0
        PUBLIC sim800_cmd_cgatt
        PUBLIC sim800_cmd_cifsr
        PUBLIC sim800_cmd_ciicr
        PUBLIC sim800_cmd_ciphead
        PUBLIC sim800_cmd_cipmode
        PUBLIC sim800_cmd_cipstart
        PUBLIC sim800_cmd_cpin
        PUBLIC sim800_cmd_creg
        PUBLIC sim800_cmd_csq
        PUBLIC sim800_cmd_cstt
        PUBLIC sim800_init
        PUBLIC sim800_power_ctrl_process
        PUBLIC sim800_power_off
        PUBLIC sim800_power_on
        PUBLIC sim800_power_state
        PUBLIC sim800_send
        PUBLIC sim800_set_parent
        PUBLIC sim800_uart_input_handler
        PUBLIC yychar
        PUBLIC yyerror
        PUBLIC yylex
        PUBLIC yylval
        PUBLIC yynerrs
        PUBLIC yyparse


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
app_process:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cpin_status:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
csq_data:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
creg_data:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cgatt_data:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cifsr_data:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
send_data_ptr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
send_data_size:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
recv_data_buffer:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
recv_data_size:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
recv_data_ptr:
        DS8 4

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "SIM800 state on"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "parse process"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "sim800 power ctrl process"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "Deleting"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "syntax error"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "Error: discarding"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "Error: popping"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "memory exhausted"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "Cleanup: discarding lookahead"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "Cleanup: popping"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "AT+CPIN?\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 "AT+CSQ?\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "AT+CREG?\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "AT+CGATT?\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "AT+CSTT=\"%s\"\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_16:
        DATA
        DC8 "AT+CIICR\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_17:
        DATA
        DC8 "AT+CIFSR\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_18:
        DATA
        DC8 "AT+CIPHEAD=1\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_19:
        DATA
        DC8 "ATE0\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_20:
        DATA
        DC8 "AT+CIPSTART=\"TCP\",\"%s\",\"%s\"\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_21:
        DATA
        DC8 "AT+CIPMODE=\"%s\"\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_22:
        DATA
        DC8 "AT+CIPSEND=%d\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yytranslate:
        DATA
        DC8 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 23, 25
        DC8 2, 26, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 24, 2, 2, 2, 27, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
        DC8 2, 2, 2, 2, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
        DC8 16, 17, 18, 19, 20, 21, 22, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yypact:
        DATA
        DC8 -3, -21, -22, -22, 2, -22, 3, -11, -10, -22, 12, -22, 13, -22, -22
        DC8 -22, -22, -22, -22, -22, -22, -7, -22, -22, -22, -22, -22, -22, 16
        DC8 -22, -22, -22, -22, 1, 5, 6, 7, 8, -22, 11, -22, 0, -4, 24, 31, 32
        DC8 33, 14, 34, -22, -22, 35, 15, 17, -22, 20, 19, 21, -22, 36, 42, -22
        DC8 -22, 43, -22, -22, -22, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yydefact:
        DATA
        DC8 0, 0, 17, 18, 27, 29, 0, 0, 0, 36, 0, 32, 0, 4, 5, 6, 7, 8, 9, 10
        DC8 11, 0, 13, 14, 15, 2, 3, 16, 0, 28, 30, 34, 35, 0, 0, 0, 0, 0, 1, 0
        DC8 12, 0, 0, 0, 0, 0, 0, 0, 0, 19, 21, 20, 0, 0, 25, 0, 0, 0, 22, 0, 0
        DC8 31, 33, 0, 23, 24, 26, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yypgoto:
        DATA
        DC8 -22, -22, -22, -22, -22, -22, -22, -22, -22, -22, -22, -22, -22
        DC8 -22, -22, -22, -22, -22, -22, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yydefgoto:
        DATA
        DC8 -1, 12, 13, 14, 15, 51, 16, 17, 18, 19, 20, 21, 22, 23, 24, 40, 25
        DC8 26, 27, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yytable:
        DATA
        DC8 1, 2, 3, 49, 50, 28, 29, 30, 31, 32, 4, 5, 6, 38, 7, 8, 39, 9, 33
        DC8 41, 10, 34, 35, 36, 11, 42, 48, 52, 37, 43, 44, 45, 47, 46, 53, 54
        DC8 55, 57, 56, 64, 59, 62, 60, 58, 61, 65, 66, 63

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yycheck:
        DATA
        DC8 3, 4, 5, 7, 8, 26, 4, 4, 19, 19, 13, 14, 15, 0, 17, 18, 23, 20, 6
        DC8 3, 23, 9, 10, 11, 27, 24, 26, 3, 16, 24, 24, 24, 21, 25, 3, 3, 3, 3
        DC8 24, 3, 25, 22, 25, 8, 24, 3, 3, 26

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yystos:
        DATA
        DC8 0, 3, 4, 5, 13, 14, 15, 17, 18, 20, 23, 27, 29, 30, 31, 32, 34, 35
        DC8 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 26, 4, 4, 19, 19, 6, 9, 10
        DC8 11, 16, 0, 23, 43, 3, 24, 24, 24, 24, 25, 21, 26, 7, 8, 33, 3, 3, 3
        DC8 3, 24, 3, 8, 25, 25, 24, 22, 26, 3, 3, 3, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yyr1:
        DATA
        DC8 0, 28, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29
        DC8 30, 31, 32, 32, 33, 33, 34, 35, 36, 37, 38, 38, 39, 40, 41, 42, 43
        DC8 44, 45, 46, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
yyr2:
        DATA
        DC8 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 4, 4, 1, 2
        DC8 6, 6, 4, 7, 1, 2, 1, 2, 5, 1, 4, 2, 2, 1, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
yydestruct:
        CMP      R0,#+0
        BNE.N    ??yydestruct_0
        LDR.W    R3,??DataTable1
        MOVS     R0,R3
??yydestruct_0:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
yychar:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
yylval:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
yynerrs:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
yyparse:
        PUSH     {R4-R11,LR}
        SUBW     SP,SP,#+1228
        MOVS     R8,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+828
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        MOV      R9,R0
        ADD      R0,SP,#+28
        STR      R0,[SP, #+12]
        LDR      R0,[SP, #+12]
        MOVS     R6,R0
        MOVS     R0,#+200
        MOV      R10,R0
        MOVS     R0,#+0
        MOVS     R4,R0
        MOVS     R0,#+0
        MOVS     R5,R0
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_1
        STR      R0,[R1, #+0]
        MVNS     R0,#+1
        LDR.W    R1,??DataTable1_2
        STR      R0,[R1, #+0]
        B.N      ??yyparse_0
??yyparse_1:
        ADDS     R9,R9,#+2
??yyparse_0:
        STRH     R4,[R9, #+0]
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,R10, LSL #+1
        SUBS     R0,R0,#+2
        CMP      R9,R0
        BCC.N    ??yyparse_2
        LDR      R0,[SP, #+0]
        SUBS     R0,R9,R0
        ASRS     R0,R0,#+1
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+8]
        MOVW     R0,#+10000
        CMP      R10,R0
        BCS.W    ??yyparse_3
??yyparse_4:
        LSLS     R10,R10,#+1
        MOVW     R0,#+10001
        CMP      R10,R0
        BCC.N    ??yyparse_5
        MOVW     R0,#+10000
        MOV      R10,R0
??yyparse_5:
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+20]
        MOVS     R0,#+6
        MUL      R0,R0,R10
        ADDS     R0,R0,#+3
        BL       malloc
        MOV      R11,R0
        CMP      R11,#+0
        BEQ.W    ??yyparse_3
??yyparse_6:
        MOVS     R2,#+0
        MOVS     R1,R2
??yyparse_7:
        LDR      R2,[SP, #+8]
        CMP      R1,R2
        BCS.N    ??yyparse_8
        LDR      R2,[SP, #+0]
        LDRH     R2,[R2, R1, LSL #+1]
        STRH     R2,[R11, R1, LSL #+1]
        ADDS     R1,R1,#+1
        B.N      ??yyparse_7
??yyparse_8:
        STR      R11,[SP, #+0]
        LSLS     R1,R10,#+1
        ADDS     R1,R1,#+3
        MOVS     R0,R1
        LSRS     R0,R0,#+2
        ADDS     R11,R11,R0, LSL #+2
        MOVS     R2,#+0
        MOVS     R1,R2
??yyparse_9:
        LDR      R2,[SP, #+8]
        CMP      R1,R2
        BCS.N    ??yyparse_10
        LDR      R2,[SP, #+12]
        LDR      R2,[R2, R1, LSL #+2]
        STR      R2,[R11, R1, LSL #+2]
        ADDS     R1,R1,#+1
        B.N      ??yyparse_9
??yyparse_10:
        STR      R11,[SP, #+12]
        LSLS     R1,R10,#+2
        ADDS     R1,R1,#+3
        MOVS     R0,R1
        LSRS     R0,R0,#+2
        ADDS     R11,R11,R0, LSL #+2
        LDR      R0,[SP, #+20]
        ADD      R1,SP,#+828
        CMP      R0,R1
        BEQ.N    ??yyparse_11
        LDR      R0,[SP, #+20]
        BL       free
??yyparse_11:
        LDR      R0,[SP, #+0]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1, LSL #+1
        SUBS     R0,R0,#+2
        MOV      R9,R0
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1, LSL #+2
        SUBS     R0,R0,#+4
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,R10, LSL #+1
        SUBS     R0,R0,#+2
        CMP      R9,R0
        BCS.W    ??yyparse_12
??yyparse_2:
        CMP      R4,#+38
        BNE.N    ??yyparse_13
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        B.N      ??yyparse_14
??yyparse_13:
        LDR.W    R0,??DataTable1_3
        LDRSB    R0,[R4, R0]
        MOVS     R7,R0
        CMN      R7,#+22
        BEQ.N    ??yyparse_15
??yyparse_16:
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMN      R0,#+2
        BNE.N    ??yyparse_17
        BL       yylex
        LDR.W    R1,??DataTable1_2
        STR      R0,[R1, #+0]
??yyparse_17:
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BGE.N    ??yyparse_18
        MOVS     R0,#+0
        MOV      R8,R0
        LDR.W    R0,??DataTable1_2
        STR      R8,[R0, #+0]
        B.N      ??yyparse_19
??yyparse_18:
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+278
        BCS.N    ??yyparse_20
        LDR.W    R0,??DataTable1_4
        LDR.W    R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        LDRB     R8,[R1, R0]
        B.N      ??yyparse_19
??yyparse_20:
        MOVS     R8,#+2
??yyparse_19:
        ADDS     R7,R8,R7
        CMP      R7,#+0
        BMI.N    ??yyparse_21
        CMP      R7,#+48
        BGE.N    ??yyparse_21
        LDR.W    R0,??DataTable1_5
        LDRB     R0,[R7, R0]
        CMP      R0,R8
        BEQ.N    ??yyparse_22
??yyparse_21:
        B.N      ??yyparse_15
??yyparse_22:
        LDR.W    R0,??DataTable1_6
        LDRB     R7,[R7, R0]
        CMP      R7,#+1
        BGE.N    ??yyparse_23
        RSBS     R7,R7,#+0
        B.N      ??yyparse_24
??yyparse_23:
        CMP      R5,#+0
        BEQ.N    ??yyparse_25
        SUBS     R5,R5,#+1
??yyparse_25:
        MVNS     R0,#+1
        LDR.W    R1,??DataTable1_2
        STR      R0,[R1, #+0]
        MOVS     R4,R7
        ADDS     R6,R6,#+4
        LDR.W    R0,??yylex_0
        LDR      R0,[R0, #+0]
        STR      R0,[R6, #+0]
        B.N      ??yyparse_1
??yyparse_15:
        LDR.W    R0,??DataTable1_7
        LDRB     R0,[R4, R0]
        MOVS     R7,R0
        CMP      R7,#+0
        BNE.N    ??yyparse_26
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMN      R0,#+2
        BNE.W    ??yyparse_27
        B.N      ??yyparse_28
??yyparse_26:
??yyparse_24:
        LDR.W    R0,??DataTable1_8
        LDRB     R0,[R7, R0]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        RSBS     R0,R0,#+0
        ADDS     R0,R6,R0, LSL #+2
        LDR      R0,[R0, #+4]
        STR      R0,[SP, #+24]
        MOVS     R0,R7
        CMP      R0,#+17
        BEQ.N    ??yyparse_29
        CMP      R0,#+18
        BEQ.N    ??yyparse_30
        CMP      R0,#+19
        BEQ.N    ??yyparse_31
        CMP      R0,#+20
        BEQ.N    ??yyparse_32
        CMP      R0,#+23
        BEQ.N    ??yyparse_33
        CMP      R0,#+24
        BEQ.N    ??yyparse_34
        CMP      R0,#+25
        BEQ.N    ??yyparse_35
        CMP      R0,#+26
        BEQ.W    ??yyparse_36
        CMP      R0,#+28
        BEQ.W    ??yyparse_37
        CMP      R0,#+29
        BEQ.W    ??yyparse_38
        CMP      R0,#+30
        BEQ.W    ??yyparse_39
        CMP      R0,#+31
        BEQ.W    ??yyparse_40
        CMP      R0,#+32
        BEQ.W    ??yyparse_41
        CMP      R0,#+33
        BEQ.W    ??yyparse_42
        B.N      ??yyparse_43
??yyparse_29:
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_44
        MOVS     R2,#+0
        MOVS     R1,#+80
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_44:
        B.N      ??yyparse_45
??yyparse_30:
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_46
        MOVS     R2,#+0
        MOVS     R1,#+81
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_46:
        B.N      ??yyparse_45
??yyparse_31:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable1_10
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_47
        MOVS     R2,#+0
        MOVS     R1,#+82
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_47:
        B.N      ??yyparse_45
??yyparse_32:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1_10
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_48
        LDR.N    R2,??DataTable1_10
        MOVS     R1,#+82
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_48:
        B.N      ??yyparse_45
??yyparse_33:
        LDR      R0,[R6, #-8]
        LDR.W    R1,??DataTable2
        STR      R0,[R1, #+0]
        LDR      R0,[R6, #+0]
        LDR.W    R1,??DataTable2
        STR      R0,[R1, #+4]
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_49
        LDR.W    R2,??DataTable2
        MOVS     R1,#+83
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_49:
        B.N      ??yyparse_45
??yyparse_34:
        LDR      R0,[R6, #-8]
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+0]
        LDR      R0,[R6, #+0]
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+4]
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_50
        LDR.W    R2,??DataTable2_1
        MOVS     R1,#+84
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_50:
        B.N      ??yyparse_45
??yyparse_35:
        LDR      R0,[R6, #+0]
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_51
        LDR.W    R2,??DataTable2_2
        MOVS     R1,#+85
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_51:
        B.N      ??yyparse_45
??yyparse_36:
        LDR      R0,[R6, #-24]
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        LDR      R0,[R6, #-16]
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+4]
        LDR      R0,[R6, #-8]
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+8]
        LDR      R0,[R6, #+0]
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+12]
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_52
        LDR.W    R2,??DataTable2_3
        MOVS     R1,#+86
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_52:
        B.N      ??yyparse_45
??yyparse_37:
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_53
        MOVS     R2,#+0
        MOVS     R1,#+87
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_53:
        B.N      ??yyparse_45
??yyparse_38:
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_54
        MOVS     R2,#+0
        MOVS     R1,#+88
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_54:
        B.N      ??yyparse_45
??yyparse_39:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_55
        MOVS     R2,#+0
        MOVS     R1,#+89
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_55:
        B.N      ??yyparse_45
??yyparse_40:
        LDR      R0,[R6, #-4]
        LDR.W    R1,??DataTable3_2
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable3_3
        LDR.W    R1,??DataTable3_4
        STR      R0,[R1, #+0]
        B.N      ??yyparse_45
??yyparse_41:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_56
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_56
        LDR.W    R0,??DataTable3_1
        LDR      R2,[R0, #+0]
        LDR.W    R0,??DataTable3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+2
        BL       usart_write
??yyparse_56:
        B.N      ??yyparse_45
??yyparse_42:
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??yyparse_57
        MOVS     R2,#+0
        MOVS     R1,#+92
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       process_post
??yyparse_57:
        B.N      ??yyparse_45
??yyparse_43:
??yyparse_45:
        LDR      R0,[SP, #+4]
        MVNS     R1,#+3
        MLA      R6,R1,R0,R6
        LDR      R0,[SP, #+4]
        MVNS     R1,#+1
        MLA      R9,R1,R0,R9
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        ADDS     R6,R6,#+4
        LDR      R0,[SP, #+24]
        STR      R0,[R6, #+0]
        LDR.W    R0,??DataTable3_5
        LDRB     R7,[R7, R0]
        LDR.W    R0,??DataTable3_6
        ADDS     R0,R7,R0
        LDRSB    R0,[R0, #-28]
        LDRSH    R1,[R9, #+0]
        ADDS     R0,R1,R0
        MOVS     R4,R0
        CMP      R4,#+0
        BMI.N    ??yyparse_58
        CMP      R4,#+48
        BGE.N    ??yyparse_58
        LDR.N    R0,??DataTable1_5
        LDRB     R0,[R4, R0]
        LDRSH    R1,[R9, #+0]
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BNE.N    ??yyparse_58
        LDR.N    R0,??DataTable1_6
        LDRB     R4,[R4, R0]
        B.N      ??yyparse_59
??yyparse_58:
        LDR.W    R0,??DataTable3_7
        ADDS     R0,R7,R0
        LDRSB    R0,[R0, #-28]
        MOVS     R4,R0
??yyparse_59:
        B.N      ??yyparse_1
??yyparse_28:
        MVNS     R8,#+1
        B.N      ??yyparse_60
??yyparse_27:
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+278
        BCS.N    ??yyparse_61
        LDR.N    R0,??DataTable1_4
        LDR.N    R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        LDRB     R8,[R1, R0]
        B.N      ??yyparse_60
??yyparse_61:
        MOVS     R8,#+2
??yyparse_60:
        CMP      R5,#+0
        BNE.N    ??yyparse_62
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable3_8
        BL       yyerror
??yyparse_62:
        CMP      R5,#+3
        BNE.N    ??yyparse_63
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BGE.N    ??yyparse_64
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??yyparse_63
        B.N      ??yyparse_12
??yyparse_64:
        LDR.W    R2,??yylex_0
        MOV      R1,R8
        LDR.W    R0,??DataTable3_9
        BL       yydestruct
        MVNS     R0,#+1
        LDR.N    R1,??DataTable1_2
        STR      R0,[R1, #+0]
??yyparse_63:
        MOVS     R0,#+3
        MOVS     R5,R0
??yyparse_65:
        LDR.N    R0,??DataTable1_3
        LDRSB    R0,[R4, R0]
        MOVS     R7,R0
        CMN      R7,#+22
        BEQ.N    ??yyparse_66
        ADDS     R7,R7,#+1
        CMP      R7,#+0
        BMI.N    ??yyparse_66
        CMP      R7,#+48
        BGE.N    ??yyparse_66
        LDR.N    R0,??DataTable1_5
        LDRB     R0,[R7, R0]
        CMP      R0,#+1
        BNE.N    ??yyparse_66
        LDR.N    R0,??DataTable1_6
        LDRB     R7,[R7, R0]
        CMP      R7,#+1
        BLT.N    ??yyparse_66
        ADDS     R6,R6,#+4
        LDR.W    R0,??yylex_0
        LDR      R0,[R0, #+0]
        STR      R0,[R6, #+0]
        MOVS     R4,R7
        B.N      ??yyparse_1
??yyparse_66:
        LDR      R0,[SP, #+0]
        CMP      R9,R0
        BEQ.N    ??yyparse_12
??yyparse_67:
        MOVS     R2,R6
        LDR.W    R0,??DataTable4
        LDRB     R1,[R4, R0]
        LDR.W    R0,??DataTable4_1
        BL       yydestruct
        SUBS     R6,R6,#+4
        SUBS     R9,R9,#+2
        LDRSH    R0,[R9, #+0]
        MOVS     R4,R0
        B.N      ??yyparse_65
??yyparse_12:
        MOVS     R0,#+1
        STR      R0,[SP, #+16]
        B.N      ??yyparse_14
??yyparse_3:
        LDR.W    R0,??DataTable4_2
        BL       yyerror
        MOVS     R0,#+2
        STR      R0,[SP, #+16]
??yyparse_14:
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMN      R0,#+2
        BEQ.N    ??yyparse_68
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+278
        BCS.N    ??yyparse_69
        LDR.N    R0,??DataTable1_4
        LDR.N    R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        LDRB     R8,[R1, R0]
        B.N      ??yyparse_70
??yyparse_69:
        MOVS     R8,#+2
??yyparse_70:
        LDR.W    R2,??yylex_0
        MOV      R1,R8
        LDR.W    R0,??DataTable4_3
        BL       yydestruct
??yyparse_68:
        LDR      R0,[SP, #+4]
        MVNS     R1,#+3
        MLA      R6,R1,R0,R6
        LDR      R0,[SP, #+4]
        MVNS     R1,#+1
        MLA      R9,R1,R0,R9
??yyparse_71:
        LDR      R0,[SP, #+0]
        CMP      R9,R0
        BEQ.N    ??yyparse_72
        MOVS     R2,R6
        LDR.W    R0,??DataTable4
        LDRSH    R1,[R9, #+0]
        LDRB     R1,[R1, R0]
        LDR.W    R0,??DataTable4_4
        BL       yydestruct
        SUBS     R6,R6,#+4
        SUBS     R9,R9,#+2
        B.N      ??yyparse_71
??yyparse_72:
        LDR      R0,[SP, #+0]
        ADD      R1,SP,#+828
        CMP      R0,R1
        BEQ.N    ??yyparse_73
        LDR      R0,[SP, #+0]
        BL       free
??yyparse_73:
        LDR      R0,[SP, #+16]
        ADDW     SP,SP,#+1228
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     yynerrs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     yychar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     yypact

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     yytranslate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     yycheck

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     yytable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     yydefact

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     yyr2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     app_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     cpin_status

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
YYCURSOR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
YYSTART:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
YYMARKER:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
yylex:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
??yylex_1:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+0
        BEQ.N    ??yylex_2
        SUBS     R0,R0,#+9
        CMP      R0,#+1
        BLS.N    ??yylex_3
        SUBS     R0,R0,#+4
        BEQ.N    ??yylex_3
        SUBS     R0,R0,#+19
        BEQ.N    ??yylex_3
        SUBS     R0,R0,#+11
        CMP      R0,#+1
        BLS.N    ??yylex_4
        SUBS     R0,R0,#+3
        BEQ.N    ??yylex_4
        SUBS     R0,R0,#+2
        BEQ.N    ??yylex_5
        SUBS     R0,R0,#+1
        CMP      R0,#+8
        BLS.N    ??yylex_6
        SUBS     R0,R0,#+9
        BEQ.N    ??yylex_4
        SUBS     R0,R0,#+4
        BEQ.N    ??yylex_4
        SUBS     R0,R0,#+3
        BEQ.N    ??yylex_7
        SUBS     R0,R0,#+2
        BEQ.N    ??yylex_8
        SUBS     R0,R0,#+1
        BEQ.N    ??yylex_9
        SUBS     R0,R0,#+1
        BEQ.N    ??yylex_10
        SUBS     R0,R0,#+4
        BEQ.W    ??yylex_11
        SUBS     R0,R0,#+6
        BEQ.W    ??yylex_12
        SUBS     R0,R0,#+1
        BEQ.W    ??yylex_13
        SUBS     R0,R0,#+2
        BEQ.W    ??yylex_14
        SUBS     R0,R0,#+1
        BEQ.W    ??yylex_15
        B.N      ??yylex_16
??yylex_2:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+267
        B.W      ??yylex_17
??yylex_3:
        B.N      ??yylex_18
??yylex_4:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        B.W      ??yylex_17
??yylex_5:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        B.N      ??yylex_19
??yylex_6:
        B.N      ??yylex_20
??yylex_7:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+84
        BNE.W    ??yylex_21
        B.N      ??yylex_22
??yylex_8:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+71
        BEQ.W    ??yylex_23
        CMP      R0,#+76
        BEQ.W    ??yylex_24
        CMP      R0,#+79
        BEQ.W    ??yylex_25
        CMP      R0,#+80
        BEQ.W    ??yylex_26
        CMP      R0,#+82
        BEQ.W    ??yylex_27
        CMP      R0,#+83
        BEQ.W    ??yylex_28
        CMP      R0,#+97
        BEQ.W    ??yylex_29
        B.N      ??yylex_30
??yylex_9:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+69
        BNE.W    ??yylex_31
        B.N      ??yylex_32
??yylex_10:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+82
        BNE.W    ??yylex_33
        B.N      ??yylex_34
??yylex_11:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+80
        BNE.W    ??yylex_35
        B.N      ??yylex_36
??yylex_12:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+75
        BNE.W    ??yylex_37
        B.N      ??yylex_38
??yylex_13:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+68
        BNE.W    ??yylex_39
        B.N      ??yylex_40
??yylex_14:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+69
        BEQ.W    ??yylex_41
        CMP      R0,#+101
        BEQ.W    ??yylex_42
        B.N      ??yylex_43
??yylex_15:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+69
        BEQ.W    ??yylex_44
        CMP      R0,#+77
        BEQ.W    ??yylex_45
        B.N      ??yylex_46
??yylex_16:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
??yylex_47:
        MOVW     R0,#+263
        B.N      ??yylex_17
??yylex_18:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+9
        BEQ.N    ??yylex_48
        CMP      R0,#+10
        BEQ.N    ??yylex_48
        CMP      R0,#+13
        BEQ.N    ??yylex_48
        CMP      R0,#+32
        BNE.N    ??yylex_49
??yylex_48:
        B.N      ??yylex_18
??yylex_49:
        B.N      ??yylex_1
??yylex_19:
        ADD      R2,SP,#+0
        ADR.N    R1,??yylex_50    ;; 0x25, 0x64, 0x00, 0x00
        LDR.W    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        BL       sscanf
        LDR      R0,[SP, #+0]
        LDR.W    R1,??yylex_0
        STR      R0,[R1, #+0]
        MOV      R0,#+258
        B.N      ??yylex_17
        DATA
??yylex_50:
        DC8      0x25, 0x64, 0x00, 0x00
        THUMB
??yylex_20:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        SUBS     R0,R0,#+48
        CMP      R0,#+9
        BHI.N    ??yylex_51
??yylex_52:
        B.N      ??yylex_20
??yylex_51:
        B.N      ??yylex_19
??yylex_22:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+69
        BNE.W    ??yylex_53
        B.N      ??yylex_54
??yylex_21:
        B.N      ??yylex_47
??yylex_23:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+65
        BNE.W    ??yylex_55
        B.N      ??yylex_56
??yylex_24:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+79
        BNE.W    ??yylex_57
        B.N      ??yylex_58
??yylex_25:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+78
        BNE.W    ??yylex_59
        B.N      ??yylex_60
??yylex_26:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+73
        BNE.W    ??yylex_61
        B.N      ??yylex_62
??yylex_27:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+69
        BNE.W    ??yylex_63
        B.N      ??yylex_64
??yylex_28:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+81
        BNE.W    ??yylex_65
        B.N      ??yylex_66
??yylex_29:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+108
        BNE.W    ??yylex_67
        B.N      ??yylex_68
??yylex_30:
        B.N      ??yylex_47
??yylex_32:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+65
        BNE.W    ??yylex_69
        B.N      ??yylex_70
??yylex_31:
        B.N      ??yylex_47
??yylex_34:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+82
        BNE.W    ??yylex_71
        B.N      ??yylex_72
??yylex_33:
        B.N      ??yylex_47
??yylex_36:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+68
        BNE.W    ??yylex_73
        B.N      ??yylex_74
??yylex_35:
        B.N      ??yylex_47
??yylex_38:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+259
        B.N      ??yylex_17
??yylex_37:
        B.N      ??yylex_47
??yylex_40:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+80
        BNE.W    ??yylex_75
        B.N      ??yylex_76
??yylex_39:
        B.N      ??yylex_47
??yylex_41:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+65
        BNE.W    ??yylex_77
        B.N      ??yylex_78
??yylex_42:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+97
        BNE.W    ??yylex_79
        B.N      ??yylex_80
??yylex_43:
        B.N      ??yylex_47
??yylex_44:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+78
        BNE.W    ??yylex_81
        B.N      ??yylex_82
??yylex_45:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+83
        BNE.W    ??yylex_83
        B.N      ??yylex_84
??yylex_46:
        B.N      ??yylex_47
??yylex_54:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+48
        BNE.W    ??yylex_85
        B.N      ??yylex_86
??yylex_53:
??yylex_87:
        LDR.W    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        B.N      ??yylex_47
??yylex_56:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+84
        BNE.W    ??yylex_88
        B.N      ??yylex_89
??yylex_55:
        B.N      ??yylex_87
??yylex_58:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+83
        BNE.W    ??yylex_90
        B.N      ??yylex_91
??yylex_57:
        B.N      ??yylex_87
??yylex_60:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+78
        BNE.W    ??yylex_92
        B.N      ??yylex_93
??yylex_59:
        B.N      ??yylex_87
??yylex_62:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+78
        BNE.W    ??yylex_94
        B.N      ??yylex_95
??yylex_61:
        B.N      ??yylex_87
??yylex_64:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+71
        BNE.W    ??yylex_96
        B.N      ??yylex_97
??yylex_63:
        B.N      ??yylex_87
??yylex_66:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+264
        B.N      ??yylex_17
??yylex_65:
        B.N      ??yylex_87
??yylex_68:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+108
        BNE.W    ??yylex_98
        B.N      ??yylex_99
??yylex_67:
        B.N      ??yylex_87
??yylex_70:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+67
        BNE.W    ??yylex_100
        B.N      ??yylex_101
??yylex_69:
        B.N      ??yylex_87
??yylex_72:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+79
        BNE.W    ??yylex_102
        B.N      ??yylex_103
??yylex_71:
        B.N      ??yylex_87
??yylex_74:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+271
        B.N      ??yylex_17
??yylex_73:
        B.N      ??yylex_87
??yylex_76:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+276
        B.N      ??yylex_17
??yylex_75:
        B.N      ??yylex_87
??yylex_78:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+68
        BNE.W    ??yylex_104
        B.N      ??yylex_105
??yylex_77:
        B.N      ??yylex_87
??yylex_80:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+100
        BNE.W    ??yylex_106
        B.N      ??yylex_107
??yylex_79:
        B.N      ??yylex_87
??yylex_82:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+68
        BNE.W    ??yylex_108
        B.N      ??yylex_109
??yylex_81:
        B.N      ??yylex_87
??yylex_84:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+273
        B.N      ??yylex_17
??yylex_83:
        B.N      ??yylex_87
??yylex_86:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+275
        B.N      ??yylex_17
??yylex_85:
        B.N      ??yylex_87
??yylex_89:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+84
        BNE.W    ??yylex_110
        B.N      ??yylex_111
??yylex_88:
        B.N      ??yylex_87
??yylex_91:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+69
        BNE.W    ??yylex_112
        B.N      ??yylex_113
??yylex_90:
        B.N      ??yylex_87
??yylex_93:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+69
        BNE.W    ??yylex_114
        B.N      ??yylex_115
??yylex_92:
        B.N      ??yylex_87
??yylex_95:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+261
        B.N      ??yylex_17
??yylex_94:
        B.N      ??yylex_87
??yylex_97:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+265
        B.N      ??yylex_17
??yylex_96:
        B.N      ??yylex_87
??yylex_99:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+272
        B.N      ??yylex_17
??yylex_98:
        B.N      ??yylex_87
??yylex_101:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+84
        BNE.N    ??yylex_116
        B.N      ??yylex_117
??yylex_100:
        B.N      ??yylex_87
??yylex_103:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+82
        BNE.N    ??yylex_118
        B.N      ??yylex_119
??yylex_102:
        B.N      ??yylex_87
??yylex_105:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+89
        BNE.N    ??yylex_120
        B.N      ??yylex_121
??yylex_104:
        B.N      ??yylex_87
??yylex_107:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+121
        BNE.N    ??yylex_122
        B.N      ??yylex_123
??yylex_106:
        B.N      ??yylex_87
??yylex_109:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+270
        B.N      ??yylex_17
??yylex_108:
        B.N      ??yylex_87
??yylex_111:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+266
        B.N      ??yylex_17
??yylex_110:
        B.N      ??yylex_87
??yylex_113:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+68
        BNE.N    ??yylex_124
        B.N      ??yylex_125
        DATA
??yylex_0:
        DC32     yylval
        THUMB
??yylex_112:
        B.N      ??yylex_87
??yylex_115:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+67
        BNE.N    ??yylex_126
        B.N      ??yylex_127
??yylex_114:
        B.N      ??yylex_87
??yylex_117:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+277
        B.N      ??yylex_17
??yylex_116:
        B.N      ??yylex_87
??yylex_119:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+260
        B.N      ??yylex_17
??yylex_118:
        B.N      ??yylex_87
??yylex_121:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+262
        B.N      ??yylex_17
??yylex_120:
        B.N      ??yylex_87
??yylex_123:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+274
        B.N      ??yylex_17
??yylex_122:
        B.N      ??yylex_87
??yylex_125:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOVW     R0,#+269
        B.N      ??yylex_17
??yylex_124:
        B.N      ??yylex_87
??yylex_127:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+84
        BNE.N    ??yylex_128
        B.N      ??yylex_129
??yylex_126:
        B.N      ??yylex_87
??yylex_129:
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5
        STR      R0,[R1, #+0]
        MOV      R0,#+268
        B.N      ??yylex_17
??yylex_128:
        B.N      ??yylex_87
??yylex_17:
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     csq_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     creg_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     cgatt_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     cifsr_data

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
yyerror:
        MOVS     R1,R0
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_buffer_init:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        ADDS     R0,R4,#+4
        STR      R0,[R4, #+0]
        MOVS     R5,#+64
        MOVS     R6,#+0
        ADDS     R7,R4,#+4
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R7
        BL       __aeabi_memset
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_buffer_dataptr:
        ADDS     R0,R0,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_buffer_length:
        LDR      R1,[R0, #+0]
        ADDS     R0,R0,#+4
        SUBS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_buffer_size:
        ADDS     R1,R0,#+68
        LDR      R0,[R0, #+0]
        SUBS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_buffer_push_byte:
        MOVS     R2,R0
        LDR      R0,[R2, #+0]
        STRB     R1,[R0, #+0]
        LDR      R0,[R2, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R2, #+0]
        MOVS     R0,#+1
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
current_cmd_buffer:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmdbuffs:
        DATA
        DC16 68, 4
        DC32 cmdbuffs_memb_count, cmdbuffs_memb_mem

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute char cmdbuffs_memb_count[4]
cmdbuffs_memb_count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute struct cmd_buffer_struct cmdbuffs_memb_mem[4]
cmdbuffs_memb_mem:
        DS8 272

        SECTION `.data`:DATA:REORDER:NOROOT(2)
sim800_power_state:
        DATA
        DC32 0H, ?_0, process_thread_sim800_power_state
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_sim800_power_state:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_sim800_power_state_0
        MOVW     R2,#+2159
        CMP      R0,R2
        BEQ.N    ??process_thread_sim800_power_state_1
        B.N      ??process_thread_sim800_power_state_2
??process_thread_sim800_power_state_0:
        MOVS     R0,#+4
        BL       gpio_set_as_output
        MOVS     R0,#+3
        BL       gpio_set_as_output
        MOVS     R0,#+10
        BL       gpio_set_as_input
??process_thread_sim800_power_state_3:
        MOVS     R2,#+0
        MOVS     R1,#+133
        LDR.W    R0,??DataTable22
        LDR      R0,[R0, #+0]
        BL       process_post
        MOVS     R1,#+0
        MOVW     R0,#+2159
        STRH     R0,[R4, #+0]
??process_thread_sim800_power_state_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??process_thread_sim800_power_state_4
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+133
        BEQ.N    ??process_thread_sim800_power_state_5
??process_thread_sim800_power_state_4:
        MOVS     R0,#+1
        B.N      ??process_thread_sim800_power_state_6
??process_thread_sim800_power_state_5:
        MOVS     R0,#+10
        BL       gpio_get_pin
        CMP      R0,#+0
        BEQ.N    ??process_thread_sim800_power_state_7
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       gpio_set_pin
        B.N      ??process_thread_sim800_power_state_8
??process_thread_sim800_power_state_7:
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       gpio_set_pin
??process_thread_sim800_power_state_8:
        MOVS     R0,#+8
        BL       gpio_get_pin
        CMP      R0,#+0
        BEQ.N    ??process_thread_sim800_power_state_9
        MOVS     R1,#+1
        MOVS     R0,#+3
        BL       gpio_set_pin
        B.N      ??process_thread_sim800_power_state_3
??process_thread_sim800_power_state_9:
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       gpio_set_pin
        B.N      ??process_thread_sim800_power_state_3
??process_thread_sim800_power_state_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_sim800_power_state_6:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     send_data_ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     send_data_size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     recv_data_size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     recv_data_buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     recv_data_ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     yyr1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     yypgoto

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     yydefgoto

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     ?_5

        SECTION `.data`:DATA:REORDER:NOROOT(2)
parse_process:
        DATA
        DC32 0H, ?_1, process_thread_parse_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_parse_process:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_parse_process_0
        MOVW     R2,#+2181
        CMP      R0,R2
        BEQ.N    ??process_thread_parse_process_1
        B.N      ??process_thread_parse_process_2
??process_thread_parse_process_0:
        MOVS     R2,#+0
        MOVS     R1,#+133
        LDR.W    R0,??DataTable22
        LDR      R0,[R0, #+0]
        BL       process_post
        MOVS     R1,#+0
        MOVW     R0,#+2181
        STRH     R0,[R4, #+0]
??process_thread_parse_process_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??process_thread_parse_process_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+133
        BEQ.N    ??process_thread_parse_process_4
??process_thread_parse_process_3:
        MOVS     R0,#+1
        B.N      ??process_thread_parse_process_5
??process_thread_parse_process_4:
        ADD      R1,SP,#+0
        MOVS     R0,#+1
        BL       usart_stream_byte
        CMP      R0,#+0
        BEQ.N    ??process_thread_parse_process_0
        LDR.W    R0,??DataTable22_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_parse_process_6
        LDRB     R0,[SP, #+0]
        LDR.W    R1,??DataTable22_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable22_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable22_2
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable22_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable22_3
        LDR.W    R2,??DataTable22_1
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        CMP      R0,R1
        BNE.N    ??process_thread_parse_process_7
        LDR.W    R0,??DataTable22_3
        LDR.W    R1,??DataTable22_4
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable22_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable22_4
        STR      R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable22_1
        STR      R0,[R1, #+0]
        LDR.W    R2,??DataTable22_4
        MOVS     R1,#+90
        LDR.W    R0,??DataTable22_5
        LDR      R0,[R0, #+0]
        BL       process_post_synch
??process_thread_parse_process_7:
        B.N      ??process_thread_parse_process_0
??process_thread_parse_process_6:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+62
        BNE.N    ??process_thread_parse_process_8
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??process_thread_parse_process_9
        LDRB     R1,[SP, #+0]
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??process_thread_parse_process_9:
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_dataptr
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+0]
        BL       yyparse
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
        B.N      ??process_thread_parse_process_0
??process_thread_parse_process_8:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+58
        BNE.N    ??process_thread_parse_process_10
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_dataptr
        MOVS     R7,R0
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??process_thread_parse_process_11
        LDRB     R1,[SP, #+0]
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??process_thread_parse_process_11:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+43
        BNE.W    ??process_thread_parse_process_0
        LDRB     R0,[R7, #+1]
        CMP      R0,#+73
        BNE.W    ??process_thread_parse_process_0
        LDRB     R0,[R7, #+2]
        CMP      R0,#+80
        BNE.W    ??process_thread_parse_process_0
        LDRB     R0,[R7, #+3]
        CMP      R0,#+68
        BNE.W    ??process_thread_parse_process_0
        LDR.N    R0,??DataTable5
        STR      R7,[R0, #+0]
        BL       yyparse
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
        B.N      ??process_thread_parse_process_0
??process_thread_parse_process_10:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+10
        BNE.N    ??process_thread_parse_process_12
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??process_thread_parse_process_13
        LDRB     R1,[SP, #+0]
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??process_thread_parse_process_13:
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_length
        CMP      R0,#+3
        BCC.N    ??process_thread_parse_process_14
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_dataptr
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+0]
        BL       yyparse
??process_thread_parse_process_14:
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
        B.N      ??process_thread_parse_process_0
??process_thread_parse_process_12:
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.W    ??process_thread_parse_process_0
        LDRB     R1,[SP, #+0]
        LDR.W    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
        B.N      ??process_thread_parse_process_0
??process_thread_parse_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_parse_process_5:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     yystos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     YYSTART

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??recv_data:
        DS8 8

        SECTION `.data`:DATA:REORDER:NOROOT(2)
sim800_power_ctrl_process:
        DATA
        DC32 0H, ?_2, process_thread_sim800_power_ctrl_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_sim800_power_ctrl_process:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_sim800_power_ctrl_process_0
        MOVW     R2,#+2246
        SUBS     R0,R0,R2
        BEQ.N    ??process_thread_sim800_power_ctrl_process_1
        SUBS     R0,R0,#+5
        BEQ.N    ??process_thread_sim800_power_ctrl_process_2
        SUBS     R0,R0,#+10
        BEQ.N    ??process_thread_sim800_power_ctrl_process_3
        B.N      ??process_thread_sim800_power_ctrl_process_4
??process_thread_sim800_power_ctrl_process_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BNE.N    ??process_thread_sim800_power_ctrl_process_5
        MOVS     R0,#+2
        STRB     R0,[SP, #+2]
        MOVS     R0,#+20
        STRB     R0,[SP, #+3]
        MOVS     R0,#+128
        STRH     R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable22_7  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R1,#+1
        MOVS     R0,#+21
        BL       gpio_set_pin
??process_thread_sim800_power_ctrl_process_5:
        MOVS     R1,#+0
        MOVW     R0,#+2246
        STRH     R0,[R4, #+0]
??process_thread_sim800_power_ctrl_process_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??process_thread_sim800_power_ctrl_process_6
        MOVS     R0,#+1
        B.N      ??process_thread_sim800_power_ctrl_process_7
??process_thread_sim800_power_ctrl_process_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+64
        BNE.N    ??process_thread_sim800_power_ctrl_process_8
        MOVS     R0,#+10
        BL       gpio_get_pin
        CMP      R0,#+0
        BNE.N    ??process_thread_sim800_power_ctrl_process_9
        MOVS     R1,#+128
        LDR.W    R0,??DataTable22_7  ;; 0x40010800
        BL       GPIO_ResetBits
        MOV      R1,#+1200
        LDR.W    R0,??DataTable22_8
        BL       etimer_set
        MOVS     R1,#+0
        MOVW     R0,#+2251
        STRH     R0,[R4, #+0]
??process_thread_sim800_power_ctrl_process_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??process_thread_sim800_power_ctrl_process_10
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_sim800_power_ctrl_process_11
??process_thread_sim800_power_ctrl_process_10:
        MOVS     R0,#+1
        B.N      ??process_thread_sim800_power_ctrl_process_7
??process_thread_sim800_power_ctrl_process_11:
        MOVS     R1,#+128
        LDR.W    R0,??DataTable22_7  ;; 0x40010800
        BL       GPIO_SetBits
??process_thread_sim800_power_ctrl_process_9:
        LDR.W    R0,??DataTable22_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_sim800_power_ctrl_process_8
        MOVS     R2,#+0
        MOVS     R1,#+94
        LDR.W    R0,??DataTable22_5
        LDR      R0,[R0, #+0]
        BL       process_post
??process_thread_sim800_power_ctrl_process_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+65
        BNE.N    ??process_thread_sim800_power_ctrl_process_5
        MOVS     R0,#+10
        BL       gpio_get_pin
        CMP      R0,#+1
        BNE.N    ??process_thread_sim800_power_ctrl_process_12
        MOVS     R1,#+128
        LDR.W    R0,??DataTable22_7  ;; 0x40010800
        BL       GPIO_ResetBits
        MOVW     R1,#+1500
        LDR.W    R0,??DataTable22_8
        BL       etimer_set
        MOVS     R1,#+0
        MOVW     R0,#+2261
        STRH     R0,[R4, #+0]
??process_thread_sim800_power_ctrl_process_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??process_thread_sim800_power_ctrl_process_13
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+136
        BEQ.N    ??process_thread_sim800_power_ctrl_process_14
??process_thread_sim800_power_ctrl_process_13:
        MOVS     R0,#+1
        B.N      ??process_thread_sim800_power_ctrl_process_7
??process_thread_sim800_power_ctrl_process_14:
        MOVS     R1,#+128
        LDR.W    R0,??DataTable22_7  ;; 0x40010800
        BL       GPIO_SetBits
??process_thread_sim800_power_ctrl_process_12:
        LDR.W    R0,??DataTable22_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??process_thread_sim800_power_ctrl_process_5
        MOVS     R2,#+0
        MOVS     R1,#+95
        LDR.W    R0,??DataTable22_5
        LDR      R0,[R0, #+0]
        BL       process_post
        B.N      ??process_thread_sim800_power_ctrl_process_5
??process_thread_sim800_power_ctrl_process_4:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_sim800_power_ctrl_process_7:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     YYCURSOR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     YYMARKER

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??et_power:
        DS8 16

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_uart_input_handler:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+10
        BEQ.N    ??sim800_uart_input_handler_0
        CMP      R0,#+58
        BEQ.N    ??sim800_uart_input_handler_1
        CMP      R0,#+62
        BNE.N    ??sim800_uart_input_handler_2
??sim800_uart_input_handler_3:
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??sim800_uart_input_handler_4
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??sim800_uart_input_handler_4:
        LDR.N    R0,??DataTable22_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+93
        LDR.N    R0,??DataTable22_9
        BL       process_post
        LDR.N    R0,??DataTable22_10
        BL       memb_alloc
        LDR.N    R1,??DataTable22_6
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
        B.N      ??sim800_uart_input_handler_5
??sim800_uart_input_handler_1:
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_dataptr
        MOVS     R5,R0
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??sim800_uart_input_handler_6
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??sim800_uart_input_handler_6:
        LDRB     R0,[R5, #+1]
        CMP      R0,#+73
        BNE.N    ??sim800_uart_input_handler_7
        LDRB     R0,[R5, #+2]
        CMP      R0,#+80
        BNE.N    ??sim800_uart_input_handler_7
        LDRB     R0,[R5, #+3]
        CMP      R0,#+68
        BNE.N    ??sim800_uart_input_handler_7
        MOVS     R0,#+1
        B.N      ??sim800_uart_input_handler_8
??sim800_uart_input_handler_7:
        MOVS     R0,#+0
??sim800_uart_input_handler_8:
        STRB     R0,[R5, #+0]
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ.N    ??sim800_uart_input_handler_9
        LDR.N    R0,??DataTable22_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+93
        LDR.N    R0,??DataTable22_9
        BL       process_post
        LDR.N    R0,??DataTable22_10
        BL       memb_alloc
        LDR.N    R1,??DataTable22_6
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
??sim800_uart_input_handler_9:
        B.N      ??sim800_uart_input_handler_5
??sim800_uart_input_handler_0:
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??sim800_uart_input_handler_10
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??sim800_uart_input_handler_10:
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_length
        CMP      R0,#+3
        BCC.N    ??sim800_uart_input_handler_11
        LDR.N    R0,??DataTable22_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+93
        LDR.N    R0,??DataTable22_9
        BL       process_post
        LDR.N    R0,??DataTable22_10
        BL       memb_alloc
        LDR.N    R1,??DataTable22_6
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??sim800_uart_input_handler_11
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
??sim800_uart_input_handler_11:
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
        B.N      ??sim800_uart_input_handler_5
??sim800_uart_input_handler_2:
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_size
        CMP      R0,#+1
        BLT.N    ??sim800_uart_input_handler_12
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_push_byte
??sim800_uart_input_handler_12:
??sim800_uart_input_handler_5:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable22_10
        BL       memb_init
        LDR.N    R0,??DataTable22_10
        BL       memb_alloc
        LDR.N    R1,??DataTable22_6
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable22_6
        LDR      R0,[R0, #+0]
        BL       cmd_buffer_init
        MOVS     R0,#+10
        BL       gpio_set_as_input
        MOVS     R0,#+8
        BL       gpio_set_as_input
        MOVS     R0,#+21
        BL       gpio_set_as_output
        MOVS     R1,#+0
        LDR.N    R0,??DataTable22_11
        BL       process_start
        MOVS     R1,#+0
        LDR.N    R0,??DataTable22_9
        BL       process_start
        MOVS     R1,#+0
        LDR.N    R0,??DataTable22_12
        BL       process_start
        LDR.N    R0,??DataTable22_5
        STR      R4,[R0, #+0]
        MOVS     R0,#+1
        BL       usart_stream_init
        MOVS     R3,#+1
        MOVS     R2,#+8
        MOV      R1,#+9600
        MOVS     R0,#+2
        BL       usart_configure
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_set_parent:
        LDR.N    R1,??DataTable22_5
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_power_on:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+64
        LDR.N    R0,??DataTable22_11
        BL       process_post
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_power_off:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+65
        LDR.N    R0,??DataTable22_11
        BL       process_post
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_cpin:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_13
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_csq:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_14
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_creg:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_15
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_cgatt:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_16
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_cstt:
        PUSH     {R4,LR}
        SUB      SP,SP,#+32
        MOVS     R4,R0
        MOVS     R2,R4
        LDR.N    R1,??DataTable22_17
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+32
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_ciicr:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_18
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_cifsr:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_19
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_ciphead:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_20
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_ate0:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR.N    R1,??DataTable22_21
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_cipstart:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+68
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R3,R5
        MOVS     R2,R4
        LDR.N    R1,??DataTable22_22
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+68
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_cmd_cipmode:
        PUSH     {R4,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R0
        MOVS     R2,R4
        LDR.N    R1,??DataTable22_23
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+64
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sim800_send:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+68
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable22_24
        STR      R4,[R0, #+0]
        LDR.N    R0,??DataTable22_25
        STR      R5,[R0, #+0]
        MOVS     R2,R5
        LDR.N    R1,??DataTable22_26
        ADD      R0,SP,#+0
        BL       sprintf
        ADD      R0,SP,#+0
        BL       strlen
        MOVS     R2,R0
        ADD      R1,SP,#+0
        MOVS     R0,#+2
        BL       usart_write
        ADD      SP,SP,#+68
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     process_current

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     recv_data_size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     recv_data_ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_3:
        DC32     recv_data_buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_4:
        DC32     ??recv_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_5:
        DC32     app_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_6:
        DC32     current_cmd_buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_7:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_8:
        DC32     ??et_power

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_9:
        DC32     parse_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_10:
        DC32     cmdbuffs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_11:
        DC32     sim800_power_ctrl_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_12:
        DC32     sim800_power_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_13:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_14:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_15:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_16:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_17:
        DC32     ?_15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_18:
        DC32     ?_16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_19:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_20:
        DC32     ?_18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_21:
        DC32     ?_19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_22:
        DC32     ?_20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_23:
        DC32     ?_21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_24:
        DC32     send_data_ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_25:
        DC32     send_data_size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_26:
        DC32     ?_22

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
// 1 412 bytes in section .bss
//    60 bytes in section .data
// 1 080 bytes in section .rodata
// 5 968 bytes in section .text
// 
// 5 968 bytes of CODE  memory
// 1 080 bytes of CONST memory
// 1 472 bytes of DATA  memory
//
//Errors: none
//Warnings: none
