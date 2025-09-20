#!/bin/bash

F="lista.txt"

# Función para mostrar el menú
menu() {
    echo "----- AGENDA -----"
    echo "1) Añadir registro"
    echo "2) Buscar registro"
    echo "3) Listar registros"
    echo "4) Ordenar registros"
    echo "5) Borrar agenda"
    echo "6) Salir"
    echo "-----------------"
}

while true; do
    menu
    read -p "Elige una opción: " opcion

    case $opcion in
        1)  # Añadir registro
            read -p "Nombre: " nombre
            read -p "Dirección: " direccion
            read -p "Teléfono: " telefono
            echo "$nombre|$direccion|$telefono" >> "$F"
            echo "Registro añadido."
            ;;
        2)  # Buscar registro
            if [ ! -f "$F" ]; then
                echo "La agenda está vacía."
            else
                read -p "Introduce palabra a buscar: " busqueda
                grep -i "$busqueda" "$F" || echo "No encontrado"
            fi
            ;;
        3)  # Listar registros
            if [ ! -f "$F" ]; then
                echo "La agenda está vacía."
            else
                cat "$F"
            fi
            ;;
        4)  # Ordenar registros
            if [ ! -f "$F" ]; then
                echo "La agenda está vacía."
            else
                sort "$F" -o "$F"
                echo "Agenda ordenada alfabéticamente."
            fi
            ;;
        5)  # Borrar agenda
            if [ -f "$F" ]; then
                rm "$F"
                echo "Agenda borrada."
            else
                echo "La agenda ya está vacía."
            fi
            ;;
        6)  # Salir
            echo "Saliendo de la agenda..."
            break
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
done
