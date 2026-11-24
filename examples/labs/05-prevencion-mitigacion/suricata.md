[⬅️ Volver al README principal](../README.md)

---

# Prevención y Detección con Suricata (IDS/IPS)

Este documento describe cómo instalar y configurar Suricata en el servidor Debian (192.168.0.36) para detectar y prevenir ataques desde Kali Linux.

## Paso 1: Instalar Suricata

```bash
apt update
apt install -y suricata
```

## Paso 2: Configurar Suricata

Edite el archivo de configuración principal:

```bash
nano /etc/suricata/suricata.yaml
```

### Configuraciones clave a modificar:

```yaml
# Interfaz de red para monitoreo
af-packet:
  - interface: eth0  # Cambie por su interfaz de red real
    cluster-id: 99
    cluster-type: cluster_flow
    defrag: yes

# Habilitar IPS mode (para bloquear, no solo detectar)
# En modo IPS, Suricata puede descartar paquetes maliciosos

# Variables de red
vars:
  address-groups:
    HOME_NET: "[192.168.0.0/24]"  # Red local a proteger
    EXTERNAL_NET: "any"            # Cualquier red externa

# Regla por defecto: alert para detectar, drop para bloquear (IPS)
default-rule-path: /var/lib/suricata/rules
rule-files:
  - suricata-rules.rules  # Archivo de reglas personalizado

# Archivos de registro
default-log-dir: /var/log/suricata/
```

## Paso 3: Crear reglas personalizadas de Suricata

Cree un archivo de reglas para detectar los ataques del laboratorio:

```bash
nano /var/lib/suricata/rules/suricata-rules.rules
```

Reglas sugeridas para este laboratorio:

```suricata
# ============================================================
# Reglas de Suricata para Laboratorio de Seguridad
# Servidor: 192.168.0.36 | Cliente: 192.168.0.2 | Atacante: 192.168.0.13
# ============================================================

# 1. Detectar escaneo de puertos con nmap (syn scan)
alert tcp any any -> 192.168.0.36 22222 (msg:"POSIBLE ESCANEO DE PUERTOS SSH - Nmap SYN scan"; flags:S; threshold:type limit, track by_src, count 5, seconds 10; sid:1000001; rev:1;)

# 2. Detectar fuerza bruta SSH (múltiple intentos fallidos)
alert tcp any any -> 192.168.0.36 22222 (msg:"POSIBLE FUERZA BRUTA SSH - Múltiples conexiones"; flags:S; threshold:type both, track by_src, count 10, seconds 60; sid:1000002; rev:1;)

# 3. Detectar escaneo HTTP (nikto, dirb, gobuster)
alert http any any -> 192.168.0.36 80 (msg:"POSIBLE ESCANEO WEB - User-Agent de herramientas de ataque"; http.user_agent; content:"nikto"; nocache; sid:1000003; rev:1;)
alert http any any -> 192.168.0.36 80 (msg:"POSIBLE ESCANEO WEB - User-Agent de dirb/gobuster"; http.user_agent; content:"gobuster"; nocache; sid:1000004; rev:1;)

# 4. Detectar acceso a archivos sensibles en el servidor web
alert http any any -> 192.168.0.36 80 (msg:"ACCESO A ARCHIVO CONFIGURACIÓN EXPUESTO - config.php.bak"; http.uri; content:"/config.php.bak"; nocache; sid:1000005; rev:1;)
alert http any any -> 192.168.0.36 80 (msg:"ACCESO A PANEL ADMIN - admin.html"; http.uri; content:"/admin.html"; nocache; sid:1000006; rev:1;)
alert http any any -> 192.168.0.36 80 (msg:"ACCESO A INFO.PHP - Posible exposición de información"; http.uri; content:"/info.php"; nocache; sid:1000007; rev:1;)

# 5. Detectar escaneo SSL/TLS
alert tcp any any -> 192.168.0.36 443 (msg:"POSIBLE ESCANEO SSL/TLS - sslscan/testssl"; flow:to_server,established; content:"|16 03|"; depth:2; threshold:type limit, track by_src, count 20, seconds 30; sid:1000008; rev:1;)

# 6. Detectar escaneo UDP de WireGuard
alert udp any any -> 192.168.0.36 51820 (msg:"ESCANEO UDP WIREGUARD - Puerto 51820"; sid:1000009; rev:1;)

# 7. Detectar tráfico desde el atacante conocido (192.168.0.13)
alert ip 192.168.0.13 any -> 192.168.0.36 any (msg:"TRÁFICO DESDE IP DE ATACANTE CONOCIDO - 192.168.0.13"; sid:1000010; rev:1;)

# 8. Detectar intentos de fuerza bruta HTTP
alert http any any -> 192.168.0.36 80 (msg:"POSIBLE FUERZA BRUTA HTTP - Múltiples peticiones"; http.request.method; content:"POST"; threshold:type both, track by_src, count 20, seconds 30; sid:1000011; rev:1;)

# 9. Detectar escaneo de puertos completo (nmap -p-)
alert tcp any any -> 192.168.0.36 !22,80,443 (msg:"CONEXIÓN A PUERTO NO ESTÁNDAR - Posible escaneo"; flags:S; sid:1000012; rev:1;)
```

