#!/bin/bash

suma=0

while true; do
    read -p "Introduce un número (0 para terminar): " num
    # Comprobar si es 0
    if [ "$num" -eq 0 ]; then
        break
    fi
    suma=$(( suma + num ))
done

echo "La suma total es: $suma"
