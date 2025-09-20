#!/bin/bash

# Comprobar que hay al menos 4 parámetros
if [ $# -lt 4 ]; then
    echo "Error. La sintaxis correcta es:"
    echo "./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

accion=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5

# Crear identificativo aluXXYYZ
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
