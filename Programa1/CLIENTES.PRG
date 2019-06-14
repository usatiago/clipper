#include "c:\clipper5\include\inkey.ch"
************************************************************************************
public loc,delta,loc2
************************************************************************************
op = m_cliente()
if op = 1
        cad_cli()
elseif op = 2
        subop1 = consulta()
        if subop1 = 0 .and. subop1 = 3
                do menu
        elseif subop1 = 2
                lista()
                if delta = 1
                        dr = alert("Retornar   consulta (?)",{"Consulta Anterior","Nova Consulta"})
                        if dr = 1
                                y=lista()
                                if y = 1
                                        lista()        
                                endif                                                        
                        elseif dr = 2
                                consulta()
                        endif
                elseif delta = 2
                        do menu
                elseif delta = 3
                        deleta()
                elseif delta = 4
                        altera()
                elseif delta = 0
                        impressao()
                endif
        endif                
elseif op = 3
        relat()
elseif op = 4
        lixeira()
endif
************************************************************************************
Function M_CLIENTE
	@ 10,20 clear to 16,65
	@ 10,20 to 16,65 double
	op_cliente:={"Cadastro de Clientes",;
		     "Alt. Con. Exc. de Clientes",;
		     "Relatorio de Clientes",;
		     "Lixeira"}
	op = achoice(11,21,15,64,op_cliente)
	if op = 1
                opcao = 1 ; return(opcao)
	elseif op = 2
                opcao = 2 ; return(opcao)
        elseif op = 3
                opcao = 3 ; return(opcao)                
        elseif op = 4
                opcao = 4 ; return(opcao)
	endif
***************************************************************************************
***************************************************************************************
** ->

Function CAD_CLI
banco()
z = .t.
do while z = .t.    
	banco()
	dbgobottom()
	_codigo:=codigo+1
	_numero:=0
	_rg:=space(12)
	_cep:="13.720-000" 
	_cpf:=_telefone:=space(13)
	_nome:=_rua:=space(30)
	_cidade:="SAO JOSE DO RIO PARDO        "
	_datanasc:=ctod("  /  /  ")
	_datacad:=date()
	_bairro = space(25)
	_uf = "SP"            
	setcolor("w+/b")     
	@ 05,05 clear to 18,76 ; @ 05,05 to 18,76 
	@ 05,06 say repl(chr(219),70) color "r/r"
	@ 05,10 say "Cadastro de Clientes - Insira os dados" color "w+/r"
        @ 07,08 say "Codigo  -" get _codigo pict "9999" 
        @ 08,08 say "Nome    -" get _nome pict "@!" valid empty(_nome)<>.t. 
	@ 09,08 say "Rua     -" get _rua pict "@!"  
	@ 09,49 say "N§  -" get _numero pict "9999" 
	@ 10,08 say "Bairro  -" get _bairro pict "@!" 
	@ 11,08 say "Cidade  -" get _cidade pict "@!"
	@ 11,49 say "CEP -" get _cep pict "99.999-999" 
	@ 11,66 say "UF - " get _uf pict "@!" 
        @ 12,08 say "RG      -" get _rg pict "99.999.999-9" valid empty(_rg)<>.t. 
	@ 12,49 say "CPF -" get _cpf pict "99.999.999-99"  
	@ 13,08 say "Tel.    -" get _telefone pict "(999)999-9999" 
	@ 16,08 say "Data de Nascimento - " get _datanasc color "r/w,n/w" 
	@ 16,40 say "Data de Cadastro   - " get _datacad color "r/w,n/w" 
	read      
	_nome=alltrim(_nome)
	if empty(_nome) = .f.
		seek _codigo
		if found() 
			t = alert("Registro ja existente . Sobrescreve ?",{"Sim","Nao"})
			if rt = 1
				delete ; pack 
			endif
		else
			rt = alert("Grava Registro ?",{"Sim","Nao"})        
		endif
		if rt = 1
		  grav()
		endif
	endif
	a = alert("Continua Cadastro ?",{"Sim","Nao"})
	if a = 2
		z = .f.
		close all
	endif
enddo
do menu

