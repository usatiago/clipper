**

MOLDURA_SOMBREADA(4,05,13,73,"Desenvolvedores ...")
@ 07,10 say "Tiago Ferbani Garcia        - 18 - 2§ PD" Color "GR+/B"
@ 08,10 say "Ricardo Rogerio de Oliveira - 15 - 2§ PD" Color "GR+/B"
@ 09,10 say "Tutor : Ilmo. Sr. JOSE ROBERTO DOBIES." Color "GR+/B"
@ 11,10 say "E.T.E Dr Francisco Nogueira de Lima." Color "GR+/B"
inkey(0)
clear

Bco_Dados_Clientes()

@ 0,0 To 24,79 color "w+/n"
@ 1,1,23,78 Box Repl("Û",9) color "w+/w+"
MOLDURA_SOMBREADA(08,05,17,75,"Inicializando ...")
MOLDURA_SOMBREADA(11,10,13,70,"Aviso ...")
@ 12,13 say "Acessando a Base de Dados 'CLIENTES.DBF'. Espere ..." Color "w+*/b"
Select 1 ; Reindex
MOLDURA_SOMBREADA(11,10,13,70,"Aviso ...")
@ 12,13 say "Acessando a Base de Dados 'PRODUTOS.DBF'. Espere ..." Color "w+*/b"
Select 2 ; Reindex

Do menu
