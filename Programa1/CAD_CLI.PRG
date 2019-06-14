//                                                    
//    Nome do Arquivo ---> Menu.Prg
//    Programadores -----> Ricardo Rog‚rio de Oliveira.
//                         Tiago Ferbani Garcia.
//
//    Dia da éltima Atualiza‡Æo --> 23/05/1998.
//
// --> Arquivo Principal do Projeto LOCADORA
// --> Principal: Menu.PRG - Menu Principal.
//   ----> Sub Arquivos: Cad_Cli.PRG - Cadastro de Clientes.



Bco_Dados_Clientes()
Public Var_Controle_2 :=0
Do While Var_Controle_2 = 0
    Set Cursor On
    Use Cliente
    Index On Codigo To Ntx_Cod
    _Codigo:=lastrec()+1
    _NR:=0
    _Nome:= _SobNome:= Space(30)
    _Bairro:=_Cidade:=_End:= Space(40)
    _UF:=Space(02)
    _Tel:=_RG:=_Cic:=_tel2:=Space(14)
    _DataNasc:=CtoD("  /  /  ")
    _DataCad:=Date()
    Set Color To ,,,,W+/BG
    @ 06,02 clear to 19,77
    @ 06,02 to 19,77 double
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
    datanasc with _datanasc, datacad with _datanasc, saldo with _saldo


Procedure Bco_Dados_Clientes
If !File("cliente.dbf")
         Dados:={ {"codigo","N",7,0},{"nome","C",30,0},{"sobnome","C",30,0},{"end","C",30,0},;
                  {"nr","C",6,0},{"bairro","C",40,0},{"cidade","C",40,0},;
                  {"uf","C",2,0},{"tel","C",14,0},{"rg","C",14,0},;
                  {"cic","C",14,0},{"datanasc","D",8,0},{"datacad","D",8,0},;
                  {"saldo","N",8,0},{"tel2","C",14,0} }
         dbcreate("cliente.dbf",dados)
endif

Procedure FORMULARIO
    @ 08,05 say "Codigo     - " get _codigo Pict "9999999"
    @ 09,05 say "Nome       - " get _nome pict "@!" Valid(_nome<>" ")
    @ 10,05 say "Sobrenome  - " get _sobnome pict "@!" Valid(_Sobnome<>" ")
    @ 11,05 say "Endereco   - " get _end pict "@!" Valid(_end<>" ")
    @ 11,60 say "N§ - " get _nr
    @ 12,05 say "Bairro     - " get _bairro pict "@!"
    @ 13,05 say "Cidade     - " get _cidade pict "@!"
    @ 13,60 say "UF - " get _uf pict "@!"
    @ 14,05 say "Telefone Residencial - " get _tel pict "(999)9999-9999"
    @ 15,05 say "Telefone Comercial   - " get _tel2 pict "(999)9999-9999"
    @ 16,05 say "RG - " get _rg pict "999.999.999-9"
    @ 16,35 say "CIC/CPF - " get _cic pict "99.999.999-99"
    @ 17,05 say "Data Nascimento - " get _datanasc
    @ 17,35 say "Data Cadastro - " get _datacad
    Read
