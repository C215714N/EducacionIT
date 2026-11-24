[⬅️ Volver al README principal](../README.md)

---

# Configuración de VirtualBox - Adaptador Puente (Bridged Adapter)

Para que este laboratorio funcione correctamente, todas las máquinas virtuales deben usar un adaptador de red puente para compartir la misma red física que el cliente (PC host).

## Requisitos Previos

- VirtualBox instalado en el PC host
- Imagen ISO de Debian 12 (netinst o DVD)
- Imagen ISO de Kali Linux
- PC host con IP 192.168.0.2 en la red física

## Paso 1: Crear la máquina virtual del Servidor Debian

1. Abra VirtualBox y haga clic en **Nueva**
2. Nombre: `Servidor-Debian-Lab`
3. Carpeta: seleccione una ubicación para los archivos de la VM
4. Imagen ISO: seleccione el ISO de Debian 12
5. Tipo: Linux / Versión: Debian (64-bit)
6. Memoria RAM: 1024 MB (mínimo) o 2048 MB (recomendado)
7. Procesadores: 1 o 2 CPUs
8. Disco duro virtual: 20 GB, dinámicamente asignado

## Paso 2: Configurar red del Servidor Debian

1. Seleccione la VM `Servidor-Debian-Lab`
2. Haga clic en **Configuración** > **Red**
3. En la pestaña **Adaptador 1**:
   - Marque **Habilitar adaptador de red**
   - Conectado a: **Adaptador de puente (Bridged Adapter)**
   - Nombre: seleccione su adaptador de red físico (Ej: Ethernet, Wi-Fi)
   - Tipo de adaptador: Intel PRO/1000 MT Desktop (o paravirtualizado)
4. Haga clic en **Aceptar**

## Paso 3: Crear la máquina virtual de Kali Linux

1. Abra VirtualBox y haga clic en **Nueva**
2. Nombre: `Kali-Linux-Atacante`
3. Imagen ISO: seleccione el ISO de Kali Linux
4. Tipo: Linux / Versión: Debian (64-bit)
5. Memoria RAM: 2048 MB (mínimo) o 4096 MB (recomendado)
6. Procesadores: 2 CPUs
7. Disco duro virtual: 25 GB, dinámicamente asignado

## Paso 4: Configurar red de Kali Linux

1. Seleccione la VM `Kali-Linux-Atacante`
2. Haga clic en **Configuración** > **Red**
3. En la pestaña **Adaptador 1**:
   - Marque **Habilitar adaptador de red**
   - Conectado a: **Adaptador de puente (Bridged Adapter)**
   - Nombre: seleccione el mismo adaptador de red físico que el servidor
4. Haga clic en **Aceptar**

## Paso 5: Asignar IPs estáticas

Como las VMs usan adaptador puente, obtienen IP del servidor DHCP de la red. Para este laboratorio, asignaremos IPs estáticas manualmente:

### Servidor Debian (192.168.0.36)

Edite `/etc/network/interfaces` o use NetworkManager:

```bash
# /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 192.168.0.36
    netmask 255.255.255.0
    gateway 192.168.0.1
    dns-nameservers 8.8.8.8 1.1.1.1
```

Luego reinicie la red:
```bash
sudo systemctl restart networking
```

### Kali Linux (192.168.0.13)

```bash
# Usando ip命令 temporalmente
sudo ip addr add 192.168.0.13/24 dev eth0
sudo ip link set eth0 up
sudo ip route add default via 192.168.0.1

# O de forma permanente en /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 192.168.0.13
    netmask 255.255.255.0
    gateway 192.168.0.1
```

## Paso 6: Verificar conectividad

Desde cada VM y el PC host, verifique que puede hacer ping a los demás:

```bash
# Desde el PC host (Windows)
ping 192.168.0.36   # Servidor Debian
ping 192.168.0.13   # Kali Linux

# Desde el Servidor Debian
ping 192.168.0.2    # Cliente PC host
ping 192.168.0.13   # Kali Linux

# Desde Kali Linux
ping 192.168.0.36   # Servidor Debian
ping 192.168.0.2    # Cliente PC host
```

## Paso 7: Instalación base de Debian en el servidor

Durante la instalación de Debian:
- Seleccione **Instalar** (no instalación gráfica si desea ahorrar recursos)
- Configure el nombre de host: `servidor-debian`
- Dominio: puede dejarse en blanco o usar `local`
- Contraseña de root: `root123` (intencionalmente débil para el laboratorio)
- Crea usuario `c215714n` con contraseña `c215714n123` (intencionalmente débil)
- Seleccione solo utilidades estándar del sistema (no entorno de escritorio para ahorrar recursos)
- Instale el gestor de arranque GRUB en el disco principal

## Notas Importantes

- **Adaptador puente:** Permite que las VMs tengan IPs en la misma red física que el PC host
- Si el adaptador puente no funciona, pruebe con diferentes adaptadores de red en la configuración de VirtualBox
- Asegúrese de que el firewall del PC host no bloquee el tráfico entre las VMs
- Para laboratorio, se recomienda deshabilitar temporalmente firewalls del host para evitar bloqueos accidentales

---

[⬅️ Volver al README principal](../README.md)
