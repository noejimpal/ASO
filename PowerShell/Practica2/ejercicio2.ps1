# Ejercicio 2 - Calculadora de operaciones básicas
Write-Host "--- CALCULADORA POWERSHELL ---" -ForegroundColor Green

# Pedimos los números. 
# IMPORTANTE: Ponemos [int] delante para que PowerShell sepa que son NÚMEROS y no letras.
[int]$num1 = Read-Host "Introduce el primer número"
[int]$num2 = Read-Host "Introduce el segundo número"

# Realizamos las operaciones
$suma = $num1 + $num2
$resta = $num1 - $num2
$multi = $num1 * $num2
$divi  = $num1 / $num2
$resto = $num1 % $num2

# Mostramos los resultados
Write-Host "-----------------------------"
Write-Host "Suma: $num1 + $num2 = $suma"
Write-Host "Resta: $num1 - $num2 = $resta"
Write-Host "Multiplicación: $num1 * $num2 = $multi"
Write-Host "División: $num1 / $num2 = $divi"
Write-Host "Resto (Módulo): $num1 % $num2 = $resto"