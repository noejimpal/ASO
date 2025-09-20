#!/bin/bash

# Obtener la hora actual (solo la hora, en formato 00..23)
hora=$(date +%H)

# Convertir a número (por si acaso)
hora=$((10#$hora))

# Condicional para decidir el saludo
if (( hora >= 8 && hora < 15 )); then
    echo "Buenos días"
elif (( hora >= 15 && hora < 20 )); then
    echo "Buenas tardes"
else
    echo "Buenas noches"
fi
