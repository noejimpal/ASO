# 1. Pedimos la edad
[int]$edad = Read-Host "Introduce tu edad"

# 2. Comparamos con 18
if ($edad -ge 18) {
    Write-Host "Eres mayor de edad." -ForegroundColor Green
} 
else {
    Write-Host "Eres menor de edad." -ForegroundColor Red
}