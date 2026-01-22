#Ejercicio 9 (Bucle de contraseña):
$password = "secreto"
$intento = ""

while ($intento -ne $password) {
    $intento = Read-Host "Escribe la contraseña"
}
Write-Host "Contraseña correcta"