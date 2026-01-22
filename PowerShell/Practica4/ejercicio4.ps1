#[int]$n = Read-Host "Introduce un número positivo"
$impares = @() # Creamos una lista vacía

for ($i = 1; $i -le $n; $i++) {
    if ($i % 2 -ne 0) {
        $impares += $i # Si es impar, lo guardamos
    }
}
Write-Host ($impares -join ", ")