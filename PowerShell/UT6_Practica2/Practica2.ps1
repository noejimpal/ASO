# 1. Cargamos la lista de departamentos desde tu archivo CSV
$lista = Import-Csv -Path "C:\UT6_Practica1\departamentos.csv" -Delimiter ";"

# 2. Comando para asegurar que la carpeta principal existe (si ya existe, no hace nada) 
New-Item -Path "C:\Empresa" -ItemType Directory -Force

# 3. Bucle para crear las subcarpetas de cada departamento [cite: 17, 18]
foreach ($fila in $lista) {
    # Sacamos el nombre del departamento de la columna del CSV
    $nombre = $fila.departamento
    
    # Creamos la subcarpeta dentro de C:\Empresa usando New-Item [cite: 16, 17]
    New-Item -Path "C:\Empresa\$nombre" -ItemType Directory -Force
}

# --- PARTE 3: COMPARTICIÓN EN RED ---

# Compartimos la carpeta principal "Empresa"
# -Name: Cómo se verá en la red
# -Path: Qué carpeta física compartimos
# -FullAccess: Damos permiso total en la "puerta" de red (el filtro real es el NTFS)
if (-not (Get-SmbShare -Name "Empresa" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "Empresa" -Path "C:\Empresa" -FullAccess "Usuarios del dominio"
    Write-Host "Carpeta compartida en red como 'Empresa'" -ForegroundColor Green
} else {
    Write-Host "La carpeta ya estaba compartida." -ForegroundColor Yellow
}

Write-Host "`n¡PRÁCTICA 2 COMPLETADA!" -ForegroundColor Magenta