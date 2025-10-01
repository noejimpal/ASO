#!/bin/bash

# Comprobar que se ha pasado un parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <número>"
    exit 1
fi

# Guardamos el parámetro en la variable n
n=$1   

# Bucle del 1 al 10 para hacer la multiplicacion
for i in {1..10}; do
    resultado=$(( i * n ))
    echo "$i x $n = $resultado"
done
