#!/bin/bash

# Comprobar que se pasó un parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <número>"
    exit 1
fi

num=$1

# Comprobar si el número es menor que 2
if [ "$num" -lt 2 ]; then
    echo "$num no es primo"
    exit 0
fi

# Comprobar divisores
es_primo=1  # 1 = primo, 0 = no primo

for (( i=2; i*i<=num; i++ )); do
    if (( num % i == 0 )); then
        es_primo=0
        break
    fi
done

if (( es_primo )); then
    echo "$num es primo"
else
    echo "$num no es primo"
fi
