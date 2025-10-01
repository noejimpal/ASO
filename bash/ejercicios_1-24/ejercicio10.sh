#!/bin/bash

#pedimos un numero
read -p "Introduce un número: " numero

#comprobar si el numero es divisible por 2
if (( numero % 2 == 0 )); then
    echo "$numero es par"
else
    echo "$numero es impar"
fi
