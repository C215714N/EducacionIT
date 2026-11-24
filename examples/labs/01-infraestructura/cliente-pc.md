[⬅️ Volver al README principal](../README.md)

---

# Configuración del Cliente (PC Host)

El cliente es la computadora física donde se ejecutan las máquinas virtuales. Utilizará la IP 192.168.0.2 y realizará comunicaciones legítimas con el servidor.

## Requisitos

- IP del PC host: 192.168.0.2 (configurada en el adaptador de red físico)
- VirtualBox instalado con las VMs creadas
- Navegador web para acceder al servidor HTTP
- Cliente de terminal (cmd, PowerShell, o terminal de Linux) para SSH y ping

## Paso 1: Verificar IP del PC host

### Windows

```cmd
ipconfig
```

Busque el adaptador de red activo y verifique que la IP sea `192.168.0.2`. Si no lo es, configure una IP estática:

1. Panel de Control > Redes e Internet > Centro de redes y recursos compartidos
2. Cambiar configuración del adaptador
3. Propiedades de su adaptador de red
4. Protocolo de Internet versión 4 (TCP/IPv4) > Propiedades
5. Usar la siguiente dirección IP:
   - IP: 192.168.0.2
   - Máscara de subred: 255.255.255.0
   - Puerta de enlace predeterminada: 192.168.0.1
   - Servidor DNS: 8.8.8.8

### Linux

```bash
ip addr show
# O
ifconfig
```

Para configurar IP estática temporalmente:
```bash
sudo ip addr add 192.168.0.2/24 dev eth0
sudo ip link set eth0 up
```

## Paso 2: Verificar conectividad con las VMs

Desde el PC host, abra una terminal y ejecute:

```bash
# Windows (cmd o PowerShell)
ping 192.168.0.36   # Servidor Debian
ping 192.168.0.13   # Kali Linux

# Linux
ping -c 4 192.168.0.36
ping -c 4 192.168.0.13
```

Si recibe respuestas, la conectividad puente funciona correctamente.

## Paso 3: Comunicaciones legítimas

### 3.1 Ping al servidor

```bash
# Windows
ping 192.168.0.36

# Linux
ping -c 4 192.168.0.36
```

**Resultado esperado:** Respuestas del servidor con tiempos de respuesta bajos (< 5ms en red local).

### 3.2 Conexión SSH con usuario y contraseña

Desde una terminal en el PC host:

```bash
# Con el usuario c215714n (contraseña débil: c215714n123, puerto 22222)
ssh -p 22222 c215714n@192.168.0.36

# Con el usuario root (contraseña débil: root123, puerto 22222)
ssh -p 22222 root@192.168.0.36
```

Al conectarse por primera vez, aparecerá una advertencia sobre la huella digital del host. Escriba `yes` para continuar. Luego ingrese la contraseña cuando se le solicite.

**Resultado esperado:** Acceso al shell del servidor como el usuario correspondiente.

Para salir de la sesión SSH:
```bash
exit
```

### 3.3 Acceso al servidor web por HTTP

Abra un navegador web (Chrome, Firefox, Edge) y acceda a:

```
http://192.168.0.36
```

**Resultado esperado:** Debería ver la página predeterminada de Apache ("It works!" o la página de bienvenida de Debian).

Si configuró SSL/TLS en el servidor, también puede probar:
```
https://192.168.0.36
```
(Nota: aparecerá advertencia de certificado autofirmado, lo cual es normal en este laboratorio)

## Paso 4: Verificación de servicios desde el cliente

Desde el PC host, puede verificar qué puertos están abiertos en el servidor:

```bash
# Windows (PowerShell)
Test-NetConnection 192.168.0.36 -Port 80
Test-NetConnection 192.168.0.36 -Port 22
Test-NetConnection 192.168.0.36 -Port 443

# Linux
nc -zv 192.168.0.36 80
nc -zv 192.168.0.36 22
nc -zv 192.168.0.36 443
```

## Resumen del Cliente

| Elemento | Valor |
|----------|-------|
| IP | 192.168.0.2 |
| Rol | Usuario legítimo que realiza ping, SSH y HTTP |
| Acciones | Ping, conexión SSH, acceso web HTTP |
| Herramientas | Terminal, navegador web, cliente SSH |

El cliente está listo para realizar las comunicaciones legítimas documentadas en `04-comunicaciones-cliente/`.

---

[⬅️ Volver al README principal](../README.md)
