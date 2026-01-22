#Ejercicio 7 - Validacion de contraseña

$key = "noe123"
$pass = Read-Host "Introduce la contraseña"

if ($pass -eq $key) {
    Write-Host "Contraseña correcta"
} else {
    Write-Host "Acceso denegado"
}