# calculadora
#pedimos los numeros y losp reparamos como enteros
[int]$num1 = Read-Host "introduce el primer numero"
[int]$num2 = Read-Host "introduce el segundo numero"

#mostramos el menu
Write-Host "******** CALCULADORA ******" -ForegroundColor Cyan
Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

#pedimos la opcion al usuario
$opcion = Read-Host "Elige una opcion: "
#swhict
switch ($opcion) {
    "1" { 
        $resultado = $num1 + $num2
        Write-Host "El resultado de la suma es: $resultado" -ForegroundColor Green
    }
    "2" { 
        $resultado = $num1 - $num2
        Write-Host "El resultado de la resta es: $resultado" -ForegroundColor Green
    }
    "3" { 
        $resultado = $num1 * $num2
        Write-Host "El resultado de la multiplicación es: $resultado" -ForegroundColor Green
    }
    "4" { 
        $resultado = $num1 / $num2
        Write-Host "El resultado de la división es: $resultado" -ForegroundColor Green
    }
    default { 
        Write-Host "Opción no válida" -ForegroundColor Red
    }
}