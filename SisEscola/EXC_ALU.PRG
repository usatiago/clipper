use alunos
index on numematri to numero
use
use alunos index numero
private alu_pes:=1
Do while alu_pes=1
        tela("Exclus∆o de Alunos")
        @23,69 say"€€€€€€€€€" color"b/b"
        @23,69 say"Pesquisa" color"gr+/b"
        @10,29,13,51 box repl(chr(219),9) color"n/n"
        @10,30,12,50 box repl(chr(219),9) color"b/b"
        @10,30 to 12,50 color"gr+/b"
        @10,30,10,50 box repl(chr(219),9) color"r/r"
        @10,31 say"Nß Matr°cula" color"w+/r"
        set cursor on
        setcursor(2)
        _numematri:=0
        @11,35 get _numematri color"r/w"
        read

        if _numematri=0
                alert("N£mero de Matr°cula, Inv†lido (!)",{"OK"})
                saida=alert("Abandonar Sess∆o (?)",{"Sim","N∆o"})
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
                alert("Nß de Matr°cula n∆o encontrado (!)",{"OK"})
                saida2=alert("Abandonar Sess∆o (?)",{"Sim","N∆o"})
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
        most_pes2()
                saida3=alert("Abandonar Sess∆o (?)",{"Sim","N∆o"})
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
procedure most_pes2()
@2,3 say"Nome do Aluno:>" color"w+/b"
@3,3 say"Endereáo:>" color"w+/b"
@3,45 say"Comp:>" color"w+/b"
@4,3 say"Cidade:>" color"w+/b"
@4,45 say"Estado:>" color"w+/b"
@4,57 say"Cep:>" color"w+/b"
@5,3 say"Datanasc:>" color"w+/b"
@5,25 say"Telefone:>" color"w+/b"
@5,52 say"RG:>" color"w+/b"
@6,3 say"CPF:>" color"w+/b"
@6,25 say"Per°odo:>" color"w+/b"
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
@9,3 say"Endereáo:>" color"w+/b"
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
@13,3 say"Nome da M∆e:>" color"w+/b"
@14,3 say"Endereáo:>" color"w+/b"
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
@18,3 say"Informaá‰es Complementares" color"g+/b"
@19,3 say"Nome do Respons†vel:>" color"w+/b"
@20,3 say"Endereáo:>" color"w+/b"
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
@23,5 say"Pressione qualquer tecla para continuar..." color"g+/b"
inkey(0)
op = Alert("Deseja Confirmar a Exclus∆o do Registro ??",{"Sim","N∆o"})
if op = 1
        delete ; pack
        seek _numematri
        if !found()
                alert("Registro Apagado")
        else
                alert("N∆o foi possivel apagar este registro !!!","w+/b*")
        endif
endif
*******


