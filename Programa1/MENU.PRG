
* set key 12 to l

PUBLIC CONTROLE:=1
public lixeira:={}

   set date brit ; setcancel(.f.)
   set confirm on
   teste = .t.
   
   do while teste = .t.
         limpa_tela()
         tela()         
         opcoes_barra_1()
         opcao()
   enddo


  ************************************************************************
  // -------> Procedures ()

  Procedure LIMPA_TELA
         setcolor("w/n") ; clear

  ** ->
  Procedure TELA    
    for a = 2 to 23
        @ a,00 say repl(chr(177),80) color "w+/w+"
    next
    @ 01,00 say repl(chr(219),80) color "b/b"
    @ 24,00 say repl(chr(219),80) color "b/b"
  ** ->

  Procedure OPCOES_BARRA_1
     barra:="[-]  F2-Clientes  F3-Funcionarios  F4-Produtos  F5-Estoque  F6-Venda  ESC-Sair"
     @ 01,00 say barra color "w+/b"
     @ 24,02 say "L-Lixeira(Ctrl+L - Limpa Lixeira)" color "w+/b"
  ** ->    

Procedure OPCAO
    op = inkey(0)
    if op = 27
        saida()
    elseif op = -1
        do clientes
    elseif op = 12
        lx()
    elseif op = 108 .or. op = 76
       lixeira()
    endif
** ->

Procedure SAIDA
    a = alert("Deseja Finalizar ?",{"Sim","Nao"})
    if a = 1
        setcolor("w/n")
        clear
        teste = .f.
    endif 
** ->
******************************************************************************************
Procedure LX
        use lixeirac index lixeirac
        if reccount() > 0
                dr = alert("Quer Limpar a Lixeira ?",{"Sim","Nao"})
                if dr = 1
                        zap
                endif        
        else
                dr = alert("A lixeira ja esta vazia",{"OK"})
        endif







