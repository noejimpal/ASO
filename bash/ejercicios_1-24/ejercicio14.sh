#!/bin/bash

# Script para dar de alta o baja usuarios del sistema
# Comprobar que hay al menos 4 parámetros
if [ $# -lt 4 ]; then
    echo "Error. La sintaxis correcta es:"
    echo "./ejercicio14.sh accion nombre apellido1 apellido2 [grupo]"
    exit 1
fi

accion=$1                 # 'alta' o 'baja'
nombre=$2                 # nombre del usuario
apellido1=$3              # primer apellido
apellido2=$4              # segundo apellido
grupo=$5                  # grupo opcional (puede no estar definido)

# Crear identificativo aluXXYYZ
# XX = primeras 2 letras de apellido1
# YY = primeras 2 letras de apellido2
# Z = primera letra del nombre
id="alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}"

case $accion in
    alta)
        # Si no se indica grupo, se crea con el mismo identificativo
        if [ -z "$grupo" ]; then
            grupo="$id"
        fi
        echo "Alta de usuario: $id en grupo $grupo"
        sudo groupadd -f "$grupo"       # crea grupo si no existe
        sudo useradd -m -g "$grupo" "$id"
        echo "Usuario $id creado correctamente."
        ;;
    baja)
        echo "Baja de usuario: $id"
        sudo userdel -r "$id"           # elimina usuario y su home
        sudo groupdel "$id" 2>/dev/null
        echo "Usuario $id eliminado correctamente."
        ;;
    *)
        echo "Error. La sintaxis correcta es:"
        echo "./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        ;;
esac
