<#
.SYNOPSIS
    Práctica 1 UT6: Administración de usuarios y grupos.
.DESCRIPTION
    Crea la estructura de la OU Empresa, sub-OUs, grupos y usuarios
    según los archivos CSV en C:\UT6_Practica1.
#>

Import-Module ActiveDirectory

# Configuración de rutas
$rutaCarpeta = "C:\UT6_Practica1"
$dominio = "DC=empresa,DC=local"
$passDefecto = ConvertTo-SecureString "aso2025." -AsPlainText -Force

# 1. Crear la Unidad Organizativa "Empresa"
try {
    New-ADOrganizationalUnit -Name "Empresa" -Path $dominio -ErrorAction Stop
    Write-Host "OU Empresa creada." -ForegroundColor Green
} catch {
    Write-Host "La OU Empresa ya existe." -ForegroundColor Yellow
}

$pathEmpresa = "OU=Empresa,$dominio"

# 2. Procesar Departamentos
$depts = Import-Csv -Path "$rutaCarpeta\departamentos.csv" -Delimiter ";"
foreach ($d in $depts) {
    $nombreD = $d.departamento
    # Crear OU del departamento dentro de Empresa
    New-ADOrganizationalUnit -Name $nombreD -Path $pathEmpresa -Description $d.descripcion
    # Crear Grupo Global (G_NombreDepartamento)
    New-ADGroup -Name "G_$nombreD" -GroupScope Global -Path "OU=$nombreD,$pathEmpresa"
    Write-Host "Estructura creada para: $nombreD" -ForegroundColor Cyan
}

# 3. Procesar Empleados
$emps = Import-Csv -Path "$rutaCarpeta\empleados.csv" -Delimiter ";"
foreach ($e in $emps) {
    $login = ($e.nombre + "." + $e.apellido).ToLower().Replace(" ","")
    $ouDestino = "OU=$($e.departamento),$pathEmpresa"

    # Crear Usuario con los requisitos del PDF
    New-ADUser -Name "$($e.nombre) $($e.apellido)" `
               -SamAccountName $login `
               -UserPrincipalName "$login@empresa.local" `
               -Path $ouDestino `
               -AccountPassword $passDefecto `
               -ChangePasswordAtLogon $true `
               -Enabled $true

    # Añadir el usuario a su grupo
    Add-ADGroupMember -Identity "G_$($e.departamento)" -Members $login
    Write-Host "Usuario $login creado y unido a G_$($e.departamento)"
}

Write-Host "`n¡PROCESO FINALIZADO EXITOSAMENTE!" -ForegroundColor Magenta