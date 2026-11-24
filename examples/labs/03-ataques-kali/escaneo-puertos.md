[⬅️ Volver al README principal](../README.md)

---

# Escaneo de Puertos Abiertos desde Kali Linux

Este documento describe cómo identificar los puertos abiertos en el servidor Debian (192.168.0.36) desde la máquina atacante Kali Linux (192.168.0.13).

## Paso 1: Verificar conectividad con el servidor

```bash
ping -c 4 192.168.0.36
```

## Paso 2: Escaneo básico con nmap (detectar puertos abiertos)

```bash
# Escaneo rápido de los puertos más comunes
nmap -F 192.168.0.36

# Escaneo completo de todos los puertos TCP (1-65535)
nmap -p- 192.168.0.36

# Escaneo con detección de servicios y versiones
nmap -sV -sC 192.168.0.36

# Escaneo con detección de sistema operativo
nmap -O 192.168.0.36

# Escaneo completo con scripts, versiones y OS
nmap -sV -sC -O -p- 192.168.0.36
```

**Resultado esperado:** Puertos abiertos detectados:
- 22/tcp (SSH)
- 80/tcp (HTTP)
- 443/tcp (HTTPS/SSL)
- 51820/udp (WireGuard) - requiere escaneo UDP

## Paso 3: Escaneo específico de puertos conocidos

```bash
# Escanear puertos específicos de interés
nmap -p 22222,80,443,51820 192.168.0.36

# Escaneo UDP para WireGuard (más lento)
nmap -sU -p 51820 192.168.0.36
```

## Paso 4: Escaneo rápido con masscan

```bash
# Escaneo muy rápido de todos los puertos
masscan -p1-65535 192.168.0.36 --rate 1000

# Guardar resultados en archivo
masscan -p1-65535 192.168.0.36 --rate 1000 -oL resultados-masscan.txt
```

## Paso 5: Escaneo de servicios web (HTTP/HTTPS)

```bash
# Detectar tecnologías del servidor web
nmap --script http-headers,http-title -p 80 192.168.0.36

# Detectar vulnerabilidades HTTP comunes
nmap --script http-vuln* -p 80 192.168.0.36

# Escaneo SSL/TLS
nmap --script ssl-enum-ciphers,ssl-cert -p 443 192.168.0.36
```

## Paso 6: Escaneo de directorios y archivos expuestos

```bash
# Usar dirb para encontrar directorios ocultos
dirb http://192.168.0.36/

# Usar gobuster (más rápido)
gobuster dir -u http://192.168.0.36 -w /usr/share/wordlists/dirb/common.txt

# Buscar archivos comunes
gobuster dir -u http://192.168.0.36 -w /usr/share/wordlists/dirb/common.txt -x php,html,txt,backup,bak
```

**Resultado esperado:** Se encontrarán archivos como:
- /admin.html
- /info.php
- /config.php.bak

## Paso 7: Escaneo de vulnerabilidades SSL/TLS

```bash
sslscan 192.168.0.36

# O más detallado
testssl.sh 192.168.0.36
```

## Paso 8: Guardar resultados del escaneo

```bash
# Guardar escaneo nmap en formato normal
nmap -sV -sC -oN escaneo-nmap.txt 192.168.0.36

# Guardar en formato XML (para leer con otras herramientas)
nmap -sV -sC -oX escaneo-nmap.xml 192.168.0.36

# Guardar en formato grepeable
nmap -sV -sC -oG escaneo-nmap.gnmap 192.168.0.36
```

## Resumen de puertos esperados

| Puerto | Protocolo | Servicio | Descripción |
|--------|-----------|----------|-------------|
| 22222 | tcp | SSH | OpenSSH (contraseñas débiles, puerto no estándar) |
| 80 | tcp | HTTP | Apache Web Server |
| 443 | tcp | HTTPS | Apache + SSL/TLS (certificado autofirmado) |
| 51820 | udp | WireGuard | VPN |

## Comandos resumidos para el atacante

```bash
# Escaneo completo rápido
nmap -sV -sC -T4 192.168.0.36

# Escaneo UDP para WireGuard
nmap -sU -p 51820 192.168.0.36

# Escaneo web
nikto -h http://192.168.0.36
dirb http://192.168.0.36/

# Escaneo SSL
sslscan 192.168.0.36
```

---

[⬅️ Volver al README principal](../README.md)
