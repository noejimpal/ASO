#Ejercicio 7 (Triángulo simple): PowerShell permite "multiplicar" un texto por un número para repetirlo.
[int]$altura = Read-Host "Altura del triángulo"
for ($i = 1; $i -le $altura; $i++) {
    Write-Host ("*" * $i)
}