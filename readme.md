# Dimensionado de Redes

Esto es una guia para los alumnos de la capacitacion CCNA3 que cursan los dias martes y jueves de 10hs a 12hs, donde podran realizar actividades y repasar los contenidos vistos en clase.

## Tabla de Contenidos
1. [Open Shortest Path First](#ospf)
1. [Access Control List](#acl)
1. [Network Address Translation](#nat)
1. [Point to Point Protocol](#ppp)
1. [Enhaced Internal Gateway Routing protocol](#eigrp)
1. [Internet Protocol Secure](#ipsec)

## OSPF

__Open Shortest Path First__ es un protocolo de red es estandar abierto para enrutamiento jerarquico tipo _Internal Gateway Protocol (IGP)_, que usa el algoritmo _Dijkstra_, para calcular la ruta mas corta entre dos nodos y selecciona la de menor costo para incorporarla a la tabla de enrutamiento. Por defecto el ancho de banda referencial es de `100.000Kbps` y si la interfaz es `FastEthernet`, el resultado es `metrica = 1`. Para determinar el costo de las rutas aprendidas este protocolo realiza el siguiente calculo $\dfrac{Ref BW}{Link Speed}$ 

1. router(config-router)# __(configuracion protocolo OSPF)__
    * __router ospf `<process-id>`__: ingresa al submodo de configuracion de OSPF
    * __router-id `<ip address>`__: establece un numero identificador para el router en formato IP 
    * __network `<network>` `<wildcard>` area `<area>`__: declara la red que pertenece a la topologia que utiliza OSPF
2. router# __(verificacion configuracion OSPF)__
    * __show ip ospf__: muestra la configuracion de los procesos OSPF
    * __show ip ospf neighbor__: muestra los dispositivos conectados directamente que usan OSPF
    * __show ip ospf database__: muestra informacion relacionada con el mapa de la topologia 
    * __show ip route ospf__: muestra las rutas aprendidas a traves del protocolo OSPF
3. router(config-router)#: __(actualizacion de ajustes)__
    * __passive interface `<interface-id>`__: evita el envio de paquetes OSPF en las interfaces especificadas
    * __auto-cost reference-bandwidth `<Mbits>`__: establece el ancho de banda de referencia para el calculo del algoritmo _Dijkstra_
    * __default-information originate__: comparte las rutas predeterminadas mediante multicast

## ACL

__Access Control List__ corresponde a una serie de reglas que determinan si un router reenvia o descarta un paquete segun la informacion que se encuentra en la cabecera, permitiendo controlar el flujo de trafico. El principal objetivo de las ACL es filtrar el trafico de red, pemitiendo o denegando el mismo en base a una condicion, de manera similar al funcionamiento de un _firewall_. Las mismas se aplican al trafico entran y saliente, no operando sobre los paquetes originados en el router.

1. router(config)# __(definicion de lista numerada estandar)__
    * __access-list `<1-99>` permit `<network>` `<wildcard>`__: regla que permite los paquetes que coincidan con la red especificada
    * __access-list `1` permit host `3.217.96.6`__: establece la mascara wildcard _0.0.0.0_ que coincide solamente con la direccion indicada
    * __access-list `1` permit any__: establece la mascara wildard _255.255.255.255_ que coincide con todos los paquetes recibidos
    * __access-list `1` deny `192.168.0.0` `0.0.255.255`__: regla que bloquea los paquetes que coincidan con la red 192.168.0.0/16
    * __ip access-list standard `<WORD>`__: crea una lista estandar nombrada e ingresa al modo de subconfiguracion ACL
2. router(config)# __(definicion de lista numerada extendida)__
    * __access-list `<100-199>` permit `<protocol>` `<src-net>` `<dest-net>` [`<operator>` `<operand>`]__: regla que permite los paquetes de la red de origen a la red de destino que correspondan con el puerto y protocolo indicados
    * __access-list `100` permit `ospf` any any__: permite los paquetes ospf de cualquier direccion de origen a cualquier direccion de destino
    * __access-list `100` permit `ip` `10.0.0.0` `0.0.0.255` any__: permite los paquetes ip cuya direccion de origen coincida con la red 10.0.0.0/24
    * __access-list `100` deny `icmp` host `200.42.4.204` `192.168.0.0` `0.0.255.255` `echo-reply`__: bloquea los paquetes de respuesta _icmp_ cuya direccion de origen corresponda con la red 192.168.0.0/16 y cuyo destino sea el host especificado.
    * __access-list `100` deny `tcp` any host `31.13.94.19` eq `80`__: bloquea los paquetes cuya direccion de destino sea el host especificado cuyo protocolo de aplicacion sea _http_
    * __ip access-list extended `<WORD>`__: crea una lista extendida nombrada e ingresa al modo de subconfiguracion ACL
3. router(config-if)# __(implementacion de listas de acceso)__
    * __ip access-group `<1-199>` in__: asigna la lista de acceso para que analice el trafico entrante de la interfaz
    * __ip access-group `<1-199>` out__: asigna la lista de acceso para que analice el trafico saliente de la interfaz
    * __ip access-class `<WORD>`__: asigna una lista de control acceso nombrada a la lineas VTY y consola

## NAT

__Network Address Translation__ es un mecanismo utilizado por los routers para cambiar paquetes entre dos redes que asignan mutuamente direcciones incompatibles y se implementa generalmente para la comunicacion de redes privadas con redes publicas. Surge como una solucion al problema de agotamiento de direcciones en IPv4 y puede implementarse de diferentes maneras como _estatica_, cuando la traduccion se realiza individualmente, _dinamica_, cuando se asigna una lista de direcciones a traducir, y con _sobrecarga_ donde ademas se asocia un numero de puerto para seguir la comunicacion.

1. router(config)# __(definicion de direcciones publicas)__
    * __ip nat inside source static `<private ip>` `<public ip>`__: define de manera estatica la direccion que debe asignarse a la ip de tipo privada
    * __ip nat pool `<WORD>` `<start ip>` `<end ip>` netmask `<netmask>`__: define de manera dinamica lista de direcciones publicas con su respectiva mascara
2. router(config)# __(asociacion dinamica de direcciones)__
    * __ip nat inside source list `<WORD>` pool `<WORD>`__: define la lista de acceso a utilizar, asociandola con la lista de direcciones NAT
    * __ip nat inside source list `<WORD>` pool `<WORD>` overload__: habilita la sobrecarga de puertos para optimizar la asignacion de direcciones
    * __ip nat inside source list `<WORD>` interface `<interface-id>` overload__: habilita la sobrecarga de puertos indicando la interfaz de salida 
3. router(config-if)# __(asignacion de direcciones)__
    * __ip nat inside__: define la interfaz de trafico entrante que debera coincidir con la lista de direcciones LAN privadas
    * __ip nat outside__: define la interfaz de trafico saliente donde debera reemplazar las direcciones de origen con las WAN Publicas
4. router# __(verificacion de configuracion y traducciones)__
    * __show ip nat translations__: muestra la lista de paquetes, protocolos y puertos utilizados en las comunicaciones donde intervino NAT
    * __show ip nat statistics__: muestra un resumen de las estadisticas y configuracion NAT del dispositivo

## PPP
__Point to Point Protocol__ funciona a nivel de enlace de datos y es utilizado para establecer una _conexión directa entre dos nodos_ de red, permitiendo conectar routers directamente sin ningún equipo u otro dispositivo de red entre ambos. Cuando configuramos este protocolo se establecen dos subcapas LCP y NDP

1. router(config-if)# __(Protocolo Punto a Punto)__
    * __encapsulation `ppp`__: define el metodo de encapsulamiento a nivel de capa 2
    * __ppp quality `<percentage>`__: determina el porcentaje de calidad de comunicacion.
1. router (config-if)# __(Definicion de Credenciales)__
    * __hostname `R1`__: esteblece el nombre de host para la conexion punto a punto.
    * __username `R2` password `Abc123!`__: define un usuario con el nombre del host remoto.
1. router (config-if)# __(Protocolo de Autenticacion por contraseña)__
    * __ppp authentication `pap`__: establece pap como metodo de autenticacion
    * __ppp pap sent-username `R1` password `Abc123!`__: establece las credenciales que seran validadas por el host remoto.
1. router(config-if)# __(Protocolo de Autenticacion por desafio mutuo)__
    * __ppp authentication `chap`__: establece chap como metodo de autenticacion
    * __ppp authenticacion `chap` `pap`__: define los metodos de autenticacion principal y secundario en caso que no funcione.

## EIGRP

__Enhanced Interior Gateway Routing Protocol__ es un protocolo de enrutamiento de tipo _vector distancia_ propietario de __CISCO__, que mejora las propiedades de convergencia y opera con mayor eficiencia que IGRP. Se considera un protocolo avanzado que se basa en las características normalmente asociadas con los protocolos del estado de enlace. Al igual que en su version anterior el calculo de la metrica es el siguiente 

$256 * (K1 * bw + \dfrac{K2 * bw}{256 - load} + K3 * dy) * \dfrac{K5}{rel + K4}$ 

Pero teniendo en cuenta que, de manera predeterminada, los unicos valores habilitados son _k1 y k3_, el calculo del protocolo se representaria de la siguiente forma $256 * (BandWidth + Delay)$


1. router(config-router)# __(configuracion protocolo EIGRP)__
    * __router ospf `<autonomous system>`__: ingresa al submodo de configuracion de EIGRP
    * __eigrp router-id `<ip address>`__: establece un numero identificador para el router en formato IP 
    * __network `<network>` `<wildcard>`__: declara la red que pertenece a la topologia que utiliza EIGRP
2. router# __(verificacion configuracion EIGRP)__
    * __show ip eigrp traffic__: muestra las estadisticas de los mensajes de EIGRP organizados por sistema autonomo.
    * __show ip eigrp neighbors__: muestra los dispositivos de la topologia que utilizan EIGRP
    * __show ip eigrp topology__: muestra la tabla de la topologia generada con EIGRP
    * __show ip route eigrp__: muestra las rutas aprendidas a traves del protocolo EIGRP.
3. router(config-router)#: __(actualizacion de ajustes)__
    * __passive interface `<interface-id>`__: evita el envio de paquetes EIGRP en las interfaces especificadas
    * __auto-summary__: habilita la sumarizacion de subredes para simplificar rutas.
