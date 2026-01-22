
# Ejercicio 5
$ruta = Read-Host "Introduce ruta"
if (Test-Path $ruta) { Write-Host "Existe" } else { Write-Host "No existe" }