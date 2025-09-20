#!/bin/bash

# Comprobar que se han pasado exactamente 2 parámetros
if [ "$#" -ne 2 ]; then
    echo "Error: Debes indicar 2 parámetros: origen y destino"
    echo "Uso: $0 <fichero_origen> <fichero_destino>"
    exit 1
fi

origen="$1"
destino="$2"

# Comprobar que el archivo de origen existe y es un fichero ordinario
if [ ! -f "$origen" ]; then
    echo "Error: El fichero de origen '$origen' no existe o no es un fichero ordinario"
    exit 2
fi

# Comprobar que no exista ya un fichero o directorio con el mismo nombre de destino
if [ -e "$destino" ]; then
    echo "Error: Ya existe un archivo o directorio con el nombre '$destino'"
    exit 3
fi

# Copiar el fichero
cp "$origen" "$destino" && echo "Fichero copiado correctamente: '$destino'"
