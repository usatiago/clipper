SELECT 2
PRIVATE CONTROL:=1

DO WHILE CONTROL=1

    VCODE:=0
    TY_PESQ()
    TELAVELHA=savescreen(0,0,24,79)
    Set Cursor On
    SetCursor(3)
    @ 8,16 SAY "Digite o Codigo a ser pesquisado" COLOR "GR+/B" GET VCODE
    READ

    SEEK VCODE

    IF (VCODE=0)
        ALERT("C‡DIGO DE Nß 0(ZERO) N«O ê; CRIADO NO CADASTRO DE FITAS",{"OK"})
        AQ=ALERT("Continuar Sess∆o",{"N«O","SIM"})
        IF (AQ=1)
            CONTROL=2
            CONTROLE=1
            LOOP
        ENDIF
        IF (AQ=2)
            RESTSCREEN(0,0,24,79,TELAV)
            TY_PESQ()
            LOOP
        ENDIF
     ENDIF

    SEEK VCODE

    IF .NOT. FOUND()
        ALERT("C‡DIGO N«O ENCONTRADO",{"OK"})
        AW=ALERT("Continuar Sess∆o",{"N«O","SIM"})
        IF (AW=1)
            CONTROL=2
            CONTROLE=1
            LOOP
        ENDIF

        IF (AW=2)
            RESTSCREEN(0,0,24,79,TELAV)
            TY_PESQ()
            LOOP
        ENDIF
        ELSE
        mostra_pesqvid()
             AQ2=ALERT("Continuar Sess∆o",{"N«O","SIM"})
             IF (AQ2=1)
               CONTROL=2
               restscreen(0,0,24,79,telavelha)
               Set Cursor Off
               CONTROLE=1
               LOOP
             ELSEIF (AQ2=2)
               RESTSCREEN(0,0,24,79,TELAV)
               TY_PESQ()
               LOOP
             ENDIF

   ENDIF
    

ENDDO

IF CONTROLE=1
        DO MENU
ENDIF


PROCEDURE TY_PESQ
MOLDURA_SOMBREADA(6,11,10,61,"Pesquisa de video p. C¢digo")
RETURN

PROCEDURE MOSTRA_PESQVID

    @ 06,08 clear to 14,70
    MOLDURA_SOMBREADA(06,08,14,72,"Pesquisa de Videos")
    CodVid=Str(CodPro) ; CodVid=AllTrim(CodVid)
    QuantVid = Str(Quant) ; QuantVid = AllTrim(QuantVid)
    @ 08,10 say "Codigo do Produto  - " + CodVid
    @ 09,10 say "Titulo             - " + titulo
    @ 10,10 say "Genero             - " + genero
    @ 11,10 say "Quantidade         - " + QuantVid
    @ 12,10 say "Data de Lanáamento - " + dtoc(lanca)
    inkey(0)    
return        



