## TCPDUMP

Herramienta de línea de comandos utilizada para capturar y analizar el tráfico de red en sistemas Unix/Linux. Permite visualizar los paquetes que pasan por una interfaz de red específica, lo que resulta útil para la resolución de problemas y el análisis de seguridad.

### Comandos

La mayoría de las distribuciones de Linux incluyen esta herramienta en sus repositorios, pero se puede instalar usando el gestor de paquetes correspondiente. Generalmente requiere permisos de superusuario para capturar paquetes y por lo tanto, debe ejecutarse con `sudo`.

| Parametro | Descripcion |
|-|-|
| __-i__ | Selecciona la interfaz de red a utilizar |
| __-w__ | Guardar salida en un archivo |
| __-r__ | Leer desde un archivo |
| __-c__ | Captura una cantidad especifica de paquetes |
| __-A__ | Mostrar contenido en formato ASCII |
| __-n__ | No resolver nombres de host |
| __-s__ | Especifica el tamaño en bytes del paquete |

### Ejemplos

* __Capa de Red__
   * __tcpdump -i `enp0s3`__ : Captura todo el tráfico en la interfaz.
   * __tcpdump -i `enp0s3` net `192.168.1.0/24`__ : Captura el tráfico de una red completa.
* __Capa de Transporte__
   * __tcpdump -i `enp0s3` proto UDP__ : Captura todos los paquetes UDP
   * __tcpdump -i `enp0s3` port `22`__ : Captura tráfico solo en el puerto SSH
   * __tcpdump -i `enp0s3` portrange `8000-9000`__ : Captura tráfico en un rango de puertos.
* __Capa de Aplicación__
   * __tcpdump -i `enp0s3` -A host `192.168.1.1`__ : Captura el tráfico de la IP y muestra el contenido ASCII de los paquetes
   * __tcpdump -i `enp0s3` -w `capture.pcap`__ : Guarda la captura de tráfico en un archivo `capture.pcap`
   * __tcpdump -i `enp0s3` -c `100` -n port `80`__ : Captura 100 paquetes en el puerto HTTP sin resolver nombres de host
   * __tcpdump -i `enp0s3` -s `0` -A 'tcp port 80'__ : Captura todos los paquetes TCP del puerto 80, mostrando el contenido completo.