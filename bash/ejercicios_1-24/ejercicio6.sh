#!/bin/bash
read -p "Introduce una palabra: " palabra
echo "$palabra" >> lista.txt
echo "La palabra se ha añadido a lista.txt"
