#Ejercicio 2: Importación de datos (CSV) y Foreach

 <#
.SYNOPSIS
    Importación y lectura de datos desde un archivo CSV.
.DESCRIPTION
    Lee un archivo con columnas (nombre, apellidos, grupo) y muestra los datos formateados.
#>

# Definición de la ruta del archivo (se asume que está en el mismo directorio)
$rutaArchivo = ".\usuarios.csv"

# Verificación de existencia del fichero antes de procesar
if (Test-Path $rutaArchivo) {
    
    # Importación del contenido convirtiendo cada fila en un objeto
    $listaUsuarios = Import-Csv -Path $rutaArchivo -Delimiter ","

    Write-Host "--- LISTADO DE USUARIOS DEL SISTEMA ---" -ForegroundColor Yellow

    # Estructura repetitiva para recorrer la colección de objetos
    foreach ($usuario in $listaUsuarios) {
        Write-Host "---------------------------------------"
        # Acceso a las propiedades del objeto mediante subexpresión $()
        Write-Host "USUARIO:   $($usuario.nombre)"
        Write-Host "APELLIDOS: $($usuario.apellidos)"
        Write-Host "GRUPO:     $($usuario.grupo)"
    }
    
    Write-Host "---------------------------------------"
    Write-Host "Proceso de lectura finalizado." -ForegroundColor Cyan

} else {
    Write-Host "Error: El archivo $rutaArchivo no ha sido encontrado." -ForegroundColor Red
}