
#define N_COPIAS        1

_COPIAS = N_COPIAS
Var_op = 0
Saida = 0
//
Do While Saida = 0
        Moldura_Sombreada(5,20,19,61,"Impressao Relat¢rio de Clientes.")
        Set Wrap On
        @ 07,22 Prompt "<Op‡oes>"
        @ 07,31 Prompt "<Imprimir>"
        @ 07,42 Prompt "<Volta ao Sistema>"
        @ 18,23 Say "Ser  Impresso "+ Alltrim(Str(_Copias))+" C¢pia(s) do Relat¢rio"
        Read
        Menu To VAR_OP
        Do Case
                Case VAR_OP = 1
                        Saida = 1
                Case VAR_OP = 2
                        Saida = 2
                Case VAR_OP = 3
                        Saida = 3
        EndCase                               
Enddo
If saida = 1
        OPTIONS_IMP()
Elseif saida = 2
        PRINT_CLI()
Elseif saida = 3
Endif
//--------->
Procedure Print_Cli
                Impressora = ISPRINTER()
                If Impressora = .T.        
                        Clear
                        Set Margin To 5
                        Set Device To Print
                        Set Printer ON
                        Set Console OFF
                        Bco_Dados_Clientes()
                        Select 1
                        DBGoTop()
                        ? Chr(13)+"Relat¢rio de Clientes - GERAL"+Chr(13)
                        ? "-------------------------------------------------------------------------"
                        N = 0
                        Do While !EOF()
                                ? codigo
                                ?? "  "
                                ?? nome
                                N++
                                Skip
                        Enddo
                        ? "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                        ? N
                        ?? "  Resultado(s) do relat¢rio CLIENTES"
                        ? "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                        Set Device To Screen
                        Set Printer OFF
                        Set Console ON
                        Alert("O Relat¢rio foi enviado ao spool.;ESPERE o documento ser impresso!!")
                        Eject
                Else
                        Alert("Impressora pode estar:;- desconectada;- desligada;- sem papel;- porta diferente;- se estiver em rede capture a impressora",{"OK"})
                Endif

//Procedure MOLDURA_SOMBREADA(LIN,COL,LIN2,COL2,MENSAGEM)
//    Local medida
*   medida = (col2 - col) - 1
*    @ LIN+1,COL+2,LIN2+1,COL2+1 BOX REPL(CHR(219),9) Color "N"
*    SetColor("Gr+/b")
*    @ Lin,Col Clear To Lin2,Col2
*    @ LIN,COL To LIN2,COL2 DOUBLE
*    @ lin,col+1 say repl(chr(219),medida) color "r/r"
*    @ lin,col+3 say mensagem color "w+/r"

Procedure OPTIONS_IMP
    Public Comando:=""    
    Moldura_Sombreada(5,20,10,61,"Op‡oes de Impressao.")
    @ 07,22 Say "Numero de Copias ->" get _Copias
    Read
    ! &Comando