*********************************************************************************************************************************************
Procedure ALTERA
use clientes index nome_cli
seek loc2
	_codigo:=codigo;_numero:=numero ;_rg:=rg ;_cep:=cep ;_cpf:=cpf
	_telefone:=tel ; _nome:=nome ; _rua:=rua ; _cidade:=cidade ; _datanasc:=datanasc
	_datacad:=datacad ; _bairro = bairro ; _uf = uf 
	setcolor("w+/b")
	@ 05,05 clear to 18,76 ; @ 05,05 to 18,76        
	@ 05,06 say repl(chr(219),70) color "r/r"
        @ 05,10 say "Manipulacao de Clientes - Insira a procura" color "w/r"
	@ 07,08 say "Codigo  -" get _codigo pict "9999"  
        @ 08,08 say "Nome    -" get _nome pict "@!"  valid empty(_nome)<>.t. 
	@ 09,08 say "Rua     -" get _rua pict "@!"  
	@ 09,49 say "N§  -" get _numero pict "9999" 
	@ 10,08 say "Bairro  -" get _bairro pict "@!" 
	@ 11,08 say "Cidade  -" get _cidade pict "@!"
	@ 11,49 say "CEP -" get _cep pict "99.999-999" 
	@ 11,66 say "UF - " get _uf pict "@!" 
        @ 12,08 say "RG      -" get _rg pict "99.999.999-9" valid empty(_rg)<>.t.  
	@ 12,49 say "CPF -" get _cpf pict "99.999.999-99"  
	@ 13,08 say "Tel.    -" get _telefone pict "(999)999-9999" 
	@ 16,08 say "Data de Nascimento - " get _datanasc color "r/w,n/w" 
	@ 16,40 say "Data de Cadastro   - " get _datacad color "r/w,n/w" 
	read      
	t = alert("Grava Alteracao do Registro ?",{"Sim","Nao"})                
	if t = 1
		replace codigo with _codigo, nome with _nome, rua with _rua,;
		numero with _numero, bairro with _bairro, cidade with _cidade,;
		cep with _cep, uf with _uf, rg with _rg, cpf with _cpf,;
		tel with _telefone, datacad with _datacad, datanasc with _datanasc
		reindex
		lista2()
	elseif t = 2
		reindex
		lista2()
	endif
********************************************************************************************************************************************************************************************
Function CONSULTA

        z = ""
	a = 0
	banco()
	public con:={} 
	Cnome:=Cnome_:= space(30)
	setcolor("w+/b")     
	@ 05,05 clear to 18,76 ; @ 05,05 to 18,76 
	@ 05,06 say repl(chr(219),70) color "r/r"        
        @ 05,10 say "Manipula‡Æo de Clientes - Insira a procura" color "w+/r"
	@ 7,7 say "Nome ->" get Cnome picture "@!"
	read
	Cnome_ = trim(Cnome) ; procura:= substr(Nome,1,len(Cnome_))  
    dbeval( {|| iif(Cnome_= substr(Nome,1,len(Cnome_)),aadd(con,nome+"   "+str(codigo)),)})
	if lastkey() <> 27             
		if empty(con) = .t.                        
			w = alert("NÆo Existem Registro desse Filtro!",{"Continua","Sai da Consulta"})                        
			if w = 2 .or. w = 27
                                q = 0 ; return(q)
			endif
		else
                        q = 2 ; return(q)
		endif
	else 
                q = 3 ; return(q)
	endif
***********************************************************

Procedure BANCO

if !file("clientes.dbf") 
    estrutura:={ {"codigo","N",4,0}, {"nome","C",30,0},;
		{"datanasc","d",8,0}, {"rua","c",30,0},;
		{"numero","n",4,0}, {"bairro","c",25,0},;
		{"uf","c",2,0}, {"cidade","C",30,0},;
		{"rg","c",12,0}, {"cep","c",10,0},;
		{"cpf","c",13,0}, {"situacao","N",15,2},;
		{"datacad","d",8,0}, {"tel","c",13,0}}
		dbcreate("clientes",estrutura)
endif
if !file("relat.dbf") 
    estrutura:={ {"codigo","N",4,0}, {"nome","C",30,0},;
		{"datanasc","d",8,0}, {"rua","c",30,0},;
		{"numero","n",4,0}, {"bairro","c",25,0},;
		{"uf","c",2,0}, {"cidade","C",30,0},;
		{"rg","c",12,0}, {"cep","c",10,0},;
		{"cpf","c",13,0}, {"situacao","N",15,2},;
		{"datacad","d",8,0}, {"tel","c",13,0}}
                dbcreate("relat",estrutura)
