[⬅️ Volver al README principal](../README.md)

---

# Instalación y Configuración Base del Servidor Debian

Este documento describe la instalación base del servidor Debian que será el objetivo del laboratorio.

## Paso 1: Instalación de Debian

1. Inicie la VM `Servidor-Debian-Lab` con el ISO de Debian
2. Seleccione **Install** (modo texto, más rápido)
3. Idioma: Spanish
4. Ubicación: su país
5. Configuración del teclado: Spanish
6. Nombre de host: `servidor-debian`
7. Nombre de dominio: `local` (o dejar en blanco)
8. Contraseña de root: `root123` ← **CONTRASEÑA DÉBIL INTENCIONAL**
9. Crea usuario normal:
   - Nombre completo: Usuario Laboratorio
   - Nombre de usuario: `c215714n`
   - Contraseña: `c215714n123` ← **CONTRASEÑA DÉBIL INTENCIONAL**
10. Particionamiento: Usar todo el disco (opción recomendada para laboratorio)
11. Escaneo de otro disco o CD: No
12. Gestor de paquetes: Use un espejo de red (debian.org)
13. Configuración de popularidad de paquetes: No participar
14. Selección de software: Solo **Utilidades estándar del sistema** (desmarque entorno de escritorio)
15. Instalar GRUB en el disco principal: Sí
16. Finalice la instalación y reinicie

## Paso 2: Configuración inicial tras la instalación

Inicie sesión como root y ejecute los siguientes comandos:

### Actualizar el sistema

```bash
apt update && apt upgrade -y
```

### Instalar herramientas básicas

```bash
apt install -y sudo vim nano curl wget net-tools iproute2 openssh-server apache2 openssl wireguard
```

### Verificar la dirección IP

```bash
ip addr show
```

Debe mostrar `192.168.0.36` en la interfaz de red (eth0 o ensXX).

### Verificar conectividad

```bash
ping -c 4 192.168.0.2    # Cliente
ping -c 4 192.168.0.13   # Kali Linux
ping -c 4 8.8.8.8        # Internet (opcional)
```

## Paso 3: Verificar cuentas de usuario

Compruebe que existen las cuentas configuradas:

```bash
# Ver usuarios del sistema
cat /etc/passwd | grep -E "root|c215714n"

# Ver grupos
id root
id c215714n

# Verificar que c215714n tiene sudo (opcional, para escalada de privilegios)
usermod -aG sudo c215714n
```

## Paso 4: Preparar archivos sensibles para el laboratorio

Crearemos archivos que el atacante deberá encontrar tras escalar privilegios:

```bash
# Crear directorio de archivos sensibles
mkdir -p /opt/sensibles

# Crear archivo con contraseñas y claves
cat > /opt/sensibles/contrasenas.txt << 'EOF'
# Archivo de credenciales sensibles - SOLO PARA EL LABORATORIO
admin:Admin123!
db_root:DbPass2024!
backup:Backup456#
vpn_secret:WireGuard2026!
EOF

# Crear archivo de configuración de base de datos
cat > /opt/sensibles/db.config << 'EOF'
[database]
host=localhost
port=5432
user=admin
password=Admin123!
dbname=produccion
EOF

# Crear archivo SSH privado simulado (sin uso real, solo para demostración)
cat > /opt/sensibles/id_rsa_simulado << 'EOF'
-----BEGIN OPENSSH PRIVATE KEY-----
simulado_clave_privada_para_laboratorio_no_usar_en_produccion
-----END OPENSSH PRIVATE KEY-----
EOF

# Establecer permisos restrictivos (root solo)
chown root:root /opt/sensibles/*
chmod 600 /opt/sensibles/*
chmod 700 /opt/sensibles
```

## Paso 5: Verificar servicios instalados

```bash
# Verificar SSH
systemctl status ssh

# Verificar Apache
systemctl status apache2

# Verificar WireGuard
wg show
```

## Resumen de configuración base

| Elemento | Valor |
|----------|-------|
| Hostname | servidor-debian |
| IP | 192.168.0.36 |
| Usuario root | root / root123 |
| Usuario normal | c215714n / c215714n123 |
| Grupo sudo | c215714n pertenece a sudo |
| Archivos sensibles | /opt/sensibles/ (pertenecen a root) |

El servidor está listo para configurar los servicios vulnerables en el siguiente paso.

---

[⬅️ Volver al README principal](../README.md)
