#!/bin/bash
# ==========================================
# EJERCICIO 29 – Informe de IPs libres
# ==========================================

OUT="informe_ips.txt"
TMP="/tmp/ips_red.$$"

# ---- Función: detectar IP y red ----
detectar_red() {
    # Detectamos la interfaz por defecto
    iface=$(ip route get 8.8.8.8 | awk '{print $5; exit}')
    if [[ -z "$iface" ]]; then
        iface=$(ip -o -4 addr show scope global | awk '{print $2; exit}')
    fi

    # Obtenemos IP con prefijo CIDR
    ip_cidr=$(ip -o -4 addr show dev "$iface" | awk '{print $4}' | head -n1)
    if [[ -z "$ip_cidr" ]]; then
        echo "❌ No se detectó IP IPv4 en la interfaz $iface"
        exit 1
    fi

    echo "$iface $ip_cidr"
}

# ---- Función: calcular red y hosts ----
calcular_red_info() {
    local addr_cidr="$1"
    python3 - <<PY
import ipaddress
net = ipaddress.ip_network("$addr_cidr", strict=False)
print(net.network_address)       # Dirección de red
print(net.broadcast_address)     # Broadcast
print(net.prefixlen)             # CIDR
print(net.netmask)               # Máscara
for ip in net.hosts():
    print(ip)                    # Hosts disponibles
PY
}

# ---- Función: generar informe completo ----
generar_informe() {
    iface="$1"
    addr_cidr="$2"

    # Obtenemos datos de red
    mapfile -t data < <(calcular_red_info "$addr_cidr")
    network="${data[0]}"
    broadcast="${data[1]}"
    prefix="${data[2]}"
    netmask="${data[3]}"

    # Guardamos hosts en temporal
    > "$TMP"
    for ((i=4;i<${#data[@]};i++)); do
        echo "${data[i]}" >> "$TMP"
    done

    # Cabecera del informe
    echo "Informe de IPs libres/ocupadas - $(date)" > "$OUT"
    echo "Interfaz: $iface" >> "$OUT"
    echo "IP/Prefijo: $addr_cidr" >> "$OUT"
    echo "Red: $network/$prefix" >> "$OUT"
    echo "Broadcast: $broadcast" >> "$OUT"
    echo "Máscara de subred: $netmask" >> "$OUT"
    echo "" >> "$OUT"
    echo "IP;Estado" >> "$OUT"

    # Ping a cada IP
    while IFS= read -r ip; do
        if [[ "$ip" == "${addr_cidr%/*}" ]]; then
            echo "${ip};ocupada (local)" >> "$OUT"
            continue
        fi

        if ping -c 1 -W 1 "$ip" &>/dev/null; then
            echo "${ip};ocupada" >> "$OUT"
        else
            echo "${ip};libre" >> "$OUT"
        fi
    done < "$TMP"

    echo "✅ Informe generado correctamente en $OUT"
    rm -f "$TMP"
}

# ---- Ejecución principal ----
read -r iface ip_cidr <<< "$(detectar_red)"
echo "Detectada interfaz $iface con IP $ip_cidr"

generar_informe "$iface" "$ip_cidr"

