#!/bin/bash

# ----------------------------
# 1 Con bucle for
suma_for=0
for i in {1..1000}; do
    suma_for=$(( suma_for + i ))
done
echo "Suma con for: $suma_for"

# ----------------------------
# 2 Con bucle while
suma_while=0
i=1
while [ $i -le 1000 ]; do
    suma_while=$(( suma_while + i ))
    i=$(( i + 1 ))
done
echo "Suma con while: $suma_while"

# ----------------------------
# 3 Con bucle until
suma_until=0
i=1
until [ $i -gt 1000 ]; do
    suma_until=$(( suma_until + i ))
    i=$(( i + 1 ))
done
echo "Suma con until: $suma_until"
