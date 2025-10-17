#!/bin/bash
# ==========================================
# EJERCICIO 28
# Verifica si un fichero existe y le pone
# permisos de ejecución solo al propietario.
# ==========================================

# Función "existe"
existe() {
    local fichero="$1"   # parámetro de la función: nombre del fichero

    if [[ -e "$fichero" ]]; then
        # Fichero existe
        echo "✅ El fichero '$fichero' existe."

        # Cambiamos permisos: ejecución solo para el propietario
        chmod u+x,g-x,o-x "$fichero"

        echo "🔒 Permisos cambiados: ejecutable solo para el propietario."
        return 0
    else
        # Fichero no existe
        echo "❌ El fichero '$fichero' NO existe."
        return 1
    fi
}

# ---- Verificamos que el script reciba 1 parámetro ----
if [[ $# -ne 1 ]]; then
    echo "Uso: $0 nombre_del_fichero"
    exit 2
fi

# Llamamos a la función con el parámetro recibido
existe "$1"
