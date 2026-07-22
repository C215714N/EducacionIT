# !bin/sh
## REESTABLCER CONFIGURACION
sudo iptables -F
sudo iptables -Z
sudo iptables -t nat -F
sudo iptables -t nat -Z
## DIRECTIVAS PREDETERMINADAS
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
## COMUNICACION CON GATEWAY
sudo iptables -A INPUT -s 192.168.0.1 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.1 -j ACCEPT
## COMUNICACION CON SERVIDORES LOCALES
sudo iptables -I INPUT -s 192.168.0.0/27 -p tcp -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.0/27 -p tcp -j ACCEPT
## SERVIDOR WEB
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
## SERVIDOR DNS
sudo iptables -A INPUT -d 192.168.0.251 -p udp --dport 53 -j ACCEPT
sudo iptables -A OUTPUT -s 192.168.0.251 -p udp --sport 53 -j ACCEPT
sudo iptables -A INPUT -s "dns.google.com" -p udp --sport 53 -j ACCEPT
sudo iptables -A OUTPUT -d "dns.google.com" -p udp --dport 53 -j ACCEPT
## SERVICIOS SSH
sudo iptables -A INPUT -p tcp --dport 22222 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22222 -j ACCEPT
## ACCESO A SITIOS WEB
sudo iptables -A INPUT -p tcp --sport 80 -m string --string "google.com" -j ACCEPT
sudo iptables -A INPUT -p tcp --sport 443 -m string --string "google.com" -j ACCEPT
sudo iptables -A INPUT -p tcp --sport 80 -m string --string "github.com" -j ACCEPT
sudo iptables -A INPUT -p tcp --sport 443 -m string --string "github.com" -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
## GUARDAR CONFIGURACION
sudo iptables-save > /etc/iptables/rules.v4