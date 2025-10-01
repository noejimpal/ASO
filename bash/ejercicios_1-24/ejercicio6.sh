#!/bin/bash

#pedimos la palabra al usuario
read -p "Introduce una palabra: " palabra

#añadimos la palabraal usuario
echo "$palabra" >> lista.txt

#confirmamos
echo "La palabra se ha añadido a lista.txt"
