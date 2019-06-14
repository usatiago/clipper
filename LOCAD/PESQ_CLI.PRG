
//USE CLIENTE
//INDEX ON CODIGO TO NTX_COD
Select 1
PRIVATE CONTROL:=1
PRIVATE CONTROLE:=1
RestScreen(0,0,24,79,TelaV)
DO WHILE CONTROLE=1
    VCOD:=0
    T_PESQ()
    Set Cursor On
    @ 8,16 SAY "Digite o Codigo a ser pesquisado" COLOR "GR+/B" GET VCOD
    READ
    Set Cursor Off
    IF (VCOD=0)
        ALERT("C‡DIGO DE Nß 0(ZERO) N«O ê; CRIADO NO CADASTRO",{"OK"})
        AQ=ALERT("Continuar Sess∆o",{"N«O","SIM"})
        IF (AQ=1)
            CONTROLE=2
            CONTROL=1
            LOOP
        ENDIF
        IF (AQ=2)
            RESTSCREEN(0,0,24,79,TELAV)
            T_PESQ()
            LOOP
        ENDIF
    ENDIF
    SEEK VCOD
    IF .NOT. FOUND()
        ALERT("C‡DIGO N«O ENCONTRADO",{"OK"})
        AW=ALERT("Continuar Sess∆o",{"N«O","SIM"})
        IF (AW=1)
            CONTROLE=2
            CONTROL=1
            LOOP
        ENDIF

        IF (AW=2)
            RESTSCREEN(0,0,24,79,TELAV)
            T_PESQ()
            LOOP
        ENDIF
    ELSE
        TELA_PESQ()
    ENDIF
ENDDO

IF CONTROL=1
    DO MENU
ENDIF




PROCEDURE TELA_PESQ
MOLDURA_SOMBREADA(05,03,18,76,"Consulta de Clientes p. C¢digo")
@ 06,06 say "Codigo     - " + STR(CODIGO)
@ 07,06 say "Nome       - " +NOME
@ 08,06 say "Sobrenome  - " +SOBNOME
@ 09,06 say "Endereco   - " +END
@ 09,61 say "Nß - " + STR(NR)
@ 10,06 say "Bairro     - " +BAIRRO
@ 11,06 say "Cidade     - " +CIDADE
@ 11,61 say "UF - " +UF
@ 12,06 say "Telefone Residencial - " +TEL
@ 13,06 say "Telefone Comercial   - " +TEL2
@ 14,06 say "RG - " +RG
@ 14,31 say "CIC/CPF - " +CIC
@ 15,06 say "Data Nascimento - " +DTOC(DATANASC)
@ 15,36 say "Data Cadastro - " +DTOC(DATACAD)
@ 17,06 SAY "pressione alguma coisa para continuar..."
INKEY(0)
AL=ALERT("Continuar Sess∆o",{"N«O","SIM"})

IF (AL=1)
   CONTROLE=2 
   CONTROL=1
ENDIF


IF (AL=2)
   RESTSCREEN(0,0,24,79,TELAV)
   T_PESQ()
ENDIF

RETURN

PROCEDURE T_PESQ
MOLDURA_SOMBREADA(6,11,13,61,"Pesquisa de Clientes p. C¢digo")
RETURN
