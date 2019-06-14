****

Letreiro1 := alltrim(Str(Codigo)+"  "+Nome+" "+Sobnome)
Letreiro2 := "Saldo: "+Str(Saldo)
Ms2(10,10,20,75,Letreiro1,Letreiro2)
hist:={}
Select 3
DBGOTOP()
Do While !Eof()
        if cli_atual = codcli
                aadd(hist,str(codloc)+" "+str(codpro))                
        Endif
        Skip
Enddo
Achoice(11,11,19,74,hist)
inkey(0)

        
