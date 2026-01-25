#Ejercicio 1: Calculadora con Funciones
<#
.SYNOPSIS
    Calculadora interactiva mediante el uso de funciones con parámetros.
.DESCRIPTION
    El script solicita dos números y permite elegir una operación del menú.
#>

# --- DEFINICIÓN DE FUNCIONES ---

function Sumar ([int]$n1, [int]$n2) {
    $resultado = $n1 + $n2
    Write-Host "El resultado de la suma es: $resultado" -ForegroundColor Green
}

function Restar ([int]$n1, [int]$n2) {
    $resultado = $n1 - $n2
    Write-Host "El resultado de la resta es: $resultado" -ForegroundColor Green
}

function Multiplicar ([int]$n1, [int]$n2) {
    $resultado = $n1 * $n2
    Write-Host "El resultado de la multiplicación es: $resultado" -ForegroundColor Green
}

function Dividir ([int]$n1, [int]$n2) {
    # Validación para evitar división por cero
    if ($n2 -ne 0) {
        $resultado = $n1 / $n2
        Write-Host "El resultado de la división es: $resultado" -ForegroundColor Green
    } else {
        Write-Host "Error: No se puede dividir por cero." -ForegroundColor Red
    }
}

# --- Cuerpo Principal del Script ---

do {
    Write-Host "`n****** CALCULADORA ********" -ForegroundColor Cyan
    Write-Host "1. Sumar"
    Write-Host "2. Restar"
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "0. Salir"
    
    $opcion = Read-Host "Elige una opción"

    # Solo pedimos números si la opción es de cálculo (1 a 4)
    if ($opcion -match "^[1-4]$") {
        [int]$val1 = Read-Host "Introduce el primer número"
        [int]$val2 = Read-Host "Introduce el segundo número"

        switch ($opcion) {
            "1" { Sumar $val1 $val2 }
            "2" { Restar $val1 $val2 }
            "3" { Multiplicar $val1 $val2 }
            "4" { Dividir $val1 $val2 }
        }
    }

} while ($opcion -ne "0")