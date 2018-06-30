#\!/bin/sh

# Reglas iptables para que se permita el tráfico de conexiones ssh establecidas

#iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
#iptables -A INPUT -p tcp --destination-port 22 -j DROP
#iptables-save

# Inicia el servicio knockd (por knocking)
service knockd start

# Da acceso inmediato al contenedor tras su arranque
/bin/bash

