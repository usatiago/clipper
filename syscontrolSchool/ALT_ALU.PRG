use alunos
index on numematri to numero
use
use alunos index numero
private alu_pes:=1
Do while alu_pes=1
        tela("Altera‡Æo de Alunos")
        @23,69 say"ÛÛÛÛÛÛÛÛÛ" color"b/b"
        @23,69 say"Altera‡Æo" color"gr+/b"
        @10,29,13,51 box repl(chr(219),9) color"n/n"
        @10,30,12,50 box repl(chr(219),9) color"b/b"
        @10,30 to 12,50 color"gr+/b"
        @10,30,10,50 box repl(chr(219),9) color"r/r"
        @10,31 say"N§ Matr¡cula" color"w+/r"
        set cursor on
        setcursor(2)
        _numematri:=0
        @11,35 get _numematri color"r/w"
        read

        if _numematri=0
                alert("N£mero de Matr¡cula, Inv lido (!)",{"OK"})
                saida=alert("Abandonar SessÆo (?)",{"Sim","NÆo"})
                if saida=1
                        alu_pes=2
                        limpa_tela()
                        tela_principal()
                        loop
                        else
                        loop
                endif
        endif

        seek _numematri

        if .not. found()
                alert("N§ de Matr¡cula nÆo encontrado (!)",{"OK"})
                saida2=alert("Abandonar SessÆo (?)",{"Sim","NÆo"})
                if saida2=1
                        alu_pes=2
                        limpa_tela()
                        tela_principal()
                        loop
                        else
                        loop
                endif
        endif
        @9,29,13,51 box repl(chr(219),9) color"b/b"
        most_pes3()
                saida3=alert("Abandonar SessÆo (?)",{"Sim","NÆo"})
                if saida3=1
                        alu_pes=2
                        limpa_tela()
                        tela_principal()
                        loop
                        else
                        loop
                endif
Enddo

*******
procedure most_pes3()
        @2,3 say"Nome do Aluno:>" color"w+/b"
        @3,3 say"Endere‡o:>" color"w+/b"
        @3,45 say"Comp:>" color"w+/b"
        @4,3 say"Cidade:>" color"w+/b"
        @4,45 say"Estado:>" color"w+/b"
        @4,57 say"Cep:>" color"w+/b"
        @5,3 say"Datanasc:>" color"w+/b"
        @5,25 say"Telefone:>" color"w+/b"
        @5,52 say"RG:>" color"w+/b"
        @6,3 say"CPF:>" color"w+/b"
        @6,25 say"Per¡odo:>" color"w+/b"
        setcolor("n+/bg")
        @2,19 say nome
        @3,14 say endereco
        @3,52 say comp
        @4,12 say cidade
        @4,54 say estado
        @4,63 say cep pict"99.999-999"
        @5,14 say dtoc(datanasc)
        @5,36 say tel1 pict"(999)9999-9999"
        @5,57 say rg pict"99.999.999-9"
        @6,9 say cpf pict"999.999.999-99"
        @6,35 say periodo
        @8,3 say"Nome do Pai:>" color"w+/b"
        @9,3 say"Endere‡o:>" color"w+/b"
        @9,45 say"Comp:>" color"w+/b"
        @10,3 say"Cidade:>" color"w+/b"
        @10,45 say"Estado:>" color"w+/b"
        @10,57 say"Cep:>" color"w+/b"
        @11,3 say"Telefone:>" color"w+/b"
        @11,32 say"RG:>" color"w+/b"
        @11,50 say"CPF:>" color"w+/b"
        setcolor("n+/bg")
        @8,17 say nomepai
        @9,14 say endpai
        @9,52 say comppai
        @10,12 say cidadepai
        @10,54 say estadopai
        @10,63 say ceppai pict"99.999-999"
        @11,14 say telpai pict"(999)9999-9999"
        @11,37 say rgpai pict"99.999.999-9"
        @11,56 say cpfpai pict"999.999.999-99"
        @13,3 say"Nome da MÆe:>" color"w+/b"
        @14,3 say"Endere‡o:>" color"w+/b"
        @14,45 say"Comp:>" color"w+/b"
        @15,3 say"Cidade:>" color"w+/b"
        @15,45 say"Estado:>" color"w+/b"
        @15,57 say"Cep:>" color"w+/b"
        @16,3 say"Telefone:>" color"w+/b"
        @16,32 say"RG:>" color"w+/b"
        @16,50 say"CPF:>" color"w+/b"
        setcolor("n+/bg")
        @13,17 say nomemae
        @14,14 say endmae
        @14,52 say compmae
        @15,12 say cidademae
        @15,54 say estadomae
        @15,63 say cepmae pict"99.999-999"
        @16,14 say telmae pict"(999)9999-9999"
        @16,37 say rgmae pict"99.999.999-9"
        @16,56 say cpfmae pict"999.999.999-99"
        @18,3 say"Informa‡äes Complementares" color"g+/b"
        @19,3 say"Nome do Respons vel:>" color"w+/b"
        @20,3 say"Endere‡o:>" color"w+/b"
        @20,45 say"Comp:>" color"w+/b"
        @21,3 say"Cidade:>" color"w+/b"
        @21,45 say"Estado:>" color"w+/b"
        @21,57 say"Cep:>" color"w+/b"
        @22,3 say"Telefone:>" color"w+/b"
        @22,32 say"RG:>" color"w+/b"
        @22,50 say"CPF:>" color"w+/b"
        setcolor("n+/bg")
        @19,25 say respon
        @20,14 say endrespon
        @20,52 say comprespon
        @21,12 say cidaderesp
        @21,54 say estadoresp
        @21,63 say ceprespon pict"99.999-999"
        @22,14 say telrespon pict"(999)9999-9999"
        @22,37 say rgrespon pict"99.999.999-9"
        @22,56 say cpfrespon pict"999.999.999-99"

