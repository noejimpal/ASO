#!/bin/bash

# Comprobar que se ha pasado un parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <número>"
    exit 1
fi

n=$1

# Bucle del 1 al 10
for i in {1..10}; do
    resultado=$(( i * n ))
    echo "$i x $n = $resultado"
done
