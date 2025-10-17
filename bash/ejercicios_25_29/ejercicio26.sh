#!/bin/bash
# ejercicio26.sh
# Busca ficheros que pueden ser modificados por "otros" (o+w) y guarda rutas absolutas.

OUTFILE="archivos_peligrosos.txt"
> "$OUTFILE"  # vaciamos/creamos el fichero de salida

# Buscamos desde el directorio actual (puedes cambiar '.' por '/' para todo el sistema)
# -type f -> sólo ficheros
# -perm -o=w -> cualquier archivo con permiso de escritura para 'otros'
# -print -> imprime la ruta con el path tal cual (find devuelve rutas relativas si se usa '.')
# Para asegurar rutas absolutas, usamos -printf "%p\n" y previa expansión de $PWD
find "$PWD" -type f -perm -o=w -print > "$OUTFILE"

echo "Listado guardado en $OUTFILE. Líneas: $(wc -l < "$OUTFILE")"
