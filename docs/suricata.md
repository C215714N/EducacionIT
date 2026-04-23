# Suricata

Herramienta de detección de intrusiones (IDS), prevención de intrusiones (IPS) y monitoreo de red (NSM) que es capaz de inspeccionar el tráfico de red en tiempo real. Un __IPS__ no solo detecta ataques, sino que también bloquea el tráfico malicioso.

## Implementacion

Suricata tiene un archivo de configuración principal que se encuentra en `/etc/suricata/suricata.yaml`. Este archivo controla cómo Suricata analiza el tráfico de red.

1. __Instalacion__: Suricata está disponible en los repositorios de Ubuntu. Para instalarlo, usa el siguiente comando:
   ```sh
   sudo apt install suricata
   suricata -v               # Devuelve la version instalada
   ```
1. __Identificacion__: Antes de abrir el archivo de configuracion, debemos reconocer la interfaz de red a utilizar.
   ```sh
   ip a                                  # Muestra las interfaces
   sudo nano /etc/suricata/suricata.yaml # Archivo de configuracion
   ```
1. __Configuracion__: Busca la sección `af-packet` y edítala reemplazando `eth0` por tu interfaz de red:
   ```yaml
   af-packet:
     - interface: eth0
       threads: auto
       cluster-id: 99
       cluster-type: cluster_flow
       defrag: yes
       mmap: yes
   ```
1. __Inicializacion__: Para iniciar Suricata y empezar a monitorear la red, usa el siguiente comando:
   ```sh
   sudo systemctl start suricata  # Habilita el servicio
   sudo systemctl enable suricata # Configura el inicio automatico
   ```
1. __Verificacion__: Suricata genera logs que puedes revisar para verificar la actividad. Los logs se encuentran en:
   ```sh
   sudo nano /etc/suricata/suricata.yaml       # Abre el archivo de registro
   sudo tail -f /var/log/suricata/suricata.log # Muestra las ultimas lineas
   ```

## Configuración Avanzada (Reglas y Filtrado)

Suricata utiliza reglas para identificar tráfico malicioso o anómalo. Estas reglas se almacenan en el directorio `/etc/suricata/rules/`.

1. __Descarga__: Se puede obtener un conjunto de reglas de Suricata desde [Suricata-IDS GitHub](https://github.com/OISF/suricata) o usar un conjunto de reglas populares como las de Emerging Threats.
   ```sh
   sudo suricata-update
   ```
1. __Activacion__: Después de actualizar las reglas, Suricata las cargará automáticamente al reiniciar. Para hacer esto manualmente, puedes usar:
   ```sh
   sudo suricata -r /var/log/suricata/eve.json
   ```
1. __Verificacion__: Al utilizar herramientas como nmap en el servidor deberan generarse alertas de los escaneos de puertos en el archivo log.
   ```sh
   sudo tail -f /var/log/suricata/fast.log
   ```

## Contramedidas

* __Bloqueo de tráfico malicioso__: Configura adecuadamente las reglas de IPS para bloquear tráfico en tiempo real.
* __Alertas y notificaciones__: Configura alertas para que los administradores reciban notificaciones cuando se detecten y bloqueen ataques.
* __Actualización de reglas__: Las amenazas cambian constantemente, así que asegúrate de actualizar regularmente las reglas de Suricata para detectar nuevas vulnerabilidades.

[volver](../readme.md)