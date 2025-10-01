#!/bin/bash

suma=0  # inicializamos acumulador

while true; do
    read -p "Introduce un número (0 para terminar): " num

    # Comprobar si es 0
    if [ "$num" -eq 0 ]; then
        break   # salimos del bucle si el número es 0
    fi

    suma=$(( suma + num ))   # acumulamos el número

    # Mostrar suma parcial
    echo "Suma actual: $suma"
done

# Mostrar la suma final al terminar
echo "La suma total es: $suma"