inkey(0)
op = Alert("Deseja Alterar do Registro ??",{"Sim","NÆo"})
if op = 1
        _nome:=nome
        _endereco:=endereco
        _comp:=comp
        _cidade:=cidade
        _estado:=estado
        _cep:=cep
        _tel1:=tel1
        _datanasc:=datanasc
        _rg:=rg
        _cpf:=cpf
        _periodo:=periodo
        set color to n/bg,,,,n/bg
        @2,3 say"Nome do Aluno:>" color"w+/b" get _nome 
        @3,3 say"Endere‡o:>" color"w+/b" get _endereco
        @3,45 say"Comp:>" color"w+/b" get _comp
        @4,3 say"Cidade:>" color"w+/b" get _cidade
        @4,45 say"Estado:>" color"w+/b" get _estado
        @4,57 say"Cep:>" color"w+/b" get _cep pict"99.999-999"
        @5,3 say"Datanasc:>" color"w+/b" get _datanasc 
        @5,25 say"Telefone:>" color"w+/b" get _tel1 pict"(999)9999-9999"
        @5,52 say"RG:>" color"w+/b" get _rg pict"99.999.999-9" valid(_rg <>" ")
        @6,3 say"CPF:>" color"w+/b" get _cpf pict"999.999.999-99"
        @6,25 say"Per¡odo:>" color"w+/b" get _periodo
        _nomepai:=nomepai
        _endpai:=endpai
        _comppai:=comppai
        _cidadepai:=cidadepai
        _estadopai:=estadopai
        _ceppai:=ceppai
        _telpai:=telpai
        _rgpai:=rgpai
        _cpfpai:=cpfpai
        set color to n/bg,,,,n/bg
        @8,3 say"Nome do Pai:>" color"w+/b" get _nomepai
        @9,3 say"Endere‡o:>" color"w+/b" get _endpai
        @9,45 say"Comp:>" color"w+/b" get _comppai
        @10,3 say"Cidade:>" color"w+/b" get _cidadepai
        @10,45 say"Estado:>" color"w+/b" get _estadopai
        @10,57 say"Cep:>" color"w+/b" get _ceppai pict"99.999-999"
        @11,3 say"Telefone:>" color"w+/b" get _telpai pict"(999)9999-9999"
        @11,32 say"RG:>" color"w+/b" get _rgpai pict"99.999.999-9"
        @11,50 say"CPF:>" color"w+/b" get _cpfpai pict"999.999.999-99"
        _nomemae:=nomemae
        _endmae:=endmae
        _compmae:=compmae
        _cidademae:=cidademae
        _estadomae:=estadomae
        _cepmae:=cepmae
        _telmae:=telmae
        _rgmae:=rgmae
        _cpfmae:=cpfmae
        @13,3 say"Nome da MÆe:>" color"w+/b" get _nomemae
        @14,3 say"Endere‡o:>" color"w+/b" get _endmae
        @14,45 say"Comp:>" color"w+/b" get _compmae
        @15,3 say"Cidade:>" color"w+/b" get _cidademae
        @15,45 say"Estado:>" color"w+/b" get _estadomae
        @15,57 say"Cep:>" color"w+/b" get _cepmae pict"99.999-999"
        @16,3 say"Telefone:>" color"w+/b" get _telmae pict"(999)9999-9999"
        @16,32 say"RG:>" color"w+/b" get _rgmae pict"99.999.999-9"
        @16,50 say"CPF:>" color"w+/b" get _cpfmae pict"999.999.999-99"
        _respon:=respon
        _endrespon:=endrespon
        _comprespon:=comprespon
        _cidaderesp:=cidaderesp
        _estadoresp:=estadoresp
        _ceprespon:=ceprespon
        _telrespon:=telrespon
        _rgrespon:=rgrespon
        _cpfrespon:=cpfrespon
        @18,3 say"Informa‡äes Complementares" color"g+/b"
        @19,3 say"Nome do Respons vel:>" color"w+/b" get _respon
        @20,3 say"Endere‡o:>" color"w+/b" get _endrespon
        @20,45 say"Comp:>" color"w+/b" get _comprespon
        @21,3 say"Cidade:>" color"w+/b" get _cidaderesp
        @21,45 say"Estado:>" color"w+/b" get _estadoresp
        @21,57 say"Cep:>" color"w+/b" get _ceprespon pict"99.999-999"
        @22,3 say"Telefone:>" color"w+/b" get _telrespon pict"(999)9999-9999"
        @22,32 say"RG:>" color"w+/b" get _rgrespon pict"99.999.999-9"
        @22,50 say"CPF:>" color"w+/b" get _cpfrespon pict"999.999.999-99"
        read
        grava=alert("Gravar as Altera‡äes (?)",{"Sim","NÆo"})
        if grava=1
                gravacao()
        endif

endif
*******
