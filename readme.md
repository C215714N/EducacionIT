# Redes empresariales, Seguridad y Automatizacion

Esto es una guia para los alumnos de la capacitacion __CCNA3__ que cursan los dias _lunes y miercoles de 20hs a 22hs_, para que puedan repasar los temas vistos en clase y acceder al material trabajado durante las mismas.

## Software

* [Packet Tracer](https://skillsforall.com/resources/lab-downloads?userLang=es-XL)

## Tabla de Contenidos

1. [Open Shortest Path First](#ospf)

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
