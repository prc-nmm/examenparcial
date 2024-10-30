#/bin/sh

#Coloque IP
IP=192.168.81.128

clear

echo ""
echo "Revision NMM - PRC 2024"

echo ""
echo "IP"
ip a show dev ens33

echo "Datos del Sistema"
echo ""
snmpwalk -v 1 -c examen_parcial_24 $IP system.1
snmpwalk -v 1 -c examen_parcial_24 $IP system.3
snmpwalk -v 1 -c examen_parcial_24 $IP system.4
snmpwalk -v 1 -c examen_parcial_24 $IP system.5
snmpwalk -v 1 -c examen_parcial_24 $IP system.6

echo "Otros datos"
echo ""
snmpwalk -v 1 -c examen_parcial_24 $IP icmpInMsgs
snmpwalk -v 1 -c examen_parcial_24 $IP icmpInEchos
snmpwalk -v 1 -c examen_parcial_24 $IP icmpInEchoReps
snmpwalk -v 1 -c examen_parcial_24 $IP icmpOutEchoReps
