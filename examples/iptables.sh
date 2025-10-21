# eliminacion de regla existentes
sudo iptables -F # filter
sudo iptables -t nat -F # (internet | vpn)
# reinicio de contadores
sudo iptables -Z # filter
sudo iptables -t nat -Z # (internet | vpn)
# directiva por defecto
sudo iptables -P INPUT DROP # entrada
sudo iptables -P OUTPUT DROP # salida
sudo iptables -P FORWARD DROP # reenvio
# direcciones permitidas
sudo iptables -A INPUT -s 192.168.0.1 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.1 -j ACCEPT
sudo iptables -A INPUT -s 192.168.0.102 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.102 -j ACCEPT
# protocolos permitidos
## ARP: identificacion de dispositivos Locales
sudo iptables -A INPUT -p arp -j ACCEPT
sudo iptables -A OUTPUT -p arp -j ACCEPT
## HTTPS: acceso web seguro
### trafico servidor web local
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
### trafico web externo (internet)
#### Direcciones de Google
sudo iptables -A INPUT -p tcp -s 172.232.0.0/13 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -d 172.232.0.0/13 -j ACCEPT
#### Direcciones de Debian
sudo iptables -A INPUT -p tcp -s 151.101.0.0/16 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -d 151.101.0.0/16 -j ACCEPT
#### Direccion de Microsoft Outlook
sudo iptables -A INPUT -p tcp -s 52.96.0.0/16 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -d 52.96.0.0/16 -j ACCEPT
#### Direcciones de EducacionIT
sudo iptables -A INPUT -p tcp -s 18.65.48.0/24 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -d 18.65.48.0/24 -j ACCEPT
# sudo iptables -A INPUT -p tcp --sport 443 -j ACCEPT
# sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

## DNS: resolucion de nombres
### Permitir consultas DNS a Google Public DNS
sudo iptables -A INPUT -s 8.8.8.8 -p udp --sport 53 -j ACCEPT
sudo iptables -A OUTPUT -d 8.8.8.8 -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT -s 8.8.8.8 -p udp --sport 5353 -j ACCEPT
sudo iptables -A OUTPUT -d 8.8.8.8 -p udp --dport 5353 -j ACCEPT