endif

if !file("lixeirac.dbf")
    est:={ {"codigo","N",4,0}, {"nome","C",30,0},;
		{"datanasc","d",8,0}, {"rua","c",30,0},;
		{"numero","n",4,0}, {"bairro","c",25,0},;
		{"uf","c",2,0}, {"cidade","C",30,0},;
		{"rg","c",12,0}, {"cep","c",10,0},;
		{"cpf","c",13,0}, {"situacao","N",15,2},;
		{"datacad","d",8,0}, {"tel","c",13,0}}                
		dbcreate("lixeirac",est)
endif


if !file("clientes.ntx")
       use clientes
       index on codigo to clientes
endif

if !file("relat.ntx")
       use relat
       index on nome to relat
endif

if !file("lixeirac.ntx")
       use lixeirac
       index on nome to lixeirac
endif

use clientes index clientes
reindex
***********************************************************
Procedure IMPRESSAO
nc = 1
ni = 0
s = isprinter()
        telav = savescreen(20,10,22,40)
        @ 20,10 clear to 22,40 ; @ 20,10 to 22,40 double
        @ 20,11 say repl(chr(219),28) color "r/r"
        @ 20,14 say "Imprimir" color "w+/r"
        @ 21,14 say "Numero de Copias" get nc picture "999"
        read
if s = .t.
        do while ni >= nc
                set device to print
		set printer on
		@ 07,08 say "Codigo  - " + str(codigo)
		@ 08,08 say "Nome    - " + nome 
		@ 09,08 say "Rua     - " + rua 
		@ 09,49 say "N§  - " + str(numero)
		@ 10,08 say "Bairro  - " + bairro 
		@ 11,08 say "Cidade  - " + cidade 
		@ 11,49 say "CEP - " + cep 
		@ 11,66 say "UF - " + uf 
		@ 12,08 say "RG      - " + rg 
		@ 12,49 say "CPF - " + cpf 
		@ 13,08 say "Tel.    - " + tel 
		@ 16,08 say "Data de Nascimento - " + dtoc(datanasc)
		@ 16,40 say "Data de Cadastro   - " + dtoc(datacad)
                inkey(0.9)
                if lastkey() = 27
                        ni = nc
                        loop
                endif
                ni++
        enddo
else
        y = alert("Impressora Desativada/Inexistente !!!",{"OK"})
endif
set device to screen
set print off
restscreen(20,10,22,40,telav)
lista2()
********************************************************************************

Procedure LISTA

@ 05,05 clear to 18,76 ; @ 05,05 to 18,76         
@ 05,06 say repl(chr(219),70) color "r/r"
@ 05,10 say "Resultado do Filtro - " + str(len(con)) + " " + "registro(s) encontrados" color "w+/r"
@ 24,00 say repl(chr(219),80) color "b/b"
loc = achoice(06,06,17,75,con)
if loc = 0
	do menu
else
        delta = lista2()
endif

************************************************************************************************************************

Function LISTA2
index on nome to nome_cli
if loc <> 0
        seek con[loc]
	@ 05,05 clear to 18,76 ; @ 05,05 to 18,76
	@ 05,06 say repl(chr(219),70) color "r/r"
	@ 05,10 say "Informa‡äes sobre o Registro" color "w+/r"
        loc2=nome
	@ 07,08 say "Codigo  - " + str(codigo) 
	@ 08,08 say "Nome    - " + nome 
	@ 09,08 say "Rua     - " + rua 
	@ 09,49 say "N§  - " + str(numero)
	@ 10,08 say "Bairro  - " + bairro 
	@ 11,08 say "Cidade  - " + cidade 
	@ 11,49 say "CEP - " + cep 
	@ 11,66 say "UF - " + uf 
	@ 12,08 say "RG      - " + rg 
	@ 12,49 say "CPF - " + cpf 
	@ 13,08 say "Tel.    - " + tel 
	@ 16,08 say "Data de Nascimento - " + dtoc(datanasc)
	@ 16,40 say "Data de Cadastro   - " + dtoc(datacad)
	@ 17,40 say "Saldo - " + str(situacao)
	@ 24,00 say repl(chr(219),80) color "b/b"
	@ 24,02 say "F12-Imprime  D-Deleta  A-Altera  S-Sair da Consulta R-Retorna … Consulta"       
        e = 0
        y = inkey(0)
        if y = -41
                e = 0 ; return(e)
        elseif y = 114 .or. y = 82   // letra R
                e = 1 ; return(e)                               
        elseif y = 115 .or. y = 83   // letra S
                e = 2 ; return(e)
        elseif y = 100 .or. y = 68    // Letra D
                e = 3 ; return(e)
        elseif y = 65 .or. y = 97     // Letra A
                e = 4 ; return(e)
        endif
        lista2()
