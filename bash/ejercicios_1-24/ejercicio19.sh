#!/bin/bash

# Número de filas
filas=5

for i in $(seq 1 $filas); do
    for j in $(seq 1 $i); do
        echo -n "$i"
    done
    echo
done

