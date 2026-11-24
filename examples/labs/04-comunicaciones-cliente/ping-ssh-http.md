[⬅️ Volver al README principal](../README.md)

---

# Comunicaciones Legítimas desde el Cliente (PC Host - 192.168.0.2)

Este documento describe las comunicaciones legítimas que el cliente (PC host con IP 192.168.0.2) realizará con el servidor Debian (192.168.0.36): ping, conexión SSH con usuario y contraseña, y acceso al servidor web por HTTP.

## Paso 1: Verificar configuración de red del cliente

Desde el PC host, verifique que tenga la IP 192.168.0.2:

### Windows
```cmd
ipconfig
```

### Linux
```bash
ip addr show
```

## Paso 2: Ping al servidor

El ping verifica conectividad básica entre el cliente y el servidor.

### Windows (cmd o PowerShell)
```cmd
ping 192.168.0.36
```

### Linux
```bash
ping -c 4 192.168.0.36
```

**Resultado esperado:** Respuestas del servidor con tiempos de respuesta bajos (tipicamente < 5ms en red local). Ejemplo:

```
PING 192.168.0.36 (192.168.0.36) 56(84) bytes of data.
64 bytes from 192.168.0.36: icmp_seq=1 ttl=64 time=1.23 ms
64 bytes from 192.168.0.36: icmp_seq=2 ttl=64 time=0.98 ms
64 bytes from 192.168.0.36: icmp_seq=3 ttl=64 time=1.15 ms
64 bytes from 192.168.0.36: icmp_seq=4 ttl=64 time=1.05 ms

--- 192.168.0.36 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 0.98/1.10/1.23/0.09 ms
```

## Paso 3: Conexión SSH con usuario y contraseña

### Conexión como usuario c215714n

Desde una terminal en el PC host:

```bash
ssh -p 22222 c215714n@192.168.0.36
```

Cuando se le pregunte:
```
The authenticity of host '192.168.0.36 (192.168.0.36)' can't be established.
RSA key fingerprint is SHA256:xxxxx.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
c215714n@192.168.0.36's password: c215714n123
```

**Resultado esperado:** Acceso al shell del servidor como usuario c215714n.

### Conexión como usuario root

```bash
ssh -p 22222 root@192.168.0.36
# Contraseña: root123
```

**Resultado esperado:** Acceso al shell del servidor como root.

### Comandos para ejecutar una vez conectado

```bash
# Ver información del sistema
uname -a
hostname
ip addr show

# Verificar usuarios
cat /etc/passwd

# Ver procesos ejecutándose
ps aux

# Salir de la sesión SSH
exit
```

## Paso 4: Acceso al servidor web por HTTP

Abra un navegador web (Chrome, Firefox, Edge, etc.) en el PC host y acceda a:

```
http://192.168.0.36
```

**Resultado esperado:** Se mostrará la página de bienvenida de Apache o la página personalizada creada en el laboratorio.

### Otras páginas accesibles

| URL | Descripción |
|-----|-------------|
| http://192.168.0.36/ | Página principal |
| http://192.168.0.36/admin.html | Panel de administración simulado |
| http://192.168.0.36/info.php | Información de PHP (phpinfo) |
| http://192.168.0.36/config.php.bak | Archivo de configuración expuesto |

### Acceso con curl desde la terminal

```bash
# Ver cabeceras HTTP
curl -I http://192.168.0.36

# Descargar contenido de la página
curl http://192.168.0.36/

# Descargar archivo de configuración expuesto
curl http://192.168.0.36/config.php.bak
```

## Paso 5: Acceso HTTPS (opcional, si SSL está configurado)

Si configuró SSL/TLS en el servidor:

```
https://192.168.0.36
```

**Nota:** Aparecerá una advertencia de certificado no confiable porque es autofirmado. Haga clic en "Avanzado" y luego "Continuar al sitio" para acceder.

Desde la terminal:
```bash
curl -k https://192.168.0.36
```

## Paso 6: Verificar conectividad completa entre todos los equipos

Desde el PC host (192.168.0.2):

```bash
# Ping al servidor
ping -c 4 192.168.0.36

# Ping al atacante (Kali)
ping -c 4 192.168.0.13
```

## Resumen de comunicaciones legítimas

| Comunicación | Origen | Destino | Puerto | Protocolo | Propósito |
|--------------|--------|---------|--------|-----------|-----------|
| Ping | 192.168.0.2 | 192.168.0.36 | - | ICMP | Verificar conectividad |
| SSH | 192.168.0.2 | 192.168.0.36 | 22222/tcp | TCP | Acceso remoto seguro |
| HTTP | 192.168.0.2 | 192.168.0.36 | 80/tcp | TCP | Acceso al servidor web |
| HTTPS | 192.168.0.2 | 192.168.0.36 | 443/tcp | TCP | Acceso seguro al servidor web |

## Comandos resumidos para el cliente

```bash
# 1. Ping
ping -c 4 192.168.0.36

# 2. SSH como c215714n (puerto 22222)
ssh -p 22222 c215714n@192.168.0.36
# Contraseña: c215714n123

# 3. SSH como root (puerto 22222)
ssh -p 22222 root@192.168.0.36
# Contraseña: root123

# 4. Acceso web HTTP
# Abrir navegador: http://192.168.0.36
# O desde terminal:
curl http://192.168.0.36/
```

Estas comunicaciones legítimas servirán como referencia para comparar con el tráfico malicioso detectado por Suricata en la sección de prevención.

---

[⬅️ Volver al README principal](../README.md)
