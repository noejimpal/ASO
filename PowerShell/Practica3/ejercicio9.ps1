#Ejercicio 9: Tramos de Renta (Uso de ElseIf)
[int]$renta = Read-Host "Renta anual"

if ($renta -lt 10000) { $imp = "5%" }
elseif ($renta -lt 20000) { $imp = "15%" }
elseif ($renta -lt 35000) { $imp = "20%" }
elseif ($renta -lt 60000) { $imp = "30%" }
else { $imp = "45%" }

Write-Host "Te corresponde un $imp"