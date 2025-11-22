# Ethernet

El protocolo __Ethernet__ es un estándar de red que permite la comunicación de dispositivos en una misma red local (LAN). Especificado inicialmente en el estándar __IEEE 802.3__, Ethernet utiliza tramas para transmitir datos, y es uno de los protocolos de red más utilizados en la actualidad.

## Tramas Ethernet

Corresponden a unidades de datos que incluyen encabezados y tráilers. Cada trama contiene información esencial para el envío y recepción de datos, como la dirección MAC de origen y destino, y el tipo de protocolo de la capa superior.

| Campo | Descripción | Tamaño |
|--|--|--|
| __DEST MAC__ | Dirección MAC del dispositivo receptor | 6 bytes |
| __SRC MAC__ | Dirección MAC del dispositivo emisor | 6 bytes |
| __Tipo__ | Indica el protocolo de la capa superior (IPv4, IPv6, ARP, etc) | 2 bytes |
| __Datos__ | Información que se transmite (hasta 1500 bytes) | Variable |
| __CRC__ | Código de redundancia cíclica para la detección de errores | 4 bytes |

## Herramientas

Este protocolo es fundamental para la comunicación en redes locales, y su funcionamiento se apoya en protocolos como ARP para la resolución de direcciones. En sistemas basados en Debian o CentOS, se pueden usar herramientas como __ethtool__ para gestionar y diagnosticar interfaces de red.

| Parametro | Descripción | Ejemplo |
|-|-|-|
| __-m__ | Muestra la información del módulo (si esta disponible) | ethtool -m `enp0s3` |
| __-p__ | Activa la función de localización de la interfaz | ethtool -p `enp0s3` |
| __-s__ | Configura la velocidad y el modo dúplex | ethtool -s `enp0s3` speed `100` duplex `full` |
| __-t__ | Realiza pruebas en la interfaz | ethtool -t `enp0s3` |

## Configuración

Para gestionar las interfaces de red, se utilizan comandos como __ip__ y __ifconfig__. Estos permiten configurar direcciones IP, verificar el estado de las interfaces y manipular sus propiedades.

| Opcion | Descripción | Ejemplo
|-|-|-|
| __show__ | Configuración actual de las interfaces de red | ip addr show |
| __up__ | Enciende la interfaz | ip link _set_ `enp0s3` up |
| __down__ | Apaga la interfaz | ip link _set_ `enp0s3` |
| __add__ | Asigna una dirección IP a la interfaz | ip addr add `192.168.0.10/24` dev `enp0s3` |
| __route__ | Muestra la tabla de enrutamiento | ip route |

[volver](../readme.md)