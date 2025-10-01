#!/bin/bash

# Número a adivinar (fijo)
numero=42

echo "Adivina el número del 1 al 100 (introduce 0 para rendirte)."

while true; do
    read -p "Introduce tu intento: " intento

    # Comprobar si el usuario se rinde
    if [ "$intento" -eq 0 ]; then
        echo "Te has rendido. El número era $numero."
        break
    fi

    # Comprobar si es correcto
    if [ "$intento" -eq "$numero" ]; then
        echo "¡Enhorabuena! Has adivinado el número."
        break
    elif [ "$intento" -lt "$numero" ]; then
        echo "El número es mayor."
    else
        echo "El número es menor."
    fi
done
