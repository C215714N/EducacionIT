# Redes empresariales, Seguridad y Automatizacion

Esto es una guia para los alumnos de la capacitacion __CCNA3__ que cursan los dias _lunes y miercoles de 20hs a 22hs_, para que puedan repasar los temas vistos en clase y acceder al material trabajado durante las mismas.

## Software

* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL)

## Tabla de Contenidos

1. [Open Shortest Path First](#ospf)
1. [Access Control List](#acl)

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
