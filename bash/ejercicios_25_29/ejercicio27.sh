#!/bin/bash
# ==========================================
# AGENDA v4 - usando expresiones regulares
# Archivo: agenda.csv (Nombre;Teléfono;Email)
# Validaciones con regex para teléfono y email
# ==========================================

AGENDA="agenda.csv"
touch "$AGENDA"

# ---- Expresiones regulares ----
# Teléfono: solo dígitos, mínimo 6 y máximo 15
PHONE_REGEX='^[0-9]{6,15}$'
# Email: formato básico usuario@dominio.ext
EMAIL_REGEX='^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'

# ---- Función: Añadir contacto ----
añadir_contacto() {
    read -p "Nombre: " nombre
    read -p "Teléfono: " telefono
    read -p "Email: " email

    # Validación con regex
    if ! [[ $telefono =~ $PHONE_REGEX ]]; then
        echo "❌ Teléfono no válido (solo números, 6-15 dígitos)."
        return
    fi

    if ! [[ $email =~ $EMAIL_REGEX ]]; then
        echo "❌ Email no válido."
        return
    fi

    echo "$nombre;$telefono;$email" >> "$AGENDA"
    echo "✅ Contacto añadido correctamente."
}

# ---- Función: Listar contactos ----
listar_contactos() {
    if [[ ! -s $AGENDA ]]; then
        echo "📭 La agenda está vacía."
        return
    fi

    echo "📒 Contactos guardados:"
    echo "------------------------------------------"
    nl -w2 -s'. ' "$AGENDA" | while IFS=';' read -r num nombre telefono email; do
        echo "$num) Nombre: $nombre | Tel: $telefono | Email: $email"
    done
    echo "------------------------------------------"
}

# ---- Función: Buscar contacto ----
buscar_contacto() {
    read -p "🔍 Buscar (nombre, teléfono o email): " busqueda
    resultado=$(grep -in "$busqueda" "$AGENDA")
    if [[ -z $resultado ]]; then
        echo "❌ No se encontraron resultados."
    else
        echo "📋 Resultados:"
        echo "$resultado" | while IFS=';' read -r linea; do
            echo "$linea"
        done
    fi
}

# ---- Función: Borrar contacto ----
borrar_contacto() {
    listar_contactos
    read -p "Ingrese el número del contacto a borrar: " num
    if [[ $num =~ ^[0-9]+$ ]]; then
        sed -i "${num}d" "$AGENDA"
        echo "🗑️ Contacto eliminado."
    else
        echo "❌ Número inválido."
    fi
}

# ---- Función: Editar contacto ----
editar_contacto() {
    listar_contactos
    read -p "Ingrese el número del contacto a editar: " num

    linea=$(sed -n "${num}p" "$AGENDA")
    if [[ -z $linea ]]; then
        echo "❌ Contacto no encontrado."
        return
    fi

    IFS=';' read -r nombre telefono email <<< "$linea"

    read -p "Nuevo nombre [$nombre]: " nuevo_nombre
    read -p "Nuevo teléfono [$telefono]: " nuevo_telefono
    read -p "Nuevo email [$email]: " nuevo_email

    nuevo_nombre=${nuevo_nombre:-$nombre}
    nuevo_telefono=${nuevo_telefono:-$telefono}
    nuevo_email=${nuevo_email:-$email}

    # Validación con regex
    if ! [[ $nuevo_telefono =~ $PHONE_REGEX ]]; then
        echo "❌ Teléfono no válido."
        return
    fi

    if ! [[ $nuevo_email =~ $EMAIL_REGEX ]]; then
        echo "❌ Email no válido."
        return
    fi

    sed -i "${num}s/.*/${nuevo_nombre};${nuevo_telefono};${nuevo_email}/" "$AGENDA"
    echo "✏️ Contacto editado correctamente."
}

# ---- Función: Mostrar menú ----
mostrar_menu() {
    echo "============================="
    echo "       📘 AGENDA v4"
    echo "============================="
    echo "1) Añadir contacto"
    echo "2) Listar contactos"
    echo "3) Buscar contacto"
    echo "4) Borrar contacto"
    echo "5) Editar contacto"
    echo "6) Salir"
    echo "============================="
}

# ---- Bucle principal con CASE ----
while true; do
    mostrar_menu
    read -p "Seleccione una opción [1-6]: " opcion
    case $opcion in
        1) añadir_contacto ;;
        2) listar_contactos ;;
        3) buscar_contacto ;;
        4) borrar_contacto ;;
        5) editar_contacto ;;
        6) echo "👋 Saliendo..."; exit 0 ;;
        *) echo "❌ Opción no válida. Intente de nuevo." ;;
    esac
    echo
done

