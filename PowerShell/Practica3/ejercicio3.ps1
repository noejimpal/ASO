#Ejercicio 3: Comparar dos números (Mayor, Menor o Igual)
# 1. Pedimos los dos números
[int]$num1 = Read-Host "Introduce el primer número"
[int]$num2 = Read-Host "Introduce el segundo número"

# 2. Evaluamos las tres posibilidades
if ($num1 -gt $num2) {
    Write-Host "El primer número ($num1) es MAYOR que el segundo ($num2)"
} 
elseif ($num1 -lt $num2) {
    Write-Host "El primer número ($num1) es MENOR que el segundo ($num2)"
} 
else {
    Write-Host "Ambos números son IGUALES"
}