## Network Mapper (nmap)

Es una herramienta de código abierto utilizada para la exploración y auditoría de redes. Se usa comúnmente para identificar qué dispositivos están activos en una red, qué servicios ofrecen, y qué sistemas operativos están en uso. También ayuda a descubrir vulnerabilidades en los servicios detectados.

### Implementacion

* **Descubrimiento de Red**: Identificar dispositivos activos en una red.
* **Detección de Servicios**: Determinar qué servicios están funcionando en los dispositivos.
* **Identificación**: Obtener información del sistema operativo y versión de los dispositivos en la red.
* **Escaneo de Puertos**: Identificar los puertos abiertos para ver qué servicios están disponibles.
* **Vulnerabilidades**: A través de scripts y análisis permite identificar posibles vulnerabilidades en los servicios y configuraciones de red.

### Comandos

Nmap es una herramienta potente y flexible, por lo que hay muchos más parámetros y opciones disponibles. La documentación oficial de Nmap y el comando `man nmap` en sistemas Unix/Linux pueden proporcionar información más detallada sobre todas las capacidades y opciones.

| Parámetro | Descripción |
|-|-|
| __-f__ | Fragmenta los paquetes con el fin de evadir sistemas |
| __-g__ | Establece el puerto de origen |
| __-p__ | Especifica los puertos a escanear |
| __-v__ | Muestra salida detallada _(verbose)_ |
| __-A__ | Escaneo agresivo (servicios, versiones, os y traceroute) |
| __-D__ | Utiliza direcciones IP falsas para evadir deteccion |
| __-O__ | Identifica el sistema operativo del host |
| __-T__ | Ajusta el ritmo del escaneo en un rango de 0-5 |
| __-oN__ | Genera un archivo formato normal |
| __-oX__ | Genera un archivo formato XML |
| __-oG__ | Genera un archivo formato grepable |
| __-oA__ | Guarda el resultado en los tres formatos |
| __-Pn__ | Desactiva el ping para hosts que no responden pings |
| __-sn__/__-sP__ | Escaneo de Ping, identifica qué hosts están activos |
| __-sS__ | Envía paquetes SYN para determinar puertos abiertos |
| __-sT__ | Escaneo de Puerto TCP completando la conexion |
| __-sU__ | Escaneo de Puertos UDP abiertos |

### Ejemplos

* [Capa de Red](./osi.md)
   * __nmap `192.168.1.1`__: Escanea una IP específica para puertos abiertos
   * __nmap `192.168.1.0`/`24`__: Escanea una red completa
* [Capa de Transporte](./osi.md)
   * __nmap -sU `192.168.1.1`__: Escanea los puertos UDP
   * __nmap -p `22,80,443` `192.168.1.1`__: Escanea puertos específicos
   * __nmap -p `1-1000` `192.168.1.1`__: Escanea un rango de puertos
* [Capa de Aplicacion](./osi.md)
   * __nmap -A `192.168.1.1`__: Detección de sistema operativo y versiones de servicios
   * __nmap `192.168.1.1` -oN `results.txt`__: Guardar el resultado en un archivo
   * __nmap --script vuln `192.168.1.1`__: Busca vulnerabilidades conocidas en servicios de aplicación.
   * __nmap --script http-enum__ `192.168.1.1`: Lista directorios y archivos de un servidor HTTP.


[volver](../readme.md)