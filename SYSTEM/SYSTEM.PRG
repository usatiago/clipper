**

Alert("Este sistema foi desenvolvido por:;Tiago Ferbani Garcia e;Ricardo Rog‚rio de Oliveira, para:;Trabalho de LP - Prof: DOBIES.")


Bco_Dados_Clientes()

@ 0,0 To 24,79 color "w+/n"
@ 1,1,23,78 Box Repl("Û",9) color "w+/w+"
MOLDURA_SOMBREADA(08,05,17,75,"Inicializando ...")
@ 10,13 Say "Iniciando SERVIDOR DO BANCO DE DADOS." Color "w+/b" 
MOLDURA_SOMBREADA(11,10,13,70,"Aviso ...")
@ 12,13 say "Acessando a Base de Dados 'CLIENTES.DBF'. Espere ..." Color "w+*/b"
Select 1 ; Reindex
MOLDURA_SOMBREADA(11,10,13,70,"Aviso ...")
@ 12,13 say "Acessando a Base de Dados 'PRODUTOS.DBF'. Espere ..." Color "w+*/b"
Select 2 ; Reindex

Do menu
