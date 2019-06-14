//
//    Nome do Arquivo ---> Menu.Prg
//    Programadores -----> Ricardo Rog‚rio de Oliveira.
//                         Tiago Ferbani Garcia.
//
//
// --> Arquivo Principal do Projeto LOCADORA
// --> Principal: Menu.PRG - Menu Principal.
//   ----> Sub Arquivos: Cad_Cli.PRG - Cadastro de Clientes.
//   ----> Sub Arquivos: Cad_Prod.PRG - Cadastro de Produtos.
//   ----> Sub Arquivos: Con_Cli.PRG - Consulta Geral de Clientes.
//   ----> Sub Arquivos: Con_Prod.PRG - Consulta Geral de Produtos.


select 1
Public Var_Controle_2 :=0
Do While Var_Controle_2 = 0
    Set Cursor On
    _Codigo:=lastrec()+1
    _NR:=0
    _Nome:= _SobNome:= Space(30)
    _Bairro:=_Cidade:=_End:= Space(40)
    _UF:=Space(02)
    _Tel:=_RG:=_Cic:=_tel2:=Space(14)
    _DataNasc:=CtoD("  /  /  ")
    _DataCad:=Date()
    Set Color To ,,,,W+/BG
    RestScreen(0,0,24,79,TelaV)
    Formulario()
    Seek _Codigo
    If Found()
        Aviso = alert("Codigo Duplicado.; Vocˆ deseja alterar o codigo (?)",{"Sim","Nao"})
        if aviso = 1
            Formulario()            
        endif
    Endif
    if _Nome <> " "
        Aviso = alert("Vocˆ deseja confirmar; os dados da inclusao (?)",{"Sim","Nao"})
        if Aviso = 1
            Gravacao()
        endif
    endif
    Aviso = alert("Continuar sessao de inclusao (?)",{"Nao","Sim"})
    if aviso = 1
        var_controle_2 = 1
        loop
    endif
Enddo

If var_controle_2 = 1
    do menu
Elseif var_controle_2 = 2
    Formulario()
endif

Procedure GRAVACAO
    Append Blank
    Replace Codigo With _Codigo, Nome With _Nome, Sobnome with _sobnome,;
    end with _end, nr with _nr, bairro with _bairro, cidade with _cidade,;
    uf with _uf, Tel with _tel, rg with _rg, cic with _cic,;
    datanasc with _datanasc, datacad with _datanasc


Procedure FORMULARIO
    MOLDURA_SOMBREADA(06,02,19,76,"Cadastro de Clientes.")
    @ 08,05 say "Codigo     -" get _codigo Pict "9999999"
    @ 09,05 say "Nome       -" get _nome pict "@!" Valid(_nome<>" ")
    @ 10,05 say "Sobrenome  -" get _sobnome pict "@!" Valid(_Sobnome<>" ")
    @ 11,05 say "Endereco   -" get _end pict "@!" Valid(_end<>" ")
    @ 11,60 say "N§ -" get _nr
    @ 12,05 say "Bairro     -" get _bairro pict "@!"
    @ 13,05 say "Cidade     -" get _cidade pict "@!"
    @ 13,60 say "UF -" get _uf pict "@!"
    @ 14,05 say "Telefone Residencial -" get _tel pict "(999)9999-9999"
    @ 15,05 say "Telefone Comercial   -" get _tel2 pict "(999)9999-9999"
    @ 16,05 say "RG -" get _rg pict "999.999.999-9"
    @ 16,35 say "CIC/CPF -" get _cic pict "99.999.999-99"
    @ 17,05 say "Data Nascimento -" get _datanasc
    @ 17,35 say "Data Cadastro -" get _datacad
    Read

Procedure MOLDURA_SOMBREADA(LIN,COL,LIN2,COL2,MENSAGEM)
    Local medida
    medida = (col2 - col) - 1
    @ LIN+1,COL+2,LIN2+1,COL2+1 BOX REPL(CHR(219),9) Color "N"
    SetColor("Gr+/b")
    @ Lin,Col Clear To Lin2,Col2
    @ LIN,COL To LIN2,COL2 DOUBLE
    @ lin,col+1 say repl(chr(219),medida) color "r/r"
    @ lin,col+3 say mensagem color "w+/r"
