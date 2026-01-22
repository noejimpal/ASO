# 1. Pedimos el número y lo convertimos a entero [int]
[int]$numero = Read-Host "Introduce un número"

# 2. Lógica: Si el resto de dividir por 2 es IGUAL (-eq) a 0
if ($numero % 2 -eq 0) {
    Write-Host "El número $numero es PAR" -ForegroundColor Green
} 
else {
    Write-Host "El número $numero es IMPAR" -ForegroundColor Yellow
}