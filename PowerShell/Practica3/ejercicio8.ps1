#Ejercicio 8: Clasificación de Alumnos (Grupos A y B)
$nombre = Read-Host "Nombre"
$sexo = Read-Host "Sexo (M/H)"

# Grupo A: Mujeres < M  O  Hombres > N
if ( ($sexo -eq "M" -and $nombre -lt "M") -or ($sexo -eq "H" -and $nombre -gt "N") ) {
    Write-Host "Grupo A"
} else {
    Write-Host "Grupo B"
}