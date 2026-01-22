#Ejercicio 10: Evaluación de Empleados
[double]$puntos = Read-Host "Puntuación (0.0, 0.4, 0.6)"
$dinero = 2400 * $puntos

if ($puntos -eq 0.0) { $nivel = "Inaceptable" }
elseif ($puntos -eq 0.4) { $nivel = "Aceptable" }
elseif ($puntos -ge 0.6) { $nivel = "Meritorio" }

Write-Host "Nivel: $nivel. Cobrarás: $dinero €"