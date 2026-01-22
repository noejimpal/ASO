#Ejercicio 1 (Repetir nombre):
$nombre = Read-Host "Introduce tu nombre"
[int]$numero = Read-Host "¿Cuántas veces lo repito?"

for ($i = 1; $i -le $numero; $i++) {
    Write-Host $nombre
}