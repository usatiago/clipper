**

Bco_Dados_Clientes()

@ 8,5 clear to 17,75
MOLDURA_SOMBREADA(08,05,17,75,"Finalizando ...")
MOLDURA_SOMBREADA(11,10,13,70,"Aviso ...")
@ 12,13 say "Fechando a Base de Dados 'CLIENTES.DBF'. Espere ..." Color "w+*/b"
Select 1 ; Reindex
MOLDURA_SOMBREADA(11,10,13,70,"Aviso ...")
@ 12,13 say "Fechando a Base de Dados 'PRODUTOS.DBF'. Espere ..." Color "w+*/b"
Select 2 ; Reindex
Setcolor("W/N")
Clear
