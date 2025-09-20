#!/bin/bash
read -p "Número A: " A
read -p "Número B: " B
if [[ $A -gt $B ]]; then
echo "$A es mayor que $B"
elif [[ $A -lt $B ]]; then
echo "$B es mayor que $A"
else
echo "Son iguales"
fi
