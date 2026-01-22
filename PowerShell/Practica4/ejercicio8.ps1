#Ejercicio 8 (Triángulo de números impares): Este es el más difícil. Necesitamos dos bucles: uno para la fila y otro para los números
[int]$n = Read-Host "Introduce la altura"
for ($i = 1; $i -le $n; $i += 2) {
    $fila = ""
    for ($j = $i; $j -ge 1; $j -= 2) {
        $fila += "$j "
    }
    Write-Host $fila
}