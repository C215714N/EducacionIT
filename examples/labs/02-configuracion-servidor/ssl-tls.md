[⬅️ Volver al README principal](../README.md)

---

# Configuración de Servicios SSL/TLS (Puerto 443)

Este documento describe cómo configurar SSL/TLS en Apache para el servidor web, usando un certificado autofirmado (intencionalmente inseguro para el laboratorio).

## Paso 1: Habilitar el módulo SSL de Apache

```bash
a2enmod ssl
a2ensite default-ssl
systemctl restart apache2
```

## Paso 2: Generar un certificado autofirmado (intencionalmente inseguro)

```bash
# Crear directorio para certificados
mkdir -p /etc/apache2/ssl

# Generar clave privada y certificado autofirmado válido por 365 días
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/apache2/ssl/server.key \
    -out /etc/apache2/ssl/server.crt \
    -subj "/C=AR/ST=Estado/L=Ciudad/O=Laboratorio/CN=192.168.0.36"

# Establecer permisos restrictivos en la clave privada
chmod 600 /etc/apache2/ssl/server.key
chmod 644 /etc/apache2/ssl/server.crt
```

## Paso 3: Configurar el sitio SSL de Apache

Edite la configuración del sitio SSL:

```bash
nano /etc/apache2/sites-available/default-ssl.conf
```

Asegúrese de que apunte a los certificados generados:

```apache
<IfModule mod_ssl.c>
<VirtualHost _default_:443>
    ServerAdmin webmaster@localhost
    ServerName 192.168.0.36

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/server.crt
    SSLCertificateKeyFile /etc/apache2/ssl/server.key

    <Directory /var/www/html>
        Options +Indexes
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
</IfModule>
```

## Paso 4: Reiniciar Apache y verificar SSL

```bash
systemctl restart apache2
systemctl status apache2

# Verificar que el puerto 443 está escuchando
ss -tlnp | grep :443
```

## Paso 5: Probar acceso HTTPS

Desde el PC host o Kali, abra un navegador y acceda a:

```
https://192.168.0.36
```

**Nota:** Aparecerá una advertencia de "Conexión no privada" o "Certificado no confiable" porque el certificado es autofirmado. Esto es esperado en el laboratorio.

Desde la línea de comandos:
```bash
curl -k https://192.168.0.36
```

## Vulnerabilidades intencionales de SSL/TLS

| Elemento | Configuración | Riesgo |
|----------|--------------|--------|
| Certificado | Autofirmado | No es confiable, susceptible a MITM |
| Clave RSA | 2048 bits | Aceptable, pero podría mejorarse |
| Protocolo | Depende de OpenSSL instalado | Puede soportar versiones antiguas (SSLv3, TLS 1.0) si no se restringe |
| Alertas del navegador | Advertencia mostrada | Los usuarios pueden ignorarla y aceptar el certificado |

## Paso 6: Escaneo de SSL con herramientas (para el atacante)

Desde Kali, el atacante puede usar:

```bash
sslscan 192.168.0.36
testssl.sh 192.168.0.36
nmap --script ssl-enum-ciphers -p 443 192.168.0.36
```

Estas herramientas revelarán información sobre los cifradores soportados, la versión del certificado y posibles debilidades en la configuración SSL/TLS.

---

[⬅️ Volver al README principal](../README.md)
