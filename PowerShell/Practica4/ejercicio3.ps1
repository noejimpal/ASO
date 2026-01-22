#Ejercicio 3 (Cuenta atrás):
[int]$n = Read-Host "Introduce un número positivo"
# Creamos el rango (ej. 5..0) y los unimos con una coma
$lista = $n..0
Write-Host ($lista -join ", ")