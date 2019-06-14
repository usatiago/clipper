*

Set Cursor On
Select 1
_Codcli := 0
Ms2(05,04,21,75,"Loca‡Æo de Fitas","")
@ 07,07 Say "C¢digo do Cliente : " get _codcli picture "9999999"
Read
Seek _Codcli
If Found() .and. !Deleted()
        @ 8,07 say "Nome Completo -> [ "+alltrim(nome)+" "+alltrim(sobnome)+" ]"
Else
        alert("Cliente Inexistente!!")
        do menu
Endif
do menu      
