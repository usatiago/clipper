* Programa Principal 
* Iniciado:> 12/05/1999
* Componentes: Ricardo Rog‚rio de Oliveira
*              K tia Moreira
*              Rodrigo Messias dos Santos
*              Tiago Ferbani Garcia
*              Let¡cia Zampar
*              Tiago de Oliveira

clear
set century on
set scoreboard off
set date british
set cursor off
set wrap on
set message to 23 center
private control:=1
do funcoes
Do while control=1
        tela_principal()
        setcolor("w+/b,w+/r")
        @5,1 prompt"  Ajuda  " message"Ajuda do Sistema"
        @5,13 prompt"  InclusÆo  " message"InclusÆo de Alunos"
        @5,26 prompt"  Altera‡Æo  " message"Altera‡Æo de Alunos"
        @5,40 prompt"  Pesquisa  " message"Pesquisa de Alunos" 
        @5,52 prompt"  ExclusÆo  " message"ExclusÆo de Alunos"
        @5,68 prompt"   Sair   " message"Sair do Sistema"
        menu to opc_menu
        Do case
                case opc_menu=2
                do inc_alu

                case opc_menu=3
                do alt_alu

                case opc_menu=4
                do cont_pes

                case opc_menu=5
                do exc_alu

                case opc_menu=6
                saida=alert("Abandonar SessÆo de Trabalho (?)",{"Sim","NÆo"})
                if saida=1
                        control=2
                        setcolor("w/n")
                        clear
                endif
        Endcase
Enddo


procedure tela_principal
@0,0,24,80 box repl(chr(219),9) color"b/b"
@0,0 to 24,79 color"gr+/b"
@0,0 to 3,79 color"gr+/b"
@3,0 say"Ã" color"gr+/b"
@3,79 say"´" color"gr+/b"
@1,1 say time() color"gr+/b"
@1,70 say date() color"gr+/b"
@0,0 to 2,10 color"gr+/b"
@0,10 say"Â" color"gr+/b"
@2,0 say"Ã" color"gr+/b"
@0,69 to 2,79 color"gr+/b"
@0,69 say"Â" color"gr+/b"
@2,79 say"´" color"gr+/b"
@23,120 say"Principal" color"gr+/b"
@22,119 to 24,130 color"gr+/b"
@24,119 say"Á" color"gr+/b"
@22,130 say"´" color"gr+/b"
@1,25 say"ETE Dr. Franscisco Nogueira de Lima" color"bg/b"
@2,23 say"Sistema de Controle e Cadastro de Alunos" color"bg/b"
@6,1,21,78 box repl(chr(177),9) color"w+/w+"
@22,19 to 24,59 color"gr+/b"
@24,19 say"Á" color"gr+/b"
@24,59 say"Á" color"gr+/b"
@22,68 to 24,79 color"gr+/b"
@22,79 say"´" color"gr+/b"
@24,68 say"Á" color"gr+/b"
@23,69 say"Principal" color"gr+/b"

function tela(mensagem)
@0,0,24,79 box repl(chr(219),9) color"b/b"
@0,0 to 24,79 color"gr+/b"
@0,0,0,79 box repl(chr(219),9) color"r/r"
@0,1 say mensagem color"w+/r"

function limpa_tela
@0,0,24,79 box repl(chr(177),9) color"b/b"  

