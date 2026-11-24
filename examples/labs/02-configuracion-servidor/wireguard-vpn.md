[⬅️ Volver al README principal](../README.md)

---

# Configuración de VPN con WireGuard (Puerto 51820/udp)

Este documento describe cómo configurar un servidor VPN WireGuard en el servidor Debian.

## Paso 1: Instalar WireGuard

```bash
apt update
apt install -y wireguard
```

## Paso 2: Generar claves del servidor

```bash
# Crear directorio para WireGuard
mkdir -p /etc/wireguard
chmod 700 /etc/wireguard
cd /etc/wireguard

# Generar clave privada del servidor
wg genkey | tee server_private.key | wg pubkey > server_public.key

# Establecer permisos
chmod 600 server_private.key
chmod 644 server_public.key

# Ver las claves generadas
cat server_private.key
cat server_public.key
```

## Paso 3: Generar claves del cliente (Kali o PC host)

```bash
# Generar clave privada del cliente
wg genkey | tee client_private.key | wg pubkey > client_public.key

chmod 600 client_private.key
chmod 644 client_public.key

cat client_private.key
cat client_public.key
```

## Paso 4: Crear la configuración del servidor WireGuard

```bash
nano /etc/wireguard/wg0.conf
```

Contenido (reemplace las claves con las generadas anteriormente):

```ini
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PrivateKey = <CLAVE_PRIVADA_DEL_SERVIDOR>
SaveConfig = true

# Permitir reenvío de IP (para que el cliente acceda a la red interna)
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
# Cliente Kali
PublicKey = <CLAVE_PUBLICA_DEL_CLIENTE>
AllowedIPs = 10.0.0.2/32
```

## Paso 5: Habilitar reenvío de IP en el kernel

```bash
# Habilitar IP forwarding temporalmente
echo 1 > /proc/sys/net/ipv4/ip_forward

# Hacer permanente
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
```

## Paso 6: Iniciar WireGuard

```bash
# Iniciar la interfaz wg0
wg-quick up wg0

# O usando systemctl
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0

# Verificar estado
wg show
```

## Paso 7: Verificar que el puerto 51820/udp está abierto

```bash
ss -ulnp | grep 51820
```

## Paso 8: Configurar cliente WireGuard (en Kali o PC host)

En la máquina cliente (Kali):

```bash
# Instalar WireGuard
apt install -y wireguard

# Crear configuración del cliente
nano /etc/wireguard/wg0.conf
```

Contenido del cliente:

```ini
[Interface]
Address = 10.0.0.2/24
PrivateKey = <CLAVE_PRIVADA_DEL_CLIENTE>

[Peer]
PublicKey = <CLAVE_PUBLICA_DEL_SERVIDOR>
Endpoint = 192.168.0.36:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

Iniciar la conexión:
```bash
wg-quick up wg0
```

## Vulnerabilidades intencionales de WireGuard

| Elemento | Configuración | Riesgo |
|----------|--------------|--------|
| Puerto | 51820/udp estándar | Fácil de detectar con escaneo UDP |
| AllowedIPs | 0.0.0.0/0 en el cliente | Todo el tráfico pasa por la VPN |
| No hay autenticación pre-compartida (PSK) | Solo claves públicas | Menos capas de seguridad |
| IP forwarding habilitado | Sí | El cliente puede acceder a la red interna |

## Resumen de WireGuard

| Elemento | Valor |
|----------|-------|
| Servicio | WireGuard VPN |
| Puerto | 51820/udp |
| Interfaz | wg0 |
| Red VPN | 10.0.0.0/24 |
| IP servidor VPN | 10.0.0.1 |
| IP cliente VPN | 10.0.0.2 |

El servidor WireGuard está listo para ser escaneado y probado por el atacante.

---

[⬅️ Volver al README principal](../README.md)
