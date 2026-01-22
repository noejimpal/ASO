#Ejercicio 10 (El Gran Menú): Este ejercicio resume toda la unidad.
$opcion = ""
while ($opcion -ne "x") {
    Clear-Host
    Write-Host "a) Crear carpeta`nb) Crear fichero`nc) Renombrar`nx) Salir"
    $opcion = Read-Host "Elige opción"

    switch ($opcion) {
        "a" { New-Item -Path (Read-Host "Nombre") -ItemType Directory }
        "b" { New-Item -Path (Read-Host "Nombre") -ItemType File }
        "c" { Rename-Item -Path (Read-Host "Actual") -NewName (Read-Host "Nuevo") }
        "d" { Remove-Item -Path (Read-Host "Ruta") -Recurse }
        "e" { if (Test-Path (Read-Host "Ruta")) { "Existe" } else { "No existe" } }
        "f" { Get-ChildItem -Path (Read-Host "Ruta") }
        "g" { Get-Date }
    }
    if ($opcion -ne "x") { Read-Host "Pulsa Enter para continuar..." }
}