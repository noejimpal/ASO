#Ejercicio 6 (Adivinar número):
$secreto = 42 # El número fijo
$intento = -1 # Iniciamos con un valor que no sea el secreto

while ($intento -ne $secreto) {
    [int]$intento = Read-Host "Adivina el número"
    
    if ($intento -lt $secreto) {
        Write-Host "Es mayor..." -ForegroundColor Yellow
    } elseif ($intento -gt $secreto) {
        Write-Host "Es menor..." -ForegroundColor Yellow
    }
}
Write-Host "¡Enhorabuena! Has acertado." -ForegroundColor Green