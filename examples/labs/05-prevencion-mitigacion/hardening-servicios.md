[⬅️ Volver al README principal](../README.md)

---

# Hardening de Servicios - Endurecimiento del Servidor Debian

Este documento describe cómo endurecer (hardening) los servicios del servidor Debian para prevenir los ataques realizados en el laboratorio.

## Paso 1: Hardening de Usuarios y Contraseñas

### Cambiar contraseñas débiles por contraseñas seguras

```bash
# Cambiar contraseña de root a una segura
passwd root
# Ingrese una contraseña larga y compleja, por ejemplo: R@nd0mP@ssw0rd!2026

# Cambiar contraseña de c215714n
passwd c215714n
# Ingrese una contraseña segura
```

### Configurar política de contraseñas

```bash
# Instalar libpam-pwquality para exigir contraseñas seguras
apt install -y libpam-pwquality

# Editar configuración de PAM para contraseñas
nano /etc/pam.d/common-password

# Agregar o modificar la línea de pwquality:
password requisite pam_pwquality.so retry=3 minlen=12 dcredit=-1 ucredit=-1 lcredit=-1 ocredit=-1
```

### Configurar expiración de contraseñas

```bash
# Editar configuración de login.defs
nano /etc/login.defs

# Asegúrese de que tenga:
PASS_MAX_DAYS   90     # Contraseña expira en 90 días
PASS_MIN_DAYS   1      # Mínimo 1 día entre cambios
PASS_WARN_AGE   7      # Advertir 7 días antes de expiración
```

### Deshabilitar acceso directo de root por SSH

```bash
nano /etc/ssh/sshd_config

# Cambiar:
PermitRootLogin no

# Reiniciar SSH
systemctl restart ssh
```

## Paso 2: Hardening de SSH (OpenSSH)

Edite `/etc/ssh/sshd_config` con las siguientes configuraciones seguras:

```ssh
# Puerto SSH configurado en el laboratorio
Port 22222

# Solo protocolo SSH 2
Protocol 2

# No permitir root directamente
PermitRootLogin no

# Solo autenticación por clave pública (deshabilitar contraseñas)
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no

# Limitar intentos de autenticación
MaxAuthTries 3
MaxSessions 5

# Tiempo de gracia reducido
LoginGraceTime 30

# Deshabilitar reenvío no necesario
AllowAgentForwarding no
AllowTcpForwarding no
X11Forwarding no

# Usar PAM
UsePAM yes

# Solo usuarios específicos pueden conectarse por SSH
AllowUsers c215714n

# Banner de advertencia
Banner /etc/ssh/banner.txt
```

Crear banner de advertencia:
```bash
cat > /etc/ssh/banner.txt << 'EOF'
===============================================================
AVISO DE SEGURIDAD - Este sistema es monitoreo y privado
El acceso no autorizado está prohibido y será procesado.
===============================================================
EOF
```

### Configurar autenticación por claves SSH (en lugar de contraseñas)

```bash
# En el cliente (PC host o Kali), generar par de claves
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

# Copiar la clave pública al servidor
ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 22222 c215714n@192.168.0.36

# Probar conexión con clave (sin contraseña)
ssh -p 22222 c215714n@192.168.0.36
```

## Paso 3: Hardening de Apache HTTP

### Ocultar versión del servidor

```bash
nano /etc/apache2/conf-available/security.conf

# Asegúrese de que tenga:
ServerTokens Prod
ServerSignature Off

# Habilitar el módulo de seguridad
a2enmod security2  # si mod_security está instalado
```

### Deshabilitar listado de directorios

```bash
nano /etc/apache2/sites-available/000-default.conf

# Dentro de <Directory /var/www/html>, cambiar:
Options -Indexes
AllowOverride None
Require all granted

# Deshabilitar autoindex
a2dismod autoindex

# Reiniciar Apache
systemctl restart apache2
```

### Remover archivos de configuración expuestos

```bash
# Remover archivos sensibles del directorio web
rm -f /var/www/html/config.php.bak
rm -f /var/www/html/info.php
rm -f /var/www/html/admin.html

# O moverlos fuera del directorio web
mv /var/www/html/config.php.bak /root/config.php.bak
mv /var/www/html/info.php /root/info.php
mv /var/www/html/admin.html /root/admin.html
```

### Configurar cabeceras de seguridad

```bash
nano /etc/apache2/conf-available/security.conf

# Agregar:
Header always set X-Content-Type-Options "nosniff"
Header always set X-Frame-Options "DENY"
Header always set X-XSS-Protection "1; mode=block"
Header always set Referrer-Policy "strict-origin-when-cross-origin"

# Habilitar módulo headers
a2enmod headers
systemctl restart apache2
```

## Paso 4: Hardening de SSL/TLS

### Configurar protocolos y cifradores seguros

```bash
nano /etc/apache2/sites-available/default-ssl.conf

# Agregar dentro del VirtualHost:
SSLProtocol all -SSLv3 -TLSv1 -TLSv1.1
SSLCipherSuite HIGH:!aNULL:!MD5:!3DES
SSLHonorCipherOrder on

# Generar certificado con clave más fuerte (4096 bits)
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/apache2/ssl/server.key \
    -out /etc/apache2/ssl/server.crt \
    -subj "/C=AR/ST=Estado/L=Ciudad/O=Laboratorio/CN=192.168.0.36"

# Reiniciar Apache
systemctl restart apache2
```

