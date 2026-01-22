# Ejercicio 6
if (Test-Path $ruta -PathType Container) {
    Write-Host "Es un directorio. Contenido:"
    Get-ChildItem -Path $ruta -Recurse
}