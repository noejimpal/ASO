#!/bin/bash
read -p "Introduce un número: " n
if (( n % 2 == 0 )); then
    echo "$n es par"
else
    echo "$n es impar"
fi