### Usar certificado de una CA de confianza (producción)

En producción, use un certificado de Let's Encrypt o una CA comercial en lugar de uno autofirmado.

```bash
# Instalar certbot para Let's Encrypt
apt install -y certbot python3-certbot-apache

# Obtener certificado gratuito
certbot --apache -d su-dominio.com
```

## Paso 5: Hardening de WireGuard VPN

### Configurar reglas de firewall estrictas para WireGuard

```bash
# Solo permitir WireGuard desde IPs confiables
iptables -A INPUT -p udp -s 192.168.0.2 --dport 51820 -j ACCEPT
iptables -A INPUT -p udp --dport 51820 -j DROP
```

### Usar Pre-Shared Key (PSK) para autenticación adicional

```bash
# Generar PSK
wg genpsk > /etc/wireguard/server.psk
chmod 600 /etc/wireguard/server.psk

# Agregar al archivo wg0.conf en la sección [Peer]:
PresharedKey = <CONTENIDO_DEL_PSK>
```

### Limitar AllowedIPs en el cliente

En lugar de `0.0.0.0/0`, use solo las redes necesarias:
```ini
AllowedIPs = 10.0.0.0/24, 192.168.0.0/24
```

## Paso 6: Hardening del Sistema (Kernel y SSH)

### Deshabilitar servicios innecesarios

```bash
# Ver servicios ejecutándose
systemctl list-units --type=service --state=running

# Detener y deshabilitar servicios no necesarios
systemctl stop <servicio>
systemctl disable <servicio>
```

### Configurar sysctl para seguridad de red

```bash
nano /etc/sysctl.conf

# Agregar:
# Protección contra IP spoofing
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# No aceptar source routed packets
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# Ignorar solicitudes ICMP redirect
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0

# No actuar como router
net.ipv4.ip_forward = 0  # Cambiar a 1 solo si se necesita routing

# Protección contra SYN flood
net.ipv4.tcp_syncookies = 1

# Limitar mensajes de error ICMP
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Aplicar cambios
sysctl -p
```

### Instalar y configurar fail2ban (protección contra fuerza bruta)

```bash
apt install -y fail2ban

# Copiar configuración por defecto
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Editar jail.local
nano /etc/fail2ban/jail.local

# Configurar jail para SSH:
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
findtime = 600

# Reiniciar fail2ban
systemctl restart fail2ban

# Ver estado
fail2ban-client status
fail2ban-client status sshd
```

## Paso 7: Archivos sensibles - Mover y proteger

```bash
# Mover archivos sensibles fuera de rutas accesibles
mkdir -p /root/archivos-sensibles
mv /opt/sensibles/* /root/archivos-sensibles/
rmdir /opt/sensibles

# Establecer permisos restrictivos
chmod 600 /root/archivos-sensibles/*
chmod 700 /root/archivos-sensibles

# Verificar que no hay archivos sensibles en el directorio web
ls -la /var/www/html/
```

## Paso 8: Auditoría y monitoreo

```bash
# Instalar herramientas de auditoría
apt install -y auditd lynis

# Ejecutar auditoría con Lynis
lynis audit system

# Ver resultados en /var/log/lynis.log

# Configurar auditd para monitorear archivos sensibles
auditctl -w /etc/passwd -p wa -k passwd_changes
auditctl -w /etc/shadow -p wa -k shadow_changes
auditctl -w /root/archivos-sensibles -p r -k sensitive_files
```

## Resumen de Medidas de Hardening

| Servicio | Vulnerabilidad Original | Medida de Hardening |
|----------|------------------------|---------------------|
| Usuarios | Contraseñas débiles (root123, c215714n123) | Contraseñas seguras, política PAM, expiración |
| SSH | Puerto 22222, PermitRootLogin no, claves SSH, fail2ban | Puerto no estándar, claves SSH, fail2ban |
| Apache HTTP | Listado de directorios, archivos expuestos | -Indexes, remover archivos .bak, cabeceras seguridad |
| SSL/TLS | Certificado autofirmado, protocolos débiles | TLS 1.2+, cifradores fuertes, certificado CA |
| WireGuard | Puerto estándar, 0.0.0.0/0 AllowedIPs | IP restrictiva, PSK, AllowedIPs limitado |
| Sistema | Sin firewall, sin detección | iptables + Suricata + fail2ban + sysctl |

## Flujo de trabajo para verificar prevención

1. Aplicar todas las medidas de hardening
2. Reiniciar servicios o el servidor
3. Desde Kali, intentar los mismos ataques:
   ```bash
   nmap 192.168.0.36          # Debería mostrar menos puertos
   hydra -l root -P pass.txt 192.168.0.36 ssh  # Debería fallar (fail2ban + claves SSH)
   nikto -h http://192.168.0.36  # Debería detectar menos vulnerabilidades
   ```
4. Verificar que Suricata genere alertas para intentos de ataque
5. Verificar que iptables bloquee tráfico no autorizado

Con estas medidas implementadas, el servidor estará protegido contra los ataques demostrados en el laboratorio.

---

[⬅️ Volver al README principal](../README.md)
