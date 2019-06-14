**
     Set cursor On
     SetCursor(3)
     RestScreen(0,0,24,79,TelaV)
     _codigo:=CODIGO
     _nome:=NOME
     _sobnome:=SOBNOME
     _end:=END
     _nr:=NR
     _bairro:=BAIRRO
     _cidade:=CIDADE
     _uf:=UF
     _tel:=TEL
     _tel2:=TEL2
     _rg:=RG
     _cic:=CIC
     _bairro:=BAIRRO
     _cidade:=cidade    
     _datanasc:=dtoc(datanasc)
     _datacad:=dtoc(datacad)
    MOLDURA_SOMBREADA(06,02,19,76,"Altera‡Æo de Clientes.")
    Formulario()                
    Read
    if _Nome <> " "
        Aviso = alert("Vocˆ deseja confirmar; os dados da altera‡Æo (?)",{"Sim","Nao"})
        if Aviso = 1
            Replace Codigo With _Codigo, Nome With _Nome, Sobnome with _sobnome,;
            end with _end, nr with _nr, bairro with _bairro, cidade with _cidade,;
            uf with _uf, Tel with _tel, rg with _rg, cic with _cic,;
            datanasc with _datanasc, datacad with _datanasc
        endif
    endif

