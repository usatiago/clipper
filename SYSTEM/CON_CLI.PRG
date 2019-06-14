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

Saida = 0
Select 1
RestScreen(0,0,24,79,TelaV)
LinI = 06
ColI = 08
LinF = 20
ColF = 70
MOLDURA_SOMBREADA(11,20,13,60,"Aviso ...")
@ 12,23 say "Abrindo Banco de Dados. Espere ..." Color "w+*/b"
SetColor("w+/n")
dbgotop() 
Do While Saida = 0
        If TT = 123
                LinI = 1
                LinF = 24
                ColI = 0
                ColF = 79
                RestScreen(0,0,24,79,TelaV)
        ElseIf TT = 321
                LinI = 06
                ColI = 08
                LinF = 20
                ColF = 70
                RestScreen(0,0,24,79,TelaV)
        Endif
        Tecla = 0
        MOLDURA_SOMBREADA(LinI,ColI,LinF,ColF,"Listagem Geral")
        Tabela  := TBrowseDB(LinI+1,ColI+1,LinF-1,ColF-1)
        coluna1 := TBColumnNew("Codigo",{|| Codigo }) 
        coluna2 := TBColumnNew("Nome",{|| Nome })
        coluna3 := TBColumnNew("Sobrenome",{|| SobNome })
        coluna4 := TBColumnNew("Endereco",{|| End })
        coluna5 := TBColumnNew("Numero",{|| Nr })        
        coluna6 := TBColumnNew("Bairro",{|| Bairro })
        coluna7 := TBColumnNew("Cidade",{|| Cidade })
        coluna8 := TBColumnNew("Estado",{|| Uf })
        coluna9 := TBColumnNew("Telefone Residencial",{|| Tel })
        coluna10 := TBColumnNew("Telefone Comercial",{|| Tel2 })
        coluna11 := TBColumnNew("RG",{|| Rg })
        coluna12 := TBColumnNew("CIC/CPF",{|| CIC })
        coluna13 := TBColumnNew("Data de Nascimento",{|| DataNasc })
        coluna14 := TBColumnNew("Data de Cadastro",{|| DataCad })
        coluna15 := TBColumnNew("Saldo",{|| Saldo })
        coluna16 := TBColumnNew("Deletado",{|| Deleted() })

        Tabela : AddColumn(coluna1)
        Tabela : AddColumn(coluna2)
        Tabela : AddColumn(coluna3)
        Tabela : AddColumn(coluna4)
        Tabela : AddColumn(coluna5)
        Tabela : AddColumn(coluna6)
        Tabela : AddColumn(coluna7)
        Tabela : AddColumn(coluna8)
        Tabela : AddColumn(coluna9)
        Tabela : AddColumn(coluna10)
        Tabela : AddColumn(coluna11)
        Tabela : AddColumn(coluna12)
        Tabela : AddColumn(coluna13)
        Tabela : AddColumn(coluna14)
        Tabela : AddColumn(coluna15)
        Tabela : AddColumn(coluna16)


        tabela : ColSep(Chr(179))
        tabela : FootSep(Chr(196))
        tabela : HeadSep(Chr(196))
        Coluna1 : Footing("** Listagem de Clientes **")
        Do While Saida = 0
            Do While !Tabela:Stabilize
            Enddo
            Tecla = Inkey(0)
            Eval( {|| IIf(Tecla = 19,Tabela:Left(),)})
            Eval( {|| IIf(Tecla = 05,Tabela:Up(),)})
            Eval( {|| IIf(Tecla = 24,Tabela:Down(),)})
            Eval( {|| IIf(Tecla = 04,Tabela:Right(),)})
            Eval( {|| IIf(Tecla = 01,Tabela:Home(),)})
            Eval( {|| IIf(Tecla = 06,Tabela:End(),)})
            Eval( {|| IIf(Tecla = 31,Tabela:GoTop(),)})
            Eval( {|| IIf(Tecla = 30,Tabela:GoBottom(),)})
            Eval( {|| IIf(Tecla = 26,Tabela:PanLeft(),)})
            Eval( {|| IIf(Tecla = 02,Tabela:PanRight(),)})
            Eval( {|| IIf(Tecla = 03,Tabela:PageDown(),)}) 
            Eval( {|| IIf(Tecla = 18,Tabela:PageUp(),)})

            If Tecla = 27 // Tecla ESC
                Saida = 1 ; Loop
            Elseif Tecla = -8 // Tecla F8
                Saida = 2 ; Loop
            Endif
        Enddo
        If Saida = 2
                If TT = 123
                        TT = 321
                Elseif TT = 321
                        TT = 123
                Endif
                Saida = 0
        Endif
Enddo
If Saida = 1
        Do Menu
Endif

