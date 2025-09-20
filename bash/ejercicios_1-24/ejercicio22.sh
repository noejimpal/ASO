#!/bin/bash

# Comprobar que se ha pasado un parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

dir="$1"

# Comprobar que el parámetro existe y es un directorio
if [ ! -d "$dir" ]; then
    echo "Error: '$dir' no existe o no es un directorio."
    exit 2
fi

# Contador de entradas
contador=0

echo "Listado de entradas en '$dir':"

# Recorrer las entradas del directorio (no recursivo)
for entrada in "$dir"/*; do
    if [ -d "$entrada" ]; then
        tipo="Directorio"
    elif [ -f "$entrada" ]; then
        tipo="Fichero"
    else
        tipo="Otro"
    fi
    echo "$entrada -> $tipo"
    contador=$((contador + 1))
done

echo "Total de entradas procesadas: $contador"
