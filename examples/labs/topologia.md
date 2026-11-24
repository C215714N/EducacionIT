[⬅️ Volver al README principal](../README.md)

---

# Topología de Red - Laboratorio de Seguridad Informática

## Diagrama de Red

```
                    +---------------------+
                    |   Red Física / LAN  |
                    |   192.168.0.0/24    |
                    +---------------------+
                            |
      +---------------------+---------------------+
      |                     |                     |
+-----v-----+         +-----v-----+         +-----v-----+
|  CLIENTE  |         | SERVIDOR  |         |  ATACANTE |
|   PC Host |         |  Debian   |         |  Kali     |
| 192.168.0.2|        |192.168.0.36|        |192.168.0.13|
+-----+-----+         +-----+-----+         +-----+-----+
      |                     |                     |
      | Adaptador Puente    | Adaptador Puente    | Adaptador Puente
      | (Bridged)           | (Bridged)           | (Bridged)
      |                     |                     |
+-----v-----+         +-----v-----+         +-----v-----+
|VirtualBox |         |VirtualBox |         |VirtualBox |
|   VM      |         |   VM      |         |   VM      |
+-----------+         +-----------+         +-----------+
```

## Detalles de la Topología

### 1. Servidor Debian (192.168.0.36)

**Sistema operativo:** Debian 12 (bookworm) o superior

**Servicios ejecutándose:**
- **HTTP (Apache)** - Puerto 80/tcp
- **SSH (OpenSSH)** - Puerto 22222/tcp
- **SSL/TLS (Apache + OpenSSL)** - Puerto 443/tcp
- **VPN (WireGuard)** - Puerto 51820/udp

**Cuentas de usuario (intencionalmente inseguras):**
- `root` / contraseña débil
- `c215714n` / contraseña débil

**Propósito:** Simular un servidor de producción con configuraciones deficientes y credenciales débiles.

### 2. Atacante Kali Linux (192.168.0.13)

**Sistema operativo:** Kali Linux (última versión)

**Herramientas disponibles:**
- nmap, masscan - Escaneo de puertos
- hydra, medusa - Fuerza bruta SSH/HTTP
- john the ripper, hashcat - Craqueo de contraseñas
- nikto - Escaneo de vulnerabilidades web
- sslscan, testssl.sh - Análisis de SSL/TLS
- wireshark, tcpdump - Captura de tráfico
- searchsploit - Búsqueda de exploits
- linpeas, linux-exploit-suggester - Escalada de privilegios

**Propósito:** Identificar puertos abiertos, obtener credenciales, elevar privilegios y encontrar vulnerabilidades.

### 3. Cliente PC Host (192.168.0.2)

**Sistema operativo:** Windows o Linux (la máquina física donde corren las VM)

**Acciones legítimas:**
- Ping al servidor (192.168.0.36)
- Conexión SSH con usuario y contraseña
- Acceso al servidor web por HTTP (puerto 80)

**Propósito:** Simular tráfico legítimo de usuario para comparar con tráfico malicioso detectado por Suricata.

## Requisitos de Red

- Todas las VMs deben usar **adaptador puente (Bridged Adapter)** en VirtualBox
- Todas las VMs deben estar en el mismo segmento de red: 192.168.0.0/24
- El cliente debe poder hacer ping al servidor y al atacante
- El atacante debe poder alcanzar al servidor
- No debe haber firewall bloqueando entre las VMs durante la fase de ataque

## Verificación de Conectividad

Desde el cliente (192.168.0.2):
```bash
ping 192.168.0.36   # Servidor Debian
ping 192.168.0.13   # Kali Linux
```

Desde el atacante (192.168.0.13):
```bash
ping 192.168.0.36   # Servidor Debian
ping 192.168.0.2    # Cliente
```

Desde el servidor (192.168.0.36):
```bash
ping 192.168.0.2    # Cliente
ping 192.168.0.13   # Kali Linux
```

[volver](./README.md)