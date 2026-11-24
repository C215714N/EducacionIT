# !/bin/sh
## Asignar variables
SERVER_IP="192.168.0.3"
GW_IP="192.168.0.1"
DNS_SERVER="$GW_IP,8.8.8.8,8.8.4.4"
## Eliminar reglas preexistentes
sudo iptables -F
sudo iptables -t nat -F
## Reiniciar Contadores de Paquetes
sudo iptables -Z
sudo iptables -t nat -Z
## Conexiones servidor HTTP/S
sudo iptables -A INPUT -d "$SERVER_IP" -p tcp --match multiport --dport 80,443 -j ACCEPT
sudo iptables -A INPUT -s "google.com" -p tcp --match multiport --dport 80,443 -j ACCEPT
sudo iptables -A INPUT -s "debian.org" -p tcp --match multiport --dport 80,443 -j ACCEPT
## Acceso remoto por SSH
sudo iptables -A INPUT -d "$SERVER_IP" -p tcp --dport 22222 -j ACCEPT
sudo iptables -A INPUT -s "bandit.labs.overthewire.org" -p tcp --sport 2220
## Intercambio seguro de Archivos
sudo iptables -A INPUT -d 192.168.0.3 -p tcp --dport 21 -j ACCEPT
sudo iptables -A INPUT -s 192.168.0.3 -p tcp --sport 21 -j ACCEPT
## Servidores DNS especificos
sudo iptables -A INPUT -s "$DNS_SERVER" -p udp --match multiport --sport 53,5353 -j ACCEPT 
sudo iptables -A INPUT -s "$GW_IP" -p udp --match multiport --sport 53,5353 -j ACCEPT
## Permitir comunicacion con Gateway
sudo iptables -A INPUT -s "$GW_IP" -j ACCEPT
## Permitir el uso de UDP
sudo iptables -A INPUT -p udp --dport 51820 -j ACCEPT
## directivas predeterminadas (DROP)
sudo iptables -P INPUT DROP
## Guardar la configuracion
sudo iptables-save > etc/iptables/rules.v4