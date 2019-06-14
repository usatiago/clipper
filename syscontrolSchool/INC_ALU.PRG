private alunos:=1
Do while alunos=1
        tela("Matr¡culas - Informa‡äes Pessoais")
        @23,69 say"ÛÛÛÛÛÛÛÛÛ" color"b/b"
        @23,69 say"InclusÆo" color"gr+/b"
        set cursor on
        setcursor(2)
        use alunos
        index on numematri to numero
        _numematri:=0
        @1,3 say"N£mero da Matr¡cula:::>" color"w+/b"
        @1,29 get _numematri pict"99999"
        read

        if _numematri=0
        alert("NÆo ‚ poss¡vel cadastrar um aluno; sem o n£mero de Matr¡cula (!)",{"OK"})
        saida=alert("Abandonar SessÆo (?)",{"Sim","NÆo"})
                if saida=1
                        alunos=2
                        limpa_tela()
                        tela_principal()
                        loop
                        else
                        loop
                endif
        endif

        seek _numematri

        if found()
        alert("N£mero de matr¡cula j  existente (!)",{"OK"})
                saida2=alert("Abandonar SessÆo (?)",{"Sim","NÆo"})
                if saida2=1
                        alunos=2
                        limpa_tela()
                        tela_principal()
                        loop
                        else
                        loop
                endif
        endif
        
_nome:=space(40)
_endereco:=space(30)
_comp:=space(10)
_cidade:=space(30)
_estado:=space(2)
_cep:=space(10)
_tel1:=space(14)
_datanasc:=ctod("")
_rg:=space(12)
_cpf:=space(14)
_periodo:=space(10)
set color to n/bg,,,,n/bg
@2,3 say"Nome do Aluno:>" color"w+/b" get _nome 
@3,3 say"Endere‡o:>" color"w+/b" get _endereco
@3,45 say"Comp:>" color"w+/b" get _comp
@4,3 say"Cidade:>" color"w+/b" get _cidade
@4,45 say"Estado:>" color"w+/b" get _estado
@4,57 say"Cep:>" color"w+/b" get _cep pict"99.999-999"
@5,3 say"Datanasc:>" color"w+/b" get _datanasc 
@5,25 say"Telefone:>" color"w+/b" get _tel1 pict"(999)9999-9999"
dbcloseall()
a = 1
do while (a = 1)
        use alunos
        index on rg to rg
        @5,52 say"RG:>" color"w+/b" get _rg pict"99.999.999-9" valid(_rg <>" ")
        read
        seek _rg

        if found()
                alert("RG j  Existente (!), Vocˆ deve corrigi - lo (!)",{"OK"})
                _rg = "  .   .   - "
                loop
        else
                a = 0 ; loop              
        endif
enddo
if(a = 0)
        cad2()
endif
dbcloseall()

                saida3=alert("Abandonar SessÆo (?)",{"Sim","NÆo"})
                if saida3=1
                        alunos=2
                        limpa_tela()
                        tela_principal()
                        loop
                        else
                        loop
                endif

Enddo


procedure cad2
@6,3 say"CPF:>" color"w+/b" get _cpf pict"999.999.999-99"
@6,25 say"Per¡odo:>" color"w+/b" get _periodo
_nomepai:=space(40)
_endpai:=space(30)
_comppai:=space(10)
_cidadepai:=space(30)
_estadopai:=space(2)
_ceppai:=space(10)
_telpai:=space(14)
_rgpai:=space(12)
_cpfpai:=space(14)
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
_nomemae:=space(40)
_endmae:=space(30)
_compmae:=space(10)
_cidademae:=space(30)
_estadomae:=space(2)
_cepmae:=space(10)
_telmae:=space(14)
_rgmae:=space(12)
_cpfmae:=space(14)
@13,3 say"Nome da MÆe:>" color"w+/b" get _nomemae
@14,3 say"Endere‡o:>" color"w+/b" get _endmae
@14,45 say"Comp:>" color"w+/b" get _compmae
@15,3 say"Cidade:>" color"w+/b" get _cidademae
@15,45 say"Estado:>" color"w+/b" get _estadomae
@15,57 say"Cep:>" color"w+/b" get _cepmae pict"99.999-999"
@16,3 say"Telefone:>" color"w+/b" get _telmae pict"(999)9999-9999"
@16,32 say"RG:>" color"w+/b" get _rgmae pict"99.999.999-9"
@16,50 say"CPF:>" color"w+/b" get _cpfmae pict"999.999.999-99"
_respon:=space(40)
_endrespon:=space(30)
_comprespon:=space(10)
_cidaderesp:=space(30)
_estadoresp:=space(2)
_ceprespon:=space(10)
_telrespon:=space(14)
_rgrespon:=space(12)
_cpfrespon:=space(14)
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
grava=alert("Gravar Matr¡cula",{"Sim","NÆo"})
if grava=1
use alunos
index on numematri to numero
        append blank
        gravacao()
endif



