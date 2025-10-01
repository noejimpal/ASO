#!/bin/bash
#introducir dos numeros
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

#sacar la media
media=$(( (num1 + num2) / 2 ))

#mostrar la media aritmetica
echo "La media aritmética es: $media"
