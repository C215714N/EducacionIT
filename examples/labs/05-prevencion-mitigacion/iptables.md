[⬅️ Volver al README principal](../README.md)

---

# Prevención con iptables - Firewall del Servidor Debian

Este documento describe cómo configurar iptables en el servidor Debian (192.168.0.36) para bloquear ataques y permitir solo tráfico legítimo.

## Paso 1: Verificar si iptables está instalado

```bash
which iptables
iptables --version
```

Si no está instalado:
```bash
apt update && apt install -y iptables
```

## Paso 2: Ver reglas actuales de iptables

```bash
# Ver reglas actuales
iptables -L -n -v

# Ver reglas de NAT
iptables -t nat -L -n -v

# Ver reglas de mangle
iptables -t mangle -L -n -v
```

## Paso 3: Limpiar reglas existentes (cuidado en producción)

```bash
# Borrar todas las reglas
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Establecer políticas por defecto (permitir todo temporalmente)
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
```

## Paso 4: Configurar reglas básicas de seguridad

```bash
# === POLÍTICAS POR DEFECTO ===
# Denegar todo el tráfico entrante por defecto
iptables -P INPUT DROP
# Permitir todo el tráfico saliente
iptables -P OUTPUT ACCEPT
# Denegar tráfico forwarding por defecto
iptables -P FORWARD DROP

# === REGLAS DE LOOPBACK ===
# Permitir tráfico en la interfaz loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# === REGLAS DE TRÁFICO ESTABLECIDO ===
# Permitir tráfico relacionado con conexiones ya establecidas
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# === REGLAS ANTI-ESCANEO Y ANTI-DOS ===
# Bloquear paquetes inválidos
iptables -A INPUT -m state --state INVALID -j DROP

# Bloquear paquetes SYN flood (protección básica contra DoS)
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Limitar paquetes ICMP (ping) para evitar flooding
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s --limit-burst 4 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# === REGLAS PARA SERVICIOS LEGÍTIMOS ===

# SSH - Solo desde el cliente (192.168.0.2) y redes internas (puerto 22222)
iptables -A INPUT -p tcp -s 192.168.0.2 --dport 22222 -j ACCEPT

# HTTP - Permitir desde cualquier red interna (para acceso web)
iptables -A INPUT -p tcp -s 192.168.0.0/24 --dport 80 -j ACCEPT

# HTTPS - Permitir desde red interna
iptables -A INPUT -p tcp -s 192.168.0.0/24 --dport 443 -j ACCEPT

# WireGuard VPN - Solo desde el cliente
iptables -A INPUT -p udp -s 192.168.0.2 --dport 51820 -j ACCEPT

# === REGLAS DE LOGGING ===
# Registrar paquetes denegados (útil para detectar ataques)
iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "IPTBLES_DENIED: " --log-level 4

# === REGLAS DE RECHAZO FINAL ===
# Rechazar todo lo demás que no coincidió con reglas anteriores
iptables -A INPUT -j DROP
```

## Paso 5: Guardar las reglas de iptables

```bash
# Instalar paquete para guardar reglas (Debian)
apt install -y iptables-persistent

# Guardar reglas actuales
netfilter-persistent save
# O
iptables-save > /etc/iptables/rules.v4

# Las reglas se cargarán automáticamente al iniciar el sistema
```

## Paso 6: Verificar que las reglas están activas

```bash
iptables -L -n -v
```

## Paso 7: Probar las reglas desde el cliente y Kali

### Desde el cliente (192.168.0.2) - DEBE FUNCIONAR
```bash
ping -c 4 192.168.0.36          # ICMP limitado
ssh -p 22222 c215714n@192.168.0.36        # SSH puerto 22222
curl http://192.168.0.36         # HTTP puerto 80
```

### Desde Kali (192.168.0.13) - DEBE ESTAR BLOQUEADO (excepto lo permitido)
```bash
# Estas deberían fallar o estar restringidas:
nmap 192.168.0.36                # Escaneo limitado por reglas
ssh -p 22222 root@192.168.0.36            # SSH bloqueado (no es 192.168.0.2)
hydra -l root -P pass.txt 192.168.0.36 ssh  # Fuerza bruta bloqueada
```

## Paso 8: Reglas avanzadas de iptables (opcional)

### Rate limiting para SSH (evitar fuerza bruta)

```bash
# Limitar conexiones nuevas a SSH: máximo 3 por minuto
iptables -A INPUT -p tcp --dport 22222 -m state --state NEW -m limit --limit 3/min --limit-burst 5 -j ACCEPT
iptables -A INPUT -p tcp --dport 22222 -j DROP
```

### Bloquear IPs específicas (si se identifica un atacante)

```bash
# Bloquear una IP específica
iptables -A INPUT -s 192.168.0.13 -j DROP

# Bloquear un rango de IPs
iptables -A INPUT -s 192.168.0.13/32 -j DROP
```

### Protección contra escaneo de puertos (port scan detection)

```bash
# Detectar y bloquear escaneos de puertos recientes
iptables -A INPUT -m recent --name portscan --rcheck --seconds 60 --hitcount 10 -j DROP
iptables -A INPUT -m recent --name portscan --set -j ACCEPT
```

## Resumen de reglas iptables

| Regla | Origen | Puerto | Protocolo | Acción |
|-------|--------|--------|-----------|--------|
| Loopback | localhost | - | - | ACCEPT |
| Establecido/relacionado | cualquier | - | - | ACCEPT |
| ICMP ping limitado | cualquier | - | ICMP | ACCEPT (1/s) |
| SSH | 192.168.0.2 | 22222 | tcp | ACCEPT |
| HTTP | 192.168.0.0/24 | 80 | tcp | ACCEPT |
| HTTPS | 192.168.0.0/24 | 443 | tcp | ACCEPT |
| WireGuard | 192.168.0.2 | 51820 | udp | ACCEPT |
| Todo lo demás | cualquier | - | - | DROP |

## Archivos de configuración persistente

- `/etc/iptables/rules.v4` - Reglas IPv4 guardadas
- `/etc/iptables/rules.v6` - Reglas IPv6 (opcional)

Con iptables configurado correctamente, los ataques desde Kali (192.168.0.13) estarán restringidos, permitiendo solo tráfico desde el cliente legítimo (192.168.0.2).

---

[⬅️ Volver al README principal](../README.md)
