/*
     Ger Bank 2.1
     Criado por: Tiago Ferbani Garcia.
     Em: 11/98.
*/

A = 0 ; NomeArq = Space(8) ; Limite:=QExist:=0

N := 1
D := CtoD("12/31/99")
L := .T.

SetColor("N/W")
Clear
@ 1,0 To 24,79 Color("Gr+/B+")
@ 2,1,23,78 Box Replicate(Chr(219),9) Color("B/N")
@ 3,2 To 6,77 Double Color("N/W")
@ 4,3,5,76 Box Replicate(Chr(219),9) Color("W/W")
@ 4,5 Say "Nome do Arquivo (.DBF) :" Get NomeArq Pict"@!" 
@ 0,3 Say "GerBank v.2.1 - By Tiago Ferbani Garcia 2§PDA."
Read
NomeArq:=AllTrim(NomeArq)+".DBF"
If !File("&NomeArq")
     Alert("Arqivo nÆo existe !!!")
     Do GB21
Else
     Use &NomeArq
     DBGoTop()
     QExist:=RecCount()
     @ 4,40 Say "Registros Existentes : "+AllTrim(Str(QExist))
     @ 5,5 Say "Limite : " Get Limite Pict"999,999,999"
     Read
     Op = Alert("Gera a Base de Dados (?)",{"SIM","NÇO"})
     If Op = 1
          Estrutura = DBStruct()
          TEstrutura = Len(Estrutura)
          Dados := Array(TEstrutura)
          For W := 1 To TEstrutura
               If Estrutura[W,2] = "C"
                    Dados[W]:=Repl(Chr(65),Estrutura[W,3])
               ElseIf Estrutura[W,2] = "N"
                    Dados[W]:=N
               ElseIf Estrutura[W,2] = "D"
                    Dados[W]:=D
               ElseIf Estrutura[W,2] = "L"
                    Dados[W]:=L
               Endif
          Next
          DBGoBottom()
          While A = 0
               QExist:=RecCount()
               @ 4,40 Say "Registros Existentes : "+AllTrim(Str(QExist))
               Append Blank
               For W := 1 To TEstrutura
                    If Estrutura[W,2] = "N"
                         Campo := FieldName(W)
                         Replace &Campo With N                          
                    Else
                         Campo := FieldName(W)
                         Replace &Campo With Dados[W]
                    Endif
               Next               
               N++
               IIf(RecCount() > Limite,A:=1,)
          EndDo
     EndIf
Endif
DBCloseAll()
SetColor("W/N")
Clear
     
