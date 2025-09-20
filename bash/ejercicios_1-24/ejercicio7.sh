#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Uso: $0 <directorio>"
  exit 1
fi

dir=$1
if [ ! -d "$dir" ]; then
  echo "Error: $dir no es un directorio válido"
  exit 2
fi

fecha=$(date +%F)               # yyyy-mm-dd
nombre=$(basename "$dir")       # solo el nombre del directorio
archivo="${fecha}-${nombre}.tar.gz"

# -C cambia al directorio padre para no guardar rutas absolutas
tar -czf "$archivo" -C "$(dirname "$dir")" "$nombre"

echo "Directorio $dir comprimido en $archivo"

