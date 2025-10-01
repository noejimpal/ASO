#!/bin/bash

# Guardar el nombre del archivo donde se almacenarán los registros
archivo="agenda.txt"


# Mostrar el menú de opciones al usuario
echo "1. AÑADIR"
echo "2. BUSCAR"
echo "3. LISTAR"
echo "4. ORDENAR"
echo "5. BORRAR"
echo "6. SALIR"

# Pedir al usuario que elija una opción
read -p "Introduce una opción: " opcion

# Comenzar un bloque case para ejecutar el código según la opción elegida
case $opcion in
    1)    # Opción 1: Añadir un registro
        echo "=== AÑADIR REGISTRO ==="
        read -p "Nombre: " nombre
        read -p "Dirección: " direccion
        read -p "Teléfono: " telefono
        echo "$nombre | $direccion | $telefono" >> "$archivo"
        echo "Registro añadido correctamente."
        ;;
  2)  # Opción 2: Buscar un registro
        read -p "Introduce palabra a buscar: " palabra
        if [ -f "$archivo" ]; then  # Comprobamos que el archivo existe
            grep -i "$palabra" "$archivo"
            
        else
            echo "No existe ningún registro aún."
        fi
        ;;
    3)  # Opción 3: Listar todos los registros
        if [ -f "$archivo" ]; then
            cat "$archivo"
        else
            echo "No hay registros para mostrar."
        fi
        ;;
    4)  # Opción 4: Ordenar los registros
        if [ -f "$archivo" ]; then
            sort "$archivo" -o "$archivo"
            echo "Registros ordenados alfabéticamente."
        else
            echo "No hay registros para ordenar."
        fi
        ;;
    5)  # Opción 5: Borrar todos los registros
        if [ -f "$archivo" ]; then
            rm -f "$archivo"
            # Borra el archivo lista.txt
            echo "Archivo borrado correctamente."
        else
            echo "No hay registros para borrar."
        fi
        ;;
    6)  # Opción 6: Salir
        echo "Saliendo del programa..."
        ;;
    *)  # Cualquier otra opción que no esté en 1-6
        echo "Opción no válida"
        ;;
esac 
