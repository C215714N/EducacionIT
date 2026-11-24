[⬅️ Volver al README principal](../README.md)

---

# Configuración de Usuarios y Contraseñas Débiles (Intencional)

Esta sección describe cómo configurar las cuentas de usuario `root` y `c215714n` con contraseñas intencionalmente débiles para el laboratorio de seguridad.

## Advertencia

> Estas contraseñas son **débiles por diseño** con fines educativos únicamente. Nunca utilice contraseñas como estas en entornos de producción.

## Paso 1: Configurar contraseña de root

Inicie sesión como root en el servidor Debian y cambie la contraseña:

```bash
# Si está conectado como otro usuario, cambie a root
su -

# Cambiar la contraseña de root a una contraseña débil (para el laboratorio)
passwd root
```

Cuando se le solicite, ingrese:
- Nueva contraseña: `root123`
- Vuelva a escribir: `root123`

## Paso 2: Configurar contraseña del usuario c215714n

```bash
# Cambiar la contraseña del usuario c215714n
passwd c215714n
```

Cuando se le solicite, ingrese:
- Nueva contraseña: `c215714n123`
- Vuelva a escribir: `c215714n123`

## Paso 3: Verificar que las cuentas existen y sus contraseñas están configuradas

```bash
# Verificar que los usuarios existen en /etc/passwd
grep -E "^(root|c215714n):" /etc/passwd

# Verificar que las contraseñas están en /etc/shadow (requiere root)
grep -E "^(root|c215714n):" /etc/shadow

# Ver información de las cuentas
passwd -S root
passwd -S c215714n
```

## Paso 4: Permitir autenticación por contraseña en SSH

Para que el atacante pueda realizar fuerza bruta por SSH, asegúrese de que SSH acepte autenticación por contraseña:

```bash
# Editar la configuración de SSH
nano /etc/ssh/sshd_config

# Asegúrese de que estas líneas estén presentes y no comentadas:
PasswordAuthentication yes
PermitRootLogin yes
PubkeyAuthentication yes

# Reiniciar el servicio SSH
systemctl restart ssh
```

## Paso 5: Agregar c215714n al grupo sudo (para escalada de privilegios posterior)

```bash
usermod -aG sudo c215714n

# Verificar
id c215714n
```

## Paso 6: Crear archivos con contraseñas adicionales para simular entorno real

```bash
mkdir -p /home/c215714n/documentos

cat > /home/c215714n/documentos/notas.txt << 'EOF'
Notas personales:
- Contraseña del servidor web: webadmin2024
- Contraseña de la base de datos: dbpass123
- No compartir estas credenciales
EOF

chown c215714n:c215714n /home/c215714n/documentos/notas.txt
chmod 644 /home/c215714n/documentos/notas.txt
```

## Resumen de cuentas configuradas

| Usuario | Contraseña | Grupo | Notas |
|---------|-----------|-------|-------|
| root | root123 | root | Superusuario, SSH habilitado |
| c215714n | c215714n123 | sudo | Usuario normal con privilegios sudo |

## Prueba de acceso con contraseñas débiles

Desde el PC host o desde Kali, pruebe acceder por SSH:

```bash
# Como root (puerto 22222)
ssh -p 22222 root@192.168.0.36
# Contraseña: root123

# Como c215714n (puerto 22222)
ssh -p 22222 c215714n@192.168.0.36
# Contraseña: c215714n123
```

Estas cuentas y contraseñas débiles serán el objetivo de los ataques de fuerza bruta documentados en `03-ataques-kali/obtencion-credenciales.md`.

---

[⬅️ Volver al README principal](../README.md)
