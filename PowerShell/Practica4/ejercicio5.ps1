#Ejercicio 5 (Tabla de multiplicar):
[int]$n = Read-Host "Dime un número"
for ($i = 1; $i -le 10; $i++) {
    $resultado = $n * $i
    Write-Host "$n x $i = $resultado"
}