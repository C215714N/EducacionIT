[⬅️ Volver al README principal](../README.md)

---

# Configuración del Servidor SSH (Puerto 22222)

Este documento describe cómo configurar OpenSSH con opciones intencionalmente inseguras para permitir ataques de fuerza bruta y obtención de credenciales.

## Paso 1: Instalar OpenSSH Server

```bash
apt update
apt install -y openssh-server
```

## Paso 2: Configurar SSH con opciones intencionalmente débiles

Edite el archivo de configuración de SSH:

```bash
nano /etc/ssh/sshd_config
```

Asegúrese de que las siguientes líneas estén configuradas así (elimine el `#` si están comentadas):

```ssh
# Puerto SSH (cambiado de 22 a 22222 por seguridad)
Port 22222

# Permitir autenticación por contraseña (necesario para fuerza bruta)
PasswordAuthentication yes

# Permitir inicio de sesión como root (riesgo de seguridad)
PermitRootLogin yes

# Autenticación basada en claves públicas (opcional, dejar habilitada)
PubkeyAuthentication yes

# No usar autenticación de dos factores (para simplificar el laboratorio)
ChallengeResponseAuthentication no

# Tiempo de gracia para autenticación
LoginGraceTime 120

# Máximo de intentos de autenticación
MaxAuthTries 10

# Máximo de sesiones
MaxSessions 10

# Permitir reenvío de agente y X11 (puede ser explotado)
AllowAgentForwarding yes
AllowTcpForwarding yes
X11Forwarding yes

# Banner opcional
Banner none
```

## Paso 3: Reiniciar el servicio SSH

```bash
systemctl restart ssh
systemctl enable ssh
```

## Paso 4: Verificar que SSH está ejecutándose

```bash
systemctl status ssh
ss -tlnp | grep :22
```

## Paso 5: Probar conexión SSH

Desde el PC host o Kali:

```bash
# Conectar como root (puerto 22222)
ssh -p 22222 root@192.168.0.36
# Contraseña: root123

# Conectar como c215714n (puerto 22222)
ssh -p 22222 c215714n@192.168.0.36
# Contraseña: c215714n123
```

## Vulnerabilidades intencionales configuradas

| Configuración | Valor | Riesgo |
|-------------|-------|--------|
| Puerto | 22222 (cambiado del estándar 22) | Menos visible para escaneos básicos |
| PasswordAuthentication | yes | Permite fuerza bruta con hydra/medusa |
| PermitRootLogin | yes | Permite acceso directo como root |
| MaxAuthTries | 10 | Permite muchos intentos antes de bloquear |
| LoginGraceTime | 120 | Tiempo suficiente para múltiples intentos |

Estas configuraciones permitirán al atacante (Kali) realizar ataques de fuerza bruta contra SSH usando herramientas como hydra o medusa, tal como se documenta en `03-ataques-kali/obtencion-credenciales.md`.

---

[⬅️ Volver al README principal](../README.md)
