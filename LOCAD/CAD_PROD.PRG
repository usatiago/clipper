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

Set Confirm On
Public Var_Controle_3 :=0
Do While Var_Controle_3 = 0
    Set Cursor On
    Select 2
    _CodPro = Lastrec()+1
    _Titulo = Space(40)
    _Genero = Space(30)
    _Quant = 0
    _Lanca = ctod("  /  /  ")
    Set Color To ,,,,W+/BG
    RestScreen(0,0,24,79,TelaV)
    Produtos_Formulario()
    Seek _CodPro
    if found()
        Aviso = alert("Codigo Duplicado.; Vocˆ deseja alterar o codigo (?)",{"Sim","Nao"})
        If aviso = 1
            PRODUTOS_FORMULARIO()            
        Endif
    end
    if _Titulo <> " "
        Aviso = alert("Vocˆ deseja confirmar; os dados da inclusao (?)",{"Sim","Nao"})
        if Aviso = 1
            Gravacao_produtos()
        endif
    endif
    Aviso = alert("Continuar sessao de inclusao (?)",{"Nao","Sim"})
    if aviso = 1
        var_controle_3 = 1
        loop
    endif
Enddo

If var_controle_3 = 1
    set confirm off
    do menu
Elseif var_controle_3 = 2
    PRODUTOS_FORMULARIO()
endif

*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*


Procedure PRODUTOS_FORMULARIO
    MOLDURA_SOMBREADA(06,08,14,70,"Cadastro de Videos")
    @ 08,10 say "Codigo do Produto -" get _codpro Pict "99999999"
    @ 09,10 say "Titulo     -" get _titulo pict "@!" Valid(_titulo<>" ")
    @ 10,10 say "Genero     -" get _genero pict "@!" Valid(_genero<>" ")
    @ 11,10 say "Quantidade -" get _quant pict "99" 
    @ 12,10 say "Data de Lan‡amento -" get _lanca 
    Read

Procedure GRAVACAO_PRODUTOS
    Append Blank
    Replace Codpro With _CodPro, Titulo With _Titulo, Genero with _Genero,;
    quant with _quant, lanca with _lanca
       

