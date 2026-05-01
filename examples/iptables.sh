#!/bin/bash

# 1 LIMPIAR TABLAS EXISTENTES
## Eliminar Reglas
sudo iptables -F
sudo iptables -t nat -F 
## Reiniciar Contadores
sudo iptables -Z 
sudo iptables -t nat -Z

# 2 ESTABLECER POLITICAS PREDETERMINADAS
## Descartamos todo el trafico
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP

# 3 REGLAS DEL SERVIDOR
# permitir conexiones ssh
sudo iptables -A INPUT -p tcp --dport 22222 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22222 -j ACCEPT
# permitir comunicacion con debian.org
sudo iptables -A INPUT -s "debian.org" -j ACCEPT
sudo iptables -A OUTPUT -d "debian.org" -j ACCEPT
# permitir dns de Google
sudo iptables -A INPUT -s 8.8.8.8 -p udp --sport 53 -j ACCEPT
sudo iptables -A OUTPUT -d 8.8.8.8 -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT -s 8.8.8.8 -p udp --sport 5353 -j ACCEPT
sudo iptables -A OUTPUT -d 8.8.8.8 -p udp --dport 5353 -j ACCEPT
# permitir conexiones http con el servidor
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
# permitir conexiones a determinados sitios web
sudo iptables -A INPUT -s "google.com" -p tcp --sport 443 -j ACCEPT
sudo iptables -A OUTPUT -d "google.com" -p tcp --dport 443 -j ACCEPT

# 4 GUARDAR LA CONFIGURACION
sudo iptables-save > /etc/iptables/rules.v4