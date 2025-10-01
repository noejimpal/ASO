#!/bin/bash

# Comprobar que se ha pasado un parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

dir="$1"

# Comprobar que el directorio existe
if [ ! -d "$dir" ]; then
    echo "Error: '$dir' no existe o no es un directorio."
    exit 2
fi

# Contadores
num_ficheros=0
num_directorios=0

# Recorrer entradas del directorio (no recursivo)
for entrada in "$dir"/*; do
    if [ -d "$entrada" ]; then
        num_directorios=$((num_directorios + 1))
    elif [ -f "$entrada" ]; then
        num_ficheros=$((num_ficheros + 1))
    fi
done

echo "Estadísticas del directorio '$dir':"
echo "Número de ficheros: $num_ficheros"
echo "Número de subdirectorios: $num_directorios"
