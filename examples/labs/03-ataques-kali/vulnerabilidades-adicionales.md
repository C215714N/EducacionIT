[⬅️ Volver al README principal](../README.md)

---

# Identificación de Vulnerabilidades Adicionales

Este documento describe cómo utilizar herramientas adicionales para identificar vulnerabilidades en el servidor Debian más allá del escaneo de puertos y fuerza bruta.

## Paso 1: Escaneo de vulnerabilidades web con Nikto

Nikto escanea servidores web en busca de archivos peligrosos, configuraciones inseguras y vulnerabilidades conocidas.

```bash
# Escaneo básico del servidor web HTTP
nikto -h http://192.168.0.36

# Escaneo del servidor HTTPS
nikto -h https://192.168.0.36

# Escaneo con salida en archivo
nikto -h http://192.168.0.36 -o reporte-nikto.txt -Format txt
```

**Resultado esperado:** Nikto identificará:
- Servidor Apache con versión expuesta
- Archivos expuestos (admin.html, info.php, config.php.bak)
- Posibles problemas de configuración
- Cabeceras de seguridad faltantes

## Paso 2: Análisis detallado de SSL/TLS

```bash
# sslscan - Escaneo rápido de certificados y cifradores
sslscan 192.168.0.36

# testssl.sh - Análisis completo de SSL/TLS
testssl.sh 192.168.0.36

# nmap con scripts SSL
nmap --script ssl-enum-ciphers,ssl-cert,ssl-date -p 443 192.168.0.36
```

**Vulnerabilidades esperadas:**
- Certificado autofirmado (no confiable)
- Posible soporte de protocolos antiguos (SSLv3, TLS 1.0, TLS 1.1)
- Cifradores débiles

## Paso 3: Escaneo de vulnerabilidades con scripts Nmap (NSE)

```bash
# Escaneo de vulnerabilidades comunes
nmap --script vuln 192.168.0.36

# Scripts específicos por servicio
nmap --script ssh-vuln* -p 22222 192.168.0.36
nmap --script http-vuln* -p 80,443 192.168.0.36

# Escaneo completo de vulnerabilidades
nmap --script vuln,safe -sV -sC 192.168.0.36
```

## Paso 4: Búsqueda de exploits públicos con searchsploit

Después de identificar versiones de servicios:

```bash
# Identificar versiones primero
nmap -sV 192.168.0.36

# Buscar exploits para Apache
searchsploit apache <versión>

# Buscar exploits para OpenSSH
searchsploit openssh <versión>

# Buscar exploits para Debian
searchsploit debian <versión>

# Buscar exploits para el kernel
searchsploit linux kernel <versión>
```

## Paso 5: Captura y análisis de tráfico con Wireshark

```bash
# Capturar tráfico entre Kali y el servidor
sudo tcpdump -i eth0 -w captura-red.pcap host 192.168.0.36

# Analizar con Wireshark (interfaz gráfica)
wireshark captura-red.pcap &

# O analizar con tshark (línea de comandos)
tshark -r captura-red.pcap -Y "tcp.port == 22 or tcp.port == 80"
```

**Qué buscar en el tráfico:**
- Credenciales en texto plano (HTTP Basic Auth, telnet, FTP)
- Sesiones SSH (cifradas, pero se pueden ver metadatos)
- Tráfico HTTP sin cifrar
- Intentes de fuerza bruta (muchos paquetes SSH fallidos)

## Paso 6: Escaneo de servicios WireGuard (UDP)

```bash
# Escaneo UDP para detectar WireGuard
nmap -sU -p 51820 192.168.0.36

# Escaneo más completo de UDP (más lento)
nmap -sU -p 1-65535 192.168.0.36
```

## Paso 7: Escaneo de cabecera HTTP y tecnologías

```bash
# Ver cabeceras del servidor web
curl -I http://192.168.0.36

# Ver tecnologías con whatweb (si está instalado)
whatweb http://192.168.0.36

# O con nmap
nmap --script http-headers,http-server-header -p 80 192.168.0.36
```

## Paso 8: Escaneo de archivos y directorios con Gobuster

```bash
# Escaneo de directorios comunes
gobuster dir -u http://192.168.0.36 -w /usr/share/wordlists/dirb/common.txt

# Escaneo con extensiones específicas
gobuster dir -u http://192.168.0.36 -w /usr/share/wordlists/dirb/common.txt -x php,html,txt,bak,backup,zip,tar

# Escaneo de subdominios virtuales
gobuster vhost -u http://192.168.0.36 -w /usr/share/wordlists/dirb/vhosts.txt
```

## Resumen de herramientas y vulnerabilidades identificables

| Herramienta | Objetivo | Vulnerabilidades detectadas |
|-------------|----------|----------------------------|
| Nikto | Servidor web | Archivos expuestos, cabeceras faltantes, versión de servidor |
| sslscan/testssl.sh | SSL/TLS | Certificado autofirmado, protocolos débiles, cifradores inseguros |
| Nmap NSE (vuln) | Todos los servicios | Vulnerabilidades conocidas por servicio |
| searchsploit | Servicios identificados | Exploits públicos disponibles |
| Wireshark/tcpdump | Tráfico de red | Credenciales en texto plano, patrones de ataque |
| Gobuster/dirb | Servidor web | Directorios y archivos ocultos expuestos |
| nmap -sU | UDP | Servicios ocultos como WireGuard |

## Flujo de trabajo completo desde Kali

```bash
# 1. Escaneo de puertos
nmap -sV -sC -p- 192.168.0.36

# 2. Escaneo web
nikto -h http://192.168.0.36
dirb http://192.168.0.36/

# 3. Escaneo SSL
sslscan 192.168.0.36

# 4. Fuerza bruta SSH
hydra -L usuarios.txt -P contraseñas.txt -s 22222 -vV 192.168.0.36 ssh

# 5. Conectar y escalar privilegios
ssh -p 22222 c215714n@192.168.0.36
sudo su -

# 6. Buscar vulnerabilidades adicionales con linpeas
./linpeas.sh
```

---

[⬅️ Volver al README principal](../README.md)
