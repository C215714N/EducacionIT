#!bin/bash

su
sudo apt update && apt upgrade
sudo apt install iptables

# Reiniciamos la tablas filter y nat
sudo iptables -F
sudo iptables -Z
sudo iptables -t nat -F
sudo iptables -t nat -Z

# Directivas por defecto
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

# Reglas de Entrada
sudo iptables -A INPUT -s 192.168.0.0/24 -j ACCEPT      # comunicacion red local
sudo iptables -A INPUT -p tcp --sport 443 -j ACCEPT     # permitir respuesta HTTPS
sudo iptables -A INPUT -p tcp --sport 80 -j ACCEPT      # permitir respuesta HTTP

# Reglas de Salida
sudo iptables -A OUTPUT -d 192.168.0.0/24 -j ACCEPT     # comunicacion red local
sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT    # permitir solicitud HTTPS
sudo iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT     # permitir solicitud HTTP

