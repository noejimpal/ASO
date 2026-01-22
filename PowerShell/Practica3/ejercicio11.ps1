# Ejercicio 11: Sala de Juegos (Precios por edad)
[int]$edad = Read-Host "Edad del cliente"

if ($edad -lt 4) { Write-Host "Entra gratis" }
elseif ($edad -le 18) { Write-Host "Paga 5€" }
else { Write-Host "Paga 10€" }