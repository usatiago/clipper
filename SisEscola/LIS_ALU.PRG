**
Local Escolha,Lista:={},Laco:= 1,Indice:={}
Do While Laco = 1
        Set Confirm On
        DiaAtual = SubStr(DtoC(Date()),1,2)
        MesAtual = SubStr(DtoC(Date()),4,2)
        tela("Pesquisa de Anivers riantes")
        @ 23,69 say"ÛÛÛÛÛÛÛÛÛ" color"b/b"
        @ 23,69 say"Pesquisa" color"gr+/b"
        @ 10,29,13,51 box repl(chr(219),9) color"n/n"
        @ 10,30,12,50 box repl(chr(219),9) color"b/b"
        @ 10,30 to 12,50 color"gr+/b"
        @ 10,30,10,50 box repl(chr(219),9) color"r/r"
        @ 10,31 say "Data a Pesquisar" color "w+/r"
        set cursor on
        Setcursor(2)
        @ 11,35 Get DiaAtual color"r/w"
                @ 11,38 Say "/" get MesAtual Color "r/w"
        Read
        DataP = Alltrim(DiaAtual)+"/"+MesAtual
        Use Alunos
        Index On Nome To IndiceN
        Use Alunos Index IndiceN
        DBGoTop()
        AADD(Lista,"Voltar ao Menu Principal")
        Do While !Eof()
                If(DataP == SubStr(DtoC(DataNasc),1,5))
                        AADD(Indice,NumeMatri)
                        AADD(Lista,Upper(Nome)+"        "+DtoC(DataNasc))
                Endif
                Skip
        Enddo
        If Len(Lista) = 1
                Alert("A pesquisa nÆo retornou nenhum resultado")
                Laco = 0 ; Loop
        ElseIf Len(Lista) > 1
                AADD(Lista,"Imprime todos da Lista")
        Endif
        Escolha = 0
        Do While (Escolha = 0)
		@ 04,09 clear to 21,66		
		@ 04,09 to 21,66 double
		Escolha = Achoice(05,10,20,65,Lista)
        Enddo
        If (Escolha = 1) 
                Laco = 0 ; Loop
        ElseIf (Escolha > 1) .And. (Escolha < Len(Lista))
                If (ISPRINTER() = .F.)
                        Alert("NÆo h  nenhuma impressora em uso!!!")
                        Laco = 0 ; Loop
                Else
                        Seek Rtrim(Ltrim(Substr(Lista[Escolha],1,40)))
                        Set Device To Print
                        Set Console Off
                        Set Printer To LPT1
                        Set Printer On
                        ? "E.T.E  Dr. Francisco Nogueira de Lima."
                        ? "DATA: "+DtoC(DATE())
                        ? "Ao Aluno " + Nome
                        ? "**************************************"
                        ? "             Nos da E.T.E desejamos a voce um feliz aniversario e muitos"
                        ? "anos de vida e todos os seus sonhos se realizem. E que gostamos "
                        ? "muito de saber que voce estuda em nossa escola, e que sendo assim"
                        ? "voce e motivo maior de nos estarmos aqui ao seu dispor" 
                        Set Console On
                        Set Device To Screen
                        @ 22,5 say "Imprimindo.... pressione ENTER para Continuar." Color "w*/b" 
                        Inkey(0)
                        Set Printer Off
                        Set Confirm Off
                Endif
        ElseIf (Escolha = Len(Lista))
                If (ISPRINTER() = .F.)
                        Alert("Nao h  nenhuma impressora em uso!!!")
                        Laco = 0 ; Loop
                Else
                        For A = 1 to Len(Indice)
                                Seek Indice[A]
                                Set Device To Print
                                Set Console Off
                                Set Printer To LPT1
                                Set Printer On
                                ? "E.T.E  Dr. Francisco Nogueira de Lima."
                                ? "DATA: "+DtoC(DATE())
                                ? "Ao Aluno "+Rtrim(Ltrim(Substr(Lista[Escolha],1,40)))
                                ? "**************************************"
                                ? "             Nos da E.T.E desejamos a voce um feliz aniversario e muitos"
                                ? "anos de vida e todos os seus sonhos se realizem. E que gostamos "
                                ? "muito de saber que voce estuda em nossa escola, e que sendo assim"
                                ? "voce e motivo maior de nos estarmos aqui ao seu dispor" 
                                Set Console On
                                Set Device To Screen
                                @ 22,5 say "Imprimindo.... "+AllTrim(Nome) Color "w*/b" 
                                Set Printer Off
                                Set Confirm Off
                        Next
                Endif
        Endif
Enddo
