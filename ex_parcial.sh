#!/bin/bash

# --- Configuración de Variables ---
#
# Para ejecutar: ./nombre_del_script.sh <DIRECCIÓN_IP> <COMUNIDAD_SNMP>
# Ejemplo: ./snmp_test.sh 192.168.1.10 'mi_comunidad_secreta'

# 1. Asignar la Dirección IP (Argumento $1) y la Comunidad (Argumento $2)
IP="$1"
COMUNIDAD="$2"

# 2. Comprobación de argumentos
if [ -z "$IP" ] || [ -z "$COMUNIDAD" ]; then
    echo "Error: Faltan argumentos."
    echo "Uso: $0 <DIRECCIÓN_IP> <COMUNIDAD_SNMP>"
    echo "Ejemplo: $0 192.168.81.128 examen_parcial_25"
    exit 1
fi

# --- Ejecución de Pruebas ---
clear

echo ""
echo "=========================================="
echo "Revision NMM - PRC 2025 (Pruebas SNMPv1)"
echo "=========================================="
echo "Dispositivo a Testear:  $IP"
echo "Comunidad Utilizada:    $COMUNIDAD"
echo ""

# Mostrar la IP del propio host que ejecuta el script (para contexto)
echo "IP del Host de Pruebas (ens33):"
ip a show dev ens33 | grep 'inet ' | awk '{print $2}'

echo "------------------------------------------"

echo "Datos del Sistema (OIDs del MIB system)"
echo ""
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" system.1    # sysDescr
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" system.3    # sysUpTime
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" system.4    # sysContact
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" system.5    # sysName
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" system.6    # sysLocation

echo "------------------------------------------"

echo "Otros Datos de Tráfico (MIB icmp)"
echo ""
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" icmpInMsgs
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" icmpInEchos
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" icmpInEchoReps
snmpwalk -v 1 -c "$COMUNIDAD" "$IP" icmpOutEchoReps

echo "------------------------------------------"
echo "Pruebas Finalizadas en $IP"
echo ""
