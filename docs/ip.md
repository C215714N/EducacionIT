# IP (Internet Protocol)
El __IEEE (Institute of Electrical and Electronics Engineers)__ publicó un trabajo de investigación de _Robert Kahn y Vinton Cerf_ en 1974, que describía __un modelo de protocolo para la interconexión entre redes y paquetes__ tomando como _base ARPANET_. 

Posteriormente surgieron más redes de investigación basadas en la combinación de protocolos que pasó a denominarse __TCP/IP__ y en 1981 fue especificada como estándar en la __RFC 791__.

| Objeto | Abrev. | Descripcion|
|--|--|--|
| __link__ | l | Muestra los dispositivos de red |
| __address__ |	a |	Dirección IP de los dispositivos de red |
| __addrlabel__ | addrl	| Configuración de etiquetas para selección |
| __neighbor__ | n | Entradas de la memoria caché ARP o NDISC |
| __route__ | r | Entradas de la tabla de enrutamiento |
| __rule__ | ru | Muestra las directivas de enrutamiento |
| __maddress__ | m | Muestra las direcciones multicast |
| __mroute__ |	mr | Entradas en caché de enrutamiento multicast |
| __tunnel__ | t | Túnel sobre IP |
| __xfrm__ | x | Marco para el protocolo IPsec |

## Configuracion de Interfaz

| Comando Legacy | comando Actual | Descripcion |
|--|--|--|
|ifconfig -a|ip a| Muestra las interfaces de red |
|ifconfig `enp0s3` down | ip link set `enp0s3` down | Apaga la interfaz de red |
|ifconfig `enp0s3` up | ip link set `enp0s3` up | Enciende la interfaz de red
|ifconfig `enp0s3` `192.168.0.11` | ip addr add `192.168.0.11/24` dev `enp0s3`| Establece la direccion IP |
|ifconfig `enp0s3` netmask `255.255.255.0` | ip addr add `192.168.1.11/24` dev `enp0s3` | Configura la mascara de subred |
|ifconfig `enp0s3` mtu `9000`|ip link set `enp0s3` mtu `9000` | Define el MTU expresado en Bytes |
|ifconfig `enp0s3:0` `192.168.0.100` |ip addr add `192.168.2.25/24` dev `enp0s3:0`| Implementa una interfaz virtual |

## Estado de la Red

Podemos visualizar y gestionar conexiones de red, tablas de enrutamiento, estadísticas de interfaces de red y más con las herramientas que nos brinda el sistema operativo. Dichos comandos se utilizan para diagnosticar problemas de red, supervisar la actividad de red en un sistema, y saber qué servicios están en ejecución y en qué puertos están escuchando conexiones

| Comando Legacy | comando Actual | Descripcion |
|--|--|--|
| netstat | ss | Muestra el estado de las conexiones |
| netstat -g | ip maddr | Muestra las tablas multicast |

## Tablas de Enrutamiento

Corresponde a un conjunto de directrices e información de enrutamiento, __routers y endpoints__ habilitados para la red, basado en IP. La información de salida define las reglas de cómo transportar paquetes de datos entre la red, los routers y los dispositivos finales.

La estructura de una tabla de enrutamiento contiene entradas para la dirección de red de destino, máscaras de subred, pasarelas (routers), interfaces y métricas como el número de saltos o el esfuerzo de enrutamiento.

| Comando Legacy | comando Actual |
|--|--|
|route|ip r|
|route add -net `192.168.2.0` netmask `255.255.255.0` dev `enp0s3`|ip route add `192.168.2.0/24` dev `enp0s3`|
|route add default gw `192.168.0.1`|ip route add default via `192.168.0.1`|

## Resolucion de Direcciones

| Comando Legacy | comando Actual |
|--|--|
|arp -a| ip neighbor |
|arp -v| ip -s neighbor |
|arp -s `192.168.2.33` `08:00:27:0f:c3:a4`| ip n add `192.168.3.33` lladdr `08:00:27:0f:c3:a4` dev `enp0s3` |
|arp -i `enp0s3` -d `192.168.0.1`|ip neighbor del `192.168.0.1` dev `enp0s3` |

[volver](../readme.md)