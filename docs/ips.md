### **Configuración y Uso de IDS (Intrusion Detection System) e IPS (Intrusion Prevention System)**

Los sistemas **IDS** (Intrusion Detection System) e **IPS** (Intrusion Prevention System) son esenciales para proteger redes y sistemas contra accesos no autorizados, intentos de explotación, y otros ataques maliciosos. Aunque ambos comparten el objetivo de mejorar la seguridad, su funcionamiento es diferente:

- **IDS**: Se encarga de detectar actividades sospechosas en la red, pero no toma acción por sí mismo. Solo genera alertas.
- **IPS**: No solo detecta, sino que también previene activamente los ataques al bloquear el tráfico malicioso o alertar a los administradores para que tomen medidas.

### **1. Configuración y Uso de IDS (Intrusion Detection System)**

El IDS se utiliza para identificar ataques o actividades sospechosas basándose en firmas conocidas, comportamientos anómalos, o tráfico malicioso. A continuación, te mostraré cómo configurar y usar un IDS comúnmente utilizado como **Snort**.

#### **Instalación de Snort (IDS) en Linux**

1. **Instalar Snort**:
   Primero, necesitas instalar **Snort** en tu máquina. Aquí te dejo los pasos básicos para instalarlo en una distribución basada en **Debian** (como Ubuntu):

   ```bash
   sudo apt update
   sudo apt install snort
   ```

2. **Configurar la interfaz de red para Snort**:
   Debes indicar qué interfaz de red Snort debería monitorear. Normalmente, Snort se configura para monitorear el tráfico en una interfaz de red que esté en "modo promiscuo" (lo que significa que puede capturar todo el tráfico, no solo el destinado a su máquina).

   Para configurar la interfaz, edita el archivo `/etc/snort/snort.conf` y localiza la línea donde se establece la interfaz:

   ```bash
   # Interfaz de red a monitorear
   ipvar HOME_NET 192.168.1.0/24
   var EXTERNAL_NET any
   ```

   Aquí, `HOME_NET` es la red que deseas proteger y `EXTERNAL_NET` es cualquier tráfico que provenga de fuera de tu red.

3. **Configurar las reglas de Snort**:
   Snort usa un conjunto de reglas para detectar ataques. Estas reglas pueden ser de firmas (por ejemplo, para detectar un ataque conocido como SQL Injection) o basadas en comportamiento (anomalías en el tráfico).

   Las reglas de Snort se almacenan en el directorio `/etc/snort/rules/`. Puedes usar las reglas predeterminadas o descargar nuevas reglas desde fuentes como **Snort.org**.

   Por ejemplo, para iniciar Snort con reglas básicas:

   ```bash
   sudo snort -A console -i eth0 -c /etc/snort/snort.conf
   ```

   En este comando:
   - `-A console`: Muestra las alertas en la consola.
   - `-i eth0`: Interfaz de red a monitorear.
   - `-c /etc/snort/snort.conf`: Archivo de configuración de Snort.

4. **Ver Alertas de Snort**:
   Si Snort detecta tráfico malicioso, lo mostrará en la consola o lo registrará en archivos de log, que se pueden revisar en `/var/log/snort/`.

   Ejemplo de comando para revisar el archivo de logs de Snort:
   ```bash
   tail -f /var/log/snort/alert
   ```

#### **Contramedidas con IDS:**
- **Monitoreo continuo**: Configura notificaciones por correo electrónico o mediante herramientas de monitoreo para alertar sobre actividades sospechosas.
- **Revisión y actualización de reglas**: Actualiza las reglas de Snort periódicamente para detectar las amenazas más recientes.
- **Auditorías regulares**: Revisa los logs con regularidad para detectar patrones de ataques.

---

### **2. Configuración y Uso de IPS (Intrusion Prevention System)**

El **IPS** no solo detecta ataques, sino que también bloquea el tráfico malicioso. Un sistema IPS más conocido es **Suricata**, que puede actuar tanto como IDS como IPS. A continuación, se explica cómo instalar y configurar **Suricata**.

#### **Instalación de Suricata (IPS)**

1. **Instalar Suricata**:
   En una distribución basada en **Debian** o **Ubuntu**, puedes instalar **Suricata** mediante el siguiente comando:

   ```bash
   sudo apt update
   sudo apt install suricata
   ```

