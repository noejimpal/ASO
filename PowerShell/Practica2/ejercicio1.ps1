# Ejercicio 1 - Información de mi sistema
Write-Host "--- INFORMACIÓN SOLICITADA ---" -ForegroundColor Cyan

# Usamos las variables de entorno de Windows ($env)
$nombreUsuario = $env:USERNAME
$directorio    = $env:USERPROFILE
$nombreDominio = $env:USERDOMAIN
$nombreEquipo  = $env:COMPUTERNAME

# Mostramos los mensajes exactos que pide el ejercicio
Write-Host "Hola $nombreUsuario"
Write-Host "Tu directorio de trabajo es $directorio"
Write-Host "Perteneces al dominio $nombreDominio"
Write-Host "Tu equipo se llama $nombreEquipo"