#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
    echo "Error: '$dir' no existe o no es un directorio."
    exit 2
fi

contador=0
echo "Listado de entradas en '$dir':"

for entrada in "$dir"/*; do
    if [ -d "$entrada" ]; then
        tipo="Directorio"
    elif [ -f "$entrada" ]; then
        tipo="Fichero"
    elif [ -L "$entrada" ]; then
        tipo="Enlace simbólico"
    elif [ -b "$entrada" ]; then
        tipo="Archivo especial de bloque"
    elif [ -c "$entrada" ]; then
        tipo="Archivo especial de carácter"
    else
        tipo="Otro"
    fi

    echo "$entrada -> $tipo"
    contador=$((contador + 1))
done

echo "Total de entradas procesadas: $contador"