2. **Configurar la interfaz de red**:
   Al igual que con **Snort**, debes configurar la interfaz que Suricata debe monitorear. Edite el archivo de configuración de Suricata (`/etc/suricata/suricata.yaml`) y ajusta la interfaz de red:

   ```yaml
   # Configuración de la interfaz
   af-packet:
     - interface: eth0
       threads: 1
   ```

3. **Activar modo IPS**:
   Para habilitar el modo de prevención en tiempo real, necesitas configurar Suricata para que sea capaz de bloquear el tráfico malicioso.

   Esto implica configurar **iptables** para redirigir el tráfico a Suricata en modo IPS. Asegúrate de que **Suricata** esté ejecutándose en **modo IPS** y que esté configurado para bloquear el tráfico que considera malicioso.

   Puedes usar el siguiente comando para activar el modo IPS en Suricata:

   ```bash
   sudo suricata -c /etc/suricata/suricata.yaml -i eth0 --runmode=ips
   ```

   El comando `--runmode=ips` le indica a Suricata que debe bloquear el tráfico malicioso.

4. **Revisar las alertas**:
   Suricata genera alertas que puedes ver a través de sus archivos de log. Los archivos de alertas están en el directorio `/var/log/suricata/` y puedes revisar eventos utilizando:

   ```bash
   tail -f /var/log/suricata/suricata.log
   ```

5. **Configuración de Reglas de IPS**:
   Suricata utiliza reglas similares a las de Snort para detectar y bloquear ataques. Puedes descargar las reglas desde sitios como **Emerging Threats** o **Snort.org**. Las reglas se encuentran en el directorio `/etc/suricata/rules/`.

   Para configurar las reglas, edita el archivo `suricata.yaml` y asegúrate de que las reglas estén habilitadas. Luego, puedes cargar nuevas reglas ejecutando:

   ```bash
   sudo suricata-update
   ```

#### **Contramedidas con IPS:**
- **Bloqueo de tráfico malicioso**: Configura adecuadamente las reglas de IPS para bloquear tráfico en tiempo real.
- **Alertas y notificaciones**: Configura alertas para que los administradores reciban notificaciones cuando se detecten y bloqueen ataques.
- **Actualización continua de reglas**: Las amenazas cambian constantemente, así que asegúrate de actualizar regularmente las reglas de Suricata para detectar nuevas vulnerabilidades.

---

### **Diferencias Clave entre IDS y IPS**

| Característica                | IDS (Intrusion Detection System) | IPS (Intrusion Prevention System) |
|-------------------------------|----------------------------------|-----------------------------------|
| **Objetivo**                   | Detectar intrusiones y ataques   | Detectar y prevenir ataques      |
| **Acción**                      | Solo detecta y genera alertas   | Detecta y bloquea el tráfico malicioso |
| **Ubicación**                   | Normalmente en modo pasivo      | Puede ser implementado en modo activo (en la red de producción) |
| **Impacto en el tráfico**      | Ninguno (solo detecta)          | Puede bloquear el tráfico legítimo si está mal configurado |
| **Ejemplo de herramienta**     | **Snort**, **OSSEC**             | **Suricata**, **Snort (cuando se usa en modo IPS)** |

---

### **Resumen de Contramedidas Generales para IDS/IPS**

1. **Configuración adecuada**: Asegúrate de que los sistemas IDS/IPS estén bien configurados para que no generen demasiadas alertas falsas ni bloqueen tráfico legítimo.
2. **Monitoreo y auditoría**: Monitorea las alertas y logs de los sistemas IDS/IPS para detectar rápidamente problemas.
3. **Actualización de reglas**: Las reglas de detección deben actualizarse regularmente para garantizar que el sistema pueda detectar las amenazas más recientes.
4. **Capacitación y procedimientos**: Capacita a los administradores de la red sobre cómo manejar las alertas y las acciones a tomar en caso de detección de ataques.

La combinación de un IDS e IPS bien configurado en una red puede proporcionar una capa sólida de defensa contra intrusiones, ayudando a detectar y prevenir ataques antes de que puedan causar daño significativo.