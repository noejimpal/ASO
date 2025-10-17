#!/bin/bash
# ejercicio25.sh
# Muestra las líneas del comando `last` que contienen una IP IPv4.

# patrón para detectar IPv4 (básico)
IP_REGEX='\b([0-9]{1,3}\.){3}[0-9]{1,3}\b'

# Ejecutamos last y filtramos sólo las líneas que contienen una IP
# egrep imprimirá la línea completa (no sólo la IP).
last | egrep "$IP_REGEX"
