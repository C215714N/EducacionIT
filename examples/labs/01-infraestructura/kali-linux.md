[⬅️ Volver al README principal](../README.md)

---

# Instalación y Configuración de Kali Linux (Máquina Atacante)

Kali Linux será la máquina desde la cual se lanzarán los ataques de reconocimiento, obtención de credenciales y escalada de privilegios.

## Paso 1: Instalación de Kali Linux

1. Inicie la VM `Kali-Linux-Atacante` con el ISO de Kali Linux
2. Seleccione **Graphical Install** (instalación gráfica)
3. Idioma: Spanish
4. Ubicación: su país
5. Teclado: Spanish
6. Nombre de host: `kali-atacante`
7. Nombre de dominio: `local`
8. Contraseña de root: `toor` o cualquier contraseña segura (esta es la máquina del atacante, no objetivo)
9. Crea usuario normal: `kali` con su contraseña
10. Particionamiento: Usar todo el disco
11. Espejo de red: usar http.kali.org
12. Software: instalar herramientas por defecto de Kali
13. GRUB: instalar en el disco principal
14. Finalice y reinicie

## Paso 2: Configuración de red

Asigne la IP estática 192.168.0.13:

```bash
# Editar interfaces
sudo nano /etc/network/interfaces

# Agregar:
auto eth0
iface eth0 inet static
    address 192.168.0.13
    netmask 255.255.255.0
    gateway 192.168.0.1
    dns-nameservers 8.8.8.8

# Reiniciar red
sudo systemctl restart networking
```

O temporalmente:
```bash
sudo ip addr add 192.168.0.13/24 dev eth0
sudo ip link set eth0 up
sudo ip route add default via 192.168.0.1
```

## Paso 3: Actualizar herramientas de Kali

```bash
sudo apt update
sudo apt upgrade -y
```

## Paso 4: Instalar herramientas adicionales (si no vienen por defecto)

```bash
# Escaneo de puertos y red
sudo apt install -y nmap masscan zenmap

# Fuerza bruta y crackeo
sudo apt install -y hydra medusa john hashcat

# Análisis web
sudo apt install -y nikto dirb gobuster

# Análisis SSL/TLS
sudo apt install -y sslscan testssl.sh

# Captura de paquetes
sudo apt install -y wireshark tcpdump tshark

# Búsqueda de exploits
sudo apt install -y exploitdb

# Herramientas de escalada de privilegios
sudo apt install -y python3 python3-pip
pip3 install linpeas  # o descargar manualmente desde GitHub
```

## Paso 5: Verificar conectividad con el servidor

```bash
ping -c 4 192.168.0.36   # Servidor Debian
ping -c 4 192.168.0.2    # Cliente PC host
```

## Paso 6: Verificar herramientas instaladas

```bash
nmap --version
hydra --version
nikto -Version
sslscan --version
```

## Resumen de Kali Linux

| Elemento | Valor |
|----------|-------|
| Hostname | kali-atacante |
| IP | 192.168.0.13 |
| Usuario root | root / (contraseña elegida en instalación) |
| Usuario normal | kali / (contraseña elegida) |
| Red | Adaptador puente (Bridged) |

Kali Linux está listo para realizar los ataques documentados en la carpeta `03-ataques-kali/`.

---

[⬅️ Volver al README principal](../README.md)
