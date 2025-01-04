## Wireshark 

Es una herramienta de análisis de protocolos de red que permite capturar y examinar el tráfico de datos en una red en tiempo real. Es ampliamente utilizada por administradores de redes, ingenieros de seguridad y profesionales de TI para diagnosticar problemas de red, realizar análisis de rendimiento y detectar vulnerabilidades de seguridad.

### Implementacion

* __Análisis de Tráfico de Red__: Examina el contenido de los paquetes de red para entender el tráfico de datos, protocolos utilizados y posibles problemas.
* __Resolución de Problemas de Red__: Diagnostica y soluciona problemas de conectividad, rendimiento y errores de red.
* __Seguridad de la Red__: Identifica actividades sospechosas, intentos de intrusión y vulnerabilidades potenciales.
* __Monitoreo de Red__: Supervisa el tráfico de red en tiempo real para detectar problemas o cambios inesperados.
* __Aprendizaje de Protocolos__: Ayuda a entender el funcionamiento interno de los diferentes protocolos de red mediante la visualización de datos a nivel de paquete.

### Tabla de Parámetros y Funciones Comunes

Wireshark ofrece diversas funciones y opciones que se pueden ajustar desde su interfaz. A continuación se muestran algunas de las funciones y opciones clave:

| Función | Descripción |
|-|-|
| __Captura de Paquetes__ | Captura el tráfico de red en tiempo real desde una interfaz de red seleccionada.    |
| __Filtros de Captura__ | Especifica qué paquetes deben ser capturados según criterios definidos como `ip.addr==192.168.1.1` |
| __Filtros de Visualización__ | Filtra los paquetes ya capturados para mostrar solo aquellos que cumplen ciertos criterios como `tcp.port==80`   |
| __Análisis de Protocolos__ | Desglosa y muestra los detalles de los protocolos de comunicación en cada paquete.   |
| __Seguimiento de Flujo__ | Permite seguir el flujo de una conversación TCP específica para ver la secuencia de datos. |
| __Exportar Datos__ | Guarda los datos capturados en varios formatos, como `.pcap`, `.csv` o `.xml`    |
| __Estadísticas de Red__ | Proporciona informes y estadísticas sobre el tráfico de red, como análisis de ancho de banda y protocolos utilizados.   |

## TShark

TShark es la versión de línea de comandos de Wireshark, una herramienta de análisis de red. Permite capturar, filtrar y analizar tráfico, tambien permite filtrados avanzados para inspeccionar tráfico específico o depurar problemas de red.

*  __tshark -D__ Listar interfaces disponibles
*  __tshark -i `eth0` -w `captura.pcap`__ Capturar tráfico en una interfaz y guardar en un archivo
*  __tshark -i `eth0` -f "`tcp port 80`"__ Filtrar tráfico HTTP en tiempo real
*  __tshark -r `captura.pcap` -Y "`ip.dst == 192.168.1.1`"__ Analizar capturas almacenadas

[volver](../readme.md)