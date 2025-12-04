#!/bin/bash

# Reiniciar Reglas y limpiar contadores
## tabla filter
sudo iptables -F 
sudo iptables -Z
## tabla nat
sudo iptables -t nat -F
sudo iptables -t nat -Z

# Directivas predeterminadas (RECHAZAR TODO)
sudo iptables -P INPUT DROP # paquetes entrantes
sudo iptables -P OUTPUT DROP # paquetes salientes

# conexion con GATEWAY (cualquier protocolo)
sudo iptables -A INPUT -s 192.68.0.1 -j ACCEPT
sudo iptables -A OUTPUT -d 192.68.0.1 -j ACCEPT

# conexion SSH de un HOST ESPECIFICO
sudo iptables -A INPUT -s 192.168.0.102 -p tcp --dport 2222 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.102 -p tcp --sport 2222 -j ACCEPT

# conexion a SERVIDOR DNS (Google)
sudo iptables -A INPUT -s 8.8.0.0/16 -p udp --sport 53 -j ACCEPT
sudo iptables -A OUTPUT -d 8.8.0.0/16 -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT -s 8.8.0.0/16 -p udp --sport 5353 -j ACCEPT
sudo iptables -A OUTPUT -d 8.8.0.0/16 -p udp --dport 5353 -j ACCEPT

# SERVIDORES DE LINUX
## DEBIAN
sudo iptables -A INPUT -s 151.101.0.0/16 -j ACCEPT
sudo iptables -A OUTPUT -d 151.101.0.0/16 -j ACCEPT
## UBUNTU
sudo iptables -A INPUT -s 172.232.0.0/13 -j ACCEPT
sudo iptables -A OUTPUT -d 172.232.0.0/13 -j ACCEPT
sudo iptables -A INPUT -s 185.125.190.16/28 -j ACCEPT
sudo iptables -A OUTPUT -d 185.125.190.16/28 -j ACCEPT
## REDHAT
sudo iptables -A INPUT -s 151.101.2.132 -j ACCEPT
sudo iptables -A OUTPUT -d 151.101.2.132 -j ACCEPT
## CENTOS
sudo iptables -A INPUT -s 81.171.33.0/24 -j ACCEPT
sudo iptables -A OUTPUT -d 81.171.33.0/24 -j ACCEPT
## FEDORA
sudo iptables -A INPUT -s 8.43.85.0/24 -j ACCEPT
sudo iptables -A OUTPUT -d 8.43.85.0/24 -j ACCEPT
sudo iptables -A INPUT -s 38.145.32.0/24 -j ACCEPT
sudo iptables -A OUTPUT -d 38.145.32.0/24 -j ACCEPT

# conexiones HTTPS
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT

# mensajes ICMP
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
sudo iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

## EducacionIT
sudo iptables -A INPUT -s 3.163.139.0/24 -p tcp --sport 443 -j ACCEPT
sudo iptables -A OUTPUT -d 3.163.139.0/24 -p tcp --dport 443 -j ACCEPT