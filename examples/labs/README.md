# Laboratorio de Seguridad Informática - Topología con Máquinas Virtuales

## Descripción

Este laboratorio tiene como objetivo simular un entorno de red real con vulnerabilidades intencionales en un servidor Debian, para practicar:

- Reconocimiento y escaneo de puertos desde una máquina atacante (Kali Linux)
- Obtención de credenciales de cuentas con contraseñas débiles
- Escalada de privilegios para acceso a archivos sensibles
- Identificación de vulnerabilidades en servicios (HTTP, SSH, SSL, VPN/WireGuard)
- Comunicaciones legítimas desde un cliente (ping, SSH, HTTP)
- Prevención y mitigación de ataques con iptables, Suricata y hardening de servicios

## Tabla de Contenidos / Navegación

| Sección | Archivo | Descripción |
|---------|---------|-------------|
| 📋 General | [README.md](./README.md) | Visión general del laboratorio |
| 🗺️ Topología | [topologia.md](./topologia.md) | Diagrama y descripción de la topología de red |
| 🖥️ 01 - Infraestructura | [configuracion-virtualbox.md](./01-infraestructura/configuracion-virtualbox.md) | Adaptador puente en VirtualBox |
| | [servidor-debian.md](./01-infraestructura/servidor-debian.md) | Instalación y configuración base de Debian |
| | [kali-linux.md](./01-infraestructura/kali-linux.md) | Instalación y configuración de Kali Linux |
| | [cliente-pc.md](./01-infraestructura/cliente-pc.md) | Configuración del cliente (PC host) |
| 🔧 02 - Configuración del Servidor | [usuarios-y-contrasenas.md](./02-configuracion-servidor/usuarios-y-contrasenas.md) | Cuentas y contraseñas débiles |
| | [apache-http.md](./02-configuracion-servidor/apache-http.md) | Servidor web Apache HTTP |
| | [openssh.md](./02-configuracion-servidor/openssh.md) | Servidor SSH |
| | [ssl-tls.md](./02-configuracion-servidor/ssl-tls.md) | Servicios SSL/TLS |
| | [wireguard-vpn.md](./02-configuracion-servidor/wireguard-vpn.md) | VPN con WireGuard |
| ⚔️ 03 - Ataques desde Kali | [escaneo-puertos.md](./03-ataques-kali/escaneo-puertos.md) | Identificación de puertos abiertos |
| | [obtencion-credenciales.md](./03-ataques-kali/obtencion-credenciales.md) | Fuerza bruta y obtención de credenciales |
| | [escalada-privilegios.md](./03-ataques-kali/escalada-privilegios.md) | Elevación de privilegios a root |
| | [vulnerabilidades-adicionales.md](./03-ataques-kali/vulnerabilidades-adicionales.md) | Otras herramientas de vulnerabilidad |
| 💻 04 - Comunicaciones del Cliente | [ping-ssh-http.md](./04-comunicaciones-cliente/ping-ssh-http.md) | Ping, SSH y HTTP desde el cliente |
| 🛡️ 05 - Prevención y Mitigación | [iptables.md](./05-prevencion-mitigacion/iptables.md) | Reglas de firewall con iptables |
| | [suricata.md](./05-prevencion-mitigacion/suricata.md) | IDS/IPS con Suricata |
| | [hardening-servicios.md](./05-prevencion-mitigacion/hardening-servicios.md) | Endurecimiento de servicios |

---

## Topología de Red

| Equipo | Sistema Operativo | IP | Rol |
|--------|------------------|-----|-----|
| Servidor | Debian | 192.168.0.36 | Objetivo (servicios HTTP, SSH, SSL, VPN WireGuard) |
| Atacante | Kali Linux | 192.168.0.13 | Realiza ataques de reconocimiento y explotación |
| Cliente | PC Host (Windows/Linux) | 192.168.0.2 | Realiza comunicaciones legítimas (ping, SSH, HTTP) |

Todas las máquinas están configuradas con **adaptador de red puente (Bridged Adapter)** en VirtualBox, por lo que comparten la misma red física que el cliente.

## Estructura del Laboratorio

```
labs/
├── README.md                          # Este archivo (visión general)
├── topologia.md                       # Diagrama y descripción de la topología
├── 01-infraestructura/                # Configuración de las máquinas virtuales
│   ├── configuracion-virtualbox.md    # Configuración de adaptador puente en VirtualBox
│   ├── servidor-debian.md             # Instalación y configuración base del servidor Debian
│   ├── kali-linux.md                  # Instalación y configuración de Kali Linux
│   └── cliente-pc.md                  # Configuración del cliente (PC host)
├── 02-configuracion-servidor/         # Configuración de servicios vulnerables (INTENCIONAL)
│   ├── usuarios-y-contrasenas.md      # Cuentas c215714n y root con contraseñas débiles
│   ├── apache-http.md                 # Servidor web Apache HTTP
│   ├── openssh.md                     # Servidor SSH
│   ├── ssl-tls.md                     # Servicios SSL/TLS
│   └── wireguard-vpn.md               # VPN con WireGuard
├── 03-ataques-kali/                   # Pasos de ataque desde Kali Linux
│   ├── escaneo-puertos.md             # Identificación de puertos abiertos (nmap, masscan)
│   ├── obtencion-credenciales.md      # Fuerza bruta, hydra, medusa, john the ripper
│   ├── escalada-privilegios.md        # Elevación de privilegios a root
│   └── vulnerabilidades-adicionales.md# Otras herramientas de vulnerabilidad (nikto, sslscan, etc.)
├── 04-comunicaciones-cliente/         # Comunicaciones legítimas desde el cliente
│   └── ping-ssh-http.md               # Ping, conexión SSH y acceso web HTTP
└── 05-prevencion-mitigacion/          # Prevención y prevención de ataques
    ├── iptables.md                    # Reglas de firewall con iptables
    ├── suricata.md                    # IDS/IPS con Suricata
    └── hardening-servicios.md         # Endurecimiento de servicios (SSH, Apache, SSL, WireGuard)
```

## Advertencia de Seguridad

> **IMPORTANTE:** Este laboratorio es exclusivamente para fines educativos y de auditoría de seguridad en entornos controlados. No utilice estas técnicas contra sistemas que no le pertenezcan o para los no tenga autorización expresa por escrito. El acceso no autorizado a sistemas informáticos es ilegal en la mayoría de los países.

## Orden Sugerido de Ejecución

1. [Configure la infraestructura](./01-infraestructura/servidor-debian.md) (01-infraestructura)
2. [Configure el servidor con servicios vulnerables](./02-configuracion-servidor/usuarios-y-contrasenas.md) (02-configuracion-servidor)
3. [Ejecute las comunicaciones legítimas desde el cliente](./04-comunicaciones-cliente/ping-ssh-http.md) (04-comunicaciones-cliente)
4. [Realice los ataques desde Kali Linux](./03-ataques-kali/escaneo-puertos.md) (03-ataques-kali)
5. [Implemente prevenciones y mitigaciones](./05-prevencion-mitigacion/iptables.md) (05-prevencion-mitigacion)
6. Repita los ataques para verificar que las mitigaciones son efectivas