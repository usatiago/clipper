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

Public Var_Controle:= 0
Public TelaV
Public TT:=321

Do While Var_Controle = 0
    SetColor("Gr+/B")
    Clear
    Opcao = 0
    Config_Inicial()
    @ 0,0 say repl("Û",80) color "n/n"
    @ 2,3 Say "F1-Ajuda  F2-Cadastros  F3-Consultas  F5-Folha de Dados  F4-Locacao"
    Opcao = Menu_Principal()
    If Opcao = -1
        SubOP = Menu_Cadastro()
        If SubOP =  67 .or. SubOP = 99 // Tecla C - Clientes            
            Var_Controle = 1
            Loop
        ElseIf SubOP = 86 .OR. SubOP = 118 // Tecla V - Videos
            Var_Controle = 2
            Loop
        Endif
    ElseIf Opcao = -2
        SubOP = Menu_Consulta()
        If SubOP =  67 .or. SubOP = 99 // Tecla C - Clientes            
            Escolha = Alert("Vocˆ deseja efetuar consulta;de CLIENTES por:",;
                      {"Codigo","Nome"})
            if Escolha = 1
                Var_Controle = 6
                Loop
            Elseif Escolha = 2
                Var_Controle = 7
                Loop
            endif
        Endif        
    ElseIf Opcao = -4
        SubOP = M_Consulta_Geral()
        If SubOP =  67 .or. SubOP = 99 // Tecla C - Clientes            
            Var_Controle = 4
            Loop
        ElseIf SubOP = 86 .OR. SubOP = 118 // Tecla V - Videos
            Var_Controle = 5
            Loop
        Endif                
    ElseIf Opcao = 27
        Var_Controle = 27
        Loop
    Endif    
Enddo

    If Var_Controle = 1
        Do Cad_Cli
    Elseif Var_Controle = 2
        Do Cad_Prod
    Elseif Var_Controle = 4
        Do Con_Cli
    Elseif Var_Controle = 5
        Do Con_Prod
    Elseif Var_Controle = 6
        Do Pesq_Cli
    Elseif Var_Controle = 7
        Do Pesn_Cli
    Elseif Var_Controle = 27
        Fim = Saida()
        If Fim = 1
            Do Final
        Elseif Fim = 2 .or. Fim = 0
            Do Menu
        Endif
    Endif



************************************************************************************************************
Procedure CONFIG_INICIAL
Set Date Brit
Set Cursor Off

Function MENU_PRINCIPAL
    Local Op,Contador
    @ 1,00 To 24,79
    @ 3,00 Say Chr(195)
    @ 3,79 Say Chr(180)
    @ 3,01 Say Repl(Chr(196),78)
    @ 4,1,23,78 box repl(chr(177),9) color "W+/w+"
    TelaV:=SaveScreen(0,0,24,79)
    Op = Inkey(0)
    Return(Op)

Function MENU_CADASTRO
    Local Op
    @ 22,1,23,78 box repl(chr(219),9) color "b"
    @ 22,00 Say Chr(195)
    @ 22,79 Say Chr(180)
    @ 22,01 Say Repl(Chr(196),78)
    @ 23,3 Say "Clientes   Videos"
    @ 23,3 SAy "C" color "r+/b"
    @ 23,14 say "V" Color "r+/b"
    Op = Inkey(0)
    Return(Op)

Function MENU_CONSULTA
    local op
    @ 22,1,23,78 box repl(chr(219),9) color "b"
    @ 22,00 Say Chr(195)
    @ 22,79 Say Chr(180)
    @ 22,01 Say Repl(Chr(196),78)
    @ 23,3 Say "Clientes   Videos"
    @ 23,3 SAy "C" color "r+/b"
    @ 23,14 say "V" Color "r+/b"
    Op = Inkey(0)
    Return(Op)

Function M_CONSULTA_GERAL
    local op
    @ 22,1,23,78 box repl(chr(219),9) color "b"
    @ 22,00 Say Chr(195)
    @ 22,79 Say Chr(180)
    @ 22,01 Say Repl(Chr(196),78)
    @ 23,3 Say "Clientes   Videos"
    @ 23,3 SAy "C" color "r+/b"
    @ 23,14 say "V" Color "r+/b"
    Op = Inkey(0)
    Return(Op)



Function SAIDA
    Local A
    A = Alert("Tem certeza que deseja ;encerrar a sessao de trabalho (?)",{"Sim","Nao"})
    Return(a)

************************************************************************************************************
Procedure Bco_Dados_Clientes
If !File("cliente.dbf")
         Dados:={ {"codigo","N",7,0},{"nome","C",30,0},{"sobnome","C",30,0},{"end","C",30,0},;
                  {"nr","N",6,0},{"bairro","C",40,0},{"cidade","C",40,0},;
                  {"uf","C",2,0},{"tel","C",14,0},{"rg","C",14,0},;
                  {"cic","C",14,0},{"datanasc","D",8,0},{"datacad","D",8,0},;
                  {"saldo","N",8,0},{"tel2","C",14,0} }
         dbcreate("cliente.dbf",dados)
endif
If !File("Ntx_Cod.NTX")
    Use Cliente
    Index On Codigo to Ntx_Cod
Endif
If !File("produto.dbf")
         Dados:={ {"codpro","N",8,0},{"titulo","C",40,0},{"genero","C",30,0},;
                  {"quant","N",2,0},{"q_disp","N",2,0},{"lanca","D",8,0} }
         dbcreate("produto.dbf",dados)
endif
If !File("Ntx_Cod3.ntx")
    Use Produto
    Index On CodPro To Ntx_Cod3  
Endif


DBCloseAll()
Select 1
Use Cliente Index Ntx_Cod

Select 2
Use Produto Index Ntx_Cod3

