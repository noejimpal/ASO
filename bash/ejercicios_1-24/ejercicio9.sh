#!/bin/bash
echo "Elige operación: 1) + 2) - 3) * 4) /"
read -p "> " op
read -p "Primer número: " x
read -p "Segundo número: " y
case $op in
1) echo "Resultado: $((x + y))" ;;
2) echo "Resultado: $((x - y))" ;;
3) echo "Resultado: $((x * y))" ;;
4) if [ "$y" -eq 0 ]; then echo "Error: división por 0"; else echo "Resultado: $((x / y))"; fi ;;
*) echo "Opción no válida" ;;
esac
