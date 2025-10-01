#!/bin/bash

# Pedimos los dos números
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

# Mostramos el menú
echo "Elige una operación:"
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"

read -p "Opción (1-4): " opcion

# Evaluamos la opción con case
case $opcion in
  1)
    resultado=$((num1 + num2))
    echo "El resultado de la suma es: $resultado"
    ;;
  2)
    resultado=$((num1 - num2))
    echo "El resultado de la resta es: $resultado"
    ;;
  3)
    resultado=$((num1 * num2))
    echo "El resultado de la multiplicación es: $resultado"
    ;;
  4)
    resultado=$((num1 / num2))  
    echo "El resultado de la división es: $resultado"
    ;;
  *)
    echo "Opción no válida"
    ;;
esac