elseif loc = 0
	s = alert("Voce nao escolheu num registro!",{"Continua","Ab. Consulta"})       
	if s = 2
		z = 3
	endif
endif                

****************************************************************************************
Procedure DELETA
q = alert("Voce deseja excluir?",{"Sim","NÆo"})
if q = 1     
     delete
     _codigo:=codigo;_numero:=numero ;_rg:=rg ;_cep:=cep ;_cpf:=cpf
     _telefone:=tel ; _nome:=nome ; _rua:=rua ; _cidade:=cidade ; _datanasc:=datanasc
     _datacad:=datacad ; _bairro = bairro ; _uf = uf 
     pack
     use lixeirac index lixeirac
     reindex     
     grav()
     banco()
     do menu
endif
********************************************************************************************************************
Procedure GRAV
	append blank
	replace codigo with _codigo, nome with _nome, rua with _rua,;
	numero with _numero, bairro with _bairro, cidade with _cidade,;
	cep with _cep, uf with _uf, rg with _rg, cpf with _cpf,;
	tel with _telefone, datacad with _datacad, datanasc with _datanasc
*****************************************************************************************************************************
Procedure LIXEIRA
DBCLOSEALL(.T.)
banco()
use lixeirac index lixeirac
reindex
lixeirac:={}
dbeval( {|| aadd(lixeirac,nome)})
@ 12,05 clear to 18,76 
@ 12,05 to 18,76 double
@ 12,06 say repl(chr(219),70) color "b/b"
@ 18,06 say repl(chr(219),70) color "b/b"
@ 12,10 say "Lixeira" color "w+/b" 
@ 18,10 say "Status - " + str(reccount()) + " " + "registro(s) apagados" color "w+/b"
g = achoice(13,06,17,75,lixeirac)
controle = g
if len(lixeirac) <> 0
	if g<>0
	    d = alert("Voce deseja ?",{"Recuperar","Remover"})
	    if d = 1        
		recupera()                                        
	    elseif d = 2
		reindex
		seek lixeirac[controle]
		delete
		pack
	    endif            
	endif
endif
if len(lixeirac) = 0
	d = alert("A lixeira esta vazia",{"OK"})        
endif


******
Procedure RECUPERA
seek lixeirac[controle]
delete
_codigo:=codigo;_numero:=numero ;_rg:=rg ;_cep:=cep ;_cpf:=cpf
_telefone:=tel ; _nome:=nome ; _rua:=rua ; _cidade:=cidade ; _datanasc:=datanasc
_datacad:=datacad ; _bairro = bairro ; _uf = uf ; pack
banco()
seek _codigo
if found()
	s = alert("Violacao de Chave Primaria. Deseja?",{"Sobrescrever","Gravar c/ prox. c¢digo"})
	if s = 1
                banco()
                seek con[loc] ; delete ; pack ; seek lixeirac[controle] ; delete ; pack
		grav()
		do menu
	elseif s = 2
		dbgobottom()
		_codigo:=codigo+1
		grav()
	endif
else
	grav()        
endif

************************************************************************************
Procedure RELAT
banco()
eee = consulta()
if eee = 0
        do menu
elseif eee = 2
        index on nome to nome_cli
        y = len(con)
        clear
        fseek(0)
        for e = 1 to y
                seek con[e]
                fwrite(fcreate("relat.mdr",0),con[e])
        next
        fclose("relat.mdr")
endif
                
        
****************************************************************************************       