## Paso 4: Actualizar reglas de la comunidad (Emerging Threats)

```bash
# Descargar reglas de Emerging Threats
suricata-update

# Listar fuentes de reglas disponibles
suricata-update list-sources

# Habilitar una fuente específica
suricata-update enable source/open

# Actualizar reglas
suricata-update
```

## Paso 5: Probar la configuración de Suricata

```bash
# Verificar que el archivo YAML es válido
suricata -T -c /etc/suricata/suricata.yaml -v

# Ejecutar Suricata en modo prueba (solo lectura)
suricata -c /etc/suricata/suricata.yaml -i eth0 --runmode=single
```

## Paso 6: Ejecutar Suricata en modo IDS (detección only)

```bash
# Ejecutar Suricata como demonio en modo IDS
systemctl enable suricata
systemctl start suricata

# Verificar estado
systemctl status suricata
```

## Paso 7: Ejecutar Suricata en modo IPS (detección y prevención/bloqueo)

Para modo IPS, se necesita configurar NFQUEUE con iptables:

```bash
# Configurar iptables para enviar paquetes a Suricata (NFQUEUE)
iptables -I INPUT -j NFQUEUE --queue-num 0
iptables -I FORWARD -j NFQUEUE --queue-num 0

# Ejecutar Suricata en modo IPS
suricata -c /etc/suricata/suricata.yaml -i eth0 --runmode=af-packet -q 0
```

## Paso 8: Ver registros y alertas de Suricata

```bash
# Ver el archivo de alertas principal
tail -f /var/log/suricata/fast.log

# Ver alertas en formato JSON (eve.json)
tail -f /var/log/suricata/eve.json

# Ver todos los archivos de registro
ls -la /var/log/suricata/

# Buscar alertas específicas
grep "ATACANTE" /var/log/suricata/fast.log
grep "FUERZA BRUTA" /var/log/suricata/fast.log
grep "ESCANEO" /var/log/suricata/fast.log
```

### Ejemplo de entrada en fast.log:

```
[**] [1:1000001:1] POSIBLE ESCANEO DE PUERTOS SSH - Nmap SYN scan [**]
[Classification: Attempted Information Leak] [Priority: 2]
11/24/2026-10:00:00.123456 192.168.0.13:54321 -> 192.168.0.36:22
TCP TTL:64 TOS:0x0 ID:12345 IpLen:20 DgmLen:44 DF
***S**** Seq: 0x12345678  Ack: 0x0  Win: 0x1234  TcpLen: 20
```

## Paso 9: Analizar alertas con eve-box o siem (opcional)

```bash
# Instalar eve-box para visualización web (opcional)
apt install -y eve-box

# O simplemente analizar el archivo JSON con jq
apt install -y jq
jq 'select(.alert.signature_id == 1000001)' /var/log/suricata/eve.json
```

## Paso 10: Probar Suricata con los ataques del laboratorio

Desde Kali (192.168.0.13), ejecute los ataques y observe las alertas en el servidor:

```bash
# En el servidor, monitorear alertas en tiempo real:
tail -f /var/log/suricata/fast.log

# En Kali, ejecutar ataque:
nmap -sS 192.168.0.36
hydra -l root -P contraseñas.txt -s 22222 -vV 192.168.0.36 ssh
nikto -h http://192.168.0.36
```

**Resultado esperado:** Suricata generará alertas en fast.log para cada ataque detectado.

## Resumen de Suricata

| Elemento | Valor |
|----------|-------|
| Servicio | Suricata IDS/IPS |
| Interfaz | eth0 (adaptador puente) |
| Red protegida | 192.168.0.0/24 |
| Archivo de reglas | /var/lib/suricata/rules/suricata-rules.rules |
| Log de alertas | /var/log/suricata/fast.log |
| Log JSON | /var/log/suricata/eve.json |
| Modo | IDS (detección) o IPS (detección + bloqueo) |

Suricata complementa a iptables: iptables filtra tráfico basado en puertos e IPs, mientras Suricata inspecciona el contenido del tráfico en busca de patrones de ataque.

---

[⬅️ Volver al README principal](../README.md)
