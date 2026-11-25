# SNORT

Los sistemas __IDS__ (Intrusion Detection System) e __IPS__ (Intrusion Prevention System) son esenciales para proteger redes y sistemas contra accesos no autorizados, intentos de explotación, y otros ataques maliciosos. Aunque ambos comparten el objetivo de mejorar la seguridad, su funcionamiento es diferente:

- __IDS__: Se encarga de detectar actividades sospechosas en la red, pero no toma acción por sí mismo. Solo genera alertas.
- __IPS__: No solo detecta, sino que también previene activamente los ataques al bloquear el tráfico malicioso o alertar a los administradores para que tomen medidas.

## Configuracion

Debemos indicar qué interfaz de red se debería monitorear. Normalmente, Snort se configura para monitorear el tráfico en una interfaz de red que esté en "modo promiscuo" (lo que significa que puede capturar todo el tráfico, no solo el destinado a su máquina).

* Para configurar la interfaz, edita el archivo `/etc/snort/snort.conf` y localizar la línea donde se establece la interfaz. En este ejemplo `HOME_NET` es la red que deseamos proteger y `EXTERNAL_NET` es cualquier tráfico que provenga de fuera de la misma.
   ```sh
   # Interfaz de red a monitorear
   ipvar HOME_NET 192.168.1.0/24
   var EXTERNAL_NET any
   ```   
* Las reglas de Snort se almacenan en el directorio `/etc/snort/rules/`. Puedes usar las reglas predeterminadas o descargar nuevas reglas desde fuentes como __Snort.org__.
   ```sh
   sudo snort -A console -i eth0 -c /etc/snort/snort.conf 
   ```
   * `-A console`: Muestra las alertas en la consola.
   * `-i eth0`: Interfaz de red a monitorear.
   * `-c /etc/snort/snort.conf`: Archivo de configuración de Snort.
* Si se detecta tráfico malicioso, este se mostrará en la consola o sera registrado en archivos de log, que se pueden revisar en `/var/log/snort/`.
   ```sh
   tail -f /var/log/snort/alert
   ```

## Contramedidas

* __Monitoreo continuo__: Configura notificaciones por correo electrónico o mediante herramientas de monitoreo para alertar sobre actividades sospechosas.
* __Revisión de reglas__: Actualiza las reglas de Snort periódicamente para detectar las amenazas más recientes.
* __Auditorías regulares__: Revisa los logs con regularidad para detectar patrones de ataques.

## Diferencias 

| Característica | IDS (Intrusion Detection System) | IPS (Intrusion Prevention System) |
|-|-|-|
| __Objetivo__ | Detectar intrusiones y ataques | Detectar y prevenir ataques |
| __Acción__ | Solo detecta y genera alertas | Detecta y bloquea el tráfico malicioso |
| __Ubicación__ | Normalmente en modo pasivo | Puede ser implementado en modo activo (en la red de producción) |
| __Impacto__ | Ninguno (solo detecta trafico) | Puede bloquear el tráfico legítimo si está mal configurado |

[volver](../readme.md)