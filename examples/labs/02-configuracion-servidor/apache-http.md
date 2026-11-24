[⬅️ Volver al README principal](../README.md)

---

# Configuración del Servidor Web Apache HTTP (Puerto 80)

Este documento describe cómo configurar Apache para servir contenido HTTP en el servidor Debian (192.168.0.36).

## Paso 1: Instalar Apache

```bash
apt update
apt install -y apache2
```

## Paso 2: Verificar que Apache está ejecutándose

```bash
systemctl status apache2
systemctl enable apache2
```

## Paso 3: Crear una página web sencilla para el laboratorio

Cree un archivo `index.html` con información que el atacante pueda encontrar:

```bash
nano /var/www/html/index.html
```

Contenido sugerido:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servidor Debian - Laboratorio de Seguridad</title>
</head>
<body>
    <h1>Bienvenido al Servidor Debian</h1>
    <p>Este es un servidor de prueba para el laboratorio de seguridad informática.</p>
    <p>IP del servidor: 192.168.0.36</p>
    <p>Servicios activos: HTTP (80), SSH (22), HTTPS (443), WireGuard (51820/udp)</p>
    <hr>
    <footer>
        <p>Laboratorio Educativo - No usar en producción</p>
    </footer>
</body>
</html>
```

## Paso 4: Crear páginas adicionales para escaneo web (nikto, dirb)

```bash
# Página de administrador simulada
cat > /var/www/html/admin.html << 'EOF'
<!DOCTYPE html>
<html>
<head><title>Panel de Administración</title></head>
<body>
    <h1>Panel de Administración</h1>
    <p>Área restringida - Acceso solo para administradores autorizados</p>
    <p>Usuario: admin</p>
</body>
</html>
EOF

# Página de configuración simulada
cat > /var/www/html/config.php.bak << 'EOF'
<?php
// Archivo de configuración de respaldo - NO EXPONER EN PRODUCCIÓN
$db_host = "localhost";
$db_user = "admin";
$db_pass = "Admin123!";
$db_name = "produccion";
?>
EOF

# Página de phpinfo simulada (para mostrar información del servidor)
cat > /var/www/html/info.php << 'EOF'
<?php phpinfo(); ?>
EOF

# Establecer permisos
chown www-data:www-data /var/www/html/*.html /var/www/html/*.php*
chmod 644 /var/www/html/*.html /var/www/html/*.php*
```

## Paso 5: Configurar Apache para permitir listado de directorios (opcional, intencionalmente inseguro)

```bash
# Editar la configuración del sitio predeterminado
nano /etc/apache2/sites-available/000-default.conf

# Agregar dentro del bloque <VirtualHost *:80>:
<Directory /var/www/html>
    Options +Indexes
    AllowOverride None
    Require all granted
</Directory>

# Habilitar el módulo de listado de directorios (autoindex)
a2enmod autoindex

# Reiniciar Apache
systemctl restart apache2
```

## Paso 6: Verificar el servidor web

Desde el PC host o cualquier máquina en la red:

```bash
# Usando curl
curl http://192.168.0.36/

# Usando navegador web, abra:
# http://192.168.0.36/
# http://192.168.0.36/admin.html
# http://192.168.0.36/info.php
```

## Paso 7: Verificar que el puerto 80 está abierto

```bash
# Desde el servidor
ss -tlnp | grep :80

# Desde otra máquina
nc -zv 192.168.0.36 80
```

## Resumen de configuración HTTP

| Elemento | Valor |
|----------|-------|
| Servicio | Apache HTTP Server |
| Puerto | 80/tcp |
| Document root | /var/www/html |
| Página principal | /var/www/html/index.html |
| Páginas expuestas | admin.html, info.php, config.php.bak |
| Listado de directorios | Habilitado (intencionalmente inseguro) |

El servidor HTTP está listo para ser escaneado por el atacante usando herramientas como nikto, dirb o nmap con scripts HTTP.

---

[⬅️ Volver al README principal](../README.md)
