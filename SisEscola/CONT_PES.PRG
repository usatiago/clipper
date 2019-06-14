private pes_cont:=1
Do while pes_cont=1
        limpa_tela()
        @9,6,14,26 box repl(chr(219),9) color"n/n" 
        @8,5,13,25 box repl(chr(219),9) color"b/b"
        @8,5 to 13,25 color"gr+/b"
        @8,5,8,25 box repl(chr(219),9) color"r/r"
        @8,6 say"Pesquisas" color"gr+/r"
        setcolor("w+/b,w+/bg")
        @9,6 prompt"      Pesquisa     " message"Pesquisa por c¢digo"
        @10,6 prompt"       Lista       " message"Lista de Aniversariantes"
        @12,6 prompt"      Retorna      " message"Retorna ao menu Principal" 
        menu to opc_pes
        Do case
                case opc_pes = 1
                        do pes_alu
                case opc_pes = 2
                        do lis_alu
                case opc_pes = 3
                        pes_cont = 2
                        limpa_tela()
                        tela_principal()
                        loop
        Endcase
Enddo
