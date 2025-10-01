#!/bin/bash

# Número de filas del patron
filas=5

# Bucle externo: controla las filas
for i in $(seq 1 $filas); do

 # Bucle interno: imprime los números en cada fila
    for j in $(seq 1 $i); do
        echo -n "$j"             # Imprime j sin salto de línea
    done
    echo                         # Salto de línea al terminar cada fila    
done
