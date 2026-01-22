#Ejercicio 2 (Años cumplidos):
[int]$edad = Read-Host "¿Qué edad tienes?"

for ($i = 1; $i -le $edad; $i++) {
    Write-Host "Has cumplido $i años"
}