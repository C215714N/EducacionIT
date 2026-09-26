#!/bin/bash

## Limpiar reglas y restablecer contadores.
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -Z
sudo iptables -t nat -Z

## Politica por defecto: se bloquean conexiones nuevas no autorizadas.
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP
sudo sysctl -w net.ipv4.ip_forward=1

## Trafico local y respuestas de conexiones iniciadas por el servidor.
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
sudo iptables -A OUTPUT -o lo -j ACCEPT
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -m conntrack --ctstate INVALID -j DROP

## Resolucion DNS y acceso HTTP/HTTPS unicamente al gateway y repositorios Debian.
sudo iptables -A OUTPUT -d 192.168.0.1 -p udp --dport 53 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.1 -p tcp --dport 53 -j ACCEPT
sudo iptables -A OUTPUT -d 192.168.0.1 -p tcp -m multiport --dports 80,443 -j ACCEPT
sudo iptables -A OUTPUT -d deb.debian.org -p tcp -m multiport --dports 80,443 -j ACCEPT
sudo iptables -A OUTPUT -d security.debian.org -p tcp -m multiport --dports 80,443 -j ACCEPT

## Para el resto de destinos solo se permiten HTTP, HTTPS y SSH en el puerto 22222.
sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443,22222 -j ACCEPT

## Handshake del servidor WireGuard (debe coincidir con ListenPort).
sudo iptables -A INPUT -i enp0s3 -p udp --dport 51820 -j ACCEPT

## Reenvio y NAT para los clientes WireGuard hacia la red externa.
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate INVALID -j DROP
sudo iptables -A FORWARD -i wg0 -o enp0s3 -s 10.0.0.0/27 -j ACCEPT
sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/27 -o enp0s3 -j MASQUERADE

## Administracion SSH: solo desde la LAN o desde la red VPN.
sudo iptables -A INPUT -i enp0s3 -s 192.168.0.0/24 -p tcp --dport 22222 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A INPUT -i wg0 -s 10.0.0.0/27 -p tcp --dport 22222 -m conntrack --ctstate NEW -j ACCEPT

## Servicio web publicado por HTTPS.
sudo iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW -j ACCEPT

## ICMP limitado a las redes de administracion para diagnostico.
sudo iptables -A INPUT -i enp0s3 -s 192.168.0.0/24 -p icmp -j ACCEPT
sudo iptables -A INPUT -i wg0 -s 10.0.0.0/27 -p icmp -j ACCEPT

## Guardar la configuracion
sudo iptables-save > /etc/iptables/rules.v4