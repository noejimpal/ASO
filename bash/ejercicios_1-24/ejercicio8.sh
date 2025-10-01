#!/bin/bash
#pedir al usuario dos numeros
read -p "introdue el primer numero:" num1
read -p "introduce el segundo numero:" num2

#comprobar cual es mayor
if (( num1 > num2)); then
    echo "$num1 es mayor que $num2"
elif (( num1 < num2 )); then
    echo "$num2 es mayor que $num1"
else
    echo "Ambos son iguales"
fi

