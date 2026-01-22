# Ejercicio 3 - Cálculo de salario (Nómina)
Write-Host "--- SISTEMA DE GESTIÓN DE PAGOS ---" -ForegroundColor Yellow

# Pedimos los datos al usuario
# Usamos [double] en lugar de [int] por si alguien cobra con céntimos (ej. 10.50€)
[double]$horasTrabajadas = Read-Host "Introduce el número de horas trabajadas"
[double]$costeHora = Read-Host "Introduce el precio por hora"

# Calculamos el salario total
$salarioTotal = $horasTrabajadas * $costeHora

# Mostramos el resultado final
Write-Host "-------------------------------------------"
Write-Host "El salario total a pagar es de: $salarioTotal €" -ForegroundColor Green