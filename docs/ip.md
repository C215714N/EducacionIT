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

## Operacion AND

Para poder establecer una comunicacion, los Hosts deben poseer una direccion IP y una mascara que determine a que red a la que pertenece el dispositivo.

|host data|byte1|byte2|byte3|byte4|
|----|-----|-----|-----|-----|
|__address__|192|168|0|56|
|__netmask__|255|255|255|0|
|__network__|192|168|0|0|
|__broadcast__|192|168|0|0|

Cuando se envian datos a otros hosts, si la direccion de destino se encuentra en la __misma Red__, la direccion MAC de destino sera la del __dispositivo receptor__; en cambio, si se encuentra en __otra red__, utilizara como destino la __direccion MAC de la puerta de enlace__.

Esto se puede determinar realizando la __operacion AND__ que consiste en la __comparacion de los bits__ de la _direccion IP de Destino_ con la _mascara de subred_ del dispositivo, lo cual da como resultado la __direccion de red__. Si dicho resultado concide con la IP Local corresponde a la misma subred, caso contrario, corresponde a una red remota.

|128|64|32|16|8|4|2|1|Dec| Hex|
|---|--|--|--|-|-|-|-|---|----|
| __1__ | __1__| 0| __1__|__1__|__1__|0|0|220|0xDC|
| __1__ | __1__| __1__| __1__|__1__|__1__|__1__|__1__|255|0xFF|
| __1__ | __1__| 0| __1__|__1__|__1__|0|0|220|0xDC|

De esta manera, cuando un router recibe un paquete IP debe determinar la red a la que pertenece la direccion de destino, para ello compara los bits de la direccion con las mascaras de cada red coincidente para determinar lo que se considera como mejor ruta.


|128|64|32|16|8|4|2|1|Dec| Hex|
|---|--|--|--|-|-|-|-|---|----|
| __1__ | __1__| 0| __1__|__1__|__1__|0|0|220|0xDC|
| __1__ | __1__| __1__| 0|0|0|0|0|224|0xE0|
| __1__ | __1__| 0| 0|0|0|0|0|192|0xC0|

Por ejemplo, si un router recibe un paquete IP con la direccion de destino __10.54.12.48__ y lo comparamos con las siguientes direcciones de red, podemos determinar que la mejor coincidencia seria la red __10.54.12.32/27__ ya que al realizar la operacion AND tenemos una coincidencia de 27 bits.

| network | cidr | next hop | hosts |
|---------|------|----------|-------|
| 10.54.12.0 | 25 | 32.43.15.12 | 126 |
| 10.54.12.0 | 26 | 32.43.15.13 | 62 |
| 10.54.12.0 | 27 | 32.43.15.14 | 30 |
| 10.54.12.32 | 27 | 32.43.15.11 | 30 |
| 10.54.12.64 | 26 | 32.43.15.13 | 126 |
| 10.54.12.128 | 26 | 32.43.15.14 | 62 |

Por otro lado, Si la direccion de destino fuese __10.54.12.145__
la mejor coincidencia seria la red __10.54.12.128/26__ ya que corresponden los primeros 26 bits, mientras que en los casos donde la mascara es mayor, algunos bits difieren.

[volver](../readme.md)