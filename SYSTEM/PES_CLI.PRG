private control:=1
Relac:={}
do while control=1
    _nome:=space(40)
    T_PESQ()
    Set Cursor On
    SetCursor(3)
    @ 8,16 SAY "Digite o Nome a ser pesquisado" COLOR "GR+/B"
    @9,16 GET _nome PICT"@!" color"n/w"
    READ
    Set Cursor Off
    IF (_nome=space(40))
        ALERT("N∆o pode ser procurado um nome em branco (!)",{"OK"})
        AQ=ALERT("Continuar Sess∆o",{"N«O","SIM"})
        IF (AQ=1)
            CONTROLE=2
            CONTROL=2
            LOOP
        ENDIF
        IF (AQ=2)
            RESTSCREEN(0,0,24,79,TELAV)
            T_PESQ()
            LOOP
        ENDIF
    ENDIF

    DBEval( {|| iif(nome = _nome,aadd(Relac,Alltrim(SOBNOME)),) } ) 
    Escolha = AChoice(10,10,20,70,RELAC)
    SEEK Alltrim(_nome)

    IF .NOT. FOUND()
        ALERT("Registro n∆o ENCONTRADO!!;Cliente Inexistente")
        AW=ALERT("Continuar Sess∆o",{"N«O","SIM"})
        IF (AW=1)
            CONTROLE=2
            CONTROL=1
            LOOP
        ENDIF

        IF (AW=2)            
            RESTSCREEN(0,0,24,79,TELAV)
            *T_PESQ_2()
            LOOP
        ENDIF
    ELSE
        TELA_P_nome()
    ENDIF

ENDDO

IF CONTROL=1
    DO MENU
ENDIF




PROCEDURE TELA_P_nome
Local OPT
Local L1
Public Teste
teste:=Deleted()
If Teste = .t.
        L1 = "F2 - Opá‰es  "+"Status : [ REGISTRO DELETADO ]"
Else
        L1 = "F2 - Opá‰es  "+"Status : [ NORMAL            ]"
Endif
MS2(05,03,17,76,"Consulta de Clientes p. Nome",L1)
select 1
cli_atual:=codigo
_codigo:=codigo
_sobnome:=SOBNOME
_end:=END
_nr:=alltrim(str(NR))
_bairro:=BAIRRO
_cidade:=CIDADE
_uf:=UF
_tel:=TEL
_tel2:=TEL2
_rg:=RG
_cic:=CIC
_bairro:=BAIRRO
_cidade:=cidade

@ 06,06 say "Codigo     - "  +_CODIGO
@ 08,06 say "Sobrenome  - "  +_SOBNOME
@ 09,06 say "Endereco   - "  +_END
@ 09,61 say "Nß - "  +_NR
@ 10,06 say "Bairro     - "  +_BAIRRO
@ 11,06 say "Cidade     - "  +_CIDADE
@ 11,61 say "UF - " +_UF
@ 12,06 say "Telefone Residencial - " +_TEL
@ 13,06 say "Telefone Comercial   - " +_TEL2
@ 14,06 say "RG - " +_RG
@ 14,31 say "CIC/CPF - " +_CIC
@ 15,06 say "Data Nascimento - " +DTOC(DATANASC)
@ 15,36 say "Data Cadastro - " +DTOC(DATACAD)
OPT=INKEY(0)
        private p
        P = Savescreen(0,0,24,79)
        if OPT = -1
                BARRA2()
        Endif
Restscreen(0,0,24,79,p)
AL=ALERT("Continuar Sess∆o",{"N«O","SIM"})
IF (AL=1)
   CONTROLE=2 
   CONTROL=1
ENDIF


IF (AL=2)
   RESTSCREEN(0,0,24,79,TELAV)
   T_PESQ_2()
ENDIF




RETURN

PROCEDURE T_PESQ_2
MOLDURA_SOMBREADA(6,11,13,61,"Pesquisa de Clientes p. Nome")
RETURN

Procedure BARRA2
        @ 18,03 To 20,25
        OPT = Achoice(19,04,19,24,{"1. Excluir","2. Alterar","3. Imprimir","4. Relat¢rio Geral","5. Recupar Registro"})
        If OPT = 1
                A = Alert("Confirma Exclus∆o (?)",{"SIM","NAO"})
                If A = 1
                        Delete
                        Alert("Registro foi DELETADO ;com sucesso !!!")
                Endif
        ElseIf OPT = 2
                If Teste = .t.
                        Alert("N∆o Ç possivel alterar;um registro DELETADO!!")
                Else
                        Do Alt_cli
                Endif
        Elseif OPT = 4
                DevPos(0,0) ; do Imp_Cli
        Elseif OPT = 5
                DBRecall()
                Alert("Registro foi RECUPERADO ;com sucesso !!!")
        Endif



