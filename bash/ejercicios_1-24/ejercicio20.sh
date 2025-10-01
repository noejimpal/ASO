#!/bin/bash

# Pedir número si no se pasa como parámetro
num=${1:-$(read -p "Introduce un número: " n; echo $n)}

# Números <= 1 no son primos
(( num <= 1 )) && { echo "$num no es primo"; exit 0; }

# Comprobar divisores
es_primo=1
for ((i=2; i*i<=num; i++)); do
    (( num % i == 0 )) && { es_primo=0; break; }
done

# Mostrar resultado
(( es_primo )) && echo "$num es primo" || echo "$num no es primo"